import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'user_local_datasource.dart';

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final HiveInterface _hive;

  UserLocalDatasourceImpl(this._hive);

  Box<UserProfile> get _userProfileBox =>
      _hive.box<UserProfile>(HiveConstants.userProfileBox);

  @override
  Future<UserProfile?> getUserProfile() async {
    // User profile is typically a single entry, using a fixed key.
    return _userProfileBox.get(HiveConstants.userProfileKey);
  }

  @override
  Future<void> saveUserProfile(UserProfile userProfile) async {
    await _userProfileBox.put(HiveConstants.userProfileKey, userProfile);
  }

  @override
  Future<bool> deleteUserProfile(String userId) async {
    try {
      // 在这个实现中，userId 参数并未使用，因为我们使用固定的键存储用户资料
      await _userProfileBox.delete(HiveConstants.userProfileKey);
      return true;
    } catch (e) {
      print('删除用户资料时出错: $e');
      return false;
    }
  }
}

final userLocalDatasourceProvider = Provider<UserLocalDatasource>(
  (ref) => UserLocalDatasourceImpl(Hive),
);
