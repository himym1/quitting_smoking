import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';

abstract class AchievementLocalDataSource {
  /// Loads all achievement definitions from the assets
  ///
  /// Returns a [List<AchievementDefinition>]
  Future<List<AchievementDefinition>> getAchievementDefinitions();

  /// Gets all unlocked achievements from local storage
  ///
  /// Returns a [List<UnlockedAchievement>]
  Future<List<UnlockedAchievement>> getUnlockedAchievements();

  /// Saves a newly unlocked achievement to local storage
  ///
  /// Returns `true` if saved successfully
  Future<bool> saveUnlockedAchievement(UnlockedAchievement unlockedAchievement);

  /// Checks if an achievement with the given ID is already unlocked
  ///
  /// Returns `true` if achievement is unlocked
  Future<bool> isAchievementUnlocked(String achievementId);
}
