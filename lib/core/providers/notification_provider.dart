import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/core/services/notification_service.dart';

/// 通知设置状态类
class NotificationSettings {
  // 通知类型设置
  final bool achievementNotifications;
  final bool healthMilestoneNotifications;
  final bool encouragementNotifications;

  // 通知时间设置
  final TimeOfDay doNotDisturbStart;
  final TimeOfDay doNotDisturbEnd;

  const NotificationSettings({
    this.achievementNotifications = true,
    this.healthMilestoneNotifications = true,
    this.encouragementNotifications = false,
    this.doNotDisturbStart = const TimeOfDay(hour: 22, minute: 0),
    this.doNotDisturbEnd = const TimeOfDay(hour: 7, minute: 0),
  });

  NotificationSettings copyWith({
    bool? achievementNotifications,
    bool? healthMilestoneNotifications,
    bool? encouragementNotifications,
    TimeOfDay? doNotDisturbStart,
    TimeOfDay? doNotDisturbEnd,
  }) {
    return NotificationSettings(
      achievementNotifications:
          achievementNotifications ?? this.achievementNotifications,
      healthMilestoneNotifications:
          healthMilestoneNotifications ?? this.healthMilestoneNotifications,
      encouragementNotifications:
          encouragementNotifications ?? this.encouragementNotifications,
      doNotDisturbStart: doNotDisturbStart ?? this.doNotDisturbStart,
      doNotDisturbEnd: doNotDisturbEnd ?? this.doNotDisturbEnd,
    );
  }

  // 将TimeOfDay转换为可以存储的分钟数
  static int timeOfDayToMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  // 从分钟数恢复TimeOfDay
  static TimeOfDay minutesToTimeOfDay(int minutes) {
    return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
  }

  // 转换为可存储的Map
  Map<String, dynamic> toJson() {
    return {
      'achievementNotifications': achievementNotifications,
      'healthMilestoneNotifications': healthMilestoneNotifications,
      'encouragementNotifications': encouragementNotifications,
      'doNotDisturbStart': timeOfDayToMinutes(doNotDisturbStart),
      'doNotDisturbEnd': timeOfDayToMinutes(doNotDisturbEnd),
    };
  }

  // 从Map恢复数据
  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      achievementNotifications: json['achievementNotifications'] ?? true,
      healthMilestoneNotifications:
          json['healthMilestoneNotifications'] ?? true,
      encouragementNotifications: json['encouragementNotifications'] ?? false,
      doNotDisturbStart: minutesToTimeOfDay(
        json['doNotDisturbStart'] ?? 1320,
      ), // 默认22:00
      doNotDisturbEnd: minutesToTimeOfDay(
        json['doNotDisturbEnd'] ?? 420,
      ), // 默认7:00
    );
  }
}

/// 通知设置Notifier
class NotificationSettingsNotifier extends StateNotifier<NotificationSettings> {
  final HiveInterface _hive;
  final NotificationService _notificationService;

  NotificationSettingsNotifier({required HiveInterface hive})
    : _hive = hive,
      _notificationService = NotificationService(),
      super(const NotificationSettings()) {
    _loadSettings();
  }

  /// 从存储中加载通知设置
  Future<void> _loadSettings() async {
    try {
      final box = await _getSettingsBox();
      final savedSettings = box.get('notificationSettings');

      if (savedSettings != null) {
        state = NotificationSettings.fromJson(
          Map<String, dynamic>.from(savedSettings),
        );
      }

      // 初始化通知服务
      await _notificationService.init();

      // 根据当前设置预先安排通知
      _applyNotificationSettings();
    } catch (e) {
      logError('加载通知设置出错', tag: 'NotificationProvider', error: e);
      // 出错时保持默认设置
    }
  }

  /// 保存通知设置
  Future<void> _saveSettings() async {
    try {
      final box = await _getSettingsBox();
      await box.put('notificationSettings', state.toJson());

      // 应用新的通知设置
      _applyNotificationSettings();
    } catch (e) {
      logError('保存通知设置出错', tag: 'NotificationProvider', error: e);
    }
  }

  /// 获取设置Box
  Future<Box> _getSettingsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.settingsBoxName)) {
      return await _hive.openBox(HiveConstants.settingsBoxName);
    }
    return _hive.box(HiveConstants.settingsBoxName);
  }

  /// 应用通知设置，重新安排通知
  Future<void> _applyNotificationSettings() async {
    try {
      // 请求通知权限
      bool permissionGranted = await _notificationService.requestPermission();

      if (!permissionGranted) {
        logWarning('通知权限被拒绝', tag: 'NotificationProvider');
        return;
      }

      // 首先取消所有通知，然后重新安排
      await _notificationService.cancelAllNotifications();

      // 如果启用了每日打卡提醒，安排每日提醒
      // 由于dailyCheckInNotifications字段已被移除，这里不需要安排每日打卡提醒

      // 未来可以在这里添加更多的通知类型安排
    } catch (e) {
      logError('应用通知设置出错', tag: 'NotificationProvider', error: e);
    }
  }

  // 更新成就通知设置
  Future<void> setAchievementNotifications(bool value) async {
    state = state.copyWith(achievementNotifications: value);
    await _saveSettings();
  }

  // 更新健康里程碑通知设置
  Future<void> setHealthMilestoneNotifications(bool value) async {
    state = state.copyWith(healthMilestoneNotifications: value);
    await _saveSettings();
  }

  // 更新鼓励消息通知设置
  Future<void> setEncouragementNotifications(bool value) async {
    state = state.copyWith(encouragementNotifications: value);
    await _saveSettings();
  }

  // 更新免打扰时段开始时间
  Future<void> setDoNotDisturbStart(TimeOfDay time) async {
    state = state.copyWith(doNotDisturbStart: time);
    await _saveSettings();
  }

  // 更新免打扰时段结束时间
  Future<void> setDoNotDisturbEnd(TimeOfDay time) async {
    state = state.copyWith(doNotDisturbEnd: time);
    await _saveSettings();
  }
}

/// 通知设置提供者
final notificationSettingsProvider =
    StateNotifierProvider<NotificationSettingsNotifier, NotificationSettings>(
      (ref) => NotificationSettingsNotifier(hive: Hive),
    );

/// 通知服务提供者 - 方便在需要发送通知的地方使用
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
