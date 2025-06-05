/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 成就系统API模型 (AchievementModels)
 * 功能：
 * 1. 定义成就相关的API请求和响应模型
 * 2. 对应Spring Boot后端的AchievementDto
 * 3. 支持JSON序列化/反序列化
 * 4. 提供数据转换方法
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'achievement_models.freezed.dart';
part 'achievement_models.g.dart';

/// 成就定义响应模型
/// 
/// 对应Spring Boot的AchievementDto
@freezed
class AchievementResponseModel with _$AchievementResponseModel {
  const factory AchievementResponseModel({
    /// 成就ID
    required String id,
    
    /// 成就标识符
    required String identifier,
    
    /// 成就名称
    required String name,
    
    /// 成就描述
    required String description,
    
    /// 成就图标
    required String icon,
    
    /// 成就类型
    required String type,
    
    /// 解锁条件
    required Map<String, dynamic> unlockConditions,
    
    /// 奖励信息
    Map<String, dynamic>? rewards,
    
    /// 是否为隐藏成就
    @Default(false) bool isHidden,
    
    /// 成就等级
    @Default(1) int level,
    
    /// 创建时间
    required DateTime createdAt,
    
    /// 更新时间
    required DateTime updatedAt,
  }) = _AchievementResponseModel;

  /// 从JSON创建实例
  factory AchievementResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementResponseModelFromJson(json);
}

/// 用户成就响应模型
/// 
/// 对应Spring Boot的UserAchievementDto
@freezed
class UserAchievementResponseModel with _$UserAchievementResponseModel {
  const factory UserAchievementResponseModel({
    /// 用户成就ID
    required String id,
    
    /// 用户ID
    required String userId,
    
    /// 成就信息
    required AchievementResponseModel achievement,
    
    /// 解锁时间
    required DateTime unlockedAt,
    
    /// 当前进度
    required double progress,
    
    /// 是否已解锁
    required bool isUnlocked,
    
    /// 解锁时的数据快照
    Map<String, dynamic>? unlockData,
    
    /// 创建时间
    required DateTime createdAt,
    
    /// 更新时间
    required DateTime updatedAt,
  }) = _UserAchievementResponseModel;

  /// 从JSON创建实例
  factory UserAchievementResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserAchievementResponseModelFromJson(json);
}

/// 成就进度响应模型
@freezed
class AchievementProgressResponseModel with _$AchievementProgressResponseModel {
  const factory AchievementProgressResponseModel({
    /// 成就ID
    required String achievementId,
    
    /// 成就标识符
    required String identifier,
    
    /// 成就名称
    required String name,
    
    /// 当前进度值
    required double currentProgress,
    
    /// 目标进度值
    required double targetProgress,
    
    /// 进度百分比（0-100）
    required double progressPercentage,
    
    /// 是否已解锁
    required bool isUnlocked,
    
    /// 解锁时间（如果已解锁）
    DateTime? unlockedAt,
    
    /// 距离解锁还需要的进度
    double? remainingProgress,
    
    /// 预计解锁时间（基于当前进度速度）
    DateTime? estimatedUnlockTime,
  }) = _AchievementProgressResponseModel;

  /// 从JSON创建实例
  factory AchievementProgressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementProgressResponseModelFromJson(json);
}

/// 成就统计响应模型
@freezed
class AchievementStatsResponseModel with _$AchievementStatsResponseModel {
  const factory AchievementStatsResponseModel({
    /// 总成就数量
    required int totalAchievements,
    
    /// 已解锁成就数量
    required int unlockedAchievements,
    
    /// 解锁率（百分比）
    required double unlockRate,
    
    /// 最近解锁的成就
    List<UserAchievementResponseModel>? recentUnlocks,
    
    /// 即将解锁的成就
    List<AchievementProgressResponseModel>? nearUnlocks,
    
    /// 按类型分组的统计
    Map<String, int>? achievementsByType,
    
    /// 统计计算时间
    required DateTime calculatedAt,
  }) = _AchievementStatsResponseModel;

  /// 从JSON创建实例
  factory AchievementStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementStatsResponseModelFromJson(json);
}

/// 手动解锁成就请求模型
@freezed
class UnlockAchievementRequestModel with _$UnlockAchievementRequestModel {
  const factory UnlockAchievementRequestModel({
    /// 成就标识符
    required String achievementIdentifier,
    
    /// 解锁时的数据快照
    Map<String, dynamic>? unlockData,
    
    /// 解锁原因/备注
    String? reason,
  }) = _UnlockAchievementRequestModel;

  /// 从JSON创建实例
  factory UnlockAchievementRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UnlockAchievementRequestModelFromJson(json);
}

/// 成就查询请求模型
@freezed
class AchievementQueryRequestModel with _$AchievementQueryRequestModel {
  const factory AchievementQueryRequestModel({
    /// 成就类型过滤
    List<String>? types,
    
    /// 是否包含隐藏成就
    @Default(false) bool includeHidden,
    
    /// 是否只返回已解锁的成就
    bool? unlockedOnly,
    
    /// 页码（从1开始）
    @Default(1) int page,
    
    /// 每页数量
    @Default(50) int limit,
    
    /// 排序字段
    @Default('createdAt') String sortBy,
    
    /// 排序方向（asc/desc）
    @Default('asc') String sortOrder,
  }) = _AchievementQueryRequestModel;

  /// 从JSON创建实例
  factory AchievementQueryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementQueryRequestModelFromJson(json);
}
