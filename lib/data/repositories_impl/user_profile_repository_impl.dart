import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/data/datasources/local/user_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/local/user_local_datasource_impl.dart'; // Required for userLocalDatasourceProvider
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserLocalDatasource _localDatasource;

  UserProfileRepositoryImpl(this._localDatasource);

  @override
  Future<UserProfile?> getUserProfile() {
    return _localDatasource.getUserProfile();
  }

  @override
  Future<void> saveUserProfile(UserProfile userProfile) {
    return _localDatasource.saveUserProfile(userProfile);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    final profile = await _localDatasource.getUserProfile();
    return profile?.onboardingCompleted ?? false;
  }

  @override
  Future<bool> deleteUserProfile(String userId) async {
    try {
      return await _localDatasource.deleteUserProfile(userId);
    } catch (e) {
      logError('删除用户资料时出错', tag: 'UserProfileRepository', error: e);
      return false;
    }
  }
}

final userProfileRepositoryProvider = Provider<UserProfileRepository>(
  (ref) => UserProfileRepositoryImpl(ref.watch(userLocalDatasourceProvider)),
);
