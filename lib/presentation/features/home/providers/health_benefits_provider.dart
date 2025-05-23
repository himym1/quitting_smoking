import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/health_benefit_repository.dart';
import 'package:quitting_smoking/main.dart'; // For healthBenefitRepositoryProvider
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart'; // For user profile and quit date

class HealthBenefitsState {
  final List<HealthBenefitMilestone> upcomingBenefits;
  final List<HealthBenefitMilestone> achievedBenefits;
  final bool isLoading;
  final String? errorMessage;

  HealthBenefitsState({
    this.upcomingBenefits = const [],
    this.achievedBenefits = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  HealthBenefitsState copyWith({
    List<HealthBenefitMilestone>? upcomingBenefits,
    List<HealthBenefitMilestone>? achievedBenefits,
    bool? isLoading,
    String? errorMessage,
    bool? clearError,
  }) {
    return HealthBenefitsState(
      upcomingBenefits: upcomingBenefits ?? this.upcomingBenefits,
      achievedBenefits: achievedBenefits ?? this.achievedBenefits,
      isLoading: isLoading ?? this.isLoading,
      errorMessage:
          clearError == true ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class HealthBenefitsNotifier extends StateNotifier<HealthBenefitsState> {
  final HealthBenefitRepository _repository;
  final UserProfile? _userProfile; // To get quitDate
  final Locale _currentLocale;

  HealthBenefitsNotifier(
    this._repository,
    this._userProfile,
    this._currentLocale,
  ) : super(HealthBenefitsState(isLoading: true)) {
    loadHealthBenefits();
  }

  Future<void> loadHealthBenefits() async {
    if (_userProfile?.quitDateTime == null) {
      state = HealthBenefitsState(errorMessage: "Quit date not set.");
      return;
    }

    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final allBenefits = await _repository.getAllHealthBenefits(
        _currentLocale,
      );
      final now = DateTime.now();
      final quitDuration = now.difference(_userProfile!.quitDateTime!);

      final List<HealthBenefitMilestone> achieved = [];
      final List<HealthBenefitMilestone> upcoming = [];

      for (var benefit in allBenefits) {
        if (quitDuration.inMinutes >= benefit.timeThresholdInMinutes) {
          achieved.add(benefit);
        } else {
          upcoming.add(benefit);
        }
      }

      // Sort upcoming by duration ascending
      upcoming.sort(
        (a, b) => a.timeThresholdInMinutes.compareTo(b.timeThresholdInMinutes),
      );
      // Sort achieved by duration descending (most recent first)
      achieved.sort(
        (a, b) => b.timeThresholdInMinutes.compareTo(a.timeThresholdInMinutes),
      );

      state = state.copyWith(
        upcomingBenefits: upcoming,
        achievedBenefits: achieved,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Failed to load health benefits: ${e.toString()}",
        isLoading: false,
      );
    }
  }

  List<HealthBenefitMilestone> getDisplayBenefits() {
    if (state.isLoading || state.errorMessage != null) return [];

    List<HealthBenefitMilestone> displayList = [];

    // Prioritize showing 1-2 upcoming benefits if available
    if (state.upcomingBenefits.isNotEmpty) {
      displayList.addAll(state.upcomingBenefits.take(2));
    }

    // If less than 2 upcoming, fill with most recently achieved benefits
    if (displayList.length < 2 && state.achievedBenefits.isNotEmpty) {
      final needed = 2 - displayList.length;
      displayList.addAll(state.achievedBenefits.take(needed));
    }

    // Ensure unique benefits if an achieved one was also upcoming (edge case, but good to handle)
    // This simple take might not be perfect if items could be in both lists with different statuses.
    // However, our logic separates them cleanly.
    return displayList.take(2).toList(); // Ensure max 2 items
  }
}

final healthBenefitsNotifierProvider = StateNotifierProvider<
  HealthBenefitsNotifier,
  HealthBenefitsState
>((ref) {
  final repository = ref.watch(healthBenefitRepositoryProvider);
  final authState = ref.watch(authNotifierProvider);
  UserProfile? userProfile;
  authState.whenOrNull(authenticated: (up) => userProfile = up);

  // Determine current locale - this might need a more robust way to get it
  // For now, assuming MaterialApp provides it down the widget tree,
  // but a provider might not have direct BuildContext.
  // A common way is to pass it during provider initialization or watch a locale provider.
  // For simplicity, using a default or requiring it to be passed.
  // This is a placeholder. In a real app, you'd get this from a Locale provider or similar.
  final currentLocale = WidgetsBinding.instance.platformDispatcher.locale;

  return HealthBenefitsNotifier(repository, userProfile, currentLocale);
});
