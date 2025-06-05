import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/data/datasources/local/smoking_record_local_datasource_impl.dart';
import 'package:quitting_smoking/data/repositories_impl/smoking_record_repository_impl.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/domain/repositories/smoking_record_repository.dart';
import 'package:quitting_smoking/core/providers/network_providers.dart';

// Repository provider
final smokingRecordRepositoryProvider = Provider<SmokingRecordRepository>((
  ref,
) {
  final localDataSource = SmokingRecordLocalDataSourceImpl(Hive);
  final remoteDataSource = ref.watch(smokingRecordRemoteDataSourceProvider);

  return SmokingRecordRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
});

// 获取所有吸烟记录
final allSmokingRecordsProvider = FutureProvider<List<SmokingRecord>>((
  ref,
) async {
  final repository = ref.read(smokingRecordRepositoryProvider);
  return await repository.getAllSmokingRecords();
});

// 监听所有吸烟记录的变化
final smokingRecordsStreamProvider = StreamProvider<List<SmokingRecord>>((ref) {
  final repository = ref.read(smokingRecordRepositoryProvider);
  return repository.watchAllSmokingRecords();
});

// 获取某个月的吸烟记录
final monthlySmokingRecordsProvider =
    FutureProvider.family<List<SmokingRecord>, DateTime>((ref, month) async {
      final repository = ref.read(smokingRecordRepositoryProvider);
      return await repository.getSmokingRecordsForMonth(month);
    });

// 获取某天的吸烟记录
final dailySmokingRecordsProvider =
    FutureProvider.family<List<SmokingRecord>, DateTime>((ref, date) async {
      final repository = ref.read(smokingRecordRepositoryProvider);
      return await repository.getSmokingRecordsForDate(date);
    });

// 获取指定日期范围内的吸烟数量统计
final smokingCountsByDateRangeProvider =
    FutureProvider.family<Map<DateTime, int>, DateRange>((
      ref,
      dateRange,
    ) async {
      final repository = ref.read(smokingRecordRepositoryProvider);
      return await repository.getSmokingCountsByDateRange(
        dateRange.start,
        dateRange.end,
      );
    });

// 获取当前月份的吸烟统计（用于日历显示）
final currentMonthSmokingCountsProvider = FutureProvider<Map<DateTime, int>>((
  ref,
) async {
  final repository = ref.read(smokingRecordRepositoryProvider);
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final endOfMonth = DateTime(now.year, now.month + 1, 0);

  return await repository.getSmokingCountsByDateRange(startOfMonth, endOfMonth);
});

// 吸烟记录控制器
final smokingRecordControllerProvider =
    StateNotifierProvider<SmokingRecordController, AsyncValue<void>>((ref) {
      return SmokingRecordController(
        repository: ref.read(smokingRecordRepositoryProvider),
        ref: ref,
      );
    });

class SmokingRecordController extends StateNotifier<AsyncValue<void>> {
  final SmokingRecordRepository _repository;
  final Ref _ref;

  SmokingRecordController({
    required SmokingRecordRepository repository,
    required Ref ref,
  }) : _repository = repository,
       _ref = ref,
       super(const AsyncValue.data(null));

  Future<void> addSmokingRecord(SmokingRecord record) async {
    state = const AsyncValue.loading();
    try {
      await _repository.addSmokingRecord(record);
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allSmokingRecordsProvider);
      _ref.invalidate(smokingRecordsStreamProvider);
      _ref.invalidate(currentMonthSmokingCountsProvider);

      // 刷新当前月份的记录
      final now = DateTime.now();
      _ref.invalidate(
        monthlySmokingRecordsProvider(DateTime(now.year, now.month, 1)),
      );
      _ref.invalidate(
        dailySmokingRecordsProvider(DateTime(now.year, now.month, now.day)),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteSmokingRecord(dynamic recordKey) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deleteSmokingRecord(recordKey);
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allSmokingRecordsProvider);
      _ref.invalidate(smokingRecordsStreamProvider);
      _ref.invalidate(currentMonthSmokingCountsProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> clearAllSmokingRecords() async {
    state = const AsyncValue.loading();
    try {
      await _repository.clearAllSmokingRecords();
      state = const AsyncValue.data(null);

      // 刷新相关的 provider
      _ref.invalidate(allSmokingRecordsProvider);
      _ref.invalidate(smokingRecordsStreamProvider);
      _ref.invalidate(currentMonthSmokingCountsProvider);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// 日期范围类
class DateRange {
  final DateTime start;
  final DateTime end;

  DateRange({required this.start, required this.end});

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
