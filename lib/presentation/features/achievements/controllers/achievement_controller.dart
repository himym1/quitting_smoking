import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/data/repositories/achievement_repository.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';

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
          allAchievements: [],
          unlockedAchievements: [],
          isLoading: true,
        ),
      ) {
    // Load achievements asynchronously
    _loadAchievements();
  }

  /// Load achievements from repository
  Future<void> _loadAchievements() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final achievements = await _repository.getAchievementDefinitions();
      final unlockedAchievements = await _repository.getUnlockedAchievements();

      state = state.copyWith(
        allAchievements: achievements,
        unlockedAchievements: unlockedAchievements,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load achievements: ${e.toString()}',
      );
    }
  }

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

      if (unlockedAchievement == null) {
        state = state.copyWith(isLoading: false);
        return null;
      }

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

      return await _repository.getAchievementDefinitionById(achievementId);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to unlock achievement: ${e.toString()}',
      );
      return null;
    }
  }

  /// Get an achievement definition by ID
  Future<AchievementDefinition?> getAchievementById(
    String achievementId,
  ) async {
    try {
      return await _repository.getAchievementDefinitionById(achievementId);
    } catch (e) {
      return null;
    }
  }

  /// Clear all unlocked achievements (for debugging/reset purposes)
  Future<bool> clearAllAchievements() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final success = await _repository.clearAllUnlockedAchievements();

      if (success) {
        // Reload the state after clearing
        await _loadAchievements();
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to clear achievements',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Error clearing achievements: ${e.toString()}',
      );
      return false;
    }
  }

  /// Check for new achievements that should be unlocked based on consecutive days
  /// This method ensures only one achievement is unlocked at a time
  Future<AchievementDefinition?> checkForNewAchievements({
    required int consecutiveDays,
    required double moneySaved,
    bool? cravingResisted,
  }) async {
    // Validate input parameters
    if (consecutiveDays < 0) {
      print('Warning: consecutiveDays is negative: $consecutiveDays');
      return null;
    }

    if (moneySaved < 0) {
      print('Warning: moneySaved is negative: $moneySaved');
      return null;
    }

    try {
      final achievements = state.allAchievements;
      final alreadyUnlockedIds =
          state.unlockedAchievements.map((ua) => ua.achievementId).toSet();

      // Sort achievements by their unlock condition value (ascending)
      // This ensures we unlock achievements in the correct order
      final sortedAchievements =
          achievements.where((achievement) {
              return !alreadyUnlockedIds.contains(achievement.id);
            }).toList()
            ..sort((a, b) {
              final aValue = a.unlockCondition['value'] as int? ?? 0;
              final bValue = b.unlockCondition['value'] as int? ?? 0;
              return aValue.compareTo(bValue);
            });

      for (final achievement in sortedAchievements) {
        final condition = achievement.unlockCondition;

        if (condition['type'] == 'consecutive_no_smoke_days') {
          final requiredDays = condition['value'] as int;

          // Only unlock if we have exactly reached this milestone
          // or if this is the highest milestone we've reached
          if (consecutiveDays >= requiredDays) {
            // Check if there's a higher milestone that we should unlock instead
            final higherMilestone = sortedAchievements.firstWhere(
              (a) =>
                  a.unlockCondition['type'] == 'consecutive_no_smoke_days' &&
                  (a.unlockCondition['value'] as int) > requiredDays &&
                  consecutiveDays >= (a.unlockCondition['value'] as int),
              orElse: () => achievement,
            );

            // Only unlock this achievement if it's the highest milestone reached
            if (higherMilestone.id == achievement.id) {
              return await unlockAchievement(achievement.id);
            }
          }
        } else if (condition['type'] == 'money_saved') {
          final requiredAmount = condition['value'] as num;
          if (moneySaved >= requiredAmount) {
            return await unlockAchievement(achievement.id);
          }
        } else if (condition['type'] == 'craving_resisted') {
          if (cravingResisted == true) {
            return await unlockAchievement(achievement.id);
          }
        }
      }

      return null;
    } catch (e) {
      print('Error checking for new achievements: $e');
      return null;
    }
  }
}

/// Provider for AchievementState
final achievementControllerProvider =
    StateNotifierProvider<AchievementController, AchievementState>((ref) {
      final repository = ref.watch(achievementRepositoryProvider);
      return AchievementController(repository);
    });
