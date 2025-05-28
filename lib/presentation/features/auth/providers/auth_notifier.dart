import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart'; // Assuming this is the concrete implementation
import 'package:quitting_smoking/presentation/features/achievements/controllers/achievement_controller.dart';
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务

// Placeholder for UserProfileRepository provider - Now using the concrete implementation's provider
// final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
//   return ref.watch(userProfileRepositoryProvider); // This was circular, should be the concrete one
// });

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;
  late final UserProfileRepository _userProfileRepository;

  // 添加一个状态流控制器
  final StreamController<AuthState> _streamController =
      StreamController<AuthState>.broadcast();

  // 暴露状态流给GoRouter使用
  Stream<AuthState> get stream => _streamController.stream;

  AuthNotifier(this._ref) : super(const AuthState.initial()) {
    _userProfileRepository = _ref.read(userProfileRepositoryProvider);
    // 在构造函数中调用检查认证状态的方法
    checkAuthStatus();
  }

  // 检查并恢复认证状态
  Future<void> checkAuthStatus() async {
    logInfo('正在检查用户认证状态', tag: 'AuthNotifier');
    state = const AuthState.loading();

    try {
      // 从本地存储获取用户资料
      final userProfile = await _userProfileRepository.getUserProfile();

      if (userProfile != null) {
        logInfo('找到已保存的用户资料: ${userProfile.userId}', tag: 'AuthNotifier');
        // 用户已经登录，设置认证状态
        state = AuthState.authenticated(userProfile);
        logInfo('用户已认证，认证状态已恢复', tag: 'AuthNotifier');
      } else {
        logInfo('未找到已保存的用户资料，用户未认证', tag: 'AuthNotifier');
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
    await Future.delayed(const Duration(seconds: 1));

    // 测试账号，在实际应用中应该调用API
    // 修改为接受任何邮箱格式，仅做简单密码验证
    if (password.length >= 3) {
      logInfo('登录凭证验证成功', tag: 'AuthNotifier');
      // Simulate fetching user profile after successful login
      // In a real app, you'd fetch this based on user ID from login response
      UserProfile? userProfile = await _userProfileRepository.getUserProfile();
      logDebug(
        '获取用户资料结果: ${userProfile != null ? '存在' : '不存在'}',
        tag: 'AuthNotifier',
      );

      if (userProfile == null) {
        // First time login or profile not created, create a mock one
        userProfile = UserProfile(
          userId: 'mockUserId-login-${DateTime.now().millisecondsSinceEpoch}',
          // email: email, // UserProfile does not have an email field
          quitDateTime: DateTime.now(),
          dailyCigarettes: 0,
          packPrice: 0.0,
          smokingYears: 0,
          quitReason: "Mocked reason for login",
          onboardingCompleted: false, // 保持为false，以便新用户进入引导页
        );
        logDebug('创建新用户资料: $userProfile', tag: 'AuthNotifier');
        await _userProfileRepository.saveUserProfile(userProfile);
        logInfo('保存用户资料成功', tag: 'AuthNotifier');
      } else if (!userProfile.onboardingCompleted) {
        // User exists but hasn't completed onboarding
        logInfo('用户 ${userProfile.userId} 存在，但未完成引导', tag: 'AuthNotifier');
        // 保留onboardingCompleted状态，以便新注册用户可以进入引导页
        // 不做任何修改，让路由系统将用户引导到正确的页面
      }

      logDebug('设置认证状态为authenticated', tag: 'AuthNotifier');
      state = AuthState.authenticated(userProfile);
      logInfo('认证状态更新完成: $state', tag: 'AuthNotifier');
    } else {
      logWarning('登录凭证验证失败', tag: 'AuthNotifier');
      state = const AuthState.unauthenticated(
        message: 'invalidCredentialsError',
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    logInfo('开始注册过程: email=$email', tag: 'AuthNotifier');
    state = const AuthState.loading();
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    if (email == 'existing@example.com') {
      logWarning('邮箱已存在，注册失败', tag: 'AuthNotifier');
      state = const AuthState.unauthenticated(
        message: 'emailAlreadyInUseError', // Key for l10n
      );
      return;
    }

    // Simulate successful registration
    try {
      logInfo('注册验证成功，创建新用户资料', tag: 'AuthNotifier');
      final newUserProfile = UserProfile(
        userId:
            'mockUserId-reg-${email.hashCode}-${DateTime.now().millisecondsSinceEpoch}',
        // email: email, // UserProfile does not have an email field
        // Set other fields to default/initial values as onboarding will handle them
        quitDateTime: null, // Will be set during onboarding
        dailyCigarettes: null,
        packPrice: null,
        smokingYears: null,
        quitReason: null,
        onboardingCompleted: false, // User needs to go through onboarding
      );

      logDebug('新用户资料: $newUserProfile', tag: 'AuthNotifier');
      logDebug(
        '引导完成状态: ${newUserProfile.onboardingCompleted}',
        tag: 'AuthNotifier',
      );

      await _userProfileRepository.saveUserProfile(newUserProfile);
      logInfo('保存新用户资料成功', tag: 'AuthNotifier');

      // After registration, user is considered authenticated and onboarding is pending
      logDebug('设置认证状态为authenticated，引导完成状态为false', tag: 'AuthNotifier');
      state = AuthState.authenticated(newUserProfile);
      logInfo('认证状态更新完成: $state', tag: 'AuthNotifier');
    } catch (e) {
      logError('注册失败', tag: 'AuthNotifier', error: e);
      state = const AuthState.unauthenticated(
        message: 'registrationFailedError', // Key for l10n
      );
    }
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    // 实际清除用户数据
    try {
      final userProfile = await _userProfileRepository.getUserProfile();
      if (userProfile != null) {
        // 真正地删除用户资料，以便完全登出
        final success = await _userProfileRepository.deleteUserProfile(
          userProfile.userId ?? '',
        );
        if (success) {
          logInfo('用户资料已从存储中删除，用户完全登出', tag: 'AuthNotifier');
        } else {
          logWarning('删除用户资料失败，但状态仍将重置', tag: 'AuthNotifier');
        }
      } else {
        logInfo('找不到用户资料，但状态仍将重置', tag: 'AuthNotifier');
      }
    } catch (e) {
      logError('登出过程中出错', tag: 'AuthNotifier', error: e);
    }

    await Future.delayed(const Duration(milliseconds: 500));
    state = const AuthState.unauthenticated();
    logInfo('用户已登出，状态重置为未认证', tag: 'AuthNotifier');
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
      throw e; // 重新抛出异常，以便调用者可以捕获
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
