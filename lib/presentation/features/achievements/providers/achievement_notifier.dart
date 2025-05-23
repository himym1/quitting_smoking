import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';

part 'achievement_notifier.freezed.dart';

// State class for the achievements
@freezed
class AchievementsState with _$AchievementsState {
  const factory AchievementsState({
    @Default(true) bool isLoading,
    @Default([]) List<AchievementDefinition> allAchievements,
    @Default([]) List<UnlockedAchievement> unlockedAchievements,
    String? errorMessage,
    AchievementDefinition? lastUnlockedAchievement,
  }) = _AchievementsState;
}

class AchievementNotifier extends StateNotifier<AchievementsState> {
  final AchievementRepository _achievementRepository;

  AchievementNotifier({required AchievementRepository achievementRepository})
    : _achievementRepository = achievementRepository,
      super(const AchievementsState());

  Future<void> loadAchievements() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final achievements =
          await _achievementRepository.getAchievementDefinitions();
      final unlockedAchievements =
          await _achievementRepository.getUnlockedAchievements();

      state = state.copyWith(
        isLoading: false,
        allAchievements: achievements,
        unlockedAchievements: unlockedAchievements,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load achievements: ${e.toString()}',
      );
    }
  }

  Future<AchievementDefinition?> unlockAchievement(String achievementId) async {
    try {
      // Check if the achievement exists
      final achievementDef = await _achievementRepository
          .getAchievementDefinitionById(achievementId);
      if (achievementDef == null) {
        state = state.copyWith(errorMessage: 'Achievement not found');
        return null;
      }

      // Check if already unlocked
      if (await _achievementRepository.isAchievementUnlocked(achievementId)) {
        return achievementDef; // Already unlocked, just return the definition
      }

      // Unlock the achievement
      final unlockedAchievement = await _achievementRepository
          .unlockAchievement(achievementId);
      if (unlockedAchievement == null) {
        state = state.copyWith(errorMessage: 'Failed to unlock achievement');
        return null;
      }

      // Reload unlocked achievements
      final unlockedAchievements =
          await _achievementRepository.getUnlockedAchievements();

      // Update state
      state = state.copyWith(
        unlockedAchievements: unlockedAchievements,
        lastUnlockedAchievement: achievementDef,
      );

      return achievementDef;
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Error unlocking achievement: ${e.toString()}',
      );
      return null;
    }
  }

  Future<void> checkAndUnlockAchievements({
    required int consecutiveDays,
    required double moneySaved,
    bool? cravingResisted,
  }) async {
    if (state.isLoading || state.allAchievements.isEmpty) {
      await loadAchievements();
    }

    try {
      final achievementsToCheck = state.allAchievements;

      for (final achievement in achievementsToCheck) {
        final condition = achievement.unlockCondition;

        if (condition['type'] == 'consecutive_no_smoke_days') {
          final requiredDays = condition['value'] as int;
          if (consecutiveDays >= requiredDays) {
            await unlockAchievement(achievement.id);
          }
        } else if (condition['type'] == 'money_saved') {
          final requiredAmount = condition['value'] as int;
          if (moneySaved >= requiredAmount) {
            await unlockAchievement(achievement.id);
          }
        } else if (condition['type'] == 'craving_resisted' &&
            cravingResisted == true) {
          await unlockAchievement(achievement.id);
        }
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to check achievements: ${e.toString()}',
      );
    }
  }
}

// Provider for the achievement notifier
final achievementNotifierProvider =
    StateNotifierProvider<AchievementNotifier, AchievementsState>((ref) {
      final achievementRepository = ref.watch(achievementRepositoryProvider);
      return AchievementNotifier(achievementRepository: achievementRepository);
    });

// Provider for the achievement repository
final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  throw UnimplementedError(
    'Define achievement repository provider in main.dart',
  );
});
