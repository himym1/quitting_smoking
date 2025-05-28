import 'package:quitting_smoking/data/datasources/local/smoking_record_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/domain/repositories/smoking_record_repository.dart';

class SmokingRecordRepositoryImpl implements SmokingRecordRepository {
  final SmokingRecordLocalDataSource localDataSource;

  SmokingRecordRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addSmokingRecord(SmokingRecord record) {
    return localDataSource.addSmokingRecord(record);
  }

  @override
  Future<List<SmokingRecord>> getAllSmokingRecords() {
    return localDataSource.getAllSmokingRecords();
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForDate(DateTime date) {
    return localDataSource.getSmokingRecordsForDate(date);
  }

  @override
  Future<List<SmokingRecord>> getSmokingRecordsForMonth(DateTime month) {
    return localDataSource.getSmokingRecordsForMonth(month);
  }

  @override
  Stream<List<SmokingRecord>> watchAllSmokingRecords() {
    return localDataSource.watchAllSmokingRecords();
  }

  @override
  Future<void> deleteSmokingRecord(dynamic recordKey) {
    return localDataSource.deleteSmokingRecord(recordKey);
  }

  @override
  Future<void> clearAllSmokingRecords() {
    return localDataSource.clearAllSmokingRecords();
  }

  @override
  Future<Map<DateTime, int>> getSmokingCountsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return localDataSource.getSmokingCountsByDateRange(startDate, endDate);
  }
}
