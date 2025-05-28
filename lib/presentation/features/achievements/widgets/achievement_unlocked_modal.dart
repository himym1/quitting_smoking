import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/presentation/common_widgets/bottom_sheet_wrapper.dart';
import 'package:quitting_smoking/presentation/common_widgets/lottie_animation.dart';
import 'package:quitting_smoking/presentation/common_widgets/primary_button.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/core/utils/localization_extensions.dart';

/// A modal bottom sheet that displays when a user unlocks an achievement.
class AchievementUnlockedModal extends ConsumerWidget {
  /// The achievement that was unlocked
  final AchievementDefinition achievement;

  const AchievementUnlockedModal({super.key, required this.achievement});

  /// Show this modal bottom sheet
  static Future<void> show({
    required BuildContext context,
    required AchievementDefinition achievement,
  }) {
    return BottomSheetWrapper.show(
      context: context,
      content: AchievementUnlockedModal(achievement: achievement),
      isDismissible: false,
      enableDrag: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Celebration Animation
        const LottieAnimation(
          assetPath: 'assets/lottie/achievement_unlocked.json',
          width: 200,
          height: 200,
          repeat: false,
          autoPlay: true,
        ),

        // Achievement Title
        Text(
          l10n.achievementUnlockedTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        // 使用纯文字的成就卡片设计，参考Figma
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // 左侧图标
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getAchievementIcon(achievement.id),
                  color: theme.colorScheme.onPrimaryContainer,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),

              // 右侧文字内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 成就标题
                    Text(
                      _getAchievementTitle(l10n, achievement),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // 成就描述
                    Text(
                      _getAchievementDescription(l10n, achievement),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer.withOpacity(
                          0.8,
                        ),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Achievement Name
        Text(
          _getAchievementTitle(l10n, achievement),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        // Achievement Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            _getAchievementDescription(l10n, achievement),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // Achievement Story (if available)
        if (achievement.storyKey != null) ...[
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  l10n.achievementStoryTitle,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  _getAchievementStory(l10n, achievement),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 32),

        // Close Button
        PrimaryButton(
          text: l10n.continueButtonLabel,
          onPressed: () => Navigator.of(context).pop(),
          width: double.infinity,
        ),
      ],
    );
  }

  /// 根据成就ID获取对应的图标
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

  /// 根据成就获取本地化故事
  String _getAchievementStory(
    AppLocalizations l10n,
    AchievementDefinition achievement,
  ) {
    // 首先尝试使用本地化键
    if (achievement.storyKey != null) {
      final localizedStory = l10n.getString(achievement.storyKey!);
      if (localizedStory != null) {
        return localizedStory;
      }
    }

    // 如果没有本地化键，返回默认文本
    return achievement.storyKey ?? '';
  }
}
