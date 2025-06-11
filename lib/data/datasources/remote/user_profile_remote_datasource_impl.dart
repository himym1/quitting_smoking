/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 用户资料远程数据源实现 (UserProfileRemoteDataSourceImpl)
 * 功能：
 * 1. 实现用户资料API接口
 * 2. 使用Dio客户端进行HTTP请求
 * 3. 处理API响应和错误
 * 4. 提供用户资料相关的网络操作
 */

import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/remote/user_profile_remote_datasource.dart';
import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/user_profile_models.dart';

/// 用户资料远程数据源实现
///
/// 使用Dio客户端实现用户资料API调用
class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final DioClient _dioClient;

  /// 构造函数
  UserProfileRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponseModel<UserProfileResponseModel>> getUserProfile() async {
    try {
      logInfo('获取用户资料请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.userProfile,
      );

      logInfo('获取用户资料成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserProfileResponseModel>.fromJson(
        response.data!,
        (json) =>
            UserProfileResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取用户资料失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserProfileResponseModel>> updateUserProfile(
    UpdateUserProfileRequestModel request,
  ) async {
    try {
      logInfo(
        '更新用户资料请求 - URL: ${ApiConfig.userProfile}, Data: ${request.toJson()}',
        tag: 'UserProfileRemoteDataSource',
      );

      final response = await _dioClient.put<Map<String, dynamic>>(
        ApiConfig.userProfile,
        data: request.toJson(),
      );

      logInfo(
        '更新用户资料成功 - Response: ${response.data}',
        tag: 'UserProfileRemoteDataSource',
      );

      return ApiResponseModel<UserProfileResponseModel>.fromJson(
        response.data!,
        (json) =>
            UserProfileResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError(
        '更新用户资料失败 - URL: ${ApiConfig.userProfile}, Data: ${request.toJson()}',
        tag: 'UserProfileRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> deleteUserProfile() async {
    try {
      logInfo('删除用户资料请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.delete<Map<String, dynamic>>(
        ApiConfig.userProfile,
      );

      logInfo('删除用户资料成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('删除用户资料失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserStatsResponseModel>> getUserStats() async {
    try {
      logInfo('获取用户统计信息请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/stats',
      );

      logInfo('获取用户统计信息成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserStatsResponseModel>.fromJson(
        response.data!,
        (json) => UserStatsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取用户统计信息失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserStatsResponseModel>> refreshUserStats() async {
    try {
      logInfo('刷新用户统计信息请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/stats/refresh',
      );

      logInfo('刷新用户统计信息成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserStatsResponseModel>.fromJson(
        response.data!,
        (json) => UserStatsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('刷新用户统计信息失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserSettingsModel>> getUserSettings() async {
    try {
      logInfo('获取用户设置请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.userSettings,
      );

      logInfo('获取用户设置成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserSettingsModel>.fromJson(
        response.data!,
        (json) => UserSettingsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取用户设置失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserSettingsModel>> updateUserSettings(
    UserSettingsModel settings,
  ) async {
    try {
      logInfo('更新用户设置请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.put<Map<String, dynamic>>(
        ApiConfig.userSettings,
        data: settings.toJson(),
      );

      logInfo('更新用户设置成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserSettingsModel>.fromJson(
        response.data!,
        (json) => UserSettingsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('更新用户设置失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserSettingsModel>> resetUserSettings() async {
    try {
      logInfo('重置用户设置请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.userSettings}/reset',
      );

      logInfo('重置用户设置成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<UserSettingsModel>.fromJson(
        response.data!,
        (json) => UserSettingsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('重置用户设置失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<SyncStatusModel>> getSyncStatus() async {
    try {
      logInfo('获取同步状态请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.syncStatus,
      );

      logInfo('获取同步状态成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<SyncStatusModel>.fromJson(
        response.data!,
        (json) => SyncStatusModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取同步状态失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<SyncStatusModel>> triggerSync({
    List<String>? dataTypes,
  }) async {
    try {
      logInfo('触发数据同步请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.syncUpload,
        data: {if (dataTypes != null) 'dataTypes': dataTypes},
      );

      logInfo('触发数据同步成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<SyncStatusModel>.fromJson(
        response.data!,
        (json) => SyncStatusModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('触发数据同步失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> uploadLocalData({
    required Map<String, dynamic> data,
    required String dataType,
  }) async {
    try {
      logInfo('上传本地数据请求: $dataType', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.syncUpload,
        data: {'dataType': dataType, 'data': data},
      );

      logInfo('上传本地数据成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('上传本地数据失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> downloadRemoteData({
    required String dataType,
    DateTime? lastSyncTime,
  }) async {
    try {
      logInfo('下载远程数据请求: $dataType', tag: 'UserProfileRemoteDataSource');

      final queryParams = <String, dynamic>{
        'dataType': dataType,
        if (lastSyncTime != null) 'since': lastSyncTime.toIso8601String(),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.syncDownload,
        queryParameters: queryParams,
      );

      logInfo('下载远程数据成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<Map<String, dynamic>>.fromJson(
        response.data!,
        (json) => json as Map<String, dynamic>,
      );
    } catch (e) {
      logError('下载远程数据失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> exportUserData({
    String format = 'json',
    List<String>? dataTypes,
  }) async {
    try {
      logInfo('导出用户数据请求: $format', tag: 'UserProfileRemoteDataSource');

      final queryParams = <String, dynamic>{
        'format': format,
        if (dataTypes != null) 'dataTypes': dataTypes.join(','),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/export',
        queryParameters: queryParams,
      );

      logInfo('导出用户数据成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<Map<String, dynamic>>.fromJson(
        response.data!,
        (json) => json as Map<String, dynamic>,
      );
    } catch (e) {
      logError('导出用户数据失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> importUserData({
    required Map<String, dynamic> data,
    String format = 'json',
    String mergeStrategy = 'merge',
  }) async {
    try {
      logInfo('导入用户数据请求: $format', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/import',
        data: {'format': format, 'mergeStrategy': mergeStrategy, 'data': data},
      );

      logInfo('导入用户数据成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('导入用户数据失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> createBackup() async {
    try {
      logInfo('创建数据备份请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/backup',
      );

      logInfo('创建数据备份成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('创建数据备份失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getBackupList() async {
    try {
      logInfo('获取备份列表请求', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/backup',
      );

      logInfo('获取备份列表成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<List<Map<String, dynamic>>>.fromJson(
        response.data!,
        (json) => (json as List).cast<Map<String, dynamic>>(),
      );
    } catch (e) {
      logError('获取备份列表失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> restoreBackup({
    required String backupId,
    List<String>? restoreTypes,
  }) async {
    try {
      logInfo('恢复数据备份请求: $backupId', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/backup/$backupId/restore',
        data: {if (restoreTypes != null) 'restoreTypes': restoreTypes},
      );

      logInfo('恢复数据备份成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('恢复数据备份失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> deleteBackup(String backupId) async {
    try {
      logInfo('删除数据备份请求: $backupId', tag: 'UserProfileRemoteDataSource');

      final response = await _dioClient.delete<Map<String, dynamic>>(
        '${ApiConfig.userProfile}/backup/$backupId',
      );

      logInfo('删除数据备份成功', tag: 'UserProfileRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('删除数据备份失败', tag: 'UserProfileRemoteDataSource', error: e);
      rethrow;
    }
  }
}
