import 'package:quitting_smoking/data/datasources/local/craving_log_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/craving_log_entry.dart';
import 'package:quitting_smoking/domain/repositories/craving_log_repository.dart';

class CravingLogRepositoryImpl implements CravingLogRepository {
  final CravingLogLocalDataSource localDataSource;

  CravingLogRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addCravingLog(CravingLogEntry logEntry) {
    return localDataSource.addCravingLog(logEntry);
  }

  @override
  Future<List<CravingLogEntry>> getAllCravingLogs() {
    return localDataSource.getAllCravingLogs();
  }

  @override
  Stream<List<CravingLogEntry>> watchAllCravingLogs() {
    return localDataSource.watchAllCravingLogs();
  }

  @override
  Future<void> deleteCravingLog(dynamic logEntryKey) {
    return localDataSource.deleteCravingLog(logEntryKey);
  }

  @override
  Future<void> clearAllCravingLogs() {
    return localDataSource.clearAllCravingLogs();
  }
}
