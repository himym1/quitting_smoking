import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
// import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart'; // Not needed directly, repository provider is used
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart'; // Import for userProfileRepositoryProvider

part 'onboarding_notifier.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(0) int currentPageIndex,
    DateTime? quitDateTime,
    int? dailyCigarettes,
    double? packPrice,
    int? smokingYears,
    String? quitReason,
    @Default(false) bool isLoading,
    UserProfile? userProfileToSave,
  }) = _OnboardingState;
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier(this._ref) : super(const OnboardingState()) {
    _initializeUserProfile();
  }

  final Ref _ref;

  void _initializeUserProfile() {
    final authState = _ref.read(authNotifierProvider);
    authState.whenOrNull(
      authenticated: (userProfile) {
        state = state.copyWith(userProfileToSave: userProfile);
      },
      // initial: () {
      //   // Handle if needed, e.g. log or set a default mock profile for safety
      //   // For now, userProfileToSave will be null if not authenticated
      // },
      // loading: () {
      //   // Handle if needed
      // },
      // unauthenticated: (message) {
      //   // Handle if needed
      // }
    );
  }

  void nextPage() {
    if (state.currentPageIndex < 4) {
      // Assuming 5 steps (0 to 4)
      state = state.copyWith(currentPageIndex: state.currentPageIndex + 1);
    }
  }

  void previousPage() {
    if (state.currentPageIndex > 0) {
      state = state.copyWith(currentPageIndex: state.currentPageIndex - 1);
    }
  }

  void updateQuitDateTime(DateTime dateTime) {
    state = state.copyWith(quitDateTime: dateTime);
  }

  void updateDailyCigarettes(String value) {
    final intValue = int.tryParse(value);
    state = state.copyWith(dailyCigarettes: intValue);
  }

  void updatePackPrice(String value) {
    final doubleValue = double.tryParse(value);
    state = state.copyWith(packPrice: doubleValue);
  }

  void updateSmokingYears(String value) {
    final intValue = int.tryParse(value);
    state = state.copyWith(smokingYears: intValue);
  }

  void updateQuitReason(String value) {
    state = state.copyWith(quitReason: value.trim());
  }

  Future<bool> completeOnboarding() async {
    if (state.userProfileToSave == null) {
      // Handle error: userProfileToSave is not initialized
      return false;
    }
    state = state.copyWith(isLoading: true);

    final updatedProfile = state.userProfileToSave!.copyWith(
      quitDateTime: state.quitDateTime,
      dailyCigarettes: state.dailyCigarettes,
      packPrice: state.packPrice,
      smokingYears: state.smokingYears,
      quitReason: state.quitReason,
      onboardingCompleted: true,
    );

    try {
      await _ref
          .read(userProfileRepositoryProvider)
          .saveUserProfile(updatedProfile);
      _ref
          .read(authNotifierProvider.notifier)
          .completeOnboarding(updatedProfile);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      // Handle error, e.g., log it or show a message to the user
      state = state.copyWith(isLoading: false);
      return false;
    }
  }

  void goToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex <= 4) {
      // Assuming 5 steps
      state = state.copyWith(currentPageIndex: pageIndex);
    }
  }
}

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
      (ref) => OnboardingNotifier(ref),
    );
