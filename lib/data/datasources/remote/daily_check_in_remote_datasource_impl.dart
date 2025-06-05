/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 每日打卡远程数据源实现 (DailyCheckInRemoteDataSourceImpl)
 * 功能：
 * 1. 实现打卡API接口
 * 2. 使用Dio客户端进行HTTP请求
 * 3. 处理API响应和错误
 * 4. 提供打卡相关的网络操作
 */

import 'package:dio/dio.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/remote/daily_check_in_remote_datasource.dart';
import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/daily_check_in_models.dart';

/// 每日打卡远程数据源实现
///
/// 使用Dio客户端实现打卡API调用
class DailyCheckInRemoteDataSourceImpl implements DailyCheckInRemoteDataSource {
  final DioClient _dioClient;

  /// 构造函数
  DailyCheckInRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponseModel<CheckInResponseModel>> createCheckIn(
    CreateCheckInRequestModel request,
  ) async {
    try {
      logInfo('创建打卡记录请求: ${request.date}', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.checkins,
        data: request.toJson(),
      );

      logInfo('创建打卡记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<CheckInResponseModel>.fromJson(
        response.data!,
        (json) => CheckInResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('创建打卡记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<CheckInResponseModel?>> getCheckInForDate(
    DateTime date,
  ) async {
    try {
      logInfo('获取指定日期打卡记录: ${date.toIso8601String()}', tag: 'DailyCheckInRemoteDataSource');

      final dateString = date.toIso8601String().split('T')[0]; // 只取日期部分
      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.checkins}/$dateString',
      );

      logInfo('获取指定日期打卡记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<CheckInResponseModel?>.fromJson(
        response.data!,
        (json) => json != null ? CheckInResponseModel.fromJson(json as Map<String, dynamic>) : null,
      );
    } catch (e) {
      logError('获取指定日期打卡记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<CheckInResponseModel>>> getCheckInHistory(
    CheckInHistoryRequestModel request,
  ) async {
    try {
      logInfo('获取打卡历史记录', tag: 'DailyCheckInRemoteDataSource');

      final queryParams = <String, dynamic>{
        'page': request.page,
        'limit': request.limit,
        'sortBy': request.sortBy,
        'sortOrder': request.sortOrder,
        if (request.startDate != null) 'startDate': request.startDate!.toIso8601String(),
        if (request.endDate != null) 'endDate': request.endDate!.toIso8601String(),
      };

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.checkins,
        queryParameters: queryParams,
      );

      logInfo('获取打卡历史记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<List<CheckInResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => CheckInResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('获取打卡历史记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<CheckInStatsResponseModel>> getCheckInStats() async {
    try {
      logInfo('获取打卡统计信息', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.checkinStats,
      );

      logInfo('获取打卡统计信息成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<CheckInStatsResponseModel>.fromJson(
        response.data!,
        (json) => CheckInStatsResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('获取打卡统计信息失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<CheckInResponseModel>> updateCheckIn(
    String checkInId,
    String? note,
  ) async {
    try {
      logInfo('更新打卡记录: $checkInId', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.put<Map<String, dynamic>>(
        '${ApiConfig.checkins}/$checkInId',
        data: {'note': note},
      );

      logInfo('更新打卡记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<CheckInResponseModel>.fromJson(
        response.data!,
        (json) => CheckInResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('更新打卡记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> deleteCheckIn(String checkInId) async {
    try {
      logInfo('删除打卡记录: $checkInId', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.delete<Map<String, dynamic>>(
        '${ApiConfig.checkins}/$checkInId',
      );

      logInfo('删除打卡记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('删除打卡记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<Map<String, dynamic>>> getCheckInCalendar(
    int year,
    int month,
  ) async {
    try {
      logInfo('获取打卡日历数据: $year-$month', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.checkins}/calendar',
        queryParameters: {
          'year': year,
          'month': month,
        },
      );

      logInfo('获取打卡日历数据成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<Map<String, dynamic>>.fromJson(
        response.data!,
        (json) => json as Map<String, dynamic>,
      );
    } catch (e) {
      logError('获取打卡日历数据失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<CheckInResponseModel>>> batchCreateCheckIns(
    List<CreateCheckInRequestModel> requests,
  ) async {
    try {
      logInfo('批量创建打卡记录: ${requests.length}条', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        '${ApiConfig.checkins}/batch',
        data: {
          'checkIns': requests.map((r) => r.toJson()).toList(),
        },
      );

      logInfo('批量创建打卡记录成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<List<CheckInResponseModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => CheckInResponseModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      logError('批量创建打卡记录失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getCheckInLeaderboard(
    int limit,
  ) async {
    try {
      logInfo('获取打卡排行榜', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.checkins}/leaderboard',
        queryParameters: {'limit': limit},
      );

      logInfo('获取打卡排行榜成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<List<Map<String, dynamic>>>.fromJson(
        response.data!,
        (json) => (json as List).cast<Map<String, dynamic>>(),
      );
    } catch (e) {
      logError('获取打卡排行榜失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<bool>> checkTodayCheckInStatus() async {
    try {
      logInfo('检查今日打卡状态', tag: 'DailyCheckInRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        '${ApiConfig.checkins}/today',
      );

      logInfo('检查今日打卡状态成功', tag: 'DailyCheckInRemoteDataSource');

      return ApiResponseModel<bool>.fromJson(
        response.data!,
        (json) => json as bool,
      );
    } catch (e) {
      logError('检查今日打卡状态失败', tag: 'DailyCheckInRemoteDataSource', error: e);
      rethrow;
    }
  }
}
