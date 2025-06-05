import 'package:quitting_smoking/data/datasources/local/smoking_record_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/smoking_record_remote_datasource.dart';
import 'package:quitting_smoking/data/mappers/smoking_record_mapper.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/domain/repositories/smoking_record_repository.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SmokingRecordRepositoryImpl implements SmokingRecordRepository {
  final SmokingRecordLocalDataSource localDataSource;
  final SmokingRecordRemoteDataSource? remoteDataSource;
  final Connectivity _connectivity;

  SmokingRecordRepositoryImpl({
    required this.localDataSource,
    this.remoteDataSource,
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  /// 检查网络连接状态
  Future<bool> _isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> addSmokingRecord(SmokingRecord record) async {
    try {
      // 验证数据
      if (!SmokingRecordMapper.validateEntity(record)) {
        throw ArgumentError('Invalid smoking record data');
      }

      // 先保存到本地
      await localDataSource.addSmokingRecord(record);
      logInfo(
        '吸烟记录已保存到本地: ${record.timestamp}',
        tag: 'SmokingRecordRepository',
      );

      // 如果有网络连接且有远程数据源，同步到服务器
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final request = SmokingRecordMapper.entityToCreateRequest(record);
          final response = await remoteDataSource!.createSmokingRecord(request);

          if (response.success && response.data != null) {
            // 更新本地数据以包含服务器返回的信息
            final updatedRecord = SmokingRecordMapper.responseToEntity(
              response.data!,
            );
            await localDataSource.addSmokingRecord(updatedRecord);
            logInfo('吸烟记录已同步到服务器', tag: 'SmokingRecordRepository');
          }
        } catch (e) {
          logWarning(
            '同步吸烟记录到服务器失败，将在网络恢复时重试: $e',
            tag: 'SmokingRecordRepository',
          );
          // 不抛出异常，因为本地保存已成功
        }
      }
    } catch (e) {
      logError('保存吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<SmokingRecord>> getAllSmokingRecords() async {
    try {
      // 优先返回本地数据
      final localRecords = await localDataSource.getAllSmokingRecords();

      // 如果有网络连接，尝试同步最新数据
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final request = SmokingRecordMapper.createHistoryRequest(
            limit: 100, // 获取最近100条记录
          );
          final response = await remoteDataSource!.getSmokingRecordHistory(
            request,
          );

          if (response.success && response.data != null) {
            final remoteRecords = SmokingRecordMapper.responseListToEntityList(
              response.data!,
            );

            // 合并远程数据到本地（简单策略：远程数据优先）
            for (final remoteRecord in remoteRecords) {
              await localDataSource.addSmokingRecord(remoteRecord);
            }

            logInfo(
              '已同步${remoteRecords.length}条吸烟记录',
              tag: 'SmokingRecordRepository',
            );

            // 返回更新后的本地数据
            return await localDataSource.getAllSmokingRecords();
          }
        } catch (e) {
          logWarning('同步吸烟记录失败: $e', tag: 'SmokingRecordRepository');
        }
      }

      return localRecords;
    } catch (e) {
      logError('获取所有吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForDate(DateTime date) async {
    try {
      // 优先从本地获取
      final localRecords = await localDataSource.getSmokingRecordsForDate(date);

      // 如果有网络连接，尝试从服务器获取当天的记录
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final startDate = DateTime(date.year, date.month, date.day);
          final endDate = DateTime(date.year, date.month, date.day, 23, 59, 59);

          final request = SmokingRecordMapper.createHistoryRequest(
            startDate: startDate,
            endDate: endDate,
            limit: 50,
          );
          final response = await remoteDataSource!.getSmokingRecordHistory(
            request,
          );

          if (response.success && response.data != null) {
            final remoteRecords = SmokingRecordMapper.responseListToEntityList(
              response.data!,
            );

            // 保存到本地缓存
            for (final record in remoteRecords) {
              await localDataSource.addSmokingRecord(record);
            }

            logInfo('从服务器获取并缓存当日吸烟记录', tag: 'SmokingRecordRepository');

            // 返回更新后的本地数据
            return await localDataSource.getSmokingRecordsForDate(date);
          }
        } catch (e) {
          logWarning('从服务器获取当日吸烟记录失败: $e', tag: 'SmokingRecordRepository');
        }
      }

      return localRecords;
    } catch (e) {
      logError('获取当日吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForMonth(DateTime month) async {
    try {
      // 优先从本地获取
      final localRecords = await localDataSource.getSmokingRecordsForMonth(
        month,
      );

      // 如果有网络连接，尝试从服务器获取当月的记录
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final startDate = DateTime(month.year, month.month, 1);
          final endDate = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

          final request = SmokingRecordMapper.createHistoryRequest(
            startDate: startDate,
            endDate: endDate,
            limit: 200, // 一个月最多200条记录
          );
          final response = await remoteDataSource!.getSmokingRecordHistory(
            request,
          );

          if (response.success && response.data != null) {
            final remoteRecords = SmokingRecordMapper.responseListToEntityList(
              response.data!,
            );

            // 保存到本地缓存
            for (final record in remoteRecords) {
              await localDataSource.addSmokingRecord(record);
            }

            logInfo('从服务器获取并缓存当月吸烟记录', tag: 'SmokingRecordRepository');

            // 返回更新后的本地数据
            return await localDataSource.getSmokingRecordsForMonth(month);
          }
        } catch (e) {
          logWarning('从服务器获取当月吸烟记录失败: $e', tag: 'SmokingRecordRepository');
        }
      }

      return localRecords;
    } catch (e) {
      logError('获取当月吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Stream<List<SmokingRecord>> watchAllSmokingRecords() {
    return localDataSource.watchAllSmokingRecords();
  }

  @override
  Future<void> deleteSmokingRecord(dynamic recordKey) async {
    try {
      // 先从本地删除
      await localDataSource.deleteSmokingRecord(recordKey);
      logInfo('吸烟记录已从本地删除', tag: 'SmokingRecordRepository');

      // TODO: 如果有远程数据源，需要同步删除操作到服务器
      // 这需要知道记录的服务器ID，可能需要在本地存储时保存映射关系
    } catch (e) {
      logError('删除吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<void> clearAllSmokingRecords() async {
    try {
      await localDataSource.clearAllSmokingRecords();
      logInfo('所有吸烟记录已清除', tag: 'SmokingRecordRepository');
    } catch (e) {
      logError('清除所有吸烟记录失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<Map<DateTime, int>> getSmokingCountsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      // 优先从本地获取
      final localCounts = await localDataSource.getSmokingCountsByDateRange(
        startDate,
        endDate,
      );

      // 如果有网络连接，尝试从服务器获取更准确的数据
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final response = await remoteDataSource!.getSmokingHeatmapData(
            year: startDate.year,
            month: startDate.month == endDate.month ? startDate.month : null,
          );

          if (response.success && response.data != null) {
            final remoteCounts = SmokingRecordMapper.heatmapResponseToMap(
              response.data!,
            );

            // 合并本地和远程数据
            final mergedCounts = <DateTime, int>{...localCounts};
            for (final entry in remoteCounts.entries) {
              if (entry.key.isAfter(
                    startDate.subtract(const Duration(days: 1)),
                  ) &&
                  entry.key.isBefore(endDate.add(const Duration(days: 1)))) {
                mergedCounts[entry.key] = entry.value;
              }
            }

            return mergedCounts;
          }
        } catch (e) {
          logWarning('从服务器获取吸烟统计失败: $e', tag: 'SmokingRecordRepository');
        }
      }

      return localCounts;
    } catch (e) {
      logError('获取吸烟统计失败', tag: 'SmokingRecordRepository', error: e);
      rethrow;
    }
  }

  // ==================== 新增方法：远程数据源专用 ====================

  /// 获取吸烟记录统计信息
  Future<Map<String, dynamic>?> getSmokingRecordStats() async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.getSmokingRecordStats();
      if (response.success && response.data != null) {
        return SmokingRecordMapper.statsResponseToMap(response.data!);
      }
    } catch (e) {
      logError('获取吸烟记录统计失败', tag: 'SmokingRecordRepository', error: e);
    }

    return null;
  }

  /// 获取触发因素统计
  Future<Map<String, int>?> getTriggerTagsStats({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.getTriggerTagsStats(
        startDate: startDate,
        endDate: endDate,
      );
      if (response.success && response.data != null) {
        return SmokingRecordMapper.triggerStatsResponseToMap(response.data!);
      }
    } catch (e) {
      logError('获取触发因素统计失败', tag: 'SmokingRecordRepository', error: e);
    }

    return null;
  }

  /// 获取吸烟趋势数据
  Future<List<Map<String, dynamic>>?> getSmokingTrends({
    required String period,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.getSmokingTrends(
        period: period,
        startDate: startDate,
        endDate: endDate,
      );
      if (response.success && response.data != null) {
        return SmokingRecordMapper.trendsResponseToList(response.data!);
      }
    } catch (e) {
      logError('获取吸烟趋势数据失败', tag: 'SmokingRecordRepository', error: e);
    }

    return null;
  }

  /// 检查今日吸烟状态
  Future<bool?> checkTodaySmokingStatus() async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.checkTodaySmokingStatus();
      if (response.success && response.data != null) {
        return response.data!;
      }
    } catch (e) {
      logError('检查今日吸烟状态失败', tag: 'SmokingRecordRepository', error: e);
    }

    return null;
  }

  /// 强制同步数据
  Future<bool> syncData() async {
    if (remoteDataSource == null || !await _isConnected()) {
      return false;
    }

    try {
      // 获取本地所有数据
      final localRecords = await localDataSource.getAllSmokingRecords();

      // 上传本地数据到服务器
      if (localRecords.isNotEmpty) {
        final requests = SmokingRecordMapper.entityListToCreateRequestList(
          localRecords,
        );
        await remoteDataSource!.batchCreateSmokingRecords(requests);
      }

      // 下载服务器数据
      final request = SmokingRecordMapper.createHistoryRequest(limit: 1000);
      final response = await remoteDataSource!.getSmokingRecordHistory(request);

      if (response.success && response.data != null) {
        final remoteRecords = SmokingRecordMapper.responseListToEntityList(
          response.data!,
        );

        // 更新本地数据
        for (final record in remoteRecords) {
          await localDataSource.addSmokingRecord(record);
        }

        logInfo('吸烟记录数据同步完成', tag: 'SmokingRecordRepository');
        return true;
      }
    } catch (e) {
      logError('吸烟记录数据同步失败', tag: 'SmokingRecordRepository', error: e);
    }

    return false;
  }
}
