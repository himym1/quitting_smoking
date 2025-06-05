/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 数据同步Provider (DataSyncProvider)
 * 功能：
 * 1. 管理数据同步状态
 * 2. 提供同步操作的业务逻辑
 * 3. 监听网络状态变化
 * 4. 自动触发同步操作
 */

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/core/services/data_sync_service.dart';
import 'package:quitting_smoking/core/providers/network_providers.dart';
import 'package:quitting_smoking/data/repositories_impl/user_profile_repository_impl.dart';
import 'package:quitting_smoking/data/models/user_profile_models.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

// ==================== 数据同步服务 Provider ====================

/// 数据同步服务 Provider
final dataSyncServiceProvider = Provider<DataSyncService>((ref) {
  final localRepository = ref.watch(userProfileRepositoryProvider);
  final remoteDataSource = ref.watch(userProfileRemoteDataSourceProvider);

  return DataSyncService(
    localRepository: localRepository,
    remoteDataSource: remoteDataSource,
  );
});

/// 同步状态流 Provider
final syncStatusStreamProvider = StreamProvider<SyncStatusModel>((ref) {
  final syncService = ref.watch(dataSyncServiceProvider);
  return syncService.syncStatusStream;
});

/// 当前同步状态 Provider
final currentSyncStatusProvider = Provider<SyncStatusModel>((ref) {
  final syncService = ref.watch(dataSyncServiceProvider);
  return syncService.currentSyncStatus;
});

// ==================== 数据同步通知器 ====================

/// 数据同步通知器
///
/// 管理数据同步的状态和操作
class DataSyncNotifier extends StateNotifier<DataSyncState> {
  final DataSyncService _syncService;
  final Ref _ref;

  /// 网络状态监听订阅
  StreamSubscription<NetworkState>? _networkSubscription;

  /// 同步状态监听订阅
  StreamSubscription<SyncStatusModel>? _syncStatusSubscription;

  /// 自动同步定时器
  Timer? _autoSyncTimer;

  DataSyncNotifier(this._syncService, this._ref)
    : super(const DataSyncState.idle()) {
    _initializeSync();
  }

  /// 初始化同步
  void _initializeSync() {
    // 监听网络状态变化
    _networkSubscription = _ref
        .read(networkStateProvider.notifier)
        .stream
        .listen((networkState) {
          _handleNetworkStateChange(null, networkState);
        });

    // 监听同步状态变化
    _syncStatusSubscription = _syncService.syncStatusStream.listen(
      _handleSyncStatusChange,
    );

    // 启动自动同步
    _startAutoSync();
  }

  /// 执行手动同步
  Future<void> performManualSync({
    bool forceSync = false,
    List<String>? dataTypes,
  }) async {
    try {
      logInfo('开始手动同步', tag: 'DataSyncNotifier');
      state = const DataSyncState.syncing();

      final result = await _syncService.performFullSync(
        forceSync: forceSync,
        dataTypes: dataTypes,
      );

      if (result.success) {
        state = DataSyncState.success(
          syncedDataTypes: result.syncedDataTypes,
          lastSyncTime: DateTime.now(),
        );
        logInfo('手动同步成功', tag: 'DataSyncNotifier');
      } else {
        state = DataSyncState.error(
          errorMessage: result.errors.values.join('; '),
          failedDataTypes: result.failedDataTypes,
        );
        logError('手动同步失败', tag: 'DataSyncNotifier');
      }
    } catch (e) {
      state = DataSyncState.error(
        errorMessage: e.toString(),
        failedDataTypes: dataTypes ?? ['all'],
      );
      logError('手动同步异常', tag: 'DataSyncNotifier', error: e);
    }
  }

  /// 执行增量同步
  Future<void> performIncrementalSync() async {
    try {
      logInfo('开始增量同步', tag: 'DataSyncNotifier');
      state = const DataSyncState.syncing();

      final result = await _syncService.performIncrementalSync();

      if (result.success) {
        if (result.syncedDataTypes.isEmpty) {
          state = DataSyncState.upToDate(lastSyncTime: DateTime.now());
          logInfo('数据已是最新，无需同步', tag: 'DataSyncNotifier');
        } else {
          state = DataSyncState.success(
            syncedDataTypes: result.syncedDataTypes,
            lastSyncTime: DateTime.now(),
          );
          logInfo('增量同步成功', tag: 'DataSyncNotifier');
        }
      } else {
        state = DataSyncState.error(
          errorMessage: result.errors.values.join('; '),
          failedDataTypes: result.failedDataTypes,
        );
        logError('增量同步失败', tag: 'DataSyncNotifier');
      }
    } catch (e) {
      state = DataSyncState.error(
        errorMessage: e.toString(),
        failedDataTypes: ['incremental'],
      );
      logError('增量同步异常', tag: 'DataSyncNotifier', error: e);
    }
  }

  /// 重试同步
  Future<void> retrySync() async {
    final currentState = state;
    if (currentState is DataSyncError) {
      await performManualSync(dataTypes: currentState.failedDataTypes);
    } else {
      await performIncrementalSync();
    }
  }

  /// 取消同步
  void cancelSync() {
    // TODO: 实现同步取消逻辑
    state = const DataSyncState.idle();
    logInfo('同步已取消', tag: 'DataSyncNotifier');
  }

  /// 处理网络状态变化
  void _handleNetworkStateChange(NetworkState? previous, NetworkState current) {
    if (previous != null && previous.isDisconnected && current.isConnected) {
      // 网络重新连接，触发同步
      logInfo('网络重新连接，触发自动同步', tag: 'DataSyncNotifier');
      Future.delayed(const Duration(seconds: 2), () {
        performIncrementalSync();
      });
    }
  }

  /// 处理同步状态变化
  void _handleSyncStatusChange(SyncStatusModel syncStatus) {
    // 根据同步服务的状态更新UI状态
    switch (syncStatus.state) {
      case SyncState.syncing:
        if (state is! DataSyncSyncing) {
          state = const DataSyncState.syncing();
        }
        break;
      case SyncState.success:
        state = DataSyncState.success(
          syncedDataTypes: [],
          lastSyncTime: syncStatus.lastSyncTime ?? DateTime.now(),
        );
        break;
      case SyncState.error:
        state = DataSyncState.error(
          errorMessage: syncStatus.errorMessage ?? '同步失败',
          failedDataTypes: syncStatus.pendingDataTypes,
        );
        break;
      case SyncState.partial:
        state = DataSyncState.partial(
          syncedDataTypes: [],
          failedDataTypes: syncStatus.pendingDataTypes,
          lastSyncTime: syncStatus.lastSyncTime ?? DateTime.now(),
        );
        break;
      case SyncState.idle:
        if (state is DataSyncSyncing) {
          state = const DataSyncState.idle();
        }
        break;
    }
  }

  /// 启动自动同步
  void _startAutoSync() {
    _autoSyncTimer?.cancel();

    // 每30分钟执行一次增量同步
    _autoSyncTimer = Timer.periodic(const Duration(minutes: 30), (timer) {
      final networkState = _ref.read(networkStateProvider);
      if (networkState.isConnected && state is! DataSyncSyncing) {
        logInfo('执行定时自动同步', tag: 'DataSyncNotifier');
        performIncrementalSync();
      }
    });
  }

  @override
  void dispose() {
    _networkSubscription?.cancel();
    _syncStatusSubscription?.cancel();
    _autoSyncTimer?.cancel();
    super.dispose();
  }
}

/// 数据同步状态 Provider
final dataSyncProvider = StateNotifierProvider<DataSyncNotifier, DataSyncState>(
  (ref) {
    final syncService = ref.watch(dataSyncServiceProvider);
    return DataSyncNotifier(syncService, ref);
  },
);

// ==================== 数据同步状态数据模型 ====================

/// 数据同步状态
sealed class DataSyncState {
  const DataSyncState();

  const factory DataSyncState.idle() = DataSyncIdle;
  const factory DataSyncState.syncing() = DataSyncSyncing;
  const factory DataSyncState.success({
    required List<String> syncedDataTypes,
    required DateTime lastSyncTime,
  }) = DataSyncSuccess;
  const factory DataSyncState.error({
    required String errorMessage,
    required List<String> failedDataTypes,
  }) = DataSyncError;
  const factory DataSyncState.partial({
    required List<String> syncedDataTypes,
    required List<String> failedDataTypes,
    required DateTime lastSyncTime,
  }) = DataSyncPartial;
  const factory DataSyncState.upToDate({required DateTime lastSyncTime}) =
      DataSyncUpToDate;
}

/// 空闲状态
class DataSyncIdle extends DataSyncState {
  const DataSyncIdle();
}

/// 同步中状态
class DataSyncSyncing extends DataSyncState {
  const DataSyncSyncing();
}

/// 同步成功状态
class DataSyncSuccess extends DataSyncState {
  final List<String> syncedDataTypes;
  final DateTime lastSyncTime;

  const DataSyncSuccess({
    required this.syncedDataTypes,
    required this.lastSyncTime,
  });
}

/// 同步错误状态
class DataSyncError extends DataSyncState {
  final String errorMessage;
  final List<String> failedDataTypes;

  const DataSyncError({
    required this.errorMessage,
    required this.failedDataTypes,
  });
}

/// 部分同步状态
class DataSyncPartial extends DataSyncState {
  final List<String> syncedDataTypes;
  final List<String> failedDataTypes;
  final DateTime lastSyncTime;

  const DataSyncPartial({
    required this.syncedDataTypes,
    required this.failedDataTypes,
    required this.lastSyncTime,
  });
}

/// 数据已是最新状态
class DataSyncUpToDate extends DataSyncState {
  final DateTime lastSyncTime;

  const DataSyncUpToDate({required this.lastSyncTime});
}

// ==================== 数据同步状态扩展方法 ====================

extension DataSyncStateExtension on DataSyncState {
  /// 是否正在同步
  bool get isSyncing => this is DataSyncSyncing;

  /// 是否有错误
  bool get hasError => this is DataSyncError;

  /// 是否成功
  bool get isSuccess => this is DataSyncSuccess || this is DataSyncUpToDate;

  /// 是否部分成功
  bool get isPartial => this is DataSyncPartial;

  /// 获取错误消息
  String? get errorMessage {
    return switch (this) {
      DataSyncError(errorMessage: final msg) => msg,
      _ => null,
    };
  }

  /// 获取最后同步时间
  DateTime? get lastSyncTime {
    return switch (this) {
      DataSyncSuccess(lastSyncTime: final time) => time,
      DataSyncPartial(lastSyncTime: final time) => time,
      DataSyncUpToDate(lastSyncTime: final time) => time,
      _ => null,
    };
  }
}
