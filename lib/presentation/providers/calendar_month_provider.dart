import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/providers/smoking_record_provider.dart';
import 'package:quitting_smoking/main.dart';

/// 日历月份选择状态管理
/// 用于控制主页日历显示的月份
class CalendarMonthNotifier extends StateNotifier<DateTime> {
  CalendarMonthNotifier() : super(DateTime.now());

  /// 切换到指定月份
  void setMonth(DateTime month) {
    // 只保留年月信息，日期设为1号
    final normalizedMonth = DateTime(month.year, month.month, 1);
    state = normalizedMonth;
  }

  /// 切换到上一个月
  void previousMonth() {
    final currentMonth = state;
    final previousMonth = DateTime(
      currentMonth.year,
      currentMonth.month - 1,
      1,
    );
    state = previousMonth;
  }

  /// 切换到下一个月
  void nextMonth() {
    final currentMonth = state;
    final nextMonth = DateTime(currentMonth.year, currentMonth.month + 1, 1);
    state = nextMonth;
  }

  /// 回到当前月份
  void resetToCurrentMonth() {
    final now = DateTime.now();
    state = DateTime(now.year, now.month, 1);
  }

  /// 检查是否是当前月份
  bool get isCurrentMonth {
    final now = DateTime.now();
    return state.year == now.year && state.month == now.month;
  }

  /// 获取月份显示文本
  String getMonthDisplayText() {
    final year = state.year;
    final month = state.month;
    return '$year年$month月';
  }

  /// 检查是否可以切换到下一个月（不能超过当前月份）
  bool get canGoToNextMonth {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1);
    return state.isBefore(currentMonth);
  }

  /// 检查是否可以切换到上一个月（可以设置最早月份限制）
  bool canGoToPreviousMonth({DateTime? earliestMonth}) {
    if (earliestMonth == null) return true;
    return state.isAfter(earliestMonth);
  }
}

/// 日历月份选择 Provider
final calendarMonthProvider =
    StateNotifierProvider<CalendarMonthNotifier, DateTime>((ref) {
      return CalendarMonthNotifier();
    });

/// 选中月份的吸烟统计 Provider
final selectedMonthSmokingCountsProvider = FutureProvider<Map<DateTime, int>>((
  ref,
) async {
  final selectedMonth = ref.watch(calendarMonthProvider);
  final repository = ref.read(smokingRecordRepositoryProvider);

  final startOfMonth = DateTime(selectedMonth.year, selectedMonth.month, 1);
  final endOfMonth = DateTime(selectedMonth.year, selectedMonth.month + 1, 0);

  return await repository.getSmokingCountsByDateRange(startOfMonth, endOfMonth);
});

/// 选中月份的打卡记录 Provider
final selectedMonthCheckInDaysProvider = FutureProvider<Map<DateTime, bool>>((
  ref,
) async {
  final selectedMonth = ref.watch(calendarMonthProvider);
  final repository = ref.read(dailyCheckInRepositoryProvider);

  // 获取所有打卡记录，然后筛选该月份的记录
  final allCheckIns = await repository.getAllCheckIns();

  // 筛选该月份的记录
  final monthCheckIns =
      allCheckIns.where((checkIn) {
        return checkIn.date.year == selectedMonth.year &&
            checkIn.date.month == selectedMonth.month;
      }).toList();

  // 转换为 Map<DateTime, bool> 格式
  final checkInDays = <DateTime, bool>{};
  for (final checkIn in monthCheckIns) {
    final date = DateTime(
      checkIn.date.year,
      checkIn.date.month,
      checkIn.date.day,
    );
    checkInDays[date] = checkIn.isCheckedIn;
  }

  return checkInDays;
});
