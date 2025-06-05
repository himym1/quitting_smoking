import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/data/datasources/local/craving_log_local_datasource_impl.dart';
import 'package:quitting_smoking/data/repositories_impl/craving_log_repository_impl.dart';
import 'package:quitting_smoking/domain/entities/craving_log_entry.dart';
import 'package:quitting_smoking/domain/repositories/craving_log_repository.dart';

// Repository provider
final cravingLogRepositoryProvider = Provider<CravingLogRepository>((ref) {
  return CravingLogRepositoryImpl(
    localDataSource: CravingLogLocalDataSourceImpl(Hive),
  );
});

// 获取所有烟瘾记录
final allCravingLogsProvider = FutureProvider<List<CravingLogEntry>>((ref) async {
  final repository = ref.read(cravingLogRepositoryProvider);
  return await repository.getAllCravingLogs();
});

// 监听所有烟瘾记录的变化
final cravingLogsStreamProvider = StreamProvider<List<CravingLogEntry>>((ref) {
  final repository = ref.read(cravingLogRepositoryProvider);
  return repository.watchAllCravingLogs();
});

// 获取某天的烟瘾记录
final dailyCravingLogsProvider =
    FutureProvider.family<List<CravingLogEntry>, DateTime>((ref, date) async {
  final repository = ref.read(cravingLogRepositoryProvider);
  final allLogs = await repository.getAllCravingLogs();
  
  // 筛选指定日期的记录
  final targetDate = DateTime(date.year, date.month, date.day);
  return allLogs.where((log) {
    final logDate = DateTime(log.timestamp.year, log.timestamp.month, log.timestamp.day);
    return logDate.isAtSameMomentAs(targetDate);
  }).toList();
});

// 烟瘾记录控制器
final cravingLogControllerProvider =
    StateNotifierProvider<CravingLogController, AsyncValue<void>>((ref) {
  return CravingLogController(
    repository: ref.read(cravingLogRepositoryProvider),
    ref: ref,
  );
});

class CravingLogController extends StateNotifier<AsyncValue<void>> {
  final CravingLogRepository _repository;
  final Ref _ref;

  CravingLogController({
    required CravingLogRepository repository,
    required Ref ref,
  })  : _repository = repository,
        _ref = ref,
        super(const AsyncValue.data(null));

  Future<void> addCravingLog(CravingLogEntry log) async {
    state = const AsyncValue.loading();
    try {
      await _repository.addCravingLog(log);
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allCravingLogsProvider);
      _ref.invalidate(cravingLogsStreamProvider);
      
      // 刷新当天的记录
      final today = DateTime.now();
      _ref.invalidate(dailyCravingLogsProvider(today));
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteCravingLog(dynamic logKey) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deleteCravingLog(logKey);
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allCravingLogsProvider);
      _ref.invalidate(cravingLogsStreamProvider);
      
      // 刷新当天的记录
      final today = DateTime.now();
      _ref.invalidate(dailyCravingLogsProvider(today));
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> clearAllCravingLogs() async {
    state = const AsyncValue.loading();
    try {
      await _repository.clearAllCravingLogs();
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allCravingLogsProvider);
      _ref.invalidate(cravingLogsStreamProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// 日期范围类，用于查询
class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange(this.start, this.end);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateRange &&
          runtimeType == other.runtimeType &&
          start == other.start &&
          end == other.end;

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}
