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

// Provider for DailyCheckInLocalDataSource
final dailyCheckInLocalDataSourceProvider =
    Provider<DailyCheckInLocalDataSource>((ref) {
      return DailyCheckInLocalDataSourceImpl(Hive);
    });

// Provider for DailyCheckInRepository
final dailyCheckInRepositoryProvider = Provider<DailyCheckInRepository>((ref) {
  final localDataSource = ref.watch(dailyCheckInLocalDataSourceProvider);
  return DailyCheckInRepositoryImpl(localDataSource: localDataSource);
});

// Provider for HealthBenefitLocalDataSource
final healthBenefitLocalDataSourceProvider =
    Provider<HealthBenefitLocalDataSource>((ref) {
      return HealthBenefitLocalDataSourceImpl();
    });

// Provider for HealthBenefitRepository
final healthBenefitRepositoryProvider = Provider<HealthBenefitRepository>((
  ref,
) {
  final localDataSource = ref.watch(healthBenefitLocalDataSourceProvider);
  return HealthBenefitRepositoryImpl(localDataSource: localDataSource);
});

// Provider for AchievementLocalDataSource
final achievementLocalDataSourceProvider = Provider<AchievementLocalDataSource>(
  (ref) {
    final locale = ref.watch(currentLocaleProvider);
    return AchievementLocalDataSourceImpl(Hive, locale);
  },
);

// Provider for AchievementRepository
final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  final localDataSource = ref.watch(achievementLocalDataSourceProvider);
  return AchievementRepositoryImpl(localDataSource: localDataSource);
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive Adapters Registration
  // Make sure to register all adapters here
  // Example: Hive.registerAdapter(UserProfileAdapter());
  // Hive.registerAdapter(DailyCheckInAdapter()); // Add this line if not already present

  // 如果项目使用了 Hive, 在这里初始化:
  await HiveService.initHive(); // 假设您有这样的服务类 (根据原文件保留)

  // 初始化通知服务
  final notificationService = NotificationService();
  await notificationService.init();

  // 请求通知权限（在初始化完成后）
  await notificationService.requestPermission();

  // 如果项目使用了 Riverpod, runApp 将包裹在 ProviderScope 中:
  runApp(ProviderScope(child: AppWidget()));

  // 如果两者都未使用，或者在 AppWidget 内部处理 ProviderScope:
  // runApp(const AppWidget());
}
