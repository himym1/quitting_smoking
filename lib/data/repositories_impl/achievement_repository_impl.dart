import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  final AchievementLocalDataSource _localDataSource;

  AchievementRepositoryImpl({
    required AchievementLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<List<AchievementDefinition>> getAchievementDefinitions() async {
    return await _localDataSource.getAchievementDefinitions();
  }

  @override
  Future<List<UnlockedAchievement>> getUnlockedAchievements() async {
    return await _localDataSource.getUnlockedAchievements();
  }

  @override
  Future<UnlockedAchievement?> unlockAchievement(String achievementId) async {
    // Check if already unlocked
    if (await isAchievementUnlocked(achievementId)) {
      return null;
    }

    // Create new unlocked achievement
    final unlockDate = DateTime.now();
    final unlockedAchievement = UnlockedAchievement(
      achievementId: achievementId,
      unlockDate: unlockDate,
    );

    // Save to local storage
    final success = await _localDataSource.saveUnlockedAchievement(
      unlockedAchievement,
    );

    return success ? unlockedAchievement : null;
  }

  @override
  Future<bool> isAchievementUnlocked(String achievementId) async {
    return await _localDataSource.isAchievementUnlocked(achievementId);
  }

  @override
  Future<AchievementDefinition?> getAchievementDefinitionById(
    String achievementId,
  ) async {
    final achievements = await getAchievementDefinitions();
    try {
      return achievements.firstWhere((a) => a.id == achievementId);
    } catch (e) {
      return null;
    }
  }
}
