/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 用户资料API模型 (UserProfileModels)
 * 功能：
 * 1. 定义用户资料相关的API请求和响应模型
 * 2. 对应Spring Boot后端的UserProfileDto
 * 3. 支持JSON序列化/反序列化
 * 4. 提供数据转换方法
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'user_profile_models.freezed.dart';
part 'user_profile_models.g.dart';

/// 用户资料更新请求模型
///
/// 对应Spring Boot的UpdateUserProfileRequest
@freezed
class UpdateUserProfileRequestModel with _$UpdateUserProfileRequestModel {
  const factory UpdateUserProfileRequestModel({
    /// 戒烟开始日期
    DateTime? quitDate,

    /// 戒烟理由
    String? quitReason,

    /// 每日吸烟量
    int? cigarettesPerDay,

    /// 香烟价格
    double? cigarettePrice,

    /// 吸烟年数
    int? smokingYears,

    /// 货币代码
    @Default('CNY') String currency,

    /// 时区
    @Default('Asia/Shanghai') String timezone,

    /// 语言代码
    @Default('zh-CN') String locale,
  }) = _UpdateUserProfileRequestModel;

  /// 从JSON创建实例
  factory UpdateUserProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileRequestModelFromJson(json);
}

/// 用户资料响应模型
///
/// 对应Spring Boot的UserProfileResponse
@freezed
class UserProfileResponseModel with _$UserProfileResponseModel {
  const factory UserProfileResponseModel({
    /// 用户ID
    required String userId,

    /// 戒烟开始日期
    DateTime? quitDate,

    /// 戒烟理由
    String? quitReason,

    /// 每日吸烟量
    int? cigarettesPerDay,

    /// 香烟价格
    double? cigarettePrice,

    /// 吸烟年数
    int? smokingYears,

    /// 货币代码
    @Default('CNY') String currency,

    /// 时区
    @Default('Asia/Shanghai') String timezone,

    /// 语言代码
    @Default('zh-CN') String locale,

    /// 创建时间
    required DateTime createdAt,

    /// 更新时间
    required DateTime updatedAt,
  }) = _UserProfileResponseModel;

  /// 从JSON创建实例
  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);
}

/// 用户统计信息模型
///
/// 对应Spring Boot的UserStatsResponse
@freezed
class UserStatsResponseModel with _$UserStatsResponseModel {
  const factory UserStatsResponseModel({
    /// 戒烟天数
    required int quitDays,

    /// 节省的金钱
    required double moneySaved,

    /// 未吸的香烟数量
    required int cigarettesNotSmoked,

    /// 连续打卡天数
    required int consecutiveCheckIns,

    /// 总打卡次数
    required int totalCheckIns,

    /// 最长连续戒烟天数
    required int longestQuitStreak,

    /// 当前连续戒烟天数
    required int currentQuitStreak,

    /// 统计计算时间
    required DateTime calculatedAt,
  }) = _UserStatsResponseModel;

  /// 从JSON创建实例
  factory UserStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsResponseModelFromJson(json);
}

/// 用户设置模型
///
/// 对应Spring Boot的UserSettingsDto
@freezed
class UserSettingsModel with _$UserSettingsModel {
  const factory UserSettingsModel({
    /// 通知设置
    required NotificationSettingsModel notifications,

    /// 隐私设置
    required PrivacySettingsModel privacy,

    /// 显示设置
    required DisplaySettingsModel display,
  }) = _UserSettingsModel;

  /// 从JSON创建实例
  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsModelFromJson(json);
}

/// 通知设置模型
@freezed
class NotificationSettingsModel with _$NotificationSettingsModel {
  const factory NotificationSettingsModel({
    /// 是否启用推送通知
    @Default(true) bool pushEnabled,

    /// 是否启用每日提醒
    @Default(true) bool dailyReminder,

    /// 每日提醒时间（小时）
    @Default(9) int dailyReminderHour,

    /// 是否启用成就通知
    @Default(true) bool achievementNotifications,

    /// 是否启用渴望提醒
    @Default(true) bool cravingReminders,

    /// 是否启用励志消息
    @Default(true) bool motivationalMessages,
  }) = _NotificationSettingsModel;

  /// 从JSON创建实例
  factory NotificationSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsModelFromJson(json);
}

/// 隐私设置模型
@freezed
class PrivacySettingsModel with _$PrivacySettingsModel {
  const factory PrivacySettingsModel({
    /// 是否允许数据分析
    @Default(true) bool allowAnalytics,

    /// 是否允许崩溃报告
    @Default(true) bool allowCrashReports,

    /// 是否允许个性化推荐
    @Default(true) bool allowPersonalization,

    /// 数据保留天数
    @Default(365) int dataRetentionDays,
  }) = _PrivacySettingsModel;

  /// 从JSON创建实例
  factory PrivacySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsModelFromJson(json);
}

/// 显示设置模型
@freezed
class DisplaySettingsModel with _$DisplaySettingsModel {
  const factory DisplaySettingsModel({
    /// 主题模式
    @Default('system') String themeMode, // 'light', 'dark', 'system'
    /// 语言代码
    @Default('zh-CN') String language,

    /// 货币显示格式
    @Default('CNY') String currency,

    /// 日期格式
    @Default('yyyy-MM-dd') String dateFormat,

    /// 时间格式
    @Default('HH:mm') String timeFormat,

    /// 是否显示详细统计
    @Default(true) bool showDetailedStats,

    /// 是否显示进度动画
    @Default(true) bool showProgressAnimations,
  }) = _DisplaySettingsModel;

  /// 从JSON创建实例
  factory DisplaySettingsModel.fromJson(Map<String, dynamic> json) =>
      _$DisplaySettingsModelFromJson(json);
}

/// 数据同步状态模型
@freezed
class SyncStatusModel with _$SyncStatusModel {
  const factory SyncStatusModel({
    /// 最后同步时间
    DateTime? lastSyncTime,

    /// 是否正在同步
    @Default(false) bool isSyncing,

    /// 同步状态
    @Default(SyncState.idle) SyncState state,

    /// 待同步的数据类型
    @Default([]) List<String> pendingDataTypes,

    /// 同步错误信息
    String? errorMessage,

    /// 下次同步时间
    DateTime? nextSyncTime,
  }) = _SyncStatusModel;

  /// 从JSON创建实例
  factory SyncStatusModel.fromJson(Map<String, dynamic> json) =>
      _$SyncStatusModelFromJson(json);
}

/// 同步状态枚举
enum SyncState {
  /// 空闲状态
  idle,

  /// 同步中
  syncing,

  /// 同步成功
  success,

  /// 同步失败
  error,

  /// 部分同步成功
  partial,
}

/// 同步状态扩展方法
extension SyncStateExtension on SyncState {
  /// 是否为同步中状态
  bool get isSyncing => this == SyncState.syncing;

  /// 是否为成功状态
  bool get isSuccess => this == SyncState.success;

  /// 是否为错误状态
  bool get isError => this == SyncState.error;

  /// 是否为部分成功状态
  bool get isPartial => this == SyncState.partial;

  /// 获取状态描述
  String get description {
    switch (this) {
      case SyncState.idle:
        return '空闲';
      case SyncState.syncing:
        return '同步中';
      case SyncState.success:
        return '同步成功';
      case SyncState.error:
        return '同步失败';
      case SyncState.partial:
        return '部分同步';
    }
  }
}
