import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

import 'package:quitting_smoking/presentation/features/achievements/controllers/achievement_controller.dart';
import 'package:quitting_smoking/presentation/features/achievements/providers/achievement_notifier.dart';
import 'package:quitting_smoking/presentation/features/achievements/widgets/achievement_unlocked_modal.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/core/utils/localization_extensions.dart';

/// A page that displays the user's achievements.
class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final achievementState = ref.watch(achievementControllerProvider);
    final achievements = achievementState.allAchievements;
    final unlockedAchievements = achievementState.unlockedAchievements;

    // Map of achievement IDs to unlock status
    final unlockedMap = {
      for (var achievement in unlockedAchievements)
        achievement.achievementId: true,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '成就',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          // 调试按钮 - 清除所有成就
          if (achievementState.unlockedAchievements.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: '重置成就（调试用）',
              onPressed: () => _showResetDialog(context, ref),
            ),
        ],
      ),
      body:
          achievementState.isLoading
              ? const Center(child: CircularProgressIndicator())
              : achievementState.error != null
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      achievementState.error!,
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
              : achievements.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_events_outlined,
                      size: 64,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.noAchievementsAvailable,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              )
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 成就统计
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${unlockedAchievements.length} / ${achievements.length}',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '已解锁成就',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 成就列表
                    ...achievements.map((achievement) {
                      final isUnlocked = unlockedMap.containsKey(
                        achievement.id,
                      );
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildAchievementCard(
                          context,
                          theme,
                          l10n,
                          achievement,
                          isUnlocked,
                        ),
                      );
                    }),
                  ],
                ),
              ),
    );
  }

  Widget _buildAchievementCard(
    BuildContext context,
    ThemeData theme,
    AppLocalizations l10n,
    AchievementDefinition achievement,
    bool isUnlocked,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isUnlocked
                  ? theme.colorScheme.primary.withOpacity(0.3)
                  : theme.colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 成就图标
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color:
                    isUnlocked
                        ? theme.colorScheme.primary.withOpacity(0.1)
                        : theme.colorScheme.surfaceContainerHighest.withOpacity(
                          0.5,
                        ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getAchievementIcon(achievement.id),
                size: 28,
                color:
                    isUnlocked
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 16),

            // 成就信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 成就标题
                  Text(
                    _getAchievementTitle(l10n, achievement),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          isUnlocked
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // 成就描述
                  Text(
                    _getAchievementDescription(l10n, achievement),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color:
                          isUnlocked
                              ? theme.colorScheme.onSurface.withOpacity(0.8)
                              : theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            // 解锁状态指示器
            if (isUnlocked)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withOpacity(
                    0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.lock_outline,
                  size: 20,
                  color: theme.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getAchievementIcon(String achievementId) {
    // 根据成就类型返回不同图标
    if (achievementId.contains('day') || achievementId.contains('1_day')) {
      return Icons.today;
    } else if (achievementId.contains('week') ||
        achievementId.contains('7_days')) {
      return Icons.date_range;
    } else if (achievementId.contains('month') ||
        achievementId.contains('30_days')) {
      return Icons.calendar_month;
    } else if (achievementId.contains('year') ||
        achievementId.contains('365_days')) {
      return Icons.celebration;
    } else if (achievementId.contains('save') ||
        achievementId.contains('money')) {
      return Icons.savings;
    } else {
      return Icons.emoji_events;
    }
  }

  /// 根据成就获取本地化标题
  String _getAchievementTitle(
    AppLocalizations l10n,
    AchievementDefinition achievement,
  ) {
    // 首先尝试使用本地化键
    final localizedName = l10n.getString(achievement.nameKey);
    if (localizedName != null) {
      return localizedName;
    }

    // 如果没有本地化键，使用成就名称
    return achievement.name;
  }

  /// 根据成就获取本地化描述
  String _getAchievementDescription(
    AppLocalizations l10n,
    AchievementDefinition achievement,
  ) {
    // 首先尝试使用本地化键
    final localizedDesc = l10n.getString(achievement.descriptionKey);
    if (localizedDesc != null) {
      return localizedDesc;
    }

    // 如果没有本地化键，使用成就描述
    return achievement.description;
  }

  /// 显示重置确认对话框
  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('重置成就'),
            content: const Text('这将清除所有已解锁的成就数据。此操作不可撤销，确定要继续吗？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _resetAllAchievements(ref);
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('成就数据已重置')));
                  }
                },
                child: const Text('确定'),
              ),
            ],
          ),
    );
  }

  /// 重置所有成就数据
  Future<void> _resetAllAchievements(WidgetRef ref) async {
    try {
      final controller = ref.read(achievementControllerProvider.notifier);
      await controller.clearAllAchievements();
    } catch (e) {
      logError('重置成就时出错', tag: 'AchievementsPage', error: e);
    }
  }
}

/// For testing purposes - unlock an achievement
Future<void> unlockAchievementForTesting(
  WidgetRef ref,
  String achievementId,
) async {
  final controller = ref.read(achievementControllerProvider.notifier);
  final achievement = await controller.unlockAchievement(achievementId);

  if (achievement != null) {
    // Show the unlocked modal
    AchievementUnlockedModal.show(
      context: ref.context,
      achievement: achievement,
    );
  }
}
