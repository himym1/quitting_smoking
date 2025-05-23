import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart'; // To access userProfileRepositoryProvider

enum SplashState {
  initial,
  loading,
  authenticatedAndOnboarded,
  unauthenticated,
  authenticatedButNotOnboarded,
}

class SplashScreenNotifier extends StateNotifier<SplashState> {
  final UserProfileRepository _userProfileRepository;
  // final Ref _ref; // Ref is typically not stored if only used in constructor for read/watch

  SplashScreenNotifier(this._userProfileRepository /* this._ref */)
    : super(SplashState.initial);

  Future<void> checkAuthStatus() async {
    state = SplashState.loading;
    try {
      final profile = await _userProfileRepository.getUserProfile();
      if (profile != null) {
        if (profile.onboardingCompleted) {
          state = SplashState.authenticatedAndOnboarded;
        } else {
          state = SplashState.authenticatedButNotOnboarded;
        }
      } else {
        state = SplashState.unauthenticated;
      }
    } catch (e) {
      // Handle error appropriately, for MVP maybe just unauthenticated
      state = SplashState.unauthenticated;
      // In a real app, log this error: print('Error checking auth status: $e');
    }
  }
}

final splashScreenNotifierProvider =
    StateNotifierProvider<SplashScreenNotifier, SplashState>(
      (ref) => SplashScreenNotifier(ref.watch(userProfileRepositoryProvider)),
    );
