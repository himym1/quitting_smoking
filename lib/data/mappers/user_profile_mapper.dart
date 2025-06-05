/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 用户资料数据映射器 (UserProfileMapper)
 * 功能：
 * 1. 处理Flutter实体与用户资料API模型之间的转换
 * 2. 解决字段名和数据类型差异
 * 3. 提供双向转换方法
 * 4. 确保数据一致性
 */

import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/data/models/user_profile_models.dart';

/// 用户资料数据映射器
/// 
/// 负责Flutter实体和API模型之间的数据转换
class UserProfileMapper {
  
  // ==================== UserProfile 转换 ====================
  
  /// 将UserProfile实体转换为UpdateUserProfileRequest模型
  /// 
  /// 处理字段名差异：
  /// - quitDateTime -> quitDate
  /// - dailyCigarettes -> cigarettesPerDay
  /// - packPrice -> cigarettePrice
  static UpdateUserProfileRequestModel userProfileToUpdateRequest(
    UserProfile userProfile,
  ) {
    return UpdateUserProfileRequestModel(
      quitDate: userProfile.quitDateTime,
      quitReason: userProfile.quitReason,
      cigarettesPerDay: userProfile.dailyCigarettes,
      cigarettePrice: userProfile.packPrice,
      smokingYears: userProfile.smokingYears,
      currency: 'CNY',
      timezone: 'Asia/Shanghai',
      locale: 'zh-CN',
    );
  }
  
  /// 将UserProfileResponse模型转换为UserProfile实体
  /// 
  /// 处理字段名差异和数据类型转换
  static UserProfile userProfileFromResponse(
    UserProfileResponseModel response, {
    bool onboardingCompleted = true,
  }) {
    return UserProfile(
      userId: response.userId,
      quitDateTime: response.quitDate,
      quitReason: response.quitReason,
      dailyCigarettes: response.cigarettesPerDay,
      packPrice: response.cigarettePrice,
      smokingYears: response.smokingYears,
      onboardingCompleted: onboardingCompleted,
    );
  }
  
  /// 更新UserProfile实体的部分字段
  /// 
  /// 用于从API响应更新本地实体
  static UserProfile updateUserProfileFromResponse(
    UserProfile original,
    UserProfileResponseModel response,
  ) {
    return original.copyWith(
      quitDateTime: response.quitDate ?? original.quitDateTime,
      quitReason: response.quitReason ?? original.quitReason,
      dailyCigarettes: response.cigarettesPerDay ?? original.dailyCigarettes,
      packPrice: response.cigarettePrice ?? original.packPrice,
      smokingYears: response.smokingYears ?? original.smokingYears,
    );
  }
  
  // ==================== 数据验证 ====================
  
  /// 验证用户资料数据的完整性
  static bool isUserProfileComplete(UserProfile userProfile) {
    return userProfile.quitDateTime != null &&
           userProfile.dailyCigarettes != null &&
           userProfile.packPrice != null &&
           userProfile.quitReason != null &&
           userProfile.quitReason!.isNotEmpty;
  }
  
  /// 验证API模型数据的有效性
  static bool isUserProfileResponseValid(UserProfileResponseModel response) {
    return response.quitDate != null &&
           response.cigarettesPerDay != null &&
           response.cigarettesPerDay! > 0 &&
           response.cigarettePrice != null &&
           response.cigarettePrice! > 0;
  }
  
  // ==================== 统计数据转换 ====================
  
  /// 计算本地统计数据
  /// 
  /// 基于用户资料计算戒烟统计信息
  static Map<String, dynamic> calculateLocalStats(UserProfile userProfile) {
    if (userProfile.quitDateTime == null) {
      return {
        'quitDays': 0,
        'moneySaved': 0.0,
        'cigarettesNotSmoked': 0,
        'calculatedAt': DateTime.now(),
      };
    }
    
    final now = DateTime.now();
    final quitDuration = now.difference(userProfile.quitDateTime!);
    final quitDays = quitDuration.inDays;
    
    final dailyCigarettes = userProfile.dailyCigarettes ?? 0;
    final packPrice = userProfile.packPrice ?? 0.0;
    final cigarettesPerPack = 20; // 假设每包20支
    
    final dailyCost = (dailyCigarettes / cigarettesPerPack) * packPrice;
    final moneySaved = dailyCost * quitDays;
    final cigarettesNotSmoked = dailyCigarettes * quitDays;
    
    return {
      'quitDays': quitDays,
      'moneySaved': moneySaved,
      'cigarettesNotSmoked': cigarettesNotSmoked,
      'calculatedAt': now,
    };
  }
  
  /// 比较本地和远程统计数据
  /// 
  /// 用于数据同步时的冲突检测
  static bool areStatsConsistent(
    Map<String, dynamic> localStats,
    UserStatsResponseModel remoteStats,
  ) {
    final localQuitDays = localStats['quitDays'] as int;
    final localMoneySaved = localStats['moneySaved'] as double;
    
    // 允许1天的差异（时区差异）
    final daysDiff = (localQuitDays - remoteStats.quitDays).abs();
    // 允许5%的金额差异（计算精度差异）
    final moneyDiff = (localMoneySaved - remoteStats.moneySaved).abs();
    final moneyThreshold = localMoneySaved * 0.05;
    
    return daysDiff <= 1 && moneyDiff <= moneyThreshold;
  }
  
  // ==================== 设置数据转换 ====================
  
  /// 创建默认用户设置
  static UserSettingsModel createDefaultSettings() {
    return const UserSettingsModel(
      notifications: NotificationSettingsModel(),
      privacy: PrivacySettingsModel(),
      display: DisplaySettingsModel(),
    );
  }
  
  /// 合并用户设置
  /// 
  /// 将本地设置与远程设置合并
  static UserSettingsModel mergeSettings(
    UserSettingsModel? local,
    UserSettingsModel? remote,
  ) {
    if (local == null && remote == null) {
      return createDefaultSettings();
    }
    
    if (local == null) return remote!;
    if (remote == null) return local;
    
    // 优先使用远程设置，但保留本地的显示偏好
    return remote.copyWith(
      display: local.display.copyWith(
        themeMode: local.display.themeMode,
        language: local.display.language,
        showProgressAnimations: local.display.showProgressAnimations,
      ),
    );
  }
  
  // ==================== 同步状态管理 ====================
  
  /// 创建同步状态
  static SyncStatusModel createSyncStatus({
    SyncState state = SyncState.idle,
    List<String> pendingDataTypes = const [],
    String? errorMessage,
  }) {
    return SyncStatusModel(
      lastSyncTime: state == SyncState.success ? DateTime.now() : null,
      isSyncing: state == SyncState.syncing,
      state: state,
      pendingDataTypes: pendingDataTypes,
      errorMessage: errorMessage,
      nextSyncTime: _calculateNextSyncTime(state),
    );
  }
  
  /// 更新同步状态
  static SyncStatusModel updateSyncStatus(
    SyncStatusModel current,
    SyncState newState, {
    String? errorMessage,
    List<String>? pendingDataTypes,
  }) {
    return current.copyWith(
      lastSyncTime: newState == SyncState.success ? DateTime.now() : current.lastSyncTime,
      isSyncing: newState == SyncState.syncing,
      state: newState,
      pendingDataTypes: pendingDataTypes ?? current.pendingDataTypes,
      errorMessage: errorMessage,
      nextSyncTime: _calculateNextSyncTime(newState),
    );
  }
  
  /// 计算下次同步时间
  static DateTime? _calculateNextSyncTime(SyncState state) {
    final now = DateTime.now();
    
    switch (state) {
      case SyncState.success:
        // 成功后1小时再同步
        return now.add(const Duration(hours: 1));
      case SyncState.error:
        // 错误后5分钟重试
        return now.add(const Duration(minutes: 5));
      case SyncState.partial:
        // 部分成功后15分钟重试
        return now.add(const Duration(minutes: 15));
      default:
        return null;
    }
  }
  
  // ==================== 数据冲突解决 ====================
  
  /// 解决用户资料冲突
  /// 
  /// 当本地和远程数据不一致时的解决策略
  static UserProfile resolveUserProfileConflict(
    UserProfile local,
    UserProfileResponseModel remote,
  ) {
    // 策略：优先使用最新的数据，但保留本地的引导状态
    return UserProfile(
      userId: remote.userId,
      quitDateTime: remote.quitDate ?? local.quitDateTime,
      quitReason: remote.quitReason ?? local.quitReason,
      dailyCigarettes: remote.cigarettesPerDay ?? local.dailyCigarettes,
      packPrice: remote.cigarettePrice ?? local.packPrice,
      smokingYears: remote.smokingYears ?? local.smokingYears,
      onboardingCompleted: local.onboardingCompleted, // 保留本地状态
    );
  }
  
  /// 检查数据是否需要同步
  static bool needsSync(
    UserProfile local,
    UserProfileResponseModel? remote,
  ) {
    if (remote == null) return true;
    
    // 检查关键字段是否有差异
    return local.quitDateTime != remote.quitDate ||
           local.dailyCigarettes != remote.cigarettesPerDay ||
           local.packPrice != remote.cigarettePrice ||
           local.quitReason != remote.quitReason ||
           local.smokingYears != remote.smokingYears;
  }
}
