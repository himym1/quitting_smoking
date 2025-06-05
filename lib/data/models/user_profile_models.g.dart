// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateUserProfileRequestModelImpl
    _$$UpdateUserProfileRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$UpdateUserProfileRequestModelImpl(
          quitDate: json['quitDate'] == null
              ? null
              : DateTime.parse(json['quitDate'] as String),
          quitReason: json['quitReason'] as String?,
          cigarettesPerDay: (json['cigarettesPerDay'] as num?)?.toInt(),
          cigarettePrice: (json['cigarettePrice'] as num?)?.toDouble(),
          smokingYears: (json['smokingYears'] as num?)?.toInt(),
          currency: json['currency'] as String? ?? 'CNY',
          timezone: json['timezone'] as String? ?? 'Asia/Shanghai',
          locale: json['locale'] as String? ?? 'zh-CN',
        );

Map<String, dynamic> _$$UpdateUserProfileRequestModelImplToJson(
        _$UpdateUserProfileRequestModelImpl instance) =>
    <String, dynamic>{
      'quitDate': instance.quitDate?.toIso8601String(),
      'quitReason': instance.quitReason,
      'cigarettesPerDay': instance.cigarettesPerDay,
      'cigarettePrice': instance.cigarettePrice,
      'smokingYears': instance.smokingYears,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'locale': instance.locale,
    };

_$UserProfileResponseModelImpl _$$UserProfileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseModelImpl(
      userId: json['userId'] as String,
      quitDate: json['quitDate'] == null
          ? null
          : DateTime.parse(json['quitDate'] as String),
      quitReason: json['quitReason'] as String?,
      cigarettesPerDay: (json['cigarettesPerDay'] as num?)?.toInt(),
      cigarettePrice: (json['cigarettePrice'] as num?)?.toDouble(),
      smokingYears: (json['smokingYears'] as num?)?.toInt(),
      currency: json['currency'] as String? ?? 'CNY',
      timezone: json['timezone'] as String? ?? 'Asia/Shanghai',
      locale: json['locale'] as String? ?? 'zh-CN',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileResponseModelImplToJson(
        _$UserProfileResponseModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'quitDate': instance.quitDate?.toIso8601String(),
      'quitReason': instance.quitReason,
      'cigarettesPerDay': instance.cigarettesPerDay,
      'cigarettePrice': instance.cigarettePrice,
      'smokingYears': instance.smokingYears,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'locale': instance.locale,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$UserStatsResponseModelImpl _$$UserStatsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatsResponseModelImpl(
      quitDays: (json['quitDays'] as num).toInt(),
      moneySaved: (json['moneySaved'] as num).toDouble(),
      cigarettesNotSmoked: (json['cigarettesNotSmoked'] as num).toInt(),
      consecutiveCheckIns: (json['consecutiveCheckIns'] as num).toInt(),
      totalCheckIns: (json['totalCheckIns'] as num).toInt(),
      longestQuitStreak: (json['longestQuitStreak'] as num).toInt(),
      currentQuitStreak: (json['currentQuitStreak'] as num).toInt(),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
    );

Map<String, dynamic> _$$UserStatsResponseModelImplToJson(
        _$UserStatsResponseModelImpl instance) =>
    <String, dynamic>{
      'quitDays': instance.quitDays,
      'moneySaved': instance.moneySaved,
      'cigarettesNotSmoked': instance.cigarettesNotSmoked,
      'consecutiveCheckIns': instance.consecutiveCheckIns,
      'totalCheckIns': instance.totalCheckIns,
      'longestQuitStreak': instance.longestQuitStreak,
      'currentQuitStreak': instance.currentQuitStreak,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };

_$UserSettingsModelImpl _$$UserSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSettingsModelImpl(
      notifications: NotificationSettingsModel.fromJson(
          json['notifications'] as Map<String, dynamic>),
      privacy: PrivacySettingsModel.fromJson(
          json['privacy'] as Map<String, dynamic>),
      display: DisplaySettingsModel.fromJson(
          json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserSettingsModelImplToJson(
        _$UserSettingsModelImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'privacy': instance.privacy,
      'display': instance.display,
    };

_$NotificationSettingsModelImpl _$$NotificationSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsModelImpl(
      pushEnabled: json['pushEnabled'] as bool? ?? true,
      dailyReminder: json['dailyReminder'] as bool? ?? true,
      dailyReminderHour: (json['dailyReminderHour'] as num?)?.toInt() ?? 9,
      achievementNotifications:
          json['achievementNotifications'] as bool? ?? true,
      cravingReminders: json['cravingReminders'] as bool? ?? true,
      motivationalMessages: json['motivationalMessages'] as bool? ?? true,
    );

Map<String, dynamic> _$$NotificationSettingsModelImplToJson(
        _$NotificationSettingsModelImpl instance) =>
    <String, dynamic>{
      'pushEnabled': instance.pushEnabled,
      'dailyReminder': instance.dailyReminder,
      'dailyReminderHour': instance.dailyReminderHour,
      'achievementNotifications': instance.achievementNotifications,
      'cravingReminders': instance.cravingReminders,
      'motivationalMessages': instance.motivationalMessages,
    };

_$PrivacySettingsModelImpl _$$PrivacySettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrivacySettingsModelImpl(
      allowAnalytics: json['allowAnalytics'] as bool? ?? true,
      allowCrashReports: json['allowCrashReports'] as bool? ?? true,
      allowPersonalization: json['allowPersonalization'] as bool? ?? true,
      dataRetentionDays: (json['dataRetentionDays'] as num?)?.toInt() ?? 365,
    );

Map<String, dynamic> _$$PrivacySettingsModelImplToJson(
        _$PrivacySettingsModelImpl instance) =>
    <String, dynamic>{
      'allowAnalytics': instance.allowAnalytics,
      'allowCrashReports': instance.allowCrashReports,
      'allowPersonalization': instance.allowPersonalization,
      'dataRetentionDays': instance.dataRetentionDays,
    };

_$DisplaySettingsModelImpl _$$DisplaySettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DisplaySettingsModelImpl(
      themeMode: json['themeMode'] as String? ?? 'system',
      language: json['language'] as String? ?? 'zh-CN',
      currency: json['currency'] as String? ?? 'CNY',
      dateFormat: json['dateFormat'] as String? ?? 'yyyy-MM-dd',
      timeFormat: json['timeFormat'] as String? ?? 'HH:mm',
      showDetailedStats: json['showDetailedStats'] as bool? ?? true,
      showProgressAnimations: json['showProgressAnimations'] as bool? ?? true,
    );

Map<String, dynamic> _$$DisplaySettingsModelImplToJson(
        _$DisplaySettingsModelImpl instance) =>
    <String, dynamic>{
      'themeMode': instance.themeMode,
      'language': instance.language,
      'currency': instance.currency,
      'dateFormat': instance.dateFormat,
      'timeFormat': instance.timeFormat,
      'showDetailedStats': instance.showDetailedStats,
      'showProgressAnimations': instance.showProgressAnimations,
    };

_$SyncStatusModelImpl _$$SyncStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncStatusModelImpl(
      lastSyncTime: json['lastSyncTime'] == null
          ? null
          : DateTime.parse(json['lastSyncTime'] as String),
      isSyncing: json['isSyncing'] as bool? ?? false,
      state: $enumDecodeNullable(_$SyncStateEnumMap, json['state']) ??
          SyncState.idle,
      pendingDataTypes: (json['pendingDataTypes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
      nextSyncTime: json['nextSyncTime'] == null
          ? null
          : DateTime.parse(json['nextSyncTime'] as String),
    );

Map<String, dynamic> _$$SyncStatusModelImplToJson(
        _$SyncStatusModelImpl instance) =>
    <String, dynamic>{
      'lastSyncTime': instance.lastSyncTime?.toIso8601String(),
      'isSyncing': instance.isSyncing,
      'state': _$SyncStateEnumMap[instance.state]!,
      'pendingDataTypes': instance.pendingDataTypes,
      'errorMessage': instance.errorMessage,
      'nextSyncTime': instance.nextSyncTime?.toIso8601String(),
    };

const _$SyncStateEnumMap = {
  SyncState.idle: 'idle',
  SyncState.syncing: 'syncing',
  SyncState.success: 'success',
  SyncState.error: 'error',
  SyncState.partial: 'partial',
};
