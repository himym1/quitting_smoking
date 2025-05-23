import 'package:quitting_smoking/domain/entities/user_profile.dart';

abstract class UserLocalDatasource {
  Future<UserProfile?> getUserProfile();
  Future<void> saveUserProfile(UserProfile userProfile);
  Future<bool> deleteUserProfile(String userId);
}
