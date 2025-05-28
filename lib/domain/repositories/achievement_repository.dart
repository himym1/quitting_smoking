import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';

abstract class AchievementRepository {
  /// Get all achievement definitions
  Future<List<AchievementDefinition>> getAchievementDefinitions();

  /// Get all unlocked achievements
  Future<List<UnlockedAchievement>> getUnlockedAchievements();

  /// Unlock a new achievement
  ///
  /// Returns the unlocked achievement if successful, null otherwise
  Future<UnlockedAchievement?> unlockAchievement(String achievementId);

  /// Check if an achievement is already unlocked
  Future<bool> isAchievementUnlocked(String achievementId);

  /// Get an achievement definition by ID
  ///
  /// Returns null if not found
  Future<AchievementDefinition?> getAchievementDefinitionById(
    String achievementId,
  );

  /// Clear all unlocked achievements (for debugging/reset purposes)
  ///
  /// Returns true if successful
  Future<bool> clearAllUnlockedAchievements();
}
