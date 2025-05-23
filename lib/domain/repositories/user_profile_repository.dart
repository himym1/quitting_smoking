import '../entities/user_profile.dart';

// Potentially import a Failure class here in the future
// import '../../core/errors/failure.dart';
// import 'package:dartz/dartz.dart'; // If using Either for error handling

/// Abstract class (interface) for managing user profile data.
abstract class UserProfileRepository {
  /// Retrieves the current user's profile.
  ///
  /// Returns a [Future] that completes with a [UserProfile] if found,
  /// or `null` if no profile exists.
  Future<UserProfile?> getUserProfile();

  /// Saves or updates the user's profile.
  ///
  /// Takes a [UserProfile] object as input.
  /// Returns a [Future] that completes when the operation is finished.
  Future<void> saveUserProfile(UserProfile userProfile);

  /// Checks if the onboarding process has been completed by the user.
  ///
  /// Returns a [Future] that completes with `true` if onboarding is completed,
  /// `false` otherwise (including if the profile doesn't exist).
  Future<bool> isOnboardingCompleted();

  /// Deletes the user profile from storage.
  ///
  /// Takes a [String] userId as input to identify the profile to delete.
  /// Returns a [Future] that completes with `true` if deletion was successful,
  /// `false` otherwise.
  Future<bool> deleteUserProfile(String userId);
}
