/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证数据映射器 (AuthMapper)
 * 功能：
 * 1. 处理Flutter实体与API模型之间的转换
 * 2. 解决字段名和数据类型差异
 * 3. 提供双向转换方法
 * 4. 确保数据一致性
 */

import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';

/// 认证数据映射器
///
/// 负责Flutter实体和API模型之间的数据转换
class AuthMapper {
  // ==================== UserProfile 转换 ====================

  /// 将UserProfile实体转换为UserProfileDto模型
  ///
  /// 处理字段名差异：
  /// - quitDateTime -> quitDate
  /// - dailyCigarettes -> cigarettesPerDay
  /// - packPrice -> cigarettePrice
  static UserProfileDtoModel userProfileToDto(UserProfile userProfile) {
    return UserProfileDtoModel(
      quitDate: userProfile.quitDateTime,
      quitReason: userProfile.quitReason,
      cigarettesPerDay: userProfile.dailyCigarettes,
      cigarettePrice: userProfile.packPrice,
      currency: 'CNY', // 默认货币
      timezone: 'Asia/Shanghai', // 默认时区
      locale: 'zh-CN', // 默认语言
    );
  }

  /// 将UserProfileDto模型转换为UserProfile实体
  ///
  /// 处理字段名差异和数据类型转换
  static UserProfile userProfileFromDto(
    UserProfileDtoModel dto, {
    String? userId,
    bool onboardingCompleted = true,
  }) {
    return UserProfile(
      userId: userId,
      quitDateTime: dto.quitDate,
      quitReason: dto.quitReason,
      dailyCigarettes: dto.cigarettesPerDay,
      packPrice: dto.cigarettePrice,
      smokingYears: null, // API暂不支持此字段
      onboardingCompleted: onboardingCompleted,
    );
  }

  /// 更新UserProfile实体的部分字段
  ///
  /// 用于从API响应更新本地实体
  static UserProfile updateUserProfileFromDto(
    UserProfile original,
    UserProfileDtoModel dto,
  ) {
    return original.copyWith(
      quitDateTime: dto.quitDate ?? original.quitDateTime,
      quitReason: dto.quitReason ?? original.quitReason,
      dailyCigarettes: dto.cigarettesPerDay ?? original.dailyCigarettes,
      packPrice: dto.cigarettePrice ?? original.packPrice,
    );
  }

  // ==================== 认证请求转换 ====================

  /// 创建注册请求模型
  static RegisterRequestModel createRegisterRequest({
    required String email,
    required String password,
    String? name,
    bool agreeToTerms = true,
  }) {
    return RegisterRequestModel(
      email: email,
      password: password,
      name: name,
      agreeToTerms: agreeToTerms,
    );
  }

  /// 创建登录请求模型
  static LoginRequestModel createLoginRequest({
    required String email,
    required String password,
    String? deviceId,
    String? platform,
    String? version,
  }) {
    DeviceInfoModel? deviceInfo;
    if (deviceId != null && platform != null && version != null) {
      deviceInfo = DeviceInfoModel(
        deviceId: deviceId,
        platform: platform,
        version: version,
      );
    }

    return LoginRequestModel(
      email: email,
      password: password,
      deviceInfo: deviceInfo,
    );
  }

  /// 创建刷新令牌请求模型
  static RefreshTokenRequestModel createRefreshTokenRequest(
    String refreshToken,
  ) {
    return RefreshTokenRequestModel(refreshToken: refreshToken);
  }

  /// 创建忘记密码请求模型
  static ForgotPasswordRequestModel createForgotPasswordRequest(String email) {
    return ForgotPasswordRequestModel(email: email);
  }

  /// 创建重置密码请求模型
  static ResetPasswordRequestModel createResetPasswordRequest({
    required String token,
    required String newPassword,
  }) {
    return ResetPasswordRequestModel(token: token, newPassword: newPassword);
  }

  // ==================== 认证响应转换 ====================

  /// 从认证响应提取用户资料
  ///
  /// 将API响应转换为本地UserProfile实体
  static UserProfile? extractUserProfileFromAuthResponse(
    AuthResponseModel authResponse,
  ) {
    final userDto = authResponse.user;
    final profileDto = userDto.profile;

    if (profileDto == null) {
      // 如果API没有返回用户资料，创建一个基础的实体
      return UserProfile(
        userId: userDto.id,
        quitDateTime: null,
        dailyCigarettes: null,
        packPrice: null,
        smokingYears: null,
        quitReason: null,
        onboardingCompleted: false, // 需要完成引导
      );
    }

    return userProfileFromDto(
      profileDto,
      userId: userDto.id,
      onboardingCompleted: true, // 已有资料说明已完成引导
    );
  }

  /// 从认证响应提取令牌信息
  static TokenInfoModel extractTokensFromAuthResponse(
    AuthResponseModel authResponse,
  ) {
    return authResponse.tokens;
  }

  // ==================== 数据验证 ====================

  /// 验证用户资料数据的完整性
  static bool isUserProfileComplete(UserProfile userProfile) {
    return userProfile.quitDateTime != null &&
        userProfile.dailyCigarettes != null &&
        userProfile.packPrice != null &&
        userProfile.quitReason != null &&
        userProfile.quitReason!.isNotEmpty;
  }

  /// 验证API模型数据的有效性
  static bool isUserProfileDtoValid(UserProfileDtoModel dto) {
    return dto.quitDate != null &&
        dto.cigarettesPerDay != null &&
        dto.cigarettesPerDay! > 0 &&
        dto.cigarettePrice != null &&
        dto.cigarettePrice! > 0;
  }

  // ==================== 辅助方法 ====================

  /// 获取设备信息
  static DeviceInfoModel createDeviceInfo({
    required String deviceId,
    required String platform,
    required String version,
  }) {
    return DeviceInfoModel(
      deviceId: deviceId,
      platform: platform,
      version: version,
    );
  }

  /// 格式化时间戳
  static DateTime? parseTimestamp(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) return null;
    try {
      return DateTime.parse(timestamp);
    } catch (e) {
      return null;
    }
  }
}
