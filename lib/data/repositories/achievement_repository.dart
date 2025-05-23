import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';

/// A repository that manages achievement-related data.
class AchievementRepository {
  final Box<UnlockedAchievement> _unlockedAchievementsBox;
  final List<AchievementDefinition> _achievementDefinitions;

  AchievementRepository({
    required Box<UnlockedAchievement> unlockedAchievementsBox,
    required List<AchievementDefinition> achievementDefinitions,
  }) : _unlockedAchievementsBox = unlockedAchievementsBox,
       _achievementDefinitions = achievementDefinitions;

  /// Get all achievement definitions
  List<AchievementDefinition> getAchievementDefinitions() {
    return List.unmodifiable(_achievementDefinitions);
  }

  /// Get unlocked achievements
  List<UnlockedAchievement> getUnlockedAchievements() {
    return List.unmodifiable(_unlockedAchievementsBox.values.toList());
  }

  /// Check if achievement is unlocked
  bool isAchievementUnlocked(String achievementId) {
    return _unlockedAchievementsBox.containsKey(achievementId);
  }

  /// Unlock an achievement
  Future<UnlockedAchievement> unlockAchievement(String achievementId) async {
    if (isAchievementUnlocked(achievementId)) {
      return _unlockedAchievementsBox.get(achievementId)!;
    }

    final achievement = _achievementDefinitions.firstWhere(
      (a) => a.id == achievementId,
      orElse: () => throw Exception('Achievement not found: $achievementId'),
    );

    final unlockedAchievement = UnlockedAchievement(
      achievementId: achievementId,
      unlockDate: DateTime.now(),
    );

    await _unlockedAchievementsBox.put(achievementId, unlockedAchievement);
    return unlockedAchievement;
  }

  /// Get achievement definition by ID
  AchievementDefinition getAchievementById(String achievementId) {
    return _achievementDefinitions.firstWhere(
      (a) => a.id == achievementId,
      orElse: () => throw Exception('Achievement not found: $achievementId'),
    );
  }
}

/// Provider for the AchievementRepository
final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  // This would typically be initialized elsewhere and passed in
  final unlockedAchievementsBox = Hive.box<UnlockedAchievement>(
    HiveConstants.unlockedAchievementsBoxName,
  );
  final achievementDefinitions = [
    const AchievementDefinition(
      id: 'achievement_7_days',
      name: 'First Week Free',
      description: 'Smoke-free for 7 consecutive days',
      nameKey: 'achievement_7_days_name',
      descriptionKey: 'achievement_7_days_desc',
      storyKey: 'achievement_7_days_story',
      unlockCondition: {'type': 'consecutive_days', 'value': 7},
      iconLockedAssetPath: 'assets/images/achievements/7_days_locked.png',
      iconUnlockedAssetPath: 'assets/images/achievements/7_days_unlocked.png',
    ),
    const AchievementDefinition(
      id: 'achievement_30_days',
      name: 'One Month Milestone',
      description: 'Smoke-free for 30 consecutive days',
      nameKey: 'achievement_30_days_name',
      descriptionKey: 'achievement_30_days_desc',
      storyKey: 'achievement_30_days_story',
      unlockCondition: {'type': 'consecutive_days', 'value': 30},
      iconLockedAssetPath: 'assets/images/achievements/30_days_locked.png',
      iconUnlockedAssetPath: 'assets/images/achievements/30_days_unlocked.png',
    ),
    const AchievementDefinition(
      id: 'achievement_100_days',
      name: 'Century Club',
      description: 'Smoke-free for 100 consecutive days',
      nameKey: 'achievement_100_days_name',
      descriptionKey: 'achievement_100_days_desc',
      storyKey: 'achievement_100_days_story',
      unlockCondition: {'type': 'consecutive_days', 'value': 100},
      iconLockedAssetPath: 'assets/images/achievements/100_days_locked.png',
      iconUnlockedAssetPath: 'assets/images/achievements/100_days_unlocked.png',
    ),
  ];

  return AchievementRepository(
    unlockedAchievementsBox: unlockedAchievementsBox,
    achievementDefinitions: achievementDefinitions,
  );
});
