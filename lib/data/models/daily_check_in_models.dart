/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 每日打卡API模型 (DailyCheckInModels)
 * 功能：
 * 1. 定义打卡相关的API请求和响应模型
 * 2. 对应Spring Boot后端的CheckInDto
 * 3. 支持JSON序列化/反序列化
 * 4. 提供数据转换方法
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'daily_check_in_models.freezed.dart';
part 'daily_check_in_models.g.dart';

/// 创建打卡请求模型
/// 
/// 对应Spring Boot的CreateCheckInRequest
@freezed
class CreateCheckInRequestModel with _$CreateCheckInRequestModel {
  const factory CreateCheckInRequestModel({
    /// 打卡日期
    required DateTime date,
    
    /// 打卡时间（可选，默认为当前时间）
    DateTime? checkinTime,
    
    /// 打卡备注
    String? note,
  }) = _CreateCheckInRequestModel;

  /// 从JSON创建实例
  factory CreateCheckInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCheckInRequestModelFromJson(json);
}

/// 打卡记录响应模型
/// 
/// 对应Spring Boot的CheckInDto
@freezed
class CheckInResponseModel with _$CheckInResponseModel {
  const factory CheckInResponseModel({
    /// 打卡记录ID
    required String id,
    
    /// 用户ID
    required String userId,
    
    /// 打卡日期
    required DateTime date,
    
    /// 打卡时间
    required DateTime checkinTime,
    
    /// 打卡备注
    String? note,
    
    /// 连续打卡天数
    required int consecutiveDays,
    
    /// 创建时间
    required DateTime createdAt,
    
    /// 更新时间
    required DateTime updatedAt,
  }) = _CheckInResponseModel;

  /// 从JSON创建实例
  factory CheckInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInResponseModelFromJson(json);
}

/// 打卡统计响应模型
/// 
/// 对应Spring Boot的CheckInStatsDto
@freezed
class CheckInStatsResponseModel with _$CheckInStatsResponseModel {
  const factory CheckInStatsResponseModel({
    /// 总打卡天数
    required int totalCheckIns,
    
    /// 当前连续打卡天数
    required int currentStreak,
    
    /// 最长连续打卡天数
    required int longestStreak,
    
    /// 本月打卡天数
    required int monthlyCheckIns,
    
    /// 本周打卡天数
    required int weeklyCheckIns,
    
    /// 打卡成功率（百分比）
    required double successRate,
    
    /// 最近打卡日期
    DateTime? lastCheckInDate,
    
    /// 统计计算时间
    required DateTime calculatedAt,
  }) = _CheckInStatsResponseModel;

  /// 从JSON创建实例
  factory CheckInStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInStatsResponseModelFromJson(json);
}

/// 打卡历史查询请求模型
@freezed
class CheckInHistoryRequestModel with _$CheckInHistoryRequestModel {
  const factory CheckInHistoryRequestModel({
    /// 开始日期
    DateTime? startDate,
    
    /// 结束日期
    DateTime? endDate,
    
    /// 页码（从1开始）
    @Default(1) int page,
    
    /// 每页数量
    @Default(20) int limit,
    
    /// 排序字段
    @Default('date') String sortBy,
    
    /// 排序方向（asc/desc）
    @Default('desc') String sortOrder,
  }) = _CheckInHistoryRequestModel;

  /// 从JSON创建实例
  factory CheckInHistoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckInHistoryRequestModelFromJson(json);
}
