import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/data/repositories/achievement_repository.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';

/// State for the achievements feature
class AchievementState {
  final List<AchievementDefinition> allAchievements;
  final List<UnlockedAchievement> unlockedAchievements;
  final bool isLoading;
  final String? error;

  AchievementState({
    required this.allAchievements,
    required this.unlockedAchievements,
    this.isLoading = false,
    this.error,
  });

  AchievementState copyWith({
    List<AchievementDefinition>? allAchievements,
    List<UnlockedAchievement>? unlockedAchievements,
    bool? isLoading,
    String? error,
  }) {
    return AchievementState(
      allAchievements: allAchievements ?? this.allAchievements,
      unlockedAchievements: unlockedAchievements ?? this.unlockedAchievements,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Controller for achievement-related actions
class AchievementController extends StateNotifier<AchievementState> {
  final AchievementRepository _repository;

  AchievementController(this._repository)
    : super(
        AchievementState(
          allAchievements: _repository.getAchievementDefinitions(),
          unlockedAchievements: _repository.getUnlockedAchievements(),
        ),
      );

  /// Get all achievement definitions
  List<AchievementDefinition> getAllAchievements() {
    return state.allAchievements;
  }

  /// Get unlocked achievements
  List<UnlockedAchievement> getUnlockedAchievements() {
    return state.unlockedAchievements;
  }

  /// Check if an achievement is unlocked
  bool isAchievementUnlocked(String achievementId) {
    return state.unlockedAchievements.any(
      (a) => a.achievementId == achievementId,
    );
  }

  /// Unlock an achievement
  Future<AchievementDefinition?> unlockAchievement(String achievementId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final unlockedAchievement = await _repository.unlockAchievement(
        achievementId,
      );
      final updatedUnlocked = [...state.unlockedAchievements];

      // Replace if exists, add if not
      final existingIndex = updatedUnlocked.indexWhere(
        (a) => a.achievementId == achievementId,
      );

      if (existingIndex >= 0) {
        updatedUnlocked[existingIndex] = unlockedAchievement;
      } else {
        updatedUnlocked.add(unlockedAchievement);
      }

      state = state.copyWith(
        unlockedAchievements: updatedUnlocked,
        isLoading: false,
      );

      return _repository.getAchievementById(achievementId);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to unlock achievement: ${e.toString()}',
      );
      return null;
    }
  }

  /// Get an achievement definition by ID
  AchievementDefinition? getAchievementById(String achievementId) {
    try {
      return _repository.getAchievementById(achievementId);
    } catch (e) {
      return null;
    }
  }

  /// Check for new achievements that should be unlocked based on a specific event
  Future<AchievementDefinition?> checkForNewAchievements({
    required int consecutiveDays,
  }) async {
    // Logic to determine which achievements to unlock based on days
    // This is a simple implementation, could be more complex in a real app

    // First check 100 days, then 30 days, then 7 days
    final List<String> achievementIds = [];

    if (consecutiveDays >= 100) {
      achievementIds.add('achievement_100_days');
    }

    if (consecutiveDays >= 30) {
      achievementIds.add('achievement_30_days');
    }

    if (consecutiveDays >= 7) {
      achievementIds.add('achievement_7_days');
    }

    // Unlock the highest achievement that isn't already unlocked
    for (final id in achievementIds) {
      if (!isAchievementUnlocked(id)) {
        return await unlockAchievement(id);
      }
    }

    return null;
  }
}

/// Provider for AchievementState
final achievementControllerProvider =
    StateNotifierProvider<AchievementController, AchievementState>((ref) {
      final repository = ref.watch(achievementRepositoryProvider);
      return AchievementController(repository);
    });
