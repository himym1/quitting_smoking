import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/data/repositories_impl/achievement_repository_impl.dart';
import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource_impl.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';

/// Provider for the AchievementRepository
final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  // Use the new implementation that loads from JSON files
  final localDataSource = AchievementLocalDataSourceImpl(
    Hive,
    const Locale('zh', 'CN'), // You can make this dynamic based on app locale
  );

  return AchievementRepositoryImpl(localDataSource: localDataSource);
});

/// Legacy repository class - kept for compatibility but should be phased out
class LegacyAchievementRepository {
  final Box<UnlockedAchievement> _unlockedAchievementsBox;
  final List<AchievementDefinition> _achievementDefinitions;

  LegacyAchievementRepository({
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

    // Verify achievement exists
    _achievementDefinitions.firstWhere(
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
