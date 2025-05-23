import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'daily_check_in_local_datasource.dart';

class DailyCheckInLocalDataSourceImpl implements DailyCheckInLocalDataSource {
  final HiveInterface hive;

  DailyCheckInLocalDataSourceImpl(this.hive);

  Future<Box<DailyCheckIn>> _getBox() async {
    if (!hive.isBoxOpen(HiveConstants.checkInsBoxName)) {
      return await hive.openBox<DailyCheckIn>(HiveConstants.checkInsBoxName);
    }
    return hive.box<DailyCheckIn>(HiveConstants.checkInsBoxName);
  }

  @override
  Future<void> addCheckIn(DailyCheckIn checkIn) async {
    final box = await _getBox();
    // Use a composite key for daily check-ins to ensure one per day per user if needed,
    // or simply use date as key if user context is handled elsewhere or not required.
    // For simplicity, using date.toIso8601String() as key.
    // Ensure date is normalized to ignore time component for daily check-ins.
    final dateKey =
        DateTime(
          checkIn.date.year,
          checkIn.date.month,
          checkIn.date.day,
        ).toIso8601String();
    await box.put(dateKey, checkIn);
  }

  @override
  Future<DailyCheckIn?> getCheckInForDate(DateTime date) async {
    final box = await _getBox();
    final dateKey = DateTime(date.year, date.month, date.day).toIso8601String();
    return box.get(dateKey);
  }

  @override
  Future<List<DailyCheckIn>> getAllCheckIns() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  Stream<List<DailyCheckIn>> watchAllCheckIns() async* {
    final box = await _getBox();
    yield box.values.toList(); // Initial data
    yield* box.watch().map((event) => box.values.toList());
  }

  @override
  Stream<DailyCheckIn?> watchCheckInForDate(DateTime date) async* {
    final box = await _getBox();
    final dateKey = DateTime(date.year, date.month, date.day).toIso8601String();
    yield box.get(dateKey); // Initial data
    yield* box.watch(key: dateKey).map((event) => event.value as DailyCheckIn?);
  }
}
