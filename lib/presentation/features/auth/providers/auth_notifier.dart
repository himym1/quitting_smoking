import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/domain/repositories/auth_repository.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart';
import 'package:quitting_smoking/presentation/features/achievements/controllers/achievement_controller.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';
import 'package:quitting_smoking/presentation/providers/auth_provider.dart'
    as new_auth;

// Placeholder for UserProfileRepository provider - Now using the concrete implementation's provider
// final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
//   return ref.watch(userProfileRepositoryProvider); // This was circular, should be the concrete one
// });

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;
  late final UserProfileRepository _userProfileRepository;
  late final AuthRepository _authRepository;

  // 添加一个状态流控制器
  final StreamController<AuthState> _streamController =
      StreamController<AuthState>.broadcast();

  // 暴露状态流给GoRouter使用
  @override
  Stream<AuthState> get stream => _streamController.stream;

  AuthNotifier(this._ref) : super(const AuthState.initial()) {
    _userProfileRepository = _ref.read(userProfileRepositoryProvider);
    _authRepository = _ref.read(new_auth.authRepositoryProvider);
    // 在构造函数中调用检查认证状态的方法
    checkAuthStatus();
  }

  // 检查并恢复认证状态
  Future<void> checkAuthStatus() async {
    logInfo('正在检查用户认证状态', tag: 'AuthNotifier');
    state = const AuthState.loading();

    try {
      // 首先检查是否有有效的认证令牌
      final isLoggedIn = await _authRepository.isLoggedIn();

      if (isLoggedIn) {
        // 检查令牌是否即将过期，如果是则尝试刷新
        final isExpiringSoon = await _authRepository.isTokenExpiringSoon();
        if (isExpiringSoon) {
          try {
            await _authRepository.refreshToken();
            logInfo('令牌已自动刷新', tag: 'AuthNotifier');
          } catch (e) {
            logWarning('令牌刷新失败，需要重新登录', tag: 'AuthNotifier');
            state = const AuthState.unauthenticated();
            return;
          }
        }

        // 从本地存储获取用户资料
        final userProfile = await _userProfileRepository.getUserProfile();

        if (userProfile != null) {
          logInfo('找到已保存的用户资料: ${userProfile.userId}', tag: 'AuthNotifier');
          state = AuthState.authenticated(userProfile);
          logInfo('用户已认证，认证状态已恢复', tag: 'AuthNotifier');
        } else {
          logWarning('有认证令牌但无用户资料，清除认证状态', tag: 'AuthNotifier');
          await _authRepository.logout();
          state = const AuthState.unauthenticated();
        }
      } else {
        logInfo('未找到有效的认证令牌，用户未认证', tag: 'AuthNotifier');
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      logError('检查认证状态时出错', tag: 'AuthNotifier', error: e);
      state = const AuthState.unauthenticated(message: 'authCheckError');
    }
  }

  @override
  set state(AuthState value) {
    super.state = value;
    // 当状态变化时，将新状态发送到流
    _streamController.add(value);
    logDebug('状态已更新并发送到流: $value', tag: 'AuthNotifier');
  }

  Future<void> login(String email, String password) async {
    logInfo('开始登录过程: email=$email', tag: 'AuthNotifier');
    state = const AuthState.loading();

    try {
      // 使用真实的API进行登录
      final authResult = await _authRepository.login(
        email: email,
        password: password,
      );

      logInfo(
        'API登录成功，用户ID: ${authResult.userProfile.userId}',
        tag: 'AuthNotifier',
      );

      // 保存用户资料到本地（如果API返回的资料更完整）
      await _userProfileRepository.saveUserProfile(authResult.userProfile);

      // 设置认证状态
      state = AuthState.authenticated(authResult.userProfile);
      logInfo('认证状态更新完成', tag: 'AuthNotifier');
    } catch (e) {
      logError('登录失败', tag: 'AuthNotifier', error: e);

      String errorMessage = 'loginFailedError';
      if (e is NetworkException) {
        errorMessage = _getNetworkErrorMessage(e);
      }

      state = AuthState.unauthenticated(message: errorMessage);
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    logInfo('开始注册过程: email=$email', tag: 'AuthNotifier');
    state = const AuthState.loading();

    try {
      // 使用真实的API进行注册
      final authResult = await _authRepository.register(
        email: email,
        password: password,
        agreeToTerms: true, // 假设用户已同意条款
      );

      logInfo(
        'API注册成功，用户ID: ${authResult.userProfile.userId}',
        tag: 'AuthNotifier',
      );

      // 保存用户资料到本地
      await _userProfileRepository.saveUserProfile(authResult.userProfile);

      // 设置认证状态
      state = AuthState.authenticated(authResult.userProfile);
      logInfo('认证状态更新完成', tag: 'AuthNotifier');
    } catch (e) {
      logError('注册失败', tag: 'AuthNotifier', error: e);

      String errorMessage = 'registrationFailedError';
      if (e is NetworkException) {
        errorMessage = _getNetworkErrorMessage(e);
      }

      state = AuthState.unauthenticated(message: errorMessage);
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    try {
      // 使用真实的API进行登出
      await _authRepository.logout();

      // 清除本地用户资料（可选，根据业务需求）
      final userProfile = await _userProfileRepository.getUserProfile();
      if (userProfile != null) {
        await _userProfileRepository.deleteUserProfile(
          userProfile.userId ?? '',
        );
        logInfo('本地用户资料已清除', tag: 'AuthNotifier');
      }

      state = const AuthState.unauthenticated();
      logInfo('用户已登出，状态重置为未认证', tag: 'AuthNotifier');
    } catch (e) {
      logError('登出过程中出错', tag: 'AuthNotifier', error: e);
      // 即使API登出失败，也要清除本地状态
      state = const AuthState.unauthenticated();
    }
  }

  /// 获取网络错误的用户友好消息
  String _getNetworkErrorMessage(NetworkException exception) {
    return exception.when(
      requestCancelled: () => 'requestCancelledError',
      unauthorizedRequest: (_) => 'invalidCredentialsError',
      badRequest: (_) => 'invalidInputError',
      notFound: (_) => 'serviceNotFoundError',
      methodNotAllowed: () => 'methodNotAllowedError',
      notAcceptable: () => 'requestNotAcceptableError',
      requestTimeout: () => 'requestTimeoutError',
      sendTimeout: () => 'sendTimeoutError',
      conflict: (_) => 'dataConflictError',
      internalServerError: () => 'serverInternalError',
      serviceUnavailable: () => 'serviceUnavailableError',
      noInternetConnection: () => 'noInternetConnectionError',
      formatException: () => 'dataFormatError',
      unableToProcess: () => 'unableToProcessError',
      defaultError: (_) => 'unknownError',
      unexpectedError: () => 'unexpectedError',
      // 业务特定异常
      syncFailed: (_) => 'syncFailedError',
      checkInFailed: (_) => 'checkInFailedError',
      checkInAlreadyExists: (_) => 'checkInAlreadyExistsError',
      checkInNotFound: (_) => 'checkInNotFoundError',
      smokingRecordFailed: (_) => 'smokingRecordFailedError',
      smokingRecordNotFound: (_) => 'smokingRecordNotFoundError',
      invalidSmokingData: (_) => 'invalidSmokingDataError',
      achievementFailed: (_) => 'achievementFailedError',
      achievementAlreadyUnlocked: (_) => 'achievementAlreadyUnlockedError',
      achievementNotFound: (_) => 'achievementNotFoundError',
      achievementConditionNotMet: (_) => 'achievementConditionNotMetError',
    );
  }

  void completeOnboarding(UserProfile updatedProfile) async {
    state = AuthState.authenticated(updatedProfile);
    // Optionally, you might want to re-save the profile here if AuthNotifier
    // is the single source of truth for profile persistence after onboarding,
    // though OnboardingNotifier already saves it.
    // For now, just update the state.
    logInfo('引导完成，认证状态已更新，用户ID: ${updatedProfile.userId}', tag: 'AuthNotifier');

    // 引导完成后重新计算成就
    await _recalculateAchievements(updatedProfile);
  }

  // 更新吸烟数据
  Future<void> updateSmokingData({
    required int dailyCigarettes,
    required double packPrice,
    int? cigarettesPerPack,
  }) async {
    try {
      // 获取当前用户资料
      final currentProfile = await _userProfileRepository.getUserProfile();
      if (currentProfile == null) {
        throw Exception('Cannot update smoking data: User profile not found');
      }

      // 更新用户资料
      final updatedProfile = currentProfile.copyWith(
        dailyCigarettes: dailyCigarettes,
        packPrice: packPrice,
      );

      // 保存更新后的资料
      await _userProfileRepository.saveUserProfile(updatedProfile);

      // 更新状态
      state = AuthState.authenticated(updatedProfile);
      logInfo(
        '用户吸烟数据已更新: $dailyCigarettes支/天, ¥$packPrice/包',
        tag: 'AuthNotifier',
      );
    } catch (e) {
      logError('更新吸烟数据时出错', tag: 'AuthNotifier', error: e);
      // 可以在此处添加错误处理逻辑
    }
  }

  // 更新戒烟日期
  Future<void> updateQuitDate(DateTime quitDateTime) async {
    try {
      // 获取当前用户资料
      final currentProfile = await _userProfileRepository.getUserProfile();
      if (currentProfile == null) {
        throw Exception('Cannot update quit date: User profile not found');
      }

      // 更新用户资料
      final updatedProfile = currentProfile.copyWith(
        quitDateTime: quitDateTime,
      );

      // 保存更新后的资料
      await _userProfileRepository.saveUserProfile(updatedProfile);

      // 更新状态
      state = AuthState.authenticated(updatedProfile);
      logInfo('用户戒烟日期已更新: ${quitDateTime.toString()}', tag: 'AuthNotifier');

      // 重新计算成就 - 基于新的戒烟时间
      await _recalculateAchievements(updatedProfile);
    } catch (e) {
      logError('更新戒烟日期时出错', tag: 'AuthNotifier', error: e);
      // 可以在此处添加错误处理逻辑
      rethrow; // 重新抛出异常，以便调用者可以捕获
    }
  }

  // 重新计算成就的私有方法
  Future<void> _recalculateAchievements(UserProfile userProfile) async {
    try {
      if (userProfile.quitDateTime == null) return;

      // 计算戒烟天数
      final now = DateTime.now();
      final quitDuration = now.difference(userProfile.quitDateTime!);
      final consecutiveDays = quitDuration.inDays;

      // 计算节省的金钱
      final dailyCigarettes = userProfile.dailyCigarettes ?? 0;
      final packPrice = userProfile.packPrice ?? 0.0;
      final cigarettesPerPack = 20; // 假设每包20支
      final dailyCost = (dailyCigarettes / cigarettesPerPack) * packPrice;
      final moneySaved = dailyCost * consecutiveDays;

      // 获取成就控制器并检查新成就
      final achievementController = _ref.read(
        achievementControllerProvider.notifier,
      );
      await achievementController.checkForNewAchievements(
        consecutiveDays: consecutiveDays,
        moneySaved: moneySaved,
      );

      logInfo(
        '成就重新计算完成: 戒烟${consecutiveDays}天, 节省¥${moneySaved.toStringAsFixed(2)}',
        tag: 'AuthNotifier',
      );
    } catch (e) {
      logError('重新计算成就时出错', tag: 'AuthNotifier', error: e);
    }
  }

  @override
  void dispose() {
    // 关闭流控制器
    _streamController.close();
    logDebug('AuthNotifier 被释放，流控制器已关闭', tag: 'AuthNotifier');
    super.dispose();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(ref);
});
