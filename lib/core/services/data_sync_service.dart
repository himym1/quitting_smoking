/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 数据同步服务 (DataSyncService)
 * 功能：
 * 1. 管理本地和远程数据的同步
 * 2. 处理数据冲突和合并策略
 * 3. 支持增量同步和全量同步
 * 4. 提供离线优先的数据访问
 */

import 'dart:async';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/domain/repositories/user_profile_repository.dart';
import 'package:quitting_smoking/data/datasources/remote/user_profile_remote_datasource.dart';
import 'package:quitting_smoking/data/mappers/user_profile_mapper.dart';
import 'package:quitting_smoking/data/models/user_profile_models.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';

/// 数据同步服务
/// 
/// 提供本地和远程数据的双向同步功能
class DataSyncService {
  final UserProfileRepository _localRepository;
  final UserProfileRemoteDataSource _remoteDataSource;
  
  /// 同步状态流控制器
  final StreamController<SyncStatusModel> _syncStatusController = 
      StreamController<SyncStatusModel>.broadcast();
  
  /// 当前同步状态
  SyncStatusModel _currentSyncStatus = const SyncStatusModel();
  
  /// 构造函数
  DataSyncService({
    required UserProfileRepository localRepository,
    required UserProfileRemoteDataSource remoteDataSource,
  }) : _localRepository = localRepository,
       _remoteDataSource = remoteDataSource;
  
  /// 同步状态流
  Stream<SyncStatusModel> get syncStatusStream => _syncStatusController.stream;
  
  /// 当前同步状态
  SyncStatusModel get currentSyncStatus => _currentSyncStatus;
  
  // ==================== 同步操作 ====================
  
  /// 执行完整数据同步
  /// 
  /// [forceSync] 是否强制同步（忽略时间间隔）
  /// [dataTypes] 指定要同步的数据类型
  Future<SyncResult> performFullSync({
    bool forceSync = false,
    List<String>? dataTypes,
  }) async {
    try {
      logInfo('开始执行完整数据同步', tag: 'DataSyncService');
      
      _updateSyncStatus(SyncState.syncing);
      
      final results = <String, bool>{};
      final errors = <String, String>{};
      
      // 同步用户资料
      if (dataTypes == null || dataTypes.contains('userProfile')) {
        try {
          await _syncUserProfile();
          results['userProfile'] = true;
          logInfo('用户资料同步成功', tag: 'DataSyncService');
        } catch (e) {
          results['userProfile'] = false;
          errors['userProfile'] = e.toString();
          logError('用户资料同步失败', tag: 'DataSyncService', error: e);
        }
      }
      
      // 同步用户设置
      if (dataTypes == null || dataTypes.contains('userSettings')) {
        try {
          await _syncUserSettings();
          results['userSettings'] = true;
          logInfo('用户设置同步成功', tag: 'DataSyncService');
        } catch (e) {
          results['userSettings'] = false;
          errors['userSettings'] = e.toString();
          logError('用户设置同步失败', tag: 'DataSyncService', error: e);
        }
      }
      
      // 确定最终同步状态
      final hasErrors = errors.isNotEmpty;
      final hasSuccess = results.values.any((success) => success);
      
      SyncState finalState;
      if (!hasErrors) {
        finalState = SyncState.success;
      } else if (hasSuccess) {
        finalState = SyncState.partial;
      } else {
        finalState = SyncState.error;
      }
      
      _updateSyncStatus(finalState, errorMessage: errors.values.join('; '));
      
      logInfo('完整数据同步完成: $finalState', tag: 'DataSyncService');
      
      return SyncResult(
        success: !hasErrors,
        syncedDataTypes: results.keys.where((key) => results[key]!).toList(),
        failedDataTypes: results.keys.where((key) => !results[key]!).toList(),
        errors: errors,
      );
      
    } catch (e) {
      logError('完整数据同步失败', tag: 'DataSyncService', error: e);
      _updateSyncStatus(SyncState.error, errorMessage: e.toString());
      
      return SyncResult(
        success: false,
        syncedDataTypes: [],
        failedDataTypes: dataTypes ?? ['all'],
        errors: {'general': e.toString()},
      );
    }
  }
  
  /// 执行增量数据同步
  /// 
  /// 只同步自上次同步以来发生变化的数据
  Future<SyncResult> performIncrementalSync() async {
    try {
      logInfo('开始执行增量数据同步', tag: 'DataSyncService');
      
      final lastSyncTime = _currentSyncStatus.lastSyncTime;
      if (lastSyncTime == null) {
        logInfo('无上次同步时间，执行完整同步', tag: 'DataSyncService');
        return await performFullSync();
      }
      
      _updateSyncStatus(SyncState.syncing);
      
      // 检查远程数据是否有更新
      final remoteChanges = await _checkRemoteChanges(lastSyncTime);
      
      if (remoteChanges.isEmpty) {
        logInfo('远程数据无变化，同步完成', tag: 'DataSyncService');
        _updateSyncStatus(SyncState.success);
        
        return SyncResult(
          success: true,
          syncedDataTypes: [],
          failedDataTypes: [],
          errors: {},
        );
      }
      
      // 同步有变化的数据类型
      return await performFullSync(dataTypes: remoteChanges);
      
    } catch (e) {
      logError('增量数据同步失败', tag: 'DataSyncService', error: e);
      _updateSyncStatus(SyncState.error, errorMessage: e.toString());
      
      return SyncResult(
        success: false,
        syncedDataTypes: [],
        failedDataTypes: ['incremental'],
        errors: {'incremental': e.toString()},
      );
    }
  }
  
  /// 上传本地数据到服务器
  /// 
  /// [dataType] 数据类型
  /// [data] 要上传的数据
  Future<bool> uploadLocalData(String dataType, Map<String, dynamic> data) async {
    try {
      logInfo('上传本地数据: $dataType', tag: 'DataSyncService');
      
      final response = await _remoteDataSource.uploadLocalData(
        data: data,
        dataType: dataType,
      );
      
      if (response.isSuccess) {
        logInfo('本地数据上传成功: $dataType', tag: 'DataSyncService');
        return true;
      } else {
        logWarning('本地数据上传失败: ${response.errorMessage}', tag: 'DataSyncService');
        return false;
      }
    } catch (e) {
      logError('本地数据上传异常: $dataType', tag: 'DataSyncService', error: e);
      return false;
    }
  }
  
  /// 从服务器下载数据
  /// 
  /// [dataType] 数据类型
  /// [lastSyncTime] 上次同步时间（用于增量下载）
  Future<Map<String, dynamic>?> downloadRemoteData(
    String dataType, {
    DateTime? lastSyncTime,
  }) async {
    try {
      logInfo('下载远程数据: $dataType', tag: 'DataSyncService');
      
      final response = await _remoteDataSource.downloadRemoteData(
        dataType: dataType,
        lastSyncTime: lastSyncTime,
      );
      
      if (response.isSuccess) {
        logInfo('远程数据下载成功: $dataType', tag: 'DataSyncService');
        return response.data;
      } else {
        logWarning('远程数据下载失败: ${response.errorMessage}', tag: 'DataSyncService');
        return null;
      }
    } catch (e) {
      logError('远程数据下载异常: $dataType', tag: 'DataSyncService', error: e);
      return null;
    }
  }
  
  // ==================== 私有同步方法 ====================
  
  /// 同步用户资料
  Future<void> _syncUserProfile() async {
    // 获取本地用户资料
    final localProfile = await _localRepository.getUserProfile();
    
    try {
      // 获取远程用户资料
      final remoteResponse = await _remoteDataSource.getUserProfile();
      
      if (remoteResponse.isSuccess && remoteResponse.data != null) {
        final remoteProfile = UserProfileMapper.userProfileFromResponse(
          remoteResponse.data!,
        );
        
        // 检查是否需要同步
        if (localProfile == null) {
          // 本地无数据，直接保存远程数据
          await _localRepository.saveUserProfile(remoteProfile);
          logInfo('保存远程用户资料到本地', tag: 'DataSyncService');
        } else if (UserProfileMapper.needsSync(localProfile, remoteResponse.data!)) {
          // 解决数据冲突
          final mergedProfile = UserProfileMapper.resolveUserProfileConflict(
            localProfile,
            remoteResponse.data!,
          );
          
          // 保存合并后的数据到本地
          await _localRepository.saveUserProfile(mergedProfile);
          
          // 上传合并后的数据到服务器
          final updateRequest = UserProfileMapper.userProfileToUpdateRequest(mergedProfile);
          await _remoteDataSource.updateUserProfile(updateRequest);
          
          logInfo('解决用户资料冲突并同步', tag: 'DataSyncService');
        }
      } else if (localProfile != null) {
        // 远程无数据或获取失败，上传本地数据
        final updateRequest = UserProfileMapper.userProfileToUpdateRequest(localProfile);
        await _remoteDataSource.updateUserProfile(updateRequest);
        logInfo('上传本地用户资料到服务器', tag: 'DataSyncService');
      }
    } catch (e) {
      if (e is NetworkException && localProfile != null) {
        // 网络错误但有本地数据，标记为待同步
        logWarning('网络错误，用户资料将在下次同步', tag: 'DataSyncService');
        _addPendingDataType('userProfile');
      } else {
        rethrow;
      }
    }
  }
  
  /// 同步用户设置
  Future<void> _syncUserSettings() async {
    try {
      // 获取远程用户设置
      final remoteResponse = await _remoteDataSource.getUserSettings();
      
      if (remoteResponse.isSuccess && remoteResponse.data != null) {
        // TODO: 实现用户设置的本地存储和同步逻辑
        logInfo('用户设置同步成功（待实现本地存储）', tag: 'DataSyncService');
      }
    } catch (e) {
      logWarning('用户设置同步失败，将在下次重试', tag: 'DataSyncService');
      _addPendingDataType('userSettings');
      rethrow;
    }
  }
  
  /// 检查远程数据变化
  Future<List<String>> _checkRemoteChanges(DateTime lastSyncTime) async {
    final changedDataTypes = <String>[];
    
    try {
      // 检查同步状态
      final syncStatusResponse = await _remoteDataSource.getSyncStatus();
      
      if (syncStatusResponse.isSuccess && syncStatusResponse.data != null) {
        final remoteStatus = syncStatusResponse.data!;
        
        // 如果远程最后同步时间晚于本地，说明有变化
        if (remoteStatus.lastSyncTime != null && 
            remoteStatus.lastSyncTime!.isAfter(lastSyncTime)) {
          changedDataTypes.addAll(remoteStatus.pendingDataTypes);
        }
      }
    } catch (e) {
      logWarning('检查远程变化失败，执行完整同步', tag: 'DataSyncService');
      // 检查失败时，假设所有数据都有变化
      changedDataTypes.addAll(['userProfile', 'userSettings']);
    }
    
    return changedDataTypes;
  }
  
  // ==================== 状态管理 ====================
  
  /// 更新同步状态
  void _updateSyncStatus(SyncState state, {String? errorMessage}) {
    _currentSyncStatus = UserProfileMapper.updateSyncStatus(
      _currentSyncStatus,
      state,
      errorMessage: errorMessage,
    );
    
    _syncStatusController.add(_currentSyncStatus);
  }
  
  /// 添加待同步数据类型
  void _addPendingDataType(String dataType) {
    final pendingTypes = List<String>.from(_currentSyncStatus.pendingDataTypes);
    if (!pendingTypes.contains(dataType)) {
      pendingTypes.add(dataType);
      
      _currentSyncStatus = _currentSyncStatus.copyWith(
        pendingDataTypes: pendingTypes,
      );
      
      _syncStatusController.add(_currentSyncStatus);
    }
  }
  
  /// 释放资源
  void dispose() {
    _syncStatusController.close();
  }
}

/// 同步结果
class SyncResult {
  /// 是否成功
  final bool success;
  
  /// 成功同步的数据类型
  final List<String> syncedDataTypes;
  
  /// 同步失败的数据类型
  final List<String> failedDataTypes;
  
  /// 错误信息
  final Map<String, String> errors;
  
  const SyncResult({
    required this.success,
    required this.syncedDataTypes,
    required this.failedDataTypes,
    required this.errors,
  });
  
  @override
  String toString() {
    return 'SyncResult(success: $success, synced: $syncedDataTypes, failed: $failedDataTypes)';
  }
}
