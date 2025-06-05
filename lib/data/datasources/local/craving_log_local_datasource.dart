import '../../../domain/entities/craving_log_entry.dart';

abstract class CravingLogLocalDataSource {
  Future<void> addCravingLog(CravingLogEntry logEntry);

  Future<List<CravingLogEntry>> getAllCravingLogs();

  Stream<List<CravingLogEntry>> watchAllCravingLogs();

  Future<void> deleteCravingLog(dynamic logEntryKey);

  Future<void> clearAllCravingLogs();
}
