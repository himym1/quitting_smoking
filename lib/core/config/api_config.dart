/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * API配置 (ApiConfig)
 * 功能：
 * 1. 定义API基础URL和端点
 * 2. 管理不同环境的配置
 * 3. 提供网络请求的全局配置
 * 4. 定义API版本和超时设置
 */

/// API配置类
///
/// 管理应用的网络请求配置，包括：
/// - 基础URL配置
/// - 超时设置
/// - API版本管理
/// - 环境区分
class ApiConfig {
  // ==================== 环境配置 ====================

  /// 当前环境
  static const Environment currentEnvironment = Environment.development;

  /// 开发环境配置
  /// 对于Android设备，使用10.0.2.2来访问主机的localhost
  static const String _developmentBaseUrl = 'http://10.0.2.2:8080/api/v1';

  /// 生产环境配置
  static const String _productionBaseUrl = 'https://api.quitjourney.com/api/v1';

  /// 测试环境配置
  static const String _stagingBaseUrl =
      'https://staging-api.quitjourney.com/api/v1';

  // ==================== 基础配置 ====================

  /// 获取当前环境的基础URL
  static String get baseUrl {
    switch (currentEnvironment) {
      case Environment.development:
        return _developmentBaseUrl;
      case Environment.staging:
        return _stagingBaseUrl;
      case Environment.production:
        return _productionBaseUrl;
    }
  }

  /// API版本
  static const String apiVersion = 'v1';

  /// 连接超时时间（毫秒）
  static const int connectTimeout = 30000; // 30秒

  /// 接收超时时间（毫秒）
  static const int receiveTimeout = 30000; // 30秒

  /// 发送超时时间（毫秒）
  static const int sendTimeout = 30000; // 30秒

  // ==================== API端点 ====================

  /// 认证相关端点
  static const String authRegister = '/auth/register';
  static const String authLogin = '/auth/login';
  static const String authRefresh = '/auth/refresh';
  static const String authLogout = '/auth/logout';
  static const String authForgotPassword = '/auth/forgot-password';
  static const String authResetPassword = '/auth/reset-password';
  static const String authVerifyEmail = '/auth/verify-email';

  /// 用户相关端点
  static const String userProfile = '/users/profile';
  static const String userSettings = '/users/settings';

  /// 打卡相关端点
  static const String checkins = '/checkins';
  static const String checkinStats = '/checkins/stats';

  /// 吸烟记录相关端点
  static const String smokingRecords = '/smoking-records';
  static const String smokingRecordStats = '/smoking-records/stats';

  /// 数据同步相关端点
  static const String syncStatus = '/sync/status';
  static const String syncUpload = '/sync/upload';
  static const String syncDownload = '/sync/download';

  /// 成就系统相关端点
  static const String achievements = '/achievements';

  // ==================== 请求头配置 ====================

  /// 默认请求头
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Client-Version': '1.0.0',
    'X-Platform': 'Flutter',
  };

  /// 获取认证请求头
  static Map<String, String> getAuthHeaders(String token) => {
    ...defaultHeaders,
    'Authorization': 'Bearer $token',
  };

  // ==================== 错误码定义 ====================

  // 认证相关错误
  static const String emailAlreadyExists = 'EMAIL_ALREADY_EXISTS';
  static const String invalidCredentials = 'INVALID_CREDENTIALS';
  static const String tokenExpired = 'TOKEN_EXPIRED';
  static const String tokenInvalid = 'TOKEN_INVALID';

  // 验证相关错误
  static const String validationError = 'VALIDATION_ERROR';
  static const String weakPassword = 'WEAK_PASSWORD';
  static const String termsNotAgreed = 'TERMS_NOT_AGREED';

  // 服务器相关错误
  static const String internalError = 'INTERNAL_ERROR';
  static const String serviceUnavailable = 'SERVICE_UNAVAILABLE';
  static const String networkError = 'NETWORK_ERROR';

  // 业务相关错误
  static const String userNotFound = 'USER_NOT_FOUND';
  static const String resourceNotFound = 'RESOURCE_NOT_FOUND';
  static const String duplicateResource = 'DUPLICATE_RESOURCE';
}

/// 环境枚举
enum Environment { development, staging, production }

/// 环境扩展方法
extension EnvironmentExtension on Environment {
  /// 是否为开发环境
  bool get isDevelopment => this == Environment.development;

  /// 是否为测试环境
  bool get isStaging => this == Environment.staging;

  /// 是否为生产环境
  bool get isProduction => this == Environment.production;

  /// 环境名称
  String get name {
    switch (this) {
      case Environment.development:
        return 'Development';
      case Environment.staging:
        return 'Staging';
      case Environment.production:
        return 'Production';
    }
  }
}
