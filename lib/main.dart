/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 主入口文件
 * 功能：
 * 1. 初始化应用程序的核心依赖
 * 2. 配置 Riverpod 状态管理
 * 3. 设置本地数据库 (Hive)
 * 4. 初始化通知服务
 * 5. 注册所有 Provider 依赖注入
 */

import 'package:flutter/material.dart';
import 'package:quitting_smoking/app_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/local/daily_check_in_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/local/daily_check_in_local_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/local/hive_service.dart';
import 'package:quitting_smoking/data/repositories_impl/achievement_repository_impl.dart';
import 'package:quitting_smoking/data/repositories_impl/daily_check_in_repository_impl.dart';
import 'package:quitting_smoking/domain/repositories/achievement_repository.dart';
import 'package:quitting_smoking/domain/repositories/daily_check_in_repository.dart';
import 'package:quitting_smoking/data/datasources/local/health_benefit_local_datasource.dart';
import 'package:quitting_smoking/data/datasources/local/health_benefit_local_datasource_impl.dart';
import 'package:quitting_smoking/domain/repositories/health_benefit_repository.dart';
import 'package:quitting_smoking/data/repositories_impl/health_benefit_repository_impl.dart';
import 'package:quitting_smoking/core/services/notification_service.dart';
import 'package:quitting_smoking/core/providers/locale_provider.dart';
import 'package:quitting_smoking/core/providers/network_providers.dart';

// ==================== 依赖注入 Provider 配置 ====================

/// 每日打卡本地数据源 Provider
/// 功能：提供每日打卡数据的本地存储操作接口
final dailyCheckInLocalDataSourceProvider =
    Provider<DailyCheckInLocalDataSource>((ref) {
      return DailyCheckInLocalDataSourceImpl(Hive);
    });

/// 每日打卡仓库 Provider
/// 功能：封装每日打卡的业务逻辑，连接数据层和领域层
final dailyCheckInRepositoryProvider = Provider<DailyCheckInRepository>((ref) {
  final localDataSource = ref.watch(dailyCheckInLocalDataSourceProvider);
  final remoteDataSource = ref.watch(dailyCheckInRemoteDataSourceProvider);
  return DailyCheckInRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
});

/// 健康效益本地数据源 Provider
/// 功能：提供戒烟健康效益数据的本地读取操作
final healthBenefitLocalDataSourceProvider =
    Provider<HealthBenefitLocalDataSource>((ref) {
      return HealthBenefitLocalDataSourceImpl();
    });

/// 健康效益仓库 Provider
/// 功能：管理健康效益里程碑数据，支持多语言
final healthBenefitRepositoryProvider = Provider<HealthBenefitRepository>((
  ref,
) {
  final localDataSource = ref.watch(healthBenefitLocalDataSourceProvider);
  return HealthBenefitRepositoryImpl(localDataSource: localDataSource);
});

/// 成就系统本地数据源 Provider
/// 功能：提供成就数据的本地存储，支持国际化
final achievementLocalDataSourceProvider = Provider<AchievementLocalDataSource>(
  (ref) {
    // 监听当前语言设置，确保成就数据支持多语言
    final locale = ref.watch(currentLocaleProvider);
    return AchievementLocalDataSourceImpl(Hive, locale);
  },
);

/// 成就系统仓库 Provider
/// 功能：管理用户成就的解锁、查询等业务逻辑
final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  final localDataSource = ref.watch(achievementLocalDataSourceProvider);
  final remoteDataSource = ref.watch(achievementRemoteDataSourceProvider);
  return AchievementRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
});

// ==================== 应用程序主入口 ====================

/// 应用程序主入口函数
///
/// 初始化流程：
/// 1. 确保 Flutter 框架初始化
/// 2. 注册 Hive 数据适配器
/// 3. 初始化本地数据库
/// 4. 设置通知服务
/// 5. 启动应用程序
Future<void> main() async {
  // 确保 Flutter 绑定初始化完成
  // 这是使用任何插件或平台服务之前的必要步骤
  WidgetsFlutterBinding.ensureInitialized();

  // ==================== Hive 数据库初始化 ====================
  // 注册 Hive 适配器
  // 确保在这里注册所有自定义数据类型的适配器
  // 示例：
  // Hive.registerAdapter(UserProfileAdapter());
  // Hive.registerAdapter(DailyCheckInAdapter());
  // Hive.registerAdapter(CravingLogEntryAdapter());
  // Hive.registerAdapter(UnlockedAchievementAdapter());

  // 初始化本地数据库 Hive
  // 创建必要的数据表（Box），加载预置数据
  await HiveService.initHive();

  // ==================== 通知服务初始化 ====================
  // 初始化本地通知服务
  // 用于成就解锁提醒、健康里程碑通知、每日打卡提醒等
  final notificationService = NotificationService();
  await notificationService.init();

  // 请求通知权限
  // 在 Android 13+ 和 iOS 上需要用户明确授权
  await notificationService.requestPermission();

  // ==================== 启动应用程序 ====================
  // 使用 ProviderScope 包裹应用，启用 Riverpod 状态管理
  // 所有 Provider 将在此作用域内可用
  runApp(ProviderScope(child: AppWidget()));
}
