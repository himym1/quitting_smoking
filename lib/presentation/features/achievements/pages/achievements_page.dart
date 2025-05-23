import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/common_widgets/section_title.dart';
import 'package:quitting_smoking/presentation/features/achievements/controllers/achievement_controller.dart';
import 'package:quitting_smoking/presentation/features/achievements/widgets/achievement_unlocked_modal.dart';

/// A page that displays the user's achievements.
class AchievementsPage extends ConsumerWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final achievementState = ref.watch(achievementControllerProvider);
    final achievements = achievementState.allAchievements;
    final unlockedAchievements = achievementState.unlockedAchievements;

    // Map of achievement IDs to unlock status
    final unlockedMap = {
      for (var achievement in unlockedAchievements)
        achievement.achievementId: true,
    };

    // Filter achievements
    final unlockedAchievementsList =
        achievements.where((a) => unlockedMap[a.id] == true).toList();

    final lockedAchievementsList =
        achievements.where((a) => unlockedMap[a.id] != true).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('我的成就'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF8F0FE), // 淡紫色背景
      body: SafeArea(
        child:
            achievementState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : achievements.isEmpty
                ? Center(
                  child: Text('暂无可用成就', style: theme.textTheme.bodyLarge),
                )
                : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Unlocked Achievements Section
                    if (unlockedAchievementsList.isNotEmpty) ...[
                      SectionTitle(
                        title: '已解锁成就',
                        subtitle:
                            '已解锁${unlockedAchievements.length}个成就，共${achievements.length}个',
                        titleStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                        subtitleStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AchievementGrid(
                        achievements: unlockedAchievementsList,
                        isUnlocked: true,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Locked Achievements Section
                    if (lockedAchievementsList.isNotEmpty) ...[
                      SectionTitle(
                        title: '未解锁成就',
                        subtitle: '继续努力解锁更多成就',
                        titleStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                        subtitleStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AchievementGrid(
                        achievements: lockedAchievementsList,
                        isUnlocked: false,
                      ),
                    ],
                  ],
                ),
      ),
    );
  }
}

/// A grid of achievement items.
class AchievementGrid extends ConsumerWidget {
  final List<AchievementDefinition> achievements;
  final bool isUnlocked;

  const AchievementGrid({
    super.key,
    required this.achievements,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        childAspectRatio: 0.75,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return AchievementItem(
          achievement: achievement,
          isUnlocked: isUnlocked,
        );
      },
    );
  }
}

/// An individual achievement item.
class AchievementItem extends ConsumerWidget {
  final AchievementDefinition achievement;
  final bool isUnlocked;

  const AchievementItem({
    super.key,
    required this.achievement,
    required this.isUnlocked,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap:
          isUnlocked
              ? () => _showAchievementDetails(context, achievement)
              : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Achievement Badge - 使用Figma中的成就章图片
          Expanded(
            child:
                isUnlocked
                    ? _buildUnlockedAchievementBadge(achievement)
                    : _buildLockedAchievementBadge(achievement),
          ),
          const SizedBox(height: 12),
          // Achievement title
          Text(
            isUnlocked
                ? l10n.getString(achievement.nameKey) ?? achievement.name
                : '???',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color:
                  isUnlocked
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // 构建已解锁的成就章
  Widget _buildUnlockedAchievementBadge(AchievementDefinition achievement) {
    // 根据成就ID获取对应的成就章图片
    final badgeImage = _getAchievementBadgeImage(achievement.id);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(badgeImage, fit: BoxFit.cover),
    );
  }

  // 构建锁定的成就章
  Widget _buildLockedAchievementBadge(AchievementDefinition achievement) {
    // 显示成就图片但添加灰色蒙版效果
    final badgeImage = _getAchievementBadgeImage(achievement.id);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
            child: Image.asset(badgeImage, fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Center(child: Icon(Icons.lock, color: Colors.white, size: 48)),
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

  void _showAchievementDetails(
    BuildContext context,
    AchievementDefinition achievement,
  ) {
    AchievementUnlockedModal.show(context: context, achievement: achievement);
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
