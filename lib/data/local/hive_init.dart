import 'package:hive_flutter/hive_flutter.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement_adapter.dart'
    as achievement_adapter;

/// Initialize Hive and register adapters
Future<void> initHive() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  if (!Hive.isAdapterRegistered(HiveConstants.unlockedAchievementTypeId)) {
    Hive.registerAdapter(achievement_adapter.UnlockedAchievementAdapter());
  }

  // Open boxes
  await Hive.openBox<UnlockedAchievement>(
    HiveConstants.unlockedAchievementsBoxName,
  );

  // Add more box openings here as needed
}
