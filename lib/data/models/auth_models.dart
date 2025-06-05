/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证API模型 (AuthModels)
 * 功能：
 * 1. 定义认证相关的API请求和响应模型
 * 2. 对应Spring Boot后端的AuthDto
 * 3. 支持JSON序列化/反序列化
 * 4. 提供数据转换方法
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// 用户注册请求模型
/// 
/// 对应Spring Boot的RegisterRequest
@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    /// 邮箱地址
    required String email,
    
    /// 密码
    required String password,
    
    /// 用户姓名（可选）
    String? name,
    
    /// 是否同意服务条款
    @Default(false) bool agreeToTerms,
  }) = _RegisterRequestModel;

  /// 从JSON创建实例
  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}

/// 用户登录请求模型
/// 
/// 对应Spring Boot的LoginRequest
@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    /// 邮箱地址
    required String email,
    
    /// 密码
    required String password,
    
    /// 设备信息（可选）
    DeviceInfoModel? deviceInfo,
  }) = _LoginRequestModel;

  /// 从JSON创建实例
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

/// 设备信息模型
/// 
/// 对应Spring Boot的DeviceInfo
@freezed
class DeviceInfoModel with _$DeviceInfoModel {
  const factory DeviceInfoModel({
    /// 设备ID
    required String deviceId,
    
    /// 平台类型
    required String platform,
    
    /// 应用版本
    required String version,
  }) = _DeviceInfoModel;

  /// 从JSON创建实例
  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoModelFromJson(json);
}

/// 刷新令牌请求模型
/// 
/// 对应Spring Boot的RefreshTokenRequest
@freezed
class RefreshTokenRequestModel with _$RefreshTokenRequestModel {
  const factory RefreshTokenRequestModel({
    /// 刷新令牌
    required String refreshToken,
  }) = _RefreshTokenRequestModel;

  /// 从JSON创建实例
  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);
}

/// 认证响应模型
/// 
/// 对应Spring Boot的AuthResponse
@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    /// 用户信息
    required UserDtoModel user,
    
    /// 令牌信息
    required TokenInfoModel tokens,
  }) = _AuthResponseModel;

  /// 从JSON创建实例
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

/// 令牌信息模型
/// 
/// 对应Spring Boot的TokenInfo
@freezed
class TokenInfoModel with _$TokenInfoModel {
  const factory TokenInfoModel({
    /// 访问令牌
    required String accessToken,
    
    /// 刷新令牌
    required String refreshToken,
    
    /// 过期时间（秒）
    required int expiresIn,
    
    /// 令牌类型
    @Default('Bearer') String tokenType,
  }) = _TokenInfoModel;

  /// 从JSON创建实例
  factory TokenInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoModelFromJson(json);
}

/// 用户DTO模型
/// 
/// 对应Spring Boot的UserDto
@freezed
class UserDtoModel with _$UserDtoModel {
  const factory UserDtoModel({
    /// 用户ID
    required String id,
    
    /// 邮箱地址
    required String email,
    
    /// 用户姓名
    String? name,
    
    /// 邮箱是否已验证
    required bool emailVerified,
    
    /// 用户资料
    UserProfileDtoModel? profile,
    
    /// 创建时间
    required DateTime createdAt,
  }) = _UserDtoModel;

  /// 从JSON创建实例
  factory UserDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDtoModelFromJson(json);
}

/// 用户资料DTO模型
/// 
/// 对应Spring Boot的UserProfileDto
@freezed
class UserProfileDtoModel with _$UserProfileDtoModel {
  const factory UserProfileDtoModel({
    /// 戒烟开始日期
    DateTime? quitDate,
    
    /// 戒烟理由
    String? quitReason,
    
    /// 每日吸烟量
    int? cigarettesPerDay,
    
    /// 香烟价格
    double? cigarettePrice,
    
    /// 货币代码
    @Default('CNY') String currency,
    
    /// 时区
    @Default('UTC') String timezone,
    
    /// 语言代码
    @Default('zh-CN') String locale,
  }) = _UserProfileDtoModel;

  /// 从JSON创建实例
  factory UserProfileDtoModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoModelFromJson(json);
}

/// 忘记密码请求模型
@freezed
class ForgotPasswordRequestModel with _$ForgotPasswordRequestModel {
  const factory ForgotPasswordRequestModel({
    /// 邮箱地址
    required String email,
  }) = _ForgotPasswordRequestModel;

  /// 从JSON创建实例
  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);
}

/// 重置密码请求模型
@freezed
class ResetPasswordRequestModel with _$ResetPasswordRequestModel {
  const factory ResetPasswordRequestModel({
    /// 重置令牌
    required String token,
    
    /// 新密码
    required String newPassword,
  }) = _ResetPasswordRequestModel;

  /// 从JSON创建实例
  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestModelFromJson(json);
}
