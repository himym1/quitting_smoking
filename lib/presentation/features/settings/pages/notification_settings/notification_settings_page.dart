import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/core/providers/notification_provider.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

class NotificationSettingsPage extends ConsumerWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // 获取通知设置
    final notificationSettings = ref.watch(notificationSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.notificationsSettingTitle)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              localizations.notificationTypesTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
          ),

          // 成就提醒
          SwitchListTile(
            title: Text(localizations.achievementNotificationsTitle),
            subtitle: Text(localizations.achievementNotificationsSubtitle),
            value: notificationSettings.achievementNotifications,
            onChanged: (value) {
              // 更新通知设置
              ref
                  .read(notificationSettingsProvider.notifier)
                  .setAchievementNotifications(value);
              _showSettingsSavedSnackBar(context);
            },
          ),

          const Divider(),

          // 健康里程碑提醒
          SwitchListTile(
            title: Text(localizations.healthMilestoneNotificationsTitle),
            subtitle: Text(localizations.healthMilestoneNotificationsSubtitle),
            value: notificationSettings.healthMilestoneNotifications,
            onChanged: (value) {
              // 更新通知设置
              ref
                  .read(notificationSettingsProvider.notifier)
                  .setHealthMilestoneNotifications(value);
              _showSettingsSavedSnackBar(context);
            },
          ),

          const Divider(),

          // 鼓励消息
          SwitchListTile(
            title: Text(localizations.encouragementNotificationsTitle),
            subtitle: Text(localizations.encouragementNotificationsSubtitle),
            value: notificationSettings.encouragementNotifications,
            onChanged: (value) {
              // 更新通知设置
              ref
                  .read(notificationSettingsProvider.notifier)
                  .setEncouragementNotifications(value);
              _showSettingsSavedSnackBar(context);
            },
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              localizations.notificationTimeSettingsTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
          ),

          // 免打扰时段设置
          ListTile(
            title: Text(localizations.doNotDisturbTitle),
            subtitle: Text(
              '${_formatTimeOfDay(notificationSettings.doNotDisturbStart)} - ${_formatTimeOfDay(notificationSettings.doNotDisturbEnd)}',
            ),
            trailing: const Icon(Icons.do_not_disturb_on),
            onTap: () {
              _showDoNotDisturbSettingDialog(
                context,
                ref,
                notificationSettings,
              );
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // 格式化TimeOfDay为字符串
  String _formatTimeOfDay(TimeOfDay time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // 显示设置已保存的提示
  void _showSettingsSavedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).settingsSaved),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // 显示免打扰时段设置对话框
  void _showDoNotDisturbSettingDialog(
    BuildContext context,
    WidgetRef ref,
    NotificationSettings currentSettings,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(AppLocalizations.of(context).doNotDisturbSettingsTitle),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(AppLocalizations.of(context).startTime),
                  subtitle: Text(
                    _formatTimeOfDay(currentSettings.doNotDisturbStart),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();

                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: currentSettings.doNotDisturbStart,
                    );

                    if (selectedTime != null) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setDoNotDisturbStart(selectedTime);
                      _showSettingsSavedSnackBar(context);
                    }
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context).endTime),
                  subtitle: Text(
                    _formatTimeOfDay(currentSettings.doNotDisturbEnd),
                  ),
                  onTap: () async {
                    Navigator.of(context).pop();

                    final TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: currentSettings.doNotDisturbEnd,
                    );

                    if (selectedTime != null) {
                      ref
                          .read(notificationSettingsProvider.notifier)
                          .setDoNotDisturbEnd(selectedTime);
                      _showSettingsSavedSnackBar(context);
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context).cancel),
              ),
            ],
          ),
    );
  }
}
