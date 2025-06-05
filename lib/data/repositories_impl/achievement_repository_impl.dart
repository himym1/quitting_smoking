import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/achievement_remote_datasource.dart';
import 'package:quitting_smoking/data/mappers/achievement_mapper.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  final AchievementLocalDataSource _localDataSource;
  final AchievementRemoteDataSource? _remoteDataSource;
  final Connectivity _connectivity;

  AchievementRepositoryImpl({
    required AchievementLocalDataSource localDataSource,
    AchievementRemoteDataSource? remoteDataSource,
    Connectivity? connectivity,
  }) : _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource,
       _connectivity = connectivity ?? Connectivity();

  /// 检查网络连接状态
  Future<bool> _isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<List<AchievementDefinition>> getAchievementDefinitions() async {
    try {
      // 优先从本地获取
      final localDefinitions =
          await _localDataSource.getAchievementDefinitions();

      // 如果有网络连接，尝试从服务器获取最新定义
      if (_remoteDataSource != null && await _isConnected()) {
        try {
          final request = AchievementMapper.createQueryRequest(
            includeHidden: false,
            limit: 100,
          );
          final response = await _remoteDataSource!.getAllAchievements(request);

          if (response.success && response.data != null) {
            final remoteDefinitions =
                AchievementMapper.achievementResponseListToEntityList(
                  response.data!,
                );

            // 更新本地定义（简单策略：远程数据优先）
            // TODO: 需要在本地数据源中实现saveAchievementDefinition方法
            // for (final definition in remoteDefinitions) {
            //   await _localDataSource.saveAchievementDefinition(definition);
            // }

            logInfo(
              '已同步${remoteDefinitions.length}个成就定义',
              tag: 'AchievementRepository',
            );

            // 返回更新后的本地数据
            return await _localDataSource.getAchievementDefinitions();
          }
        } catch (e) {
          logWarning('同步成就定义失败: $e', tag: 'AchievementRepository');
        }
      }

      return localDefinitions;
    } catch (e) {
      logError('获取成就定义失败', tag: 'AchievementRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<UnlockedAchievement>> getUnlockedAchievements() async {
    try {
      // 优先从本地获取
      final localUnlocked = await _localDataSource.getUnlockedAchievements();

      // 如果有网络连接，尝试从服务器获取用户成就
      if (_remoteDataSource != null && await _isConnected()) {
        try {
          final request = AchievementMapper.createQueryRequest(
            unlockedOnly: true,
            limit: 100,
          );
          final response = await _remoteDataSource!.getUserAchievements(
            request,
          );

          if (response.success && response.data != null) {
            final remoteUnlocked =
                AchievementMapper.userAchievementResponseListToEntityList(
                  response.data!,
                );

            // 更新本地已解锁成就
            for (final unlocked in remoteUnlocked) {
              await _localDataSource.saveUnlockedAchievement(unlocked);
            }

            logInfo(
              '已同步${remoteUnlocked.length}个已解锁成就',
              tag: 'AchievementRepository',
            );

            // 返回更新后的本地数据
            return await _localDataSource.getUnlockedAchievements();
          }
        } catch (e) {
          logWarning('同步已解锁成就失败: $e', tag: 'AchievementRepository');
        }
      }

      return localUnlocked;
    } catch (e) {
      logError('获取已解锁成就失败', tag: 'AchievementRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<UnlockedAchievement?> unlockAchievement(String achievementId) async {
    try {
      // Check if already unlocked
      if (await isAchievementUnlocked(achievementId)) {
        return null;
      }

      // Create new unlocked achievement
      final unlockDate = DateTime.now();
      final unlockedAchievement = UnlockedAchievement(
        achievementId: achievementId,
        unlockDate: unlockDate,
      );

      // 验证数据（简化验证，因为实体结构不同）
      if (achievementId.isEmpty || unlockDate.isAfter(DateTime.now())) {
        throw ArgumentError('Invalid unlocked achievement data');
      }

      // Save to local storage first
      final success = await _localDataSource.saveUnlockedAchievement(
        unlockedAchievement,
      );

      if (!success) {
        return null;
      }

      logInfo('成就已在本地解锁: $achievementId', tag: 'AchievementRepository');

      // 如果有网络连接，同步到服务器
      if (_remoteDataSource != null && await _isConnected()) {
        try {
          final request = AchievementMapper.createUnlockRequest(
            achievementId,
            unlockData: null, // 本地实体没有unlockData字段
            reason: 'User achievement unlock',
          );
          final response = await _remoteDataSource!.unlockAchievement(request);

          if (response.success && response.data != null) {
            // 更新本地数据以包含服务器返回的信息
            final updatedUnlocked =
                AchievementMapper.userAchievementResponseToEntity(
                  response.data!,
                );
            await _localDataSource.saveUnlockedAchievement(updatedUnlocked);
            logInfo('成就解锁已同步到服务器', tag: 'AchievementRepository');
            return updatedUnlocked;
          }
        } catch (e) {
          logWarning(
            '同步成就解锁到服务器失败，将在网络恢复时重试: $e',
            tag: 'AchievementRepository',
          );
          // 不抛出异常，因为本地保存已成功
        }
      }

      return unlockedAchievement;
    } catch (e) {
      logError('解锁成就失败', tag: 'AchievementRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<bool> isAchievementUnlocked(String achievementId) async {
    return await _localDataSource.isAchievementUnlocked(achievementId);
  }

  @override
  Future<AchievementDefinition?> getAchievementDefinitionById(
    String achievementId,
  ) async {
    final achievements = await getAchievementDefinitions();
    try {
      return achievements.firstWhere((a) => a.id == achievementId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> clearAllUnlockedAchievements() async {
    try {
      final success = await _localDataSource.clearAllUnlockedAchievements();
      if (success) {
        logInfo('所有已解锁成就已清除', tag: 'AchievementRepository');
      }
      return success;
    } catch (e) {
      logError('清除所有已解锁成就失败', tag: 'AchievementRepository', error: e);
      rethrow;
    }
  }

  // ==================== 新增方法：远程数据源专用 ====================

  /// 获取成就统计信息
  Future<Map<String, dynamic>?> getAchievementStats() async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!.getAchievementStats();
      if (response.success && response.data != null) {
        return AchievementMapper.statsResponseToMap(response.data!);
      }
    } catch (e) {
      logError('获取成就统计失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 获取成就进度信息
  Future<List<Map<String, dynamic>>?> getAchievementProgress([
    List<String>? achievementIds,
  ]) async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!.getAchievementProgress(
        achievementIds,
      );
      if (response.success && response.data != null) {
        return AchievementMapper.progressResponseListToMapList(response.data!);
      }
    } catch (e) {
      logError('获取成就进度失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 获取最近解锁的成就
  Future<List<UnlockedAchievement>?> getRecentUnlockedAchievements(
    int limit,
  ) async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!.getRecentUnlockedAchievements(
        limit,
      );
      if (response.success && response.data != null) {
        return AchievementMapper.userAchievementResponseListToEntityList(
          response.data!,
        );
      }
    } catch (e) {
      logError('获取最近解锁成就失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 获取即将解锁的成就
  Future<List<Map<String, dynamic>>?> getNearUnlockAchievements(
    int limit, {
    double progressThreshold = 0.8,
  }) async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!.getNearUnlockAchievements(
        limit,
        progressThreshold: progressThreshold,
      );
      if (response.success && response.data != null) {
        return AchievementMapper.progressResponseListToMapList(response.data!);
      }
    } catch (e) {
      logError('获取即将解锁成就失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 获取成就排行榜
  Future<List<Map<String, dynamic>>?> getAchievementLeaderboard({
    required String type,
    String? category,
    int limit = 10,
  }) async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!.getAchievementLeaderboard(
        type: type,
        category: category,
        limit: limit,
      );
      if (response.success && response.data != null) {
        return AchievementMapper.leaderboardResponseToList(response.data!);
      }
    } catch (e) {
      logError('获取成就排行榜失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 检查成就解锁条件
  Future<List<String>?> checkAchievementUnlockConditions([
    List<String>? achievementIds,
  ]) async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await _remoteDataSource!
          .checkAchievementUnlockConditions(achievementIds);
      if (response.success && response.data != null) {
        return response.data!;
      }
    } catch (e) {
      logError('检查成就解锁条件失败', tag: 'AchievementRepository', error: e);
    }

    return null;
  }

  /// 同步成就进度
  Future<bool> syncAchievementProgress() async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return false;
    }

    try {
      final response = await _remoteDataSource!.syncAchievementProgress();
      if (response.success) {
        logInfo('成就进度同步完成', tag: 'AchievementRepository');
        return true;
      }
    } catch (e) {
      logError('成就进度同步失败', tag: 'AchievementRepository', error: e);
    }

    return false;
  }

  /// 强制同步数据
  Future<bool> syncData() async {
    if (_remoteDataSource == null || !await _isConnected()) {
      return false;
    }

    try {
      // 同步成就定义
      await getAchievementDefinitions();

      // 同步已解锁成就
      await getUnlockedAchievements();

      // 同步成就进度
      await syncAchievementProgress();

      logInfo('成就数据同步完成', tag: 'AchievementRepository');
      return true;
    } catch (e) {
      logError('成就数据同步失败', tag: 'AchievementRepository', error: e);
    }

    return false;
  }
}
