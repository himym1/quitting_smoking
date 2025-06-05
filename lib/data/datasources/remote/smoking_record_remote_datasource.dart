/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 吸烟记录远程数据源 (SmokingRecordRemoteDataSource)
 * 功能：
 * 1. 定义吸烟记录相关的API接口
 * 2. 处理吸烟记录的创建、查询、统计等操作
 * 3. 与Spring Boot后端API通信
 * 4. 提供统一的吸烟记录数据访问接口
 */

import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/smoking_record_models.dart';

/// 吸烟记录远程数据源接口
/// 
/// 定义所有吸烟记录相关的API操作
abstract class SmokingRecordRemoteDataSource {
  
  /// 创建吸烟记录
  /// 
  /// [request] 吸烟记录请求数据
  /// 返回创建的吸烟记录信息
  Future<ApiResponseModel<SmokingRecordResponseModel>> createSmokingRecord(
    CreateSmokingRecordRequestModel request,
  );
  
  /// 获取吸烟记录历史
  /// 
  /// [request] 历史查询请求参数
  /// 返回分页的吸烟记录列表
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> getSmokingRecordHistory(
    SmokingRecordHistoryRequestModel request,
  );
  
  /// 获取吸烟记录统计信息
  /// 
  /// 返回用户的吸烟统计数据
  Future<ApiResponseModel<SmokingRecordStatsResponseModel>> getSmokingRecordStats();
  
  /// 获取指定吸烟记录详情
  /// 
  /// [recordId] 吸烟记录ID
  /// 返回吸烟记录详情
  Future<ApiResponseModel<SmokingRecordResponseModel>> getSmokingRecord(
    String recordId,
  );
  
  /// 更新吸烟记录
  /// 
  /// [recordId] 吸烟记录ID
  /// [notes] 更新的备注信息
  /// [triggerTags] 更新的触发因素标签
  /// 返回更新后的吸烟记录
  Future<ApiResponseModel<SmokingRecordResponseModel>> updateSmokingRecord(
    String recordId, {
    String? notes,
    List<String>? triggerTags,
  });
  
  /// 删除吸烟记录
  /// 
  /// [recordId] 吸烟记录ID
  /// 返回删除操作结果
  Future<ApiResponseModel<String>> deleteSmokingRecord(String recordId);
  
  /// 获取触发因素统计
  /// 
  /// [startDate] 开始日期
  /// [endDate] 结束日期
  /// 返回触发因素统计数据
  Future<ApiResponseModel<Map<String, int>>> getTriggerTagsStats({
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// 获取吸烟趋势数据
  /// 
  /// [period] 时间周期（day/week/month）
  /// [startDate] 开始日期
  /// [endDate] 结束日期
  /// 返回吸烟趋势数据
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getSmokingTrends({
    required String period,
    DateTime? startDate,
    DateTime? endDate,
  });
  
  /// 批量创建吸烟记录
  /// 
  /// [requests] 批量吸烟记录请求列表
  /// 返回批量创建结果
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> batchCreateSmokingRecords(
    List<CreateSmokingRecordRequestModel> requests,
  );
  
  /// 获取吸烟热力图数据
  /// 
  /// [year] 年份
  /// [month] 月份（可选，不传则返回全年数据）
  /// 返回热力图数据
  Future<ApiResponseModel<Map<String, dynamic>>> getSmokingHeatmapData({
    required int year,
    int? month,
  });
  
  /// 获取最近吸烟记录
  /// 
  /// [limit] 返回数量限制
  /// 返回最近的吸烟记录列表
  Future<ApiResponseModel<List<SmokingRecordResponseModel>>> getRecentSmokingRecords(
    int limit,
  );
  
  /// 检查今日是否有吸烟记录
  /// 
  /// 返回今日吸烟状态
  Future<ApiResponseModel<bool>> checkTodaySmokingStatus();
}
