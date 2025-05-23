import '../entities/craving_log_entry.dart';

abstract class CravingLogRepository {
  Future<void> addCravingLog(CravingLogEntry logEntry);

  Future<List<CravingLogEntry>> getAllCravingLogs();

  Stream<List<CravingLogEntry>> watchAllCravingLogs();

  // Assuming CravingLogEntry has an implicit or explicit ID (e.g., Hive key)
  // For simplicity, if it's a HiveObject, its key can be used.
  // If an explicit ID field is added to CravingLogEntry, use that.
  // Otherwise, the method might need to take the object itself or its index.
  Future<void> deleteCravingLog(
    dynamic logEntryKey,
  ); // 'dynamic' to accommodate Hive key type

  Future<void> clearAllCravingLogs();
}
