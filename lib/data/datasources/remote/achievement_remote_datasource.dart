/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 成就系统远程数据源 (AchievementRemoteDataSource)
 * 功能：
 * 1. 定义成就相关的API接口
 * 2. 处理成就的查询、解锁、进度等操作
 * 3. 与Spring Boot后端API通信
 * 4. 提供统一的成就数据访问接口
 */

import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/achievement_models.dart';

/// 成就系统远程数据源接口
/// 
/// 定义所有成就相关的API操作
abstract class AchievementRemoteDataSource {
  
  /// 获取所有成就定义
  /// 
  /// [request] 成就查询请求参数
  /// 返回成就定义列表
  Future<ApiResponseModel<List<AchievementResponseModel>>> getAllAchievements(
    AchievementQueryRequestModel request,
  );
  
  /// 获取用户成就列表
  /// 
  /// [request] 成就查询请求参数
  /// 返回用户成就列表
  Future<ApiResponseModel<List<UserAchievementResponseModel>>> getUserAchievements(
    AchievementQueryRequestModel request,
  );
  
  /// 获取成就进度信息
  /// 
  /// [achievementIds] 成就ID列表（可选，不传则返回所有成就进度）
  /// 返回成就进度列表
  Future<ApiResponseModel<List<AchievementProgressResponseModel>>> getAchievementProgress([
    List<String>? achievementIds,
  ]);
  
  /// 获取成就统计信息
  /// 
  /// 返回用户的成就统计数据
  Future<ApiResponseModel<AchievementStatsResponseModel>> getAchievementStats();
  
  /// 手动解锁成就
  /// 
  /// [request] 解锁成就请求数据
  /// 返回解锁后的用户成就信息
  Future<ApiResponseModel<UserAchievementResponseModel>> unlockAchievement(
    UnlockAchievementRequestModel request,
  );
  
  /// 获取指定成就详情
  /// 
  /// [achievementId] 成就ID
  /// 返回成就详情信息
  Future<ApiResponseModel<AchievementResponseModel>> getAchievementDetail(
    String achievementId,
  );
  
  /// 获取用户指定成就信息
  /// 
  /// [achievementId] 成就ID
  /// 返回用户成就信息
  Future<ApiResponseModel<UserAchievementResponseModel?>> getUserAchievement(
    String achievementId,
  );
  
  /// 检查成就解锁条件
  /// 
  /// [achievementIds] 要检查的成就ID列表（可选）
  /// 返回检查结果，包含可解锁的成就列表
  Future<ApiResponseModel<List<String>>> checkAchievementUnlockConditions([
    List<String>? achievementIds,
  ]);
  
  /// 获取最近解锁的成就
  /// 
  /// [limit] 返回数量限制
  /// 返回最近解锁的成就列表
  Future<ApiResponseModel<List<UserAchievementResponseModel>>> getRecentUnlockedAchievements(
    int limit,
  );
  
  /// 获取即将解锁的成就
  /// 
  /// [limit] 返回数量限制
  /// [progressThreshold] 进度阈值（0-1），默认0.8表示进度超过80%的成就
  /// 返回即将解锁的成就列表
  Future<ApiResponseModel<List<AchievementProgressResponseModel>>> getNearUnlockAchievements(
    int limit, {
    double progressThreshold = 0.8,
  });
  
  /// 获取成就排行榜
  /// 
  /// [type] 排行榜类型（total/recent/category）
  /// [category] 成就类别（当type为category时使用）
  /// [limit] 返回数量限制
  /// 返回成就排行榜数据
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getAchievementLeaderboard({
    required String type,
    String? category,
    int limit = 10,
  });
  
  /// 同步成就进度
  /// 
  /// 触发服务器重新计算用户的成就进度
  /// 返回同步结果
  Future<ApiResponseModel<String>> syncAchievementProgress();
}
