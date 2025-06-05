/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 成就系统远程数据源实现 (AchievementRemoteDataSourceImpl)
 * 功能：
 * 1. 实现成就系统API接口
 * 2. 使用Dio客户端进行HTTP请求
 * 3. 处理API响应和错误
 * 4. 提供成就相关的网络操作
 */

import 'package:dio/dio.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/remote/achievement_remote_datasource.dart';
import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/achievement_models.dart';

/// 成就系统远程数据源实现
///
/// 使用Dio客户端实现成就系统API调用
class AchievementRemoteDataSourceImpl implements AchievementRemoteDataSource {
  final DioClient _dioClient;

  /// 构造函数
  AchievementRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponseModel<List<AchievementResponseModel>>> getAllAchievements(
    AchievementQueryRequestModel request,
  ) async {
    try {
      logInfo('获取所有成就定义', tag: 'AchievementRemoteDataSource');

      final queryParams = <String, dynamic>{
        'page': request.page,
        'limit': request.limit,
        'sortBy': request.sortBy,
        'sortOrder': request.sortOrder,
        'includeHidden': request.includeHidden,
        if (request.types != null && request.types!.isNotEmpty)
          'types': request.types!.join(','),
        if (request.unlockedOnly != null) 'unlockedOnly': request.unlockedOnly,
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.achievements,
        queryParameters: queryParams,
      );

      logInfo('获取所有成就定义成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<AchievementResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => AchievementResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取所有成就定义失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<UserAchievementResponseModel>>> getUserAchievements(
    AchievementQueryRequestModel request,
  ) async {
    try {
      logInfo('获取用户成就列表', tag: 'AchievementRemoteDataSource');

      final queryParams = <String, dynamic>{
        'page': request.page,
        'limit': request.limit,
        'sortBy': request.sortBy,
        'sortOrder': request.sortOrder,
        if (request.types != null && request.types!.isNotEmpty)
          'types': request.types!.join(','),
        if (request.unlockedOnly != null) 'unlockedOnly': request.unlockedOnly,
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/user',
        queryParameters: queryParams,
      );

      logInfo('获取用户成就列表成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<UserAchievementResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UserAchievementResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取用户成就列表失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<AchievementProgressResponseModel>>> getAchievementProgress([
    List<String>? achievementIds,
  ]) async {
    try {
      logInfo('获取成就进度信息', tag: 'AchievementRemoteDataSource');

      final queryParams = <String, dynamic>{
        if (achievementIds != null && achievementIds.isNotEmpty)
          'achievementIds': achievementIds.join(','),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/progress',
        queryParameters: queryParams,
      );

      logInfo('获取成就进度信息成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<AchievementProgressResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => AchievementProgressResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取成就进度信息失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<AchievementStatsResponseModel>> getAchievementStats() async {
    try {
      logInfo('获取成就统计信息', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/stats',
      );

      logInfo('获取成就统计信息成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<AchievementStatsResponseModel>.fromJson(
        response.data!,
        (json) => AchievementStatsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取成就统计信息失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserAchievementResponseModel>> unlockAchievement(
    UnlockAchievementRequestModel request,
  ) async {
    try {
      logInfo('手动解锁成就: ${request.achievementIdentifier}', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.achievements}/unlock',
        data: request.toJson(),
      );

      logInfo('手动解锁成就成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<UserAchievementResponseModel>.fromJson(
        response.data!,
        (json) => UserAchievementResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('手动解锁成就失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<AchievementResponseModel>> getAchievementDetail(
    String achievementId,
  ) async {
    try {
      logInfo('获取成就详情: $achievementId', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/$achievementId',
      );

      logInfo('获取成就详情成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<AchievementResponseModel>.fromJson(
        response.data!,
        (json) => AchievementResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取成就详情失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<UserAchievementResponseModel?>> getUserAchievement(
    String achievementId,
  ) async {
    try {
      logInfo('获取用户成就信息: $achievementId', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/user/$achievementId',
      );

      logInfo('获取用户成就信息成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<UserAchievementResponseModel?>.fromJson(
        response.data!,
        (json) => json != null ? UserAchievementResponseModel.fromJson(json as Map<String, dynamic>) : null,
      );
    } catch (e) {
      logError('获取用户成就信息失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<String>>> checkAchievementUnlockConditions([
    List<String>? achievementIds,
  ]) async {
    try {
      logInfo('检查成就解锁条件', tag: 'AchievementRemoteDataSource');

      final queryParams = <String, dynamic>{
        if (achievementIds != null && achievementIds.isNotEmpty)
          'achievementIds': achievementIds.join(','),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/check-unlock',
        queryParameters: queryParams,
      );

      logInfo('检查成就解锁条件成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<String>>.fromJson(
        response.data!,
        (json) => (json as List).cast<String>(),
      );
    } catch (e) {
      logError('检查成就解锁条件失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<UserAchievementResponseModel>>> getRecentUnlockedAchievements(
    int limit,
  ) async {
    try {
      logInfo('获取最近解锁的成就', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/recent-unlocked',
        queryParameters: {'limit': limit},
      );

      logInfo('获取最近解锁的成就成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<UserAchievementResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => UserAchievementResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取最近解锁的成就失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<AchievementProgressResponseModel>>> getNearUnlockAchievements(
    int limit, {
    double progressThreshold = 0.8,
  }) async {
    try {
      logInfo('获取即将解锁的成就', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/near-unlock',
        queryParameters: {
          'limit': limit,
          'progressThreshold': progressThreshold,
        },
      );

      logInfo('获取即将解锁的成就成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<AchievementProgressResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => AchievementProgressResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取即将解锁的成就失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getAchievementLeaderboard({
    required String type,
    String? category,
    int limit = 10,
  }) async {
    try {
      logInfo('获取成就排行榜: $type', tag: 'AchievementRemoteDataSource');

      final queryParams = <String, dynamic>{
        'type': type,
        'limit': limit,
        if (category != null) 'category': category,
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.achievements}/leaderboard',
        queryParameters: queryParams,
      );

      logInfo('获取成就排行榜成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<List<Map<String, dynamic>>>.fromJson(
        response.data!,
        (json) => (json as List).cast<Map<String, dynamic>>(),
      );
    } catch (e) {
      logError('获取成就排行榜失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> syncAchievementProgress() async {
    try {
      logInfo('同步成就进度', tag: 'AchievementRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.achievements}/sync',
      );

      logInfo('同步成就进度成功', tag: 'AchievementRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('同步成就进度失败', tag: 'AchievementRemoteDataSource', error: e);
      rethrow;
    }
  }
}
