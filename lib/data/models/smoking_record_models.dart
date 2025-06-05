/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 吸烟记录API模型 (SmokingRecordModels)
 * 功能：
 * 1. 定义吸烟记录相关的API请求和响应模型
 * 2. 对应Spring Boot后端的SmokingRecordDto
 * 3. 支持JSON序列化/反序列化
 * 4. 提供数据转换方法
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'smoking_record_models.freezed.dart';
part 'smoking_record_models.g.dart';

/// 创建吸烟记录请求模型
/// 
/// 对应Spring Boot的CreateSmokingRecordRequest
@freezed
class CreateSmokingRecordRequestModel with _$CreateSmokingRecordRequestModel {
  const factory CreateSmokingRecordRequestModel({
    /// 吸烟时间
    required DateTime timestamp,
    
    /// 吸烟支数
    @Default(1) int cigarettesSmoked,
    
    /// 触发因素标签
    List<String>? triggerTags,
    
    /// 备注
    String? notes,
    
    /// 位置信息
    LocationInfoModel? location,
  }) = _CreateSmokingRecordRequestModel;

  /// 从JSON创建实例
  factory CreateSmokingRecordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSmokingRecordRequestModelFromJson(json);
}

/// 位置信息模型
@freezed
class LocationInfoModel with _$LocationInfoModel {
  const factory LocationInfoModel({
    /// 位置名称
    String? name,
    
    /// 坐标信息 [经度, 纬度]
    List<double>? coordinates,
  }) = _LocationInfoModel;

  /// 从JSON创建实例
  factory LocationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoModelFromJson(json);
}

/// 吸烟记录响应模型
/// 
/// 对应Spring Boot的SmokingRecordDto
@freezed
class SmokingRecordResponseModel with _$SmokingRecordResponseModel {
  const factory SmokingRecordResponseModel({
    /// 记录ID
    required String id,
    
    /// 用户ID
    required String userId,
    
    /// 吸烟时间
    required DateTime timestamp,
    
    /// 吸烟支数
    required int cigarettesSmoked,
    
    /// 触发因素标签
    List<String>? triggerTags,
    
    /// 备注
    String? notes,
    
    /// 位置信息
    LocationInfoModel? location,
    
    /// 对戒烟进度的影响
    SmokingImpactModel? impact,
    
    /// 创建时间
    required DateTime createdAt,
    
    /// 更新时间
    required DateTime updatedAt,
  }) = _SmokingRecordResponseModel;

  /// 从JSON创建实例
  factory SmokingRecordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SmokingRecordResponseModelFromJson(json);
}

/// 吸烟影响模型
@freezed
class SmokingImpactModel with _$SmokingImpactModel {
  const factory SmokingImpactModel({
    /// 是否中断连续戒烟
    required bool streakBroken,
    
    /// 中断前的连续天数
    int? previousStreak,
    
    /// 影响的成就
    List<String>? affectedAchievements,
    
    /// 影响描述
    String? description,
  }) = _SmokingImpactModel;

  /// 从JSON创建实例
  factory SmokingImpactModel.fromJson(Map<String, dynamic> json) =>
      _$SmokingImpactModelFromJson(json);
}

/// 吸烟记录统计响应模型
@freezed
class SmokingRecordStatsResponseModel with _$SmokingRecordStatsResponseModel {
  const factory SmokingRecordStatsResponseModel({
    /// 总吸烟次数
    required int totalRecords,
    
    /// 总吸烟支数
    required int totalCigarettes,
    
    /// 本月吸烟次数
    required int monthlyRecords,
    
    /// 本月吸烟支数
    required int monthlyCigarettes,
    
    /// 本周吸烟次数
    required int weeklyRecords,
    
    /// 本周吸烟支数
    required int weeklyCigarettes,
    
    /// 平均每日吸烟支数
    required double averageDailyCigarettes,
    
    /// 最常见触发因素
    List<String>? commonTriggers,
    
    /// 最后吸烟时间
    DateTime? lastSmokingTime,
    
    /// 统计计算时间
    required DateTime calculatedAt,
  }) = _SmokingRecordStatsResponseModel;

  /// 从JSON创建实例
  factory SmokingRecordStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SmokingRecordStatsResponseModelFromJson(json);
}

/// 吸烟记录历史查询请求模型
@freezed
class SmokingRecordHistoryRequestModel with _$SmokingRecordHistoryRequestModel {
  const factory SmokingRecordHistoryRequestModel({
    /// 开始日期
    DateTime? startDate,
    
    /// 结束日期
    DateTime? endDate,
    
    /// 触发因素过滤
    List<String>? triggerTags,
    
    /// 页码（从1开始）
    @Default(1) int page,
    
    /// 每页数量
    @Default(20) int limit,
    
    /// 排序字段
    @Default('timestamp') String sortBy,
    
    /// 排序方向（asc/desc）
    @Default('desc') String sortOrder,
  }) = _SmokingRecordHistoryRequestModel;

  /// 从JSON创建实例
  factory SmokingRecordHistoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SmokingRecordHistoryRequestModelFromJson(json);
}
