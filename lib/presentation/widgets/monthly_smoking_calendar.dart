import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

class MonthlySmokingCalendar extends StatelessWidget {
  final DateTime currentMonth;
  final Map<DateTime, int> smokingCounts;
  final Map<DateTime, bool> checkInDays;
  final Function(DateTime)? onDateTap;

  const MonthlySmokingCalendar({
    super.key,
    required this.currentMonth,
    required this.smokingCounts,
    required this.checkInDays,
    this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    // 计算当月第一天和最后一天
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth = DateTime(
      currentMonth.year,
      currentMonth.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;
    final firstDayWeekday = firstDayOfMonth.weekday;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 月份标题
            Row(
              children: [
                Icon(Icons.calendar_month, color: theme.primaryColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  DateFormat('yyyy年M月').format(currentMonth),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 星期标题
            Row(
              children:
                  ['日', '一', '二', '三', '四', '五', '六'].map((day) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 8),

            // 日历网格
            Column(
              children: _buildCalendarRows(
                theme,
                localizations,
                firstDayWeekday,
                daysInMonth,
                firstDayOfMonth,
              ),
            ),

            const SizedBox(height: 16),

            // 图例
            _buildLegend(theme, localizations),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCalendarRows(
    ThemeData theme,
    AppLocalizations localizations,
    int firstDayWeekday,
    int daysInMonth,
    DateTime firstDayOfMonth,
  ) {
    final rows = <Widget>[];
    final today = DateTime.now();
    int dayCounter = 1;

    // 计算需要多少行
    final totalCells = firstDayWeekday % 7 + daysInMonth;
    final numberOfRows = (totalCells / 7).ceil();

    for (int week = 0; week < numberOfRows; week++) {
      final weekDays = <Widget>[];

      for (int day = 0; day < 7; day++) {
        final cellIndex = week * 7 + day;

        if (cellIndex < firstDayWeekday % 7 || dayCounter > daysInMonth) {
          // 空白单元格
          weekDays.add(const Expanded(child: SizedBox(height: 40)));
        } else {
          final currentDate = DateTime(
            firstDayOfMonth.year,
            firstDayOfMonth.month,
            dayCounter,
          );

          final smokingCount = smokingCounts[currentDate] ?? 0;
          final hasCheckIn = checkInDays[currentDate] ?? false;
          final isToday =
              currentDate.year == today.year &&
              currentDate.month == today.month &&
              currentDate.day == today.day;

          weekDays.add(
            Expanded(
              child: _buildDayCell(
                theme,
                localizations,
                dayCounter,
                smokingCount,
                hasCheckIn,
                isToday,
                currentDate,
              ),
            ),
          );
          dayCounter++;
        }
      }

      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(children: weekDays),
        ),
      );
    }

    return rows;
  }

  Widget _buildDayCell(
    ThemeData theme,
    AppLocalizations localizations,
    int day,
    int smokingCount,
    bool hasCheckIn,
    bool isToday,
    DateTime date,
  ) {
    Color backgroundColor = Colors.transparent;
    Color? borderColor;

    // 根据吸烟数量设置背景颜色
    if (smokingCount > 0) {
      if (smokingCount <= 5) {
        backgroundColor = Colors.red.withOpacity(0.3);
      } else if (smokingCount <= 10) {
        backgroundColor = Colors.red.withOpacity(0.5);
      } else {
        backgroundColor = Colors.red.withOpacity(0.7);
      }
    } else if (hasCheckIn) {
      backgroundColor = Colors.green.withOpacity(0.3);
    }

    // 今天的边框
    if (isToday) {
      borderColor = theme.primaryColor;
    }

    return GestureDetector(
      onTap: onDateTap != null ? () => onDateTap!(date) : null,
      child: Container(
        height: 40,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: backgroundColor,
          border:
              borderColor != null
                  ? Border.all(color: borderColor, width: 2)
                  : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                color: isToday ? theme.primaryColor : null,
              ),
            ),
            if (smokingCount > 0)
              Text(
                '$smokingCount${localizations.calendarCigarettesUnit}',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: Colors.red[800],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(ThemeData theme, AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.calendarLegend,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildLegendItem(
              theme,
              Colors.green.withOpacity(0.3),
              localizations.calendarCheckedIn,
            ),
            const SizedBox(width: 16),
            _buildLegendItem(
              theme,
              Colors.red.withOpacity(0.3),
              localizations.calendarCigarettes1to5,
            ),
            const SizedBox(width: 16),
            _buildLegendItem(
              theme,
              Colors.red.withOpacity(0.5),
              localizations.calendarCigarettes6to10,
            ),
            const SizedBox(width: 16),
            _buildLegendItem(
              theme,
              Colors.red.withOpacity(0.7),
              localizations.calendarCigarettes10plus,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(ThemeData theme, Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: theme.textTheme.labelSmall),
      ],
    );
  }
}
