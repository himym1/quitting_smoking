import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/main.dart';

class CheckInStatisticsPage extends ConsumerStatefulWidget {
  const CheckInStatisticsPage({super.key});

  @override
  ConsumerState<CheckInStatisticsPage> createState() =>
      _CheckInStatisticsPageState();
}

class _CheckInStatisticsPageState extends ConsumerState<CheckInStatisticsPage> {
  DateTime _selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _ = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('打卡统计'),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
      ),
      body: Column(
        children: [
          // 月份选择器
          _buildMonthSelector(theme),

          // 统计概览
          _buildStatisticsOverview(theme),

          // 打卡记录列表
          Expanded(child: _buildCheckInList(theme)),
        ],
      ),
    );
  }

  Widget _buildMonthSelector(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _selectedMonth = DateTime(
                  _selectedMonth.year,
                  _selectedMonth.month - 1,
                );
              });
            },
            icon: const Icon(Icons.chevron_left),
          ),
          GestureDetector(
            onTap: () => _showMonthPicker(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                DateFormat('yyyy年M月').format(_selectedMonth),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _selectedMonth = DateTime(
                  _selectedMonth.year,
                  _selectedMonth.month + 1,
                );
              });
            },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsOverview(ThemeData theme) {
    // 使用main.dart中定义的repository provider获取数据
    final repository = ref.watch(dailyCheckInRepositoryProvider);

    return FutureBuilder<List<DailyCheckIn>>(
      future: _getMonthlyCheckIns(repository),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            child: Text('加载统计信息时出错: ${snapshot.error}'),
          );
        }

        final checkIns = snapshot.data ?? [];
        final totalDays =
            DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
        final checkInDays = checkIns.length;
        final checkInRate = checkInDays / totalDays;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                '本月打卡情况',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem(
                    theme,
                    icon: Icons.calendar_today,
                    label: '总天数',
                    value: '$totalDays',
                    color: Colors.blue,
                  ),
                  _buildStatItem(
                    theme,
                    icon: Icons.check_circle,
                    label: '打卡天数',
                    value: '$checkInDays',
                    color: Colors.green,
                  ),
                  _buildStatItem(
                    theme,
                    icon: Icons.trending_up,
                    label: '打卡率',
                    value: '${(checkInRate * 100).toStringAsFixed(1)}%',
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildCheckInList(ThemeData theme) {
    final repository = ref.watch(dailyCheckInRepositoryProvider);

    return FutureBuilder<List<DailyCheckIn>>(
      future: _getMonthlyCheckIns(repository),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
                const SizedBox(height: 16),
                Text('加载打卡记录时出错', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(
                  snapshot.error.toString(),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final checkIns = snapshot.data ?? [];
        if (checkIns.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.event_busy, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  '本月还没有打卡记录',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }

        // 按日期倒序排列
        final sortedCheckIns = List<DailyCheckIn>.from(checkIns)
          ..sort((a, b) => b.date.compareTo(a.date));

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: sortedCheckIns.length,
          itemBuilder: (context, index) {
            final checkIn = sortedCheckIns[index];
            return _buildCheckInCard(theme, checkIn, index);
          },
        );
      },
    );
  }

  Widget _buildCheckInCard(ThemeData theme, DailyCheckIn checkIn, int index) {
    final isToday = _isToday(checkIn.date);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isToday ? theme.primaryColor : Colors.green,
          child: Icon(
            isToday ? Icons.today : Icons.check,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          DateFormat('M月d日 EEEE', 'zh_CN').format(checkIn.date),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '打卡时间: ${DateFormat('HH:mm').format(checkIn.date)}',
          style: theme.textTheme.bodySmall,
        ),
        trailing:
            isToday
                ? Chip(
                  label: const Text('今天'),
                  backgroundColor: theme.primaryColor.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 12,
                  ),
                )
                : Text(
                  '第${index + 1}天',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  void _showMonthPicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null) {
      setState(() {
        _selectedMonth = DateTime(picked.year, picked.month);
      });
    }
  }

  Future<List<DailyCheckIn>> _getMonthlyCheckIns(repository) async {
    // 获取该月的所有打卡记录
    final allCheckIns = await repository.getAllCheckIns();

    // 筛选出选定月份的记录
    return allCheckIns.where((checkIn) {
      return checkIn.date.year == _selectedMonth.year &&
          checkIn.date.month == _selectedMonth.month &&
          checkIn.isCheckedIn;
    }).toList();
  }
}
