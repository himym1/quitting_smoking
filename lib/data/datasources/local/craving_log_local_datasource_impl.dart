import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/domain/entities/craving_log_entry.dart';
import 'craving_log_local_datasource.dart';

class CravingLogLocalDataSourceImpl implements CravingLogLocalDataSource {
  final HiveInterface hive;

  CravingLogLocalDataSourceImpl(this.hive);

  Future<Box<CravingLogEntry>> _getBox() async {
    if (!hive.isBoxOpen(HiveConstants.cravingLogsBoxName)) {
      return await hive.openBox<CravingLogEntry>(
        HiveConstants.cravingLogsBoxName,
      );
    }
    return hive.box<CravingLogEntry>(HiveConstants.cravingLogsBoxName);
  }

  @override
  Future<void> addCravingLog(CravingLogEntry logEntry) async {
    final box = await _getBox();
    // 使用时间戳作为键
    final key = logEntry.timestamp.millisecondsSinceEpoch.toString();
    await box.put(key, logEntry);
  }

  @override
  Future<List<CravingLogEntry>> getAllCravingLogs() async {
    final box = await _getBox();
    final logs = box.values.toList();
    // 按时间倒序排列（最新的在前面）
    logs.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return logs;
  }

  @override
  Stream<List<CravingLogEntry>> watchAllCravingLogs() async* {
    final box = await _getBox();
    yield await getAllCravingLogs(); // 初始数据
    yield* box.watch().asyncMap((_) async => await getAllCravingLogs());
  }

  @override
  Future<void> deleteCravingLog(dynamic logEntryKey) async {
    final box = await _getBox();
    await box.delete(logEntryKey);
  }

  @override
  Future<void> clearAllCravingLogs() async {
    final box = await _getBox();
    await box.clear();
  }
}
