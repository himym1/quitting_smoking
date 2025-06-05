/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 每日打卡远程数据源 (DailyCheckInRemoteDataSource)
 * 功能：
 * 1. 定义打卡相关的API接口
 * 2. 处理打卡记录的创建、查询、统计等操作
 * 3. 与Spring Boot后端API通信
 * 4. 提供统一的打卡数据访问接口
 */

import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/daily_check_in_models.dart';

/// 每日打卡远程数据源接口
/// 
/// 定义所有打卡相关的API操作
abstract class DailyCheckInRemoteDataSource {
  
  /// 创建打卡记录
  /// 
  /// [request] 打卡请求数据
  /// 返回创建的打卡记录信息
  Future<ApiResponseModel<CheckInResponseModel>> createCheckIn(
    CreateCheckInRequestModel request,
  );
  
  /// 获取指定日期的打卡记录
  /// 
  /// [date] 查询日期
  /// 返回该日期的打卡记录，如果没有则返回null
  Future<ApiResponseModel<CheckInResponseModel?>> getCheckInForDate(
    DateTime date,
  );
  
  /// 获取打卡历史记录
  /// 
  /// [request] 历史查询请求参数
  /// 返回分页的打卡记录列表
  Future<ApiResponseModel<List<CheckInResponseModel>>> getCheckInHistory(
    CheckInHistoryRequestModel request,
  );
  
  /// 获取打卡统计信息
  /// 
  /// 返回用户的打卡统计数据
  Future<ApiResponseModel<CheckInStatsResponseModel>> getCheckInStats();
  
  /// 更新打卡记录
  /// 
  /// [checkInId] 打卡记录ID
  /// [note] 更新的备注信息
  /// 返回更新后的打卡记录
  Future<ApiResponseModel<CheckInResponseModel>> updateCheckIn(
    String checkInId,
    String? note,
  );
  
  /// 删除打卡记录
  /// 
  /// [checkInId] 打卡记录ID
  /// 返回删除操作结果
  Future<ApiResponseModel<String>> deleteCheckIn(String checkInId);
  
  /// 获取打卡日历数据
  /// 
  /// [year] 年份
  /// [month] 月份
  /// 返回指定月份的打卡日历数据
  Future<ApiResponseModel<Map<String, dynamic>>> getCheckInCalendar(
    int year,
    int month,
  );
  
  /// 批量创建打卡记录
  /// 
  /// [requests] 批量打卡请求列表
  /// 返回批量创建结果
  Future<ApiResponseModel<List<CheckInResponseModel>>> batchCreateCheckIns(
    List<CreateCheckInRequestModel> requests,
  );
  
  /// 获取连续打卡排行榜
  /// 
  /// [limit] 返回数量限制
  /// 返回连续打卡天数排行榜
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getCheckInLeaderboard(
    int limit,
  );
  
  /// 检查今日是否已打卡
  /// 
  /// 返回今日打卡状态
  Future<ApiResponseModel<bool>> checkTodayCheckInStatus();
}
