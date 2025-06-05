/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 成就系统数据映射器 (AchievementMapper)
 * 功能：
 * 1. 在Domain实体和API模型之间进行数据转换
 * 2. 处理字段名差异和数据格式转换
 * 3. 提供双向映射方法
 * 4. 确保数据一致性
 */

import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/data/models/achievement_models.dart';

/// 成就系统数据映射器
///
/// 负责Flutter实体和API模型之间的数据转换
class AchievementMapper {
  // ==================== Entity -> API Model ====================

  /// 将成就查询参数转换为AchievementQueryRequest模型
  static AchievementQueryRequestModel createQueryRequest({
    List<String>? types,
    bool includeHidden = false,
    bool? unlockedOnly,
    int page = 1,
    int limit = 50,
    String sortBy = 'createdAt',
    String sortOrder = 'asc',
  }) {
    return AchievementQueryRequestModel(
      types: types,
      includeHidden: includeHidden,
      unlockedOnly: unlockedOnly,
      page: page,
      limit: limit,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  /// 将解锁成就请求转换为UnlockAchievementRequest模型
  static UnlockAchievementRequestModel createUnlockRequest(
    String achievementIdentifier, {
    Map<String, dynamic>? unlockData,
    String? reason,
  }) {
    return UnlockAchievementRequestModel(
      achievementIdentifier: achievementIdentifier,
      unlockData: unlockData,
      reason: reason,
    );
  }

  // ==================== API Model -> Entity ====================

  /// 将AchievementResponse模型转换为AchievementDefinition实体
  ///
  /// 处理API响应到本地实体的转换
  static AchievementDefinition achievementResponseToEntity(
    AchievementResponseModel response,
  ) {
    return AchievementDefinition(
      id: response.identifier, // 使用identifier作为本地ID
      name: response.name,
      description: response.description,
      unlockCondition: response.unlockConditions, // 匹配本地实体字段名
      iconLockedAssetPath: response.icon, // 使用API图标作为锁定状态图标
      iconUnlockedAssetPath: response.icon, // 使用API图标作为解锁状态图标
      nameKey: response.name, // 使用名称作为本地化键
      descriptionKey: response.description, // 使用描述作为本地化键
    );
  }

  /// 将AchievementResponse列表转换为AchievementDefinition实体列表
  static List<AchievementDefinition> achievementResponseListToEntityList(
    List<AchievementResponseModel> responses,
  ) {
    return responses
        .map((response) => achievementResponseToEntity(response))
        .toList();
  }

  /// 将UserAchievementResponse模型转换为UnlockedAchievement实体
  ///
  /// 处理用户成就API响应到本地实体的转换
  static UnlockedAchievement userAchievementResponseToEntity(
    UserAchievementResponseModel response,
  ) {
    return UnlockedAchievement(
      achievementId: response.achievement.identifier,
      unlockDate: response.unlockedAt,
      // 本地实体没有progress和unlockData字段
    );
  }

  /// 将UserAchievementResponse列表转换为UnlockedAchievement实体列表
  static List<UnlockedAchievement> userAchievementResponseListToEntityList(
    List<UserAchievementResponseModel> responses,
  ) {
    return responses
        .map((response) => userAchievementResponseToEntity(response))
        .toList();
  }

  // ==================== 统计数据转换 ====================

  /// 将AchievementStatsResponse转换为Map格式
  ///
  /// 用于在UI中显示统计信息
  static Map<String, dynamic> statsResponseToMap(
    AchievementStatsResponseModel stats,
  ) {
    return {
      'totalAchievements': stats.totalAchievements,
      'unlockedAchievements': stats.unlockedAchievements,
      'unlockRate': stats.unlockRate,
      'recentUnlocks':
          stats.recentUnlocks
              ?.map((unlock) => userAchievementResponseToEntity(unlock))
              .toList(),
      'nearUnlocks':
          stats.nearUnlocks
              ?.map((progress) => progressResponseToMap(progress))
              .toList(),
      'achievementsByType': stats.achievementsByType,
      'calculatedAt': stats.calculatedAt,
    };
  }

  /// 将AchievementProgressResponse转换为Map格式
  static Map<String, dynamic> progressResponseToMap(
    AchievementProgressResponseModel progress,
  ) {
    return {
      'achievementId': progress.achievementId,
      'identifier': progress.identifier,
      'name': progress.name,
      'currentProgress': progress.currentProgress,
      'targetProgress': progress.targetProgress,
      'progressPercentage': progress.progressPercentage,
      'isUnlocked': progress.isUnlocked,
      'unlockedAt': progress.unlockedAt,
      'remainingProgress': progress.remainingProgress,
      'estimatedUnlockTime': progress.estimatedUnlockTime,
    };
  }

  /// 将AchievementProgressResponse列表转换为Map列表
  static List<Map<String, dynamic>> progressResponseListToMapList(
    List<AchievementProgressResponseModel> progressList,
  ) {
    return progressList
        .map((progress) => progressResponseToMap(progress))
        .toList();
  }

  // ==================== 排行榜数据转换 ====================

  /// 将排行榜API响应转换为本地格式
  static List<Map<String, dynamic>> leaderboardResponseToList(
    List<Map<String, dynamic>> leaderboardData,
  ) {
    return leaderboardData
        .map(
          (item) => {
            'rank': item['rank'] as int? ?? 0,
            'userId': item['userId'] as String? ?? '',
            'userName': item['userName'] as String? ?? '',
            'achievementCount': item['achievementCount'] as int? ?? 0,
            'totalPoints': item['totalPoints'] as int? ?? 0,
            'lastUnlockDate':
                item['lastUnlockDate'] != null
                    ? DateTime.parse(item['lastUnlockDate'] as String)
                    : null,
          },
        )
        .toList();
  }

  // ==================== 数据验证 ====================

  /// 验证AchievementDefinition实体数据的有效性
  static bool validateAchievementDefinition(AchievementDefinition entity) {
    // 检查必要字段
    if (entity.id.isEmpty) return false;
    if (entity.name.isEmpty) return false;
    if (entity.description.isEmpty) return false;

    // 检查解锁条件
    if (entity.unlockCondition.isEmpty) return false;

    return true;
  }

  /// 验证UnlockedAchievement实体数据的有效性
  static bool validateUnlockedAchievement(UnlockedAchievement entity) {
    // 检查必要字段
    if (entity.achievementId.isEmpty) return false;

    // 检查解锁时间是否合理（不能是未来时间）
    final now = DateTime.now();
    if (entity.unlockDate.isAfter(now)) return false;

    return true;
  }

  // ==================== 辅助方法 ====================

  /// 根据成就类型获取对应的图标
  static String getIconByType(String type) {
    switch (type.toLowerCase()) {
      case 'time':
        return '⏰';
      case 'health':
        return '❤️';
      case 'money':
        return '💰';
      case 'milestone':
        return '🏆';
      case 'streak':
        return '🔥';
      case 'social':
        return '👥';
      default:
        return '🎯';
    }
  }

  /// 格式化成就进度为百分比字符串
  static String formatProgressPercentage(double progress) {
    return '${(progress * 100).toStringAsFixed(1)}%';
  }

  /// 计算成就解锁所需的剩余进度
  static double calculateRemainingProgress(
    double currentProgress,
    double targetProgress,
  ) {
    return (targetProgress - currentProgress).clamp(0.0, targetProgress);
  }

  /// 检查成就是否即将解锁（进度超过阈值）
  static bool isNearUnlock(double progress, {double threshold = 0.8}) {
    return progress >= threshold && progress < 1.0;
  }

  // 注意：本地实体类没有type字段，所以移除了按类型分组的方法

  /// 根据解锁时间对已解锁成就进行排序
  static List<UnlockedAchievement> sortUnlockedAchievementsByDate(
    List<UnlockedAchievement> unlockedAchievements, {
    bool descending = true,
  }) {
    final sorted = List<UnlockedAchievement>.from(unlockedAchievements);
    sorted.sort((a, b) {
      final comparison = a.unlockDate.compareTo(b.unlockDate);
      return descending ? -comparison : comparison;
    });
    return sorted;
  }

  // 注意：本地实体类没有type和isHidden字段，所以移除了相关的过滤方法
}
