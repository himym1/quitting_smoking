import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/core/theme/app_theme_provider.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/core/providers/locale_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // 获取主题状态
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.settingsPageTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: [
          // 用户信息卡片
          _buildUserInfoCard(context, ref),

          const SizedBox(height: 16),

          // 应用设置
          _buildSettingsSection(context, localizations.appSettingsTitle, [
            SettingItem(
              icon: Icons.notifications_outlined,
              title: localizations.notificationsSettingTitle,
              subtitle: localizations.notificationsSettingSubtitle,
              onTap: () {
                // 导航到通知设置页面
                context.go('/settings/notifications');
              },
            ),
            SettingItem(
              icon: Icons.language_outlined,
              title: localizations.languageSettingTitle,
              subtitle: localizations.languageSettingSubtitle,
              onTap: () {
                // 显示语言选择对话框
                _showLanguageSelectionDialog(context, ref);
              },
            ),
            SettingItem(
              icon: Icons.dark_mode_outlined,
              title: localizations.themeSettingTitle,
              subtitle: localizations.themeSettingSubtitle,
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  // 切换主题
                  ref.read(themeProvider.notifier).toggleDarkMode();
                },
              ),
            ),
          ]),

          const SizedBox(height: 16),

          // 健康数据设置
          _buildSettingsSection(
            context,
            localizations.healthDataSettingsTitle,
            [
              SettingItem(
                icon: Icons.smoke_free,
                title: localizations.smokingDataSettingTitle,
                subtitle: localizations.smokingDataSettingSubtitle,
                onTap: () {
                  // 导航到吸烟数据设置页面
                  context.go('/settings/smoking-data');
                },
              ),
              SettingItem(
                icon: Icons.date_range_outlined,
                title: localizations.quitDateSettingTitle,
                subtitle: localizations.quitDateSettingSubtitle,
                onTap: () {
                  // 导航到戒烟日期设置页面
                  context.go('/settings/quit-date');
                },
              ),
              SettingItem(
                icon: Icons.delete_outline,
                title: localizations.resetDataSettingTitle,
                subtitle: localizations.resetDataSettingSubtitle,
                onTap: () {
                  // 显示确认对话框
                  _showResetConfirmationDialog(context);
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 关于和支持
          _buildSettingsSection(context, localizations.aboutAndSupportTitle, [
            SettingItem(
              icon: Icons.info_outline,
              title: localizations.aboutAppSettingTitle,
              subtitle: localizations.aboutAppSettingSubtitle,
              onTap: () {
                // 导航到关于应用页面
                context.go('/settings/about');
              },
            ),
            SettingItem(
              icon: Icons.help_outline,
              title: localizations.helpAndSupportSettingTitle,
              subtitle: localizations.helpAndSupportSettingSubtitle,
              onTap: () {
                // 导航到帮助和支持页面
                context.go('/settings/help-support');
              },
            ),
            SettingItem(
              icon: Icons.privacy_tip_outlined,
              title: localizations.privacyPolicySettingTitle,
              subtitle: localizations.privacyPolicySettingSubtitle,
              onTap: () {
                // 导航到隐私政策页面
                context.go('/settings/privacy-policy');
              },
            ),
          ]),

          const SizedBox(height: 24),

          // 退出登录按钮
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () => _handleLogout(context, ref),
              icon: const Icon(Icons.logout),
              label: Text(localizations.logoutButtonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: theme.colorScheme.onError,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);

    String? username;
    authState.whenOrNull(
      authenticated: (userProfile) => username = userProfile.userId,
    );

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: theme.primaryColor.withOpacity(0.1),
              child: Icon(Icons.person, size: 36, color: theme.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username != null ? username!.split('-').first : '未登录用户',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '点击编辑个人信息',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // 导航到编辑个人信息页面
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('编辑个人信息功能即将推出')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<SettingItem> items,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children:
                items.map((item) {
                  return ListTile(
                    leading: Icon(item.icon, color: theme.primaryColor),
                    title: Text(item.title),
                    subtitle: Text(item.subtitle),
                    trailing:
                        item.trailing ??
                        const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: item.onTap,
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  void _showLanguageSelectionDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('选择语言'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('English'),
                  onTap: () {
                    Navigator.of(context).pop();
                    final localeNotifier = ref.read(localeProvider.notifier);
                    localeNotifier.setLocale(AppLanguages.english);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Language changed to English'),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('中文'),
                  onTap: () {
                    Navigator.of(context).pop();
                    final localeNotifier = ref.read(localeProvider.notifier);
                    localeNotifier.setLocale(AppLanguages.chinese);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('语言已切换为中文')));
                  },
                ),
                ListTile(
                  title: const Text('简体中文'),
                  onTap: () {
                    Navigator.of(context).pop();
                    final localeNotifier = ref.read(localeProvider.notifier);
                    localeNotifier.setLocale(AppLanguages.zhCN);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('语言已切换为简体中文')));
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
            ],
          ),
    );
  }

  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('重置数据'),
            content: const Text('确定要重置所有戒烟进度数据吗？这将清除您的所有成就和历史记录。此操作无法撤销。'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('数据重置功能即将推出')));
                },
                child: const Text('重置'),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ],
          ),
    );
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('退出登录'),
            content: const Text('确定要退出登录吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // 执行退出登录
                  final authNotifier = ref.read(authNotifierProvider.notifier);
                  authNotifier.logout();

                  // 导航到登录页面
                  context.go('/login');
                },
                child: const Text('确定'),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ],
          ),
    );
  }
}

class SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });
}
