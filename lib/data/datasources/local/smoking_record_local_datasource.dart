import '../../../domain/entities/smoking_record.dart';

abstract class SmokingRecordLocalDataSource {
  Future<void> addSmokingRecord(SmokingRecord record);

  Future<List<SmokingRecord>> getAllSmokingRecords();

  Future<List<SmokingRecord>> getSmokingRecordsForDate(DateTime date);

  Future<List<SmokingRecord>> getSmokingRecordsForMonth(DateTime month);

  Stream<List<SmokingRecord>> watchAllSmokingRecords();

  Future<void> deleteSmokingRecord(dynamic recordKey);

  Future<void> clearAllSmokingRecords();

  Future<Map<DateTime, int>> getSmokingCountsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
