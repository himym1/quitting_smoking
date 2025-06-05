/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 用户资料远程数据源 (UserProfileRemoteDataSource)
 * 功能：
 * 1. 定义用户资料相关的API接口
 * 2. 处理用户资料的CRUD操作
 * 3. 与Spring Boot后端API通信
 * 4. 提供统一的用户资料数据访问接口
 */

import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/user_profile_models.dart';

/// 用户资料远程数据源接口
/// 
/// 定义所有用户资料相关的API操作
abstract class UserProfileRemoteDataSource {
  
  // ==================== 用户资料操作 ====================
  
  /// 获取用户资料
  /// 
  /// 返回当前用户的资料信息
  Future<ApiResponseModel<UserProfileResponseModel>> getUserProfile();
  
  /// 更新用户资料
  /// 
  /// [request] 用户资料更新请求数据
  /// 返回更新后的用户资料
  Future<ApiResponseModel<UserProfileResponseModel>> updateUserProfile(
    UpdateUserProfileRequestModel request,
  );
  
  /// 删除用户资料
  /// 
  /// 删除当前用户的资料（注销账户）
  Future<ApiResponseModel<String>> deleteUserProfile();
  
  // ==================== 统计数据操作 ====================
  
  /// 获取用户统计信息
  /// 
  /// 返回用户的戒烟统计数据
  Future<ApiResponseModel<UserStatsResponseModel>> getUserStats();
  
  /// 刷新用户统计信息
  /// 
  /// 触发服务器重新计算用户统计数据
  Future<ApiResponseModel<UserStatsResponseModel>> refreshUserStats();
  
  // ==================== 用户设置操作 ====================
  
  /// 获取用户设置
  /// 
  /// 返回用户的个人设置
  Future<ApiResponseModel<UserSettingsModel>> getUserSettings();
  
  /// 更新用户设置
  /// 
  /// [settings] 用户设置数据
  /// 返回更新后的设置
  Future<ApiResponseModel<UserSettingsModel>> updateUserSettings(
    UserSettingsModel settings,
  );
  
  /// 重置用户设置
  /// 
  /// 将用户设置重置为默认值
  Future<ApiResponseModel<UserSettingsModel>> resetUserSettings();
  
  // ==================== 数据同步操作 ====================
  
  /// 获取同步状态
  /// 
  /// 返回当前的数据同步状态
  Future<ApiResponseModel<SyncStatusModel>> getSyncStatus();
  
  /// 触发数据同步
  /// 
  /// [dataTypes] 需要同步的数据类型列表
  /// 返回同步操作的状态
  Future<ApiResponseModel<SyncStatusModel>> triggerSync({
    List<String>? dataTypes,
  });
  
  /// 上传本地数据
  /// 
  /// [data] 本地数据的JSON表示
  /// [dataType] 数据类型标识
  /// 返回上传结果
  Future<ApiResponseModel<String>> uploadLocalData({
    required Map<String, dynamic> data,
    required String dataType,
  });
  
  /// 下载远程数据
  /// 
  /// [dataType] 数据类型标识
  /// [lastSyncTime] 上次同步时间（增量同步）
  /// 返回远程数据
  Future<ApiResponseModel<Map<String, dynamic>>> downloadRemoteData({
    required String dataType,
    DateTime? lastSyncTime,
  });
  
  // ==================== 数据导出操作 ====================
  
  /// 导出用户数据
  /// 
  /// [format] 导出格式 ('json', 'csv', 'pdf')
  /// [dataTypes] 要导出的数据类型
  /// 返回导出文件的下载链接或数据
  Future<ApiResponseModel<Map<String, dynamic>>> exportUserData({
    String format = 'json',
    List<String>? dataTypes,
  });
  
  /// 导入用户数据
  /// 
  /// [data] 要导入的数据
  /// [format] 数据格式
  /// [mergeStrategy] 合并策略 ('replace', 'merge', 'skip')
  /// 返回导入结果
  Future<ApiResponseModel<String>> importUserData({
    required Map<String, dynamic> data,
    String format = 'json',
    String mergeStrategy = 'merge',
  });
  
  // ==================== 数据备份操作 ====================
  
  /// 创建数据备份
  /// 
  /// 创建用户数据的完整备份
  Future<ApiResponseModel<String>> createBackup();
  
  /// 获取备份列表
  /// 
  /// 返回用户的所有数据备份
  Future<ApiResponseModel<List<Map<String, dynamic>>>> getBackupList();
  
  /// 恢复数据备份
  /// 
  /// [backupId] 备份ID
  /// [restoreTypes] 要恢复的数据类型
  /// 返回恢复结果
  Future<ApiResponseModel<String>> restoreBackup({
    required String backupId,
    List<String>? restoreTypes,
  });
  
  /// 删除数据备份
  /// 
  /// [backupId] 备份ID
  /// 返回删除结果
  Future<ApiResponseModel<String>> deleteBackup(String backupId);
}
