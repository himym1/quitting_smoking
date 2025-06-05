/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证Provider (AuthProvider)
 * 功能：
 * 1. 管理用户认证状态
 * 2. 提供认证相关的业务逻辑
 * 3. 集成真实的API认证服务
 * 4. 处理令牌自动刷新
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/repositories/auth_repository.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/data/repositories_impl/auth_repository_impl.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/providers/network_providers.dart';
import 'package:quitting_smoking/data/datasources/local/user_local_datasource_impl.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';

// ==================== Repository Provider ====================

/// 认证仓库 Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = UserLocalDatasourceImpl(Hive);
  final dioClient = ref.watch(dioClientProvider);

  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    dioClient: dioClient,
  );
});

// ==================== 认证状态管理 ====================

/// 认证状态通知器
///
/// 管理用户的认证状态和相关操作
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthNotifier(this._authRepository, this._ref)
    : super(const AuthState.initial()) {
    _initializeAuth();
  }

  /// 初始化认证状态
  Future<void> _initializeAuth() async {
    try {
      state = const AuthState.loading();

      // 检查是否已登录
      final isLoggedIn = await _authRepository.isLoggedIn();

      if (isLoggedIn) {
        // 检查令牌是否需要刷新
        final isExpiringSoon = await _authRepository.isTokenExpiringSoon();

        if (isExpiringSoon) {
          await _refreshTokenSilently();
        }

        // 获取用户资料
        final userId = await _authRepository.getCurrentUserId();
        if (userId != null) {
          // TODO: 从本地数据源获取用户资料
          state = AuthState.authenticated(
            userId: userId,
            userProfile: null, // 暂时为null，后续从本地获取
          );
        } else {
          state = const AuthState.unauthenticated();
        }
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      logError('初始化认证状态失败', tag: 'AuthNotifier', error: e);
      state = const AuthState.unauthenticated();
    }
  }

  /// 用户注册
  Future<void> register({
    required String email,
    required String password,
    String? name,
    bool agreeToTerms = false,
  }) async {
    try {
      state = const AuthState.loading();

      final result = await _authRepository.register(
        email: email,
        password: password,
        name: name,
        agreeToTerms: agreeToTerms,
      );

      state = AuthState.authenticated(
        userId: result.userProfile.userId!,
        userProfile: result.userProfile,
      );

      logInfo('用户注册成功', tag: 'AuthNotifier');
    } catch (e) {
      logError('用户注册失败', tag: 'AuthNotifier', error: e);
      state = AuthState.error(_getErrorMessage(e));
    }
  }

  /// 用户登录
  Future<void> login({required String email, required String password}) async {
    try {
      state = const AuthState.loading();

      final result = await _authRepository.login(
        email: email,
        password: password,
      );

      state = AuthState.authenticated(
        userId: result.userProfile.userId!,
        userProfile: result.userProfile,
      );

      logInfo('用户登录成功', tag: 'AuthNotifier');
    } catch (e) {
      logError('用户登录失败', tag: 'AuthNotifier', error: e);
      state = AuthState.error(_getErrorMessage(e));
    }
  }

  /// 用户登出
  Future<void> logout() async {
    try {
      await _authRepository.logout();
      state = const AuthState.unauthenticated();
      logInfo('用户登出成功', tag: 'AuthNotifier');
    } catch (e) {
      logError('用户登出失败', tag: 'AuthNotifier', error: e);
      // 即使登出失败，也清除本地状态
      state = const AuthState.unauthenticated();
    }
  }

  /// 忘记密码
  Future<bool> forgotPassword(String email) async {
    try {
      return await _authRepository.forgotPassword(email);
    } catch (e) {
      logError('忘记密码请求失败', tag: 'AuthNotifier', error: e);
      return false;
    }
  }

  /// 重置密码
  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      return await _authRepository.resetPassword(
        token: token,
        newPassword: newPassword,
      );
    } catch (e) {
      logError('重置密码失败', tag: 'AuthNotifier', error: e);
      return false;
    }
  }

  /// 验证邮箱
  Future<bool> verifyEmail(String token) async {
    try {
      return await _authRepository.verifyEmail(token);
    } catch (e) {
      logError('邮箱验证失败', tag: 'AuthNotifier', error: e);
      return false;
    }
  }

  /// 静默刷新令牌
  Future<void> _refreshTokenSilently() async {
    try {
      await _authRepository.refreshToken();
      logInfo('令牌静默刷新成功', tag: 'AuthNotifier');
    } catch (e) {
      logError('令牌静默刷新失败', tag: 'AuthNotifier', error: e);
      // 刷新失败，需要重新登录
      state = const AuthState.unauthenticated();
    }
  }

  /// 清除错误状态
  void clearError() {
    if (state is AuthError) {
      state = const AuthState.unauthenticated();
    }
  }

  /// 获取错误消息
  String _getErrorMessage(dynamic error) {
    if (error is NetworkException) {
      return NetworkExceptionHandler.getDisplayMessage(error);
    }
    return error.toString();
  }
}

/// 认证状态 Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository, ref);
});

// ==================== 认证状态数据模型 ====================

/// 认证状态
sealed class AuthState {
  const AuthState();

  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({
    required String userId,
    UserProfile? userProfile,
  }) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(String message) = AuthError;
}

/// 初始状态
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// 加载状态
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// 已认证状态
class AuthAuthenticated extends AuthState {
  final String userId;
  final UserProfile? userProfile;

  const AuthAuthenticated({required this.userId, this.userProfile});
}

/// 未认证状态
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// 错误状态
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

// ==================== 认证状态扩展方法 ====================

extension AuthStateExtension on AuthState {
  /// 是否已认证
  bool get isAuthenticated => this is AuthAuthenticated;

  /// 是否未认证
  bool get isUnauthenticated => this is AuthUnauthenticated;

  /// 是否正在加载
  bool get isLoading => this is AuthLoading;

  /// 是否有错误
  bool get hasError => this is AuthError;

  /// 获取用户ID
  String? get userId {
    return switch (this) {
      AuthAuthenticated(userId: final id) => id,
      _ => null,
    };
  }

  /// 获取用户资料
  UserProfile? get userProfile {
    return switch (this) {
      AuthAuthenticated(userProfile: final profile) => profile,
      _ => null,
    };
  }

  /// 获取错误消息
  String? get errorMessage {
    return switch (this) {
      AuthError(message: final msg) => msg,
      _ => null,
    };
  }
}
