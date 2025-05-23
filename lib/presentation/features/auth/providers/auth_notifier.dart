import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart'; // Assuming this is the concrete implementation

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
    print('正在检查用户认证状态...');
    state = const AuthState.loading();

    try {
      // 从本地存储获取用户资料
      final userProfile = await _userProfileRepository.getUserProfile();

      if (userProfile != null) {
        print('找到已保存的用户资料: ${userProfile.userId}');
        // 用户已经登录，设置认证状态
        state = AuthState.authenticated(userProfile);
        print('用户已认证，认证状态已恢复');
      } else {
        print('未找到已保存的用户资料，用户未认证');
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      print('检查认证状态时出错: $e');
      state = const AuthState.unauthenticated(message: 'authCheckError');
    }
  }

  @override
  set state(AuthState value) {
    super.state = value;
    // 当状态变化时，将新状态发送到流
    _streamController.add(value);
    print('状态已更新并发送到流: $value');
  }

  Future<void> login(String email, String password) async {
    print('开始登录过程: email=$email');
    state = const AuthState.loading();
    await Future.delayed(const Duration(seconds: 1));

    // 测试账号，在实际应用中应该调用API
    // 修改为接受任何邮箱格式，仅做简单密码验证
    if (password.length >= 3) {
      print('登录凭证验证成功');
      // Simulate fetching user profile after successful login
      // In a real app, you'd fetch this based on user ID from login response
      UserProfile? userProfile = await _userProfileRepository.getUserProfile();
      print('获取用户资料结果: ${userProfile != null ? '存在' : '不存在'}');

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
        print('创建新用户资料: $userProfile');
        await _userProfileRepository.saveUserProfile(userProfile);
        print('保存用户资料成功');
      } else if (!userProfile.onboardingCompleted) {
        // User exists but hasn't completed onboarding
        print('用户 ${userProfile.userId} 存在，但未完成引导');
        // 保留onboardingCompleted状态，以便新注册用户可以进入引导页
        // 不做任何修改，让路由系统将用户引导到正确的页面
      }

      print('设置认证状态为authenticated');
      state = AuthState.authenticated(userProfile);
      print('认证状态更新完成: $state');
    } else {
      print('登录凭证验证失败');
      state = const AuthState.unauthenticated(
        message: 'invalidCredentialsError',
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    print('开始注册过程: email=$email');
    state = const AuthState.loading();
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    if (email == 'existing@example.com') {
      print('邮箱已存在，注册失败');
      state = const AuthState.unauthenticated(
        message: 'emailAlreadyInUseError', // Key for l10n
      );
      return;
    }

    // Simulate successful registration
    try {
      print('注册验证成功，创建新用户资料');
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

      print('新用户资料: $newUserProfile');
      print('引导完成状态: ${newUserProfile.onboardingCompleted}');

      await _userProfileRepository.saveUserProfile(newUserProfile);
      print('保存新用户资料成功');

      // After registration, user is considered authenticated and onboarding is pending
      print('设置认证状态为authenticated，引导完成状态为false');
      state = AuthState.authenticated(newUserProfile);
      print('认证状态更新完成: $state');
    } catch (e) {
      print('注册失败: $e');
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
          print('用户资料已从存储中删除，用户完全登出');
        } else {
          print('警告：删除用户资料失败，但状态仍将重置');
        }
      } else {
        print('找不到用户资料，但状态仍将重置');
      }
    } catch (e) {
      print('登出过程中出错: $e');
    }

    await Future.delayed(const Duration(milliseconds: 500));
    state = const AuthState.unauthenticated();
    print('User logged out, state reset to unauthenticated.');
  }

  void completeOnboarding(UserProfile updatedProfile) {
    state = AuthState.authenticated(updatedProfile);
    // Optionally, you might want to re-save the profile here if AuthNotifier
    // is the single source of truth for profile persistence after onboarding,
    // though OnboardingNotifier already saves it.
    // For now, just update the state.
    print(
      'Onboarding completed, AuthState updated with profile: ${updatedProfile.userId}',
    );
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
      print(
        'User smoking data updated: $dailyCigarettes cigarettes/day, ¥$packPrice/pack',
      );
    } catch (e) {
      print('Error updating smoking data: $e');
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
      print('User quit date updated: ${quitDateTime.toString()}');
    } catch (e) {
      print('Error updating quit date: $e');
      // 可以在此处添加错误处理逻辑
      throw e; // 重新抛出异常，以便调用者可以捕获
    }
  }

  @override
  void dispose() {
    // 关闭流控制器
    _streamController.close();
    print('AuthNotifier 被释放，流控制器已关闭');
    super.dispose();
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  return AuthNotifier(ref);
});
