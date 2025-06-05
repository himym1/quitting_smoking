/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 吸烟记录远程数据源实现 (SmokingRecordRemoteDataSourceImpl)
 * 功能：
 * 1. 实现吸烟记录API接口
 * 2. 使用Dio客户端进行HTTP请求
 * 3. 处理API响应和错误
 * 4. 提供吸烟记录相关的网络操作
 */

import 'package:dio/dio.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/remote/smoking_record_remote_datasource.dart';
import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/smoking_record_models.dart';

/// 吸烟记录远程数据源实现
///
/// 使用Dio客户端实现吸烟记录API调用
class SmokingRecordRemoteDataSourceImpl implements SmokingRecordRemoteDataSource {
  final DioClient _dioClient;

  /// 构造函数
  SmokingRecordRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponseModel<SmokingRecordResponseModel>> createSmokingRecord(
    CreateSmokingRecordRequestModel request,
  ) async {
    try {
      logInfo('创建吸烟记录请求: ${request.timestamp}', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.smokingRecords,
        data: request.toJson(),
      );

      logInfo('创建吸烟记录成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<SmokingRecordResponseModel>.fromJson(
        response.data!,
        (json) => SmokingRecordResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('创建吸烟记录失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> getSmokingRecordHistory(
    SmokingRecordHistoryRequestModel request,
  ) async {
    try {
      logInfo('获取吸烟记录历史', tag: 'SmokingRecordRemoteDataSource');

      final queryParams = <String, dynamic>{
        'page': request.page,
        'limit': request.limit,
        'sortBy': request.sortBy,
        'sortOrder': request.sortOrder,
        if (request.startDate != null) 'startDate': request.startDate!.toIso8601String(),
        if (request.endDate != null) 'endDate': request.endDate!.toIso8601String(),
        if (request.triggerTags != null && request.triggerTags!.isNotEmpty)
          'triggerTags': request.triggerTags!.join(','),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.smokingRecords,
        queryParameters: queryParams,
      );

      logInfo('获取吸烟记录历史成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<List<SmokingRecordResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SmokingRecordResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取吸烟记录历史失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<SmokingRecordStatsResponseModel>> getSmokingRecordStats() async {
    try {
      logInfo('获取吸烟记录统计信息', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.smokingRecordStats,
      );

      logInfo('获取吸烟记录统计信息成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<SmokingRecordStatsResponseModel>.fromJson(
        response.data!,
        (json) => SmokingRecordStatsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取吸烟记录统计信息失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<SmokingRecordResponseModel>> getSmokingRecord(
    String recordId,
  ) async {
    try {
      logInfo('获取吸烟记录详情: $recordId', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/$recordId',
      );

      logInfo('获取吸烟记录详情成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<SmokingRecordResponseModel>.fromJson(
        response.data!,
        (json) => SmokingRecordResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取吸烟记录详情失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<SmokingRecordResponseModel>> updateSmokingRecord(
    String recordId, {
    String? notes,
    List<String>? triggerTags,
  }) async {
    try {
      logInfo('更新吸烟记录: $recordId', tag: 'SmokingRecordRemoteDataSource');

      final data = <String, dynamic>{};
      if (notes != null) data['notes'] = notes;
      if (triggerTags != null) data['triggerTags'] = triggerTags;

      final response = await _dioClient.put<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/$recordId',
        data: data,
      );

      logInfo('更新吸烟记录成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<SmokingRecordResponseModel>.fromJson(
        response.data!,
        (json) => SmokingRecordResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('更新吸烟记录失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> deleteSmokingRecord(String recordId) async {
    try {
      logInfo('删除吸烟记录: $recordId', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.delete<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/$recordId',
      );

      logInfo('删除吸烟记录成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('删除吸烟记录失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<Map<String, int>>> getTriggerTagsStats({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      logInfo('获取触发因素统计', tag: 'SmokingRecordRemoteDataSource');

      final queryParams = <String, dynamic>{
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/trigger-stats',
        queryParameters: queryParams,
      );

      logInfo('获取触发因素统计成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<Map<String, int>>.fromJson(
        response.data!,
        (json) => Map<String, int>.from(json as Map),
      );
    } catch (e) {
      logError('获取触发因素统计失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getSmokingTrends({
    required String period,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      logInfo('获取吸烟趋势数据: $period', tag: 'SmokingRecordRemoteDataSource');

      final queryParams = <String, dynamic>{
        'period': period,
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/trends',
        queryParameters: queryParams,
      );

      logInfo('获取吸烟趋势数据成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<List<Map<String, dynamic>>>.fromJson(
        response.data!,
        (json) => (json as List).cast<Map<String, dynamic>>(),
      );
    } catch (e) {
      logError('获取吸烟趋势数据失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> batchCreateSmokingRecords(
    List<CreateSmokingRecordRequestModel> requests,
  ) async {
    try {
      logInfo('批量创建吸烟记录: ${requests.length}条', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/batch',
        data: {
          'records': requests.map((r) => r.toJson()).toList(),
        },
      );

      logInfo('批量创建吸烟记录成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<List<SmokingRecordResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SmokingRecordResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('批量创建吸烟记录失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> getSmokingHeatmapData({
    required int year,
    int? month,
  }) async {
    try {
      logInfo('获取吸烟热力图数据: $year-$month', tag: 'SmokingRecordRemoteDataSource');

      final queryParams = <String, dynamic>{
        'year': year,
        if (month != null) 'month': month,
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/heatmap',
        queryParameters: queryParams,
      );

      logInfo('获取吸烟热力图数据成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<Map<String, dynamic>>.fromJson(
        response.data!,
        (json) => json as Map<String, dynamic>,
      );
    } catch (e) {
      logError('获取吸烟热力图数据失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> getRecentSmokingRecords(
    int limit,
  ) async {
    try {
      logInfo('获取最近吸烟记录', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/recent',
        queryParameters: {'limit': limit},
      );

      logInfo('获取最近吸烟记录成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<List<SmokingRecordResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => SmokingRecordResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取最近吸烟记录失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<bool>> checkTodaySmokingStatus() async {
    try {
      logInfo('检查今日吸烟状态', tag: 'SmokingRecordRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.smokingRecords}/today',
      );

      logInfo('检查今日吸烟状态成功', tag: 'SmokingRecordRemoteDataSource');

      return ApiResponseModel<bool>.fromJson(
        response.data!,
        (json) => json as bool,
      );
    } catch (e) {
      logError('检查今日吸烟状态失败', tag: 'SmokingRecordRemoteDataSource', error: e);
      rethrow;
    }
  }
}
