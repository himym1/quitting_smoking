import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'smoking_record_local_datasource.dart';

class SmokingRecordLocalDataSourceImpl implements SmokingRecordLocalDataSource {
  final HiveInterface hive;

  SmokingRecordLocalDataSourceImpl(this.hive);

  Future<Box<SmokingRecord>> _getBox() async {
    if (!hive.isBoxOpen(HiveConstants.smokingRecordsBoxName)) {
      return await hive.openBox<SmokingRecord>(
        HiveConstants.smokingRecordsBoxName,
      );
    }
    return hive.box<SmokingRecord>(HiveConstants.smokingRecordsBoxName);
  }

  @override
  Future<void> addSmokingRecord(SmokingRecord record) async {
    final box = await _getBox();
    // 使用时间戳作为键
    final key = record.timestamp.millisecondsSinceEpoch.toString();
    await box.put(key, record);
  }

  @override
  Future<List<SmokingRecord>> getAllSmokingRecords() async {
    final box = await _getBox();
    final records = box.values.toList();
    // 按时间倒序排列（最新的在前面）
    records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return records;
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForDate(DateTime date) async {
    final box = await _getBox();
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return box.values.where((record) {
      return record.timestamp.isAfter(
            startOfDay.subtract(const Duration(seconds: 1)),
          ) &&
          record.timestamp.isBefore(endOfDay.add(const Duration(seconds: 1)));
    }).toList();
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForMonth(DateTime month) async {
    final box = await _getBox();
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

    return box.values.where((record) {
      return record.timestamp.isAfter(
            startOfMonth.subtract(const Duration(seconds: 1)),
          ) &&
          record.timestamp.isBefore(endOfMonth.add(const Duration(seconds: 1)));
    }).toList();
  }

  @override
  Stream<List<SmokingRecord>> watchAllSmokingRecords() async* {
    final box = await _getBox();
    yield await getAllSmokingRecords(); // 初始数据
    yield* box.watch().asyncMap((_) async => await getAllSmokingRecords());
  }

  @override
  Future<void> deleteSmokingRecord(dynamic recordKey) async {
    final box = await _getBox();
    await box.delete(recordKey);
  }

  @override
  Future<void> clearAllSmokingRecords() async {
    final box = await _getBox();
    await box.clear();
  }

  @override
  Future<Map<DateTime, int>> getSmokingCountsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final box = await _getBox();
    final result = <DateTime, int>{};

    // 初始化日期范围内所有日期为0
    var currentDate = DateTime(startDate.year, startDate.month, startDate.day);
    final endDateNormalized = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
    );

    while (!currentDate.isAfter(endDateNormalized)) {
      result[currentDate] = 0;
      currentDate = currentDate.add(const Duration(days: 1));
    }

    // 统计每天的吸烟数量
    for (final record in box.values) {
      final recordDate = DateTime(
        record.timestamp.year,
        record.timestamp.month,
        record.timestamp.day,
      );

      if (!recordDate.isBefore(
            DateTime(startDate.year, startDate.month, startDate.day),
          ) &&
          !recordDate.isAfter(endDateNormalized)) {
        result[recordDate] =
            (result[recordDate] ?? 0) + record.cigarettesSmoked;
      }
    }

    return result;
  }
}
