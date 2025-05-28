import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// 通知类型
enum NotificationType {
  achievement, // 成就解锁
  healthMilestone, // 健康里程碑
  encouragement, // 鼓励消息
}

/// 通知服务类
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _notificationChannelId = 'quit_journey_channel';
  final _notificationChannelName = 'Quit Journey Notifications';
  final _notificationChannelDescription = 'Notifications for Quit Journey app';

  /// 初始化通知服务
  Future<void> init() async {
    // 安卓通知初始化设置
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS通知初始化设置
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
        );

    // 初始化设置
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    // 初始化本地通知插件
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    // 初始化时区数据
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  /// 请求通知权限
  Future<bool> requestPermission() async {
    // iOS实现
    final iOSImplementation =
        _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >();

    if (iOSImplementation != null) {
      bool? granted = await iOSImplementation.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      return granted ?? false;
    }

    // Android 13+ (API 33+)实现
    final androidImplementation =
        _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    if (androidImplementation != null) {
      try {
        // 使用requestNotificationsPermission方法
        bool? granted =
            await androidImplementation.requestNotificationsPermission();
        return granted ?? false;
      } catch (e) {
        // 如果方法不可用，则假设权限已授予
        print('Android通知权限请求失败: $e');
        return true;
      }
    }

    // 对于旧版Android，无需请求权限
    return true;
  }

  /// 处理通知点击事件
  void _onDidReceiveNotificationResponse(NotificationResponse response) {
    // TODO: 根据不同通知类型和payload，执行不同操作，如打开特定页面
    print('点击了通知: ${response.payload}');
  }

  /// 显示即时通知
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      _notificationChannelId,
      _notificationChannelName,
      channelDescription: _notificationChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    DarwinNotificationDetails iOSDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// 取消指定ID的通知
  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  /// 取消所有通知
  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  /// 显示成就解锁通知
  Future<void> showAchievementNotification({
    required String achievementName,
  }) async {
    await showNotification(
      id: NotificationType.achievement.index,
      title: '成就解锁！',
      body: '恭喜您解锁了"$achievementName"成就！',
      payload: 'achievement',
    );
  }

  /// 显示健康里程碑通知
  Future<void> showHealthMilestoneNotification({
    required String milestoneName,
    required String milestoneDescription,
  }) async {
    await showNotification(
      id: NotificationType.healthMilestone.index,
      title: '健康里程碑：$milestoneName',
      body: milestoneDescription,
      payload: 'healthMilestone',
    );
  }

  /// 显示鼓励消息通知
  Future<void> showEncouragementNotification({required String message}) async {
    await showNotification(
      id: NotificationType.encouragement.index,
      title: '坚持就是胜利！',
      body: message,
      payload: 'encouragement',
    );
  }
}
