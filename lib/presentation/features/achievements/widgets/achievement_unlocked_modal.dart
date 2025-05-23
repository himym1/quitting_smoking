import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/presentation/common_widgets/bottom_sheet_wrapper.dart';
import 'package:quitting_smoking/presentation/common_widgets/lottie_animation.dart';
import 'package:quitting_smoking/presentation/common_widgets/primary_button.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // 获取成就徽章图片
    final badgeImage = _getAchievementBadgeImage(achievement.id);
    final achievementColor = _getAchievementColor(achievement.id);

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

        // 使用来自Figma的成就章图片
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset(badgeImage, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 24),

        // Achievement Name
        Text(
          l10n.getString(achievement.nameKey) ?? achievement.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        // Achievement Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            l10n.getString(achievement.descriptionKey) ??
                achievement.description,
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
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '故事',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: achievementColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.getString(achievement.storyKey!) ??
                      achievement.storyKey!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
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

  // 获取成就章图片路径
  String _getAchievementBadgeImage(String achievementId) {
    // 根据成就ID映射到对应的成就章图片
    final badgeImages = [
      'assets/images/achievements/achievement_first_day.png', // 第一天
      'assets/images/achievements/achievement_one_week.png', // 一周
      'assets/images/achievements/achievement_one_month.png', // 一个月
      'assets/images/achievements/achievement_three_months.png', // 三个月
      'assets/images/achievements/achievement_six_months.png', // 六个月
      'assets/images/achievements/achievement_one_year.png', // 一年
      'assets/images/achievements/achievement_two_years.png', // 两年
      'assets/images/achievements/achievement_five_years.png', // 五年
      'assets/images/achievements/achievement_ten_years.png', // 十年
      'assets/images/achievements/achievement_lifetime.png', // 终身成就
    ];

    // 使用成就ID的哈希值来选择成就章图片
    final hashCode = achievementId.hashCode.abs();
    return badgeImages[hashCode % badgeImages.length];
  }

  // Helper method to get different colors for achievements
  Color _getAchievementColor(String achievementId) {
    // Map achievement IDs to different colors based on the Figma design
    final colors = [
      const Color(0xFFFF9B73), // First Day
      const Color(0xFF72CCFF), // One Week
      const Color(0xFFA78BFA), // One Month
      const Color(0xFF22D3EE), // Three Months
      const Color(0xFF4ADE80), // Six Months
      const Color(0xFFFBBF24), // One Year
      const Color(0xFFFF7EB6), // Two Years
      const Color(0xFF60A5FA), // Five Years
      const Color(0xFFAE7BE3), // Ten Years
      const Color(0xFFFFD700), // Lifetime
    ];

    // Use the hash of the achievement ID to select a color
    final hashCode = achievementId.hashCode.abs();
    return colors[hashCode % colors.length];
  }
}

/// Extension to get a localized string by key or return null if not found
extension AppLocalizationsExt on AppLocalizations {
  String? getString(String key) {
    try {
      // This is a simplified approach. In a real app, you would have a more robust
      // way to access localized strings by key, such as a map or reflection.
      return switch (key) {
        // Achievement names
        'achievement_7_days_name' => achievement7DaysName,
        'achievement_30_days_name' => achievement30DaysName,
        'achievement_100_days_name' => achievement100DaysName,

        // Achievement descriptions
        'achievement_7_days_desc' => achievement7DaysDesc,
        'achievement_30_days_desc' => achievement30DaysDesc,
        'achievement_100_days_desc' => achievement100DaysDesc,

        // Achievement stories
        'achievement_7_days_story' => achievement7DaysStory,
        'achievement_30_days_story' => achievement30DaysStory,
        'achievement_100_days_story' => achievement100DaysStory,

        // Add more mappings as needed
        _ => null,
      };
    } catch (e) {
      return null;
    }
  }
}
