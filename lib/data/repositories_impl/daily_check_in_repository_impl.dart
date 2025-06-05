import 'package:quitting_smoking/data/datasources/local/daily_check_in_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/daily_check_in_remote_datasource.dart';
import 'package:quitting_smoking/data/mappers/daily_check_in_mapper.dart';
import 'package:quitting_smoking/data/models/daily_check_in_models.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/domain/repositories/daily_check_in_repository.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DailyCheckInRepositoryImpl implements DailyCheckInRepository {
  final DailyCheckInLocalDataSource localDataSource;
  final DailyCheckInRemoteDataSource? remoteDataSource;
  final Connectivity _connectivity;

  DailyCheckInRepositoryImpl({
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
  Future<void> addCheckIn(DailyCheckIn checkIn) async {
    try {
      // 验证数据
      if (!DailyCheckInMapper.validateEntity(checkIn)) {
        throw ArgumentError('Invalid check-in data');
      }

      // 先保存到本地
      await localDataSource.addCheckIn(checkIn);
      logInfo('打卡记录已保存到本地: ${checkIn.date}', tag: 'DailyCheckInRepository');

      // 如果有网络连接且有远程数据源，同步到服务器
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final request = DailyCheckInMapper.entityToCreateRequest(checkIn);
          final response = await remoteDataSource!.createCheckIn(request);

          if (response.success && response.data != null) {
            // 更新本地数据以包含服务器返回的信息
            final updatedCheckIn = DailyCheckInMapper.responseToEntity(
              response.data!,
            );
            await localDataSource.addCheckIn(updatedCheckIn);
            logInfo('打卡记录已同步到服务器', tag: 'DailyCheckInRepository');
          }
        } catch (e) {
          logWarning(
            '同步打卡记录到服务器失败，将在网络恢复时重试: $e',
            tag: 'DailyCheckInRepository',
          );
          // 不抛出异常，因为本地保存已成功
        }
      }
    } catch (e) {
      logError('保存打卡记录失败', tag: 'DailyCheckInRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<DailyCheckIn?> getCheckInForDate(DateTime date) async {
    try {
      // 优先从本地获取
      final localCheckIn = await localDataSource.getCheckInForDate(date);

      // 如果本地没有且有网络连接，尝试从服务器获取
      if (localCheckIn == null &&
          remoteDataSource != null &&
          await _isConnected()) {
        try {
          final response = await remoteDataSource!.getCheckInForDate(date);
          if (response.success && response.data != null) {
            final remoteCheckIn = DailyCheckInMapper.responseToEntity(
              response.data!,
            );
            // 保存到本地缓存
            await localDataSource.addCheckIn(remoteCheckIn);
            logInfo('从服务器获取打卡记录并缓存到本地', tag: 'DailyCheckInRepository');
            return remoteCheckIn;
          }
        } catch (e) {
          logWarning('从服务器获取打卡记录失败: $e', tag: 'DailyCheckInRepository');
        }
      }

      return localCheckIn;
    } catch (e) {
      logError('获取打卡记录失败', tag: 'DailyCheckInRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<List<DailyCheckIn>> getAllCheckIns() async {
    try {
      // 优先返回本地数据
      final localCheckIns = await localDataSource.getAllCheckIns();

      // 如果有网络连接，尝试同步最新数据
      if (remoteDataSource != null && await _isConnected()) {
        try {
          final request = DailyCheckInMapper.entityToHistoryRequest(
            limit: 100, // 获取最近100条记录
          );
          final response = await remoteDataSource!.getCheckInHistory(request);

          if (response.success && response.data != null) {
            final remoteCheckIns = DailyCheckInMapper.responseListToEntityList(
              response.data!,
            );

            // 合并远程数据到本地（简单策略：远程数据优先）
            for (final remoteCheckIn in remoteCheckIns) {
              await localDataSource.addCheckIn(remoteCheckIn);
            }

            logInfo(
              '已同步${remoteCheckIns.length}条打卡记录',
              tag: 'DailyCheckInRepository',
            );

            // 返回更新后的本地数据
            return await localDataSource.getAllCheckIns();
          }
        } catch (e) {
          logWarning('同步打卡记录失败: $e', tag: 'DailyCheckInRepository');
        }
      }

      return localCheckIns;
    } catch (e) {
      logError('获取所有打卡记录失败', tag: 'DailyCheckInRepository', error: e);
      rethrow;
    }
  }

  @override
  Stream<List<DailyCheckIn>> watchAllCheckIns() {
    return localDataSource.watchAllCheckIns();
  }

  @override
  Stream<DailyCheckIn?> watchCheckInForDate(DateTime date) {
    return localDataSource.watchCheckInForDate(date);
  }

  // ==================== 新增方法：远程数据源专用 ====================

  /// 获取打卡统计信息
  Future<Map<String, dynamic>?> getCheckInStats() async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.getCheckInStats();
      if (response.success && response.data != null) {
        return DailyCheckInMapper.statsResponseToMap(response.data!);
      }
    } catch (e) {
      logError('获取打卡统计失败', tag: 'DailyCheckInRepository', error: e);
    }

    return null;
  }

  /// 获取打卡日历数据
  Future<Map<DateTime, bool>?> getCheckInCalendar(int year, int month) async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.getCheckInCalendar(year, month);
      if (response.success && response.data != null) {
        return DailyCheckInMapper.calendarResponseToMap(response.data!);
      }
    } catch (e) {
      logError('获取打卡日历数据失败', tag: 'DailyCheckInRepository', error: e);
    }

    return null;
  }

  /// 检查今日打卡状态
  Future<bool?> checkTodayCheckInStatus() async {
    if (remoteDataSource == null || !await _isConnected()) {
      return null;
    }

    try {
      final response = await remoteDataSource!.checkTodayCheckInStatus();
      if (response.success && response.data != null) {
        return response.data!;
      }
    } catch (e) {
      logError('检查今日打卡状态失败', tag: 'DailyCheckInRepository', error: e);
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
      final localCheckIns = await localDataSource.getAllCheckIns();

      // 上传本地数据到服务器
      if (localCheckIns.isNotEmpty) {
        final requests = DailyCheckInMapper.entityListToCreateRequestList(
          localCheckIns,
        );
        await remoteDataSource!.batchCreateCheckIns(requests);
      }

      // 下载服务器数据
      final request = DailyCheckInMapper.entityToHistoryRequest(limit: 1000);
      final response = await remoteDataSource!.getCheckInHistory(request);

      if (response.success && response.data != null) {
        final remoteCheckIns = DailyCheckInMapper.responseListToEntityList(
          response.data!,
        );

        // 更新本地数据
        for (final checkIn in remoteCheckIns) {
          await localDataSource.addCheckIn(checkIn);
        }

        logInfo('数据同步完成', tag: 'DailyCheckInRepository');
        return true;
      }
    } catch (e) {
      logError('数据同步失败', tag: 'DailyCheckInRepository', error: e);
    }

    return false;
  }
}
