/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证仓库接口 (AuthRepository)
 * 功能：
 * 1. 定义认证相关的业务操作接口
 * 2. 抽象认证数据访问逻辑
 * 3. 支持本地和远程数据源
 * 4. 提供统一的认证服务接口
 */

import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';

/// 认证仓库接口
/// 
/// 定义所有认证相关的业务操作
abstract class AuthRepository {
  
  // ==================== 认证操作 ====================
  
  /// 用户注册
  /// 
  /// [email] 邮箱地址
  /// [password] 密码
  /// [name] 用户姓名（可选）
  /// [agreeToTerms] 是否同意服务条款
  /// 
  /// 返回认证结果，包含用户信息和令牌
  /// 抛出 [NetworkException] 当网络请求失败时
  Future<AuthResult> register({
    required String email,
    required String password,
    String? name,
    bool agreeToTerms = false,
  });
  
  /// 用户登录
  /// 
  /// [email] 邮箱地址
  /// [password] 密码
  /// 
  /// 返回认证结果，包含用户信息和令牌
  /// 抛出 [NetworkException] 当网络请求失败时
  Future<AuthResult> login({
    required String email,
    required String password,
  });
  
  /// 刷新访问令牌
  /// 
  /// 使用存储的刷新令牌获取新的访问令牌
  /// 返回新的令牌信息
  /// 抛出 [NetworkException] 当网络请求失败时
  Future<TokenInfoModel> refreshToken();
  
  /// 用户登出
  /// 
  /// 清除本地存储的令牌和用户信息
  /// 向服务器发送登出请求
  Future<void> logout();
  
  /// 忘记密码
  /// 
  /// [email] 邮箱地址
  /// 发送密码重置邮件
  Future<bool> forgotPassword(String email);
  
  /// 重置密码
  /// 
  /// [token] 重置令牌
  /// [newPassword] 新密码
  /// 使用重置令牌更新密码
  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  });
  
  /// 验证邮箱
  /// 
  /// [token] 验证令牌
  /// 验证用户邮箱地址
  Future<bool> verifyEmail(String token);
  
  // ==================== 状态检查 ====================
  
  /// 检查用户是否已登录
  /// 
  /// 检查本地是否存储有效的认证令牌
  Future<bool> isLoggedIn();
  
  /// 检查令牌是否有效
  /// 
  /// 验证访问令牌是否未过期
  Future<bool> isTokenValid();
  
  /// 检查令牌是否即将过期
  /// 
  /// 判断是否需要刷新令牌
  Future<bool> isTokenExpiringSoon();
  
  /// 获取当前用户ID
  /// 
  /// 从存储的令牌中获取用户ID
  Future<String?> getCurrentUserId();
  
  /// 获取当前访问令牌
  /// 
  /// 获取存储的访问令牌
  Future<String?> getCurrentAccessToken();
  
  // ==================== 用户资料同步 ====================
  
  /// 同步用户资料到服务器
  /// 
  /// [userProfile] 本地用户资料
  /// 将本地用户资料上传到服务器
  Future<UserProfile> syncUserProfileToServer(UserProfile userProfile);
  
  /// 从服务器获取用户资料
  /// 
  /// 获取服务器上的用户资料数据
  Future<UserProfile?> getUserProfileFromServer();
  
  /// 合并本地和远程用户资料
  /// 
  /// [localProfile] 本地用户资料
  /// [remoteProfile] 远程用户资料
  /// 智能合并两个资料，解决冲突
  Future<UserProfile> mergeUserProfiles(
    UserProfile? localProfile,
    UserProfile? remoteProfile,
  );
}

/// 认证结果
/// 
/// 包含认证操作的结果信息
class AuthResult {
  /// 用户资料
  final UserProfile userProfile;
  
  /// 令牌信息
  final TokenInfoModel tokens;
  
  /// 是否为新用户
  final bool isNewUser;
  
  const AuthResult({
    required this.userProfile,
    required this.tokens,
    this.isNewUser = false,
  });
  
  @override
  String toString() {
    return 'AuthResult(userProfile: $userProfile, isNewUser: $isNewUser)';
  }
}

/// 认证状态
/// 
/// 表示当前的认证状态
enum AuthStatus {
  /// 未认证
  unauthenticated,
  
  /// 已认证
  authenticated,
  
  /// 令牌过期
  tokenExpired,
  
  /// 认证中
  authenticating,
  
  /// 认证失败
  authenticationFailed,
}

/// 认证状态扩展方法
extension AuthStatusExtension on AuthStatus {
  /// 是否已认证
  bool get isAuthenticated => this == AuthStatus.authenticated;
  
  /// 是否未认证
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;
  
  /// 是否令牌过期
  bool get isTokenExpired => this == AuthStatus.tokenExpired;
  
  /// 是否正在认证
  bool get isAuthenticating => this == AuthStatus.authenticating;
  
  /// 是否认证失败
  bool get isAuthenticationFailed => this == AuthStatus.authenticationFailed;
  
  /// 获取状态描述
  String get description {
    switch (this) {
      case AuthStatus.unauthenticated:
        return '未登录';
      case AuthStatus.authenticated:
        return '已登录';
      case AuthStatus.tokenExpired:
        return '登录已过期';
      case AuthStatus.authenticating:
        return '登录中';
      case AuthStatus.authenticationFailed:
        return '登录失败';
    }
  }
}
