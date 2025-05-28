import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

// Import entity adapters
// 假设 .g.dart 文件与实体类在同一目录下或者可以通过实体类访问
// 注意：实际项目中，如果 .g.dart 文件是实体类的一部分（通过 part 'entity.g.dart';），
// 那么直接导入实体类就足够了，适配器类会自动被引入。
// 如果 .g.dart 是独立文件，则需要确保它们被正确生成和导入。
// 根据用户提供的上下文，实体类文件如 user_profile.dart 应该已经包含了 Adapter 的定义或导出。
import '../../../domain/entities/user_profile.dart';
import '../../../domain/entities/daily_check_in.dart';
import '../../../domain/entities/craving_log_entry.dart';
import '../../../domain/entities/unlocked_achievement.dart';
import '../../../domain/entities/smoking_record.dart';

// Import Hive constants
import '../../../core/constants/hive_constants.dart';

class HiveService {
  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // 对于 Flutter 应用，推荐使用 Hive.initFlutter
    await Hive.initFlutter(appDocumentDir.path);

    // 注册适配器
    // 确保这些适配器名称与 build_runner 生成的名称一致。
    // 通常命名为 ClassNameAdapter。
    // 添加检查以避免重复注册适配器，这在热重载/重启时可能发生。
    if (!Hive.isAdapterRegistered(UserProfileAdapter().typeId)) {
      Hive.registerAdapter(UserProfileAdapter());
    }
    if (!Hive.isAdapterRegistered(DailyCheckInAdapter().typeId)) {
      Hive.registerAdapter(DailyCheckInAdapter());
    }
    if (!Hive.isAdapterRegistered(CravingLogEntryAdapter().typeId)) {
      Hive.registerAdapter(CravingLogEntryAdapter());
    }
    if (!Hive.isAdapterRegistered(UnlockedAchievementAdapter().typeId)) {
      Hive.registerAdapter(UnlockedAchievementAdapter());
    }
    if (!Hive.isAdapterRegistered(SmokingRecordAdapter().typeId)) {
      Hive.registerAdapter(SmokingRecordAdapter());
    }

    // 打开 Boxes
    await Hive.openBox<UserProfile>(HiveConstants.userProfileBox);
    await Hive.openBox<DailyCheckIn>(HiveConstants.checkInsBoxName);
    await Hive.openBox<CravingLogEntry>(HiveConstants.cravingLogsBoxName);
    await Hive.openBox<UnlockedAchievement>(
      HiveConstants.unlockedAchievementsBoxName,
    );
    await Hive.openBox<SmokingRecord>(HiveConstants.smokingRecordsBoxName);
    await Hive.openBox(HiveConstants.appSettingsBoxName); // 通用 Box
  }

  // 可选: 如果需要，可以添加关闭 Hive 和 boxes 的方法
  static Future<void> closeHive() async {
    // 关闭所有打开的 boxes
    await Hive.box<UserProfile>(HiveConstants.userProfileBox).close();
    await Hive.box<DailyCheckIn>(HiveConstants.checkInsBoxName).close();
    await Hive.box<CravingLogEntry>(HiveConstants.cravingLogsBoxName).close();
    await Hive.box<UnlockedAchievement>(
      HiveConstants.unlockedAchievementsBoxName,
    ).close();
    await Hive.box<SmokingRecord>(HiveConstants.smokingRecordsBoxName).close();
    await Hive.box(HiveConstants.appSettingsBoxName).close();

    // 关闭 Hive本身
    await Hive.close();
  }
}
