import '../entities/smoking_record.dart';

abstract class SmokingRecordRepository {
  Future<void> addSmokingRecord(SmokingRecord record);

  Future<List<SmokingRecord>> getAllSmokingRecords();

  Future<List<SmokingRecord>> getSmokingRecordsForDate(DateTime date);

  Future<List<SmokingRecord>> getSmokingRecordsForMonth(DateTime month);

  Stream<List<SmokingRecord>> watchAllSmokingRecords();

  Future<void> deleteSmokingRecord(dynamic recordKey);

  Future<void> clearAllSmokingRecords();

  /// 获取指定日期范围内的吸烟数量统计
  Future<Map<DateTime, int>> getSmokingCountsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
