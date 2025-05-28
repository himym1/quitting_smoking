import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/domain/repositories/daily_check_in_repository.dart';
import 'package:quitting_smoking/presentation/providers/smoking_record_provider.dart';
import 'package:quitting_smoking/main.dart';

enum DailyCheckInStatus { initial, checkedIn, notCheckedIn, error }

class DailyCheckInState {
  final DailyCheckInStatus status;
  final String? errorMessage;
  final bool isAutoCheckedIn; // 标记是否为自动打卡

  DailyCheckInState({
    required this.status,
    this.errorMessage,
    this.isAutoCheckedIn = false,
  });

  DailyCheckInState.initial()
    : status = DailyCheckInStatus.initial,
      errorMessage = null,
      isAutoCheckedIn = false;

  DailyCheckInState.checkedIn({bool isAuto = false})
    : status = DailyCheckInStatus.checkedIn,
      errorMessage = null,
      isAutoCheckedIn = isAuto;

  DailyCheckInState.notCheckedIn()
    : status = DailyCheckInStatus.notCheckedIn,
      errorMessage = null,
      isAutoCheckedIn = false;

  DailyCheckInState.error(this.errorMessage)
    : status = DailyCheckInStatus.error,
      isAutoCheckedIn = false;
}

class DailyCheckInNotifier extends StateNotifier<DailyCheckInState> {
  final DailyCheckInRepository _repository;
  final Ref _ref;

  DailyCheckInNotifier(this._repository, this._ref)
    : super(DailyCheckInState.initial()) {
    _checkTodayStatus();
    // 监听吸烟记录变化，自动更新打卡状态
    _ref.listen(smokingRecordsStreamProvider, (previous, next) {
      next.whenData((records) {
        _updateCheckInStatusBasedOnSmokingRecords();
      });
    });
  }

  Future<void> _checkTodayStatus() async {
    try {
      await _updateCheckInStatusBasedOnSmokingRecords();
    } catch (e) {
      state = DailyCheckInState.error(
        "Failed to check today's status: ${e.toString()}",
      );
    }
  }

  Future<void> _updateCheckInStatusBasedOnSmokingRecords() async {
    try {
      final today = DateTime.now();
      final todayStart = DateTime(today.year, today.month, today.day);

      // 获取今天的吸烟记录
      final smokingRecords = await _ref
          .read(smokingRecordRepositoryProvider)
          .getSmokingRecordsForDate(todayStart);

      // 获取今天的手动打卡记录
      final existingCheckIn = await _repository.getCheckInForDate(today);

      if (smokingRecords.isNotEmpty) {
        // 如果今天有吸烟记录，则不能打卡（但保留现有的打卡记录）
        // 注意：这里我们不删除打卡记录，而是通过状态显示用户今天吸烟了
        state = DailyCheckInState.notCheckedIn();
      } else {
        // 如果今天没有吸烟记录
        if (existingCheckIn != null && existingCheckIn.isCheckedIn) {
          // 已有手动打卡记录
          state = DailyCheckInState.checkedIn(isAuto: false);
        } else {
          // 没有打卡记录，自动创建打卡记录
          await _autoCheckIn();
          state = DailyCheckInState.checkedIn(isAuto: true);
        }
      }
    } catch (e) {
      state = DailyCheckInState.error(
        "Failed to update check-in status: ${e.toString()}",
      );
    }
  }

  Future<void> _autoCheckIn() async {
    final today = DateTime.now();
    final newCheckIn = DailyCheckIn(date: today, isCheckedIn: true);
    await _repository.addCheckIn(newCheckIn);
  }

  Future<bool> performManualCheckIn() async {
    try {
      final today = DateTime.now();
      final todayStart = DateTime(today.year, today.month, today.day);

      // 检查今天是否有吸烟记录
      final smokingRecords = await _ref
          .read(smokingRecordRepositoryProvider)
          .getSmokingRecordsForDate(todayStart);

      if (smokingRecords.isNotEmpty) {
        state = DailyCheckInState.error("今天已有吸烟记录，无法打卡");
        return false;
      }

      final newCheckIn = DailyCheckIn(date: today, isCheckedIn: true);
      await _repository.addCheckIn(newCheckIn);
      state = DailyCheckInState.checkedIn(isAuto: false);
      return true;
    } catch (e) {
      state = DailyCheckInState.error(
        "Failed to perform manual check-in: ${e.toString()}",
      );
      return false;
    }
  }

  // 当用户记录吸烟时调用此方法
  Future<void> onSmokingRecorded() async {
    await _updateCheckInStatusBasedOnSmokingRecords();
  }

  // Stream to listen for changes in today's check-in status
  Stream<DailyCheckInState> get todayCheckInStatusStream {
    final today = DateTime.now();
    return _repository
        .watchCheckInForDate(today)
        .map((checkIn) {
          if (checkIn != null && checkIn.isCheckedIn) {
            return DailyCheckInState.checkedIn();
          } else {
            return DailyCheckInState.notCheckedIn();
          }
        })
        .handleError((e) {
          return DailyCheckInState.error(
            "Failed to watch today's status: ${e.toString()}",
          );
        });
  }
}

final dailyCheckInNotifierProvider =
    StateNotifierProvider<DailyCheckInNotifier, DailyCheckInState>((ref) {
      final dailyCheckInRepository = ref.watch(dailyCheckInRepositoryProvider);
      return DailyCheckInNotifier(dailyCheckInRepository, ref);
    });
