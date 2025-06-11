/// 焕新之旅 - 戒烟辅助应用
///
/// 日历详情页面 (CalendarDetailPage)
/// 功能：
/// 1. 显示选定日期的详细信息
/// 2. 展示当日的打卡状态、吸烟记录、烟瘾记录
/// 3. 提供快速操作功能（补充打卡、添加记录等）
/// 4. 支持数据编辑和删除
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/domain/entities/craving_log_entry.dart';
import 'package:quitting_smoking/presentation/providers/smoking_record_provider.dart';
import 'package:quitting_smoking/presentation/providers/craving_log_provider.dart';
import 'package:quitting_smoking/presentation/common_widgets/dialog_wrapper.dart';
import 'package:quitting_smoking/presentation/features/home/pages/smoking_record_modal.dart';
import 'package:quitting_smoking/presentation/features/home/pages/craving_log_modal.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/main.dart';
import 'package:quitting_smoking/core/theme/app_colors.dart';

/// 日历详情页面
///
/// 显示选定日期的详细信息，包括：
/// - 打卡状态和详情
/// - 吸烟记录列表
/// - 烟瘾记录详情
/// - 快速操作功能
class CalendarDetailPage extends ConsumerStatefulWidget {
  /// 选定的日期
  final DateTime selectedDate;

  const CalendarDetailPage({super.key, required this.selectedDate});

  @override
  ConsumerState<CalendarDetailPage> createState() => _CalendarDetailPageState();
}

class _CalendarDetailPageState extends ConsumerState<CalendarDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    // 格式化日期显示
    final dateFormatter = DateFormat('yyyy年M月d日 EEEE', 'zh_CN');
    final formattedDate = dateFormatter.format(widget.selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$formattedDate 详情',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 日期信息卡片
            _buildDateInfoCard(theme, localizations, formattedDate),
            const SizedBox(height: 16),

            // 打卡状态区域
            _buildCheckInSection(theme, localizations),
            const SizedBox(height: 16),

            // 吸烟记录区域
            _buildSmokingRecordsSection(theme, localizations),
            const SizedBox(height: 16),

            // 烟瘾记录区域
            _buildCravingLogsSection(theme, localizations),
            // 快速操作区域已移除，功能按钮集成在各Section内部
          ],
        ),
      ),
    );
  }

  /// 构建日期信息卡片
  Widget _buildDateInfoCard(
    ThemeData theme,
    AppLocalizations localizations,
    String formattedDate,
  ) {
    final isToday = _isToday(widget.selectedDate);
    final isPast = widget.selectedDate.isBefore(DateTime.now());

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isToday ? Icons.today : Icons.calendar_today,
                  color: theme.primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    formattedDate,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isToday)
                  Chip(
                    label: const Text('今天'),
                    backgroundColor: theme.primaryColor.withValues(alpha: 0.2),
                    labelStyle: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              isToday
                  ? '今天的戒烟记录'
                  : isPast
                  ? '历史戒烟记录'
                  : '未来日期',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.textMediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建打卡状态区域
  Widget _buildCheckInSection(ThemeData theme, AppLocalizations localizations) {
    // 获取打卡和吸烟记录数据
    final dailyCheckInRepository = ref.watch(dailyCheckInRepositoryProvider);
    final smokingRecordsAsync = ref.watch(
      dailySmokingRecordsProvider(widget.selectedDate),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: theme.primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '打卡状态',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 组合 FutureBuilder 和 AsyncValue 的状态
            FutureBuilder<DailyCheckIn?>(
              future: dailyCheckInRepository.getCheckInForDate(
                widget.selectedDate,
              ),
              builder: (context, snapshot) {
                // 1. 处理加载状态: 任意一个数据未准备好
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !smokingRecordsAsync.hasValue) {
                  return const Center(child: CircularProgressIndicator());
                }
                // 2. 处理错误状态
                if (smokingRecordsAsync.hasError) {
                  return Text(
                    '加载吸烟记录失败: ${smokingRecordsAsync.error}',
                    style: TextStyle(color: theme.colorScheme.error),
                  );
                }
                if (snapshot.hasError) {
                  return Text(
                    '加载打卡记录失败: ${snapshot.error}',
                    style: TextStyle(color: theme.colorScheme.error),
                  );
                }

                final checkIn = snapshot.data;
                final hasCheckIn = checkIn?.isCheckedIn ?? false;
                final hasSmokingRecords =
                    smokingRecordsAsync.value?.isNotEmpty ?? false;

                // 3. 确定最终状态、图标、颜色和文本
                IconData icon;
                Color color;
                String statusText;
                bool isSuccess = false; // 标记是否为成功状态

                if (hasSmokingRecords) {
                  // 优先级最高：有吸烟记录则打卡失败
                  icon = Icons.cancel_outlined;
                  color = AppColors.warningRed;
                  statusText = '打卡失败'; // (当日有吸烟记录)
                  isSuccess = false;
                } else if (hasCheckIn) {
                  // 无吸烟记录且已打卡：成功
                  icon = Icons.check_circle;
                  color = AppColors.successGreen;
                  statusText = '已打卡';
                  isSuccess = true;
                } else {
                  // 无吸烟记录且未打卡
                  icon = Icons.radio_button_unchecked;
                  color = AppColors.textMediumGray;
                  statusText = '未打卡';
                  isSuccess = false;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon, // 使用计算出的图标
                          color: color, // 使用计算出的颜色
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          statusText, // 使用计算出的文本
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: color, // 使用计算出的颜色
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    // 仅在成功打卡时显示打卡时间
                    if (isSuccess && checkIn != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        '打卡时间: ${DateFormat('HH:mm').format(checkIn.date)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textMediumGray,
                        ),
                      ),
                    ],
                    // 仅在未打卡且无吸烟记录时显示补充打卡按钮
                    if (!hasCheckIn &&
                        !hasSmokingRecords &&
                        _isPastDate(widget.selectedDate)) ...[
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () => _showSupplementCheckInDialog(),
                        icon: const Icon(Icons.add_task, size: 16),
                        label: const Text('补充打卡'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentYellow,
                          foregroundColor: AppColors.textDarkGray,
                        ),
                      ),
                    ],
                    // 如果因吸烟记录导致打卡失败，显示提示
                    if (hasSmokingRecords) ...[
                      const SizedBox(height: 8),
                      Text(
                        '提示：当日有吸烟记录，打卡无效。',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.warningRed,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 构建吸烟记录区域
  Widget _buildSmokingRecordsSection(
    ThemeData theme,
    AppLocalizations localizations,
  ) {
    final smokingRecordsAsync = ref.watch(
      dailySmokingRecordsProvider(widget.selectedDate),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.smoking_rooms,
                      color: AppColors.warningRed,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '吸烟记录',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () => _showAddSmokingRecordDialog(),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('添加'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            smokingRecordsAsync.when(
              data: (records) {
                if (records.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.successGreen.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.successGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '当日无吸烟记录，坚持得很好！',
                          style: TextStyle(color: AppColors.successGreen),
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  children:
                      records
                          .map(
                            (record) => _buildSmokingRecordItem(theme, record),
                          )
                          .toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, stack) => Text(
                    '加载失败: $error',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建吸烟记录项
  Widget _buildSmokingRecordItem(ThemeData theme, SmokingRecord record) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warningRed.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.warningRed.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.smoking_rooms, color: AppColors.warningRed, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat('HH:mm').format(record.timestamp)} - ${record.cigarettesSmoked}支',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (record.notes?.isNotEmpty == true) ...[
                  const SizedBox(height: 4),
                  Text(
                    record.notes!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMediumGray,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showDeleteSmokingRecordDialog(record),
            icon: const Icon(Icons.delete_outline, size: 16),
            color: AppColors.warningRed,
          ),
        ],
      ),
    );
  }

  /// 构建烟瘾记录区域
  Widget _buildCravingLogsSection(
    ThemeData theme,
    AppLocalizations localizations,
  ) {
    // 这里需要实现烟瘾记录的显示逻辑
    // 由于代码长度限制，先返回占位符
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.psychology,
                      color: AppColors.accentYellow,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '烟瘾记录',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () => _showAddCravingLogDialog(),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('添加'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 烟瘾记录内容
            _buildCravingLogsContent(),
          ],
        ),
      ),
    );
  }

  /// 构建快速操作区域
  Widget _buildQuickActionsSection(
    ThemeData theme,
    AppLocalizations localizations,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '快速操作',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showAddSmokingRecordDialog(),
                  icon: const Icon(Icons.smoking_rooms, size: 16),
                  label: const Text('记录吸烟'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.warningRed,
                    foregroundColor: AppColors.backgroundWhite,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showAddCravingLogDialog(),
                  icon: const Icon(Icons.psychology, size: 16),
                  label: const Text('记录烟瘾'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentYellow,
                    foregroundColor: AppColors.textDarkGray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 辅助方法
  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isPastDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkDate = DateTime(date.year, date.month, date.day);
    return checkDate.isBefore(today);
  }

  // 对话框方法实现
  void _showSupplementCheckInDialog() {
    DialogWrapper.show(
      context: context,
      title: '补充打卡',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '确认要为 ${DateFormat('M月d日').format(widget.selectedDate)} 补充打卡吗？',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            '注意：只有在当日没有吸烟记录的情况下才能补充打卡。',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.accentYellow),
          ),
        ],
      ),
      primaryActionText: '确认打卡',
      secondaryActionText: '取消',
      onPrimaryAction: () => _performSupplementCheckIn(),
      onSecondaryAction: () => Navigator.of(context).pop(),
    );
  }

  void _showAddSmokingRecordDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const SmokingRecordModal(),
    ).then((result) {
      if (result != null) {
        // 刷新页面数据
        setState(() {});
      }
    });
  }

  void _showAddCravingLogDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CravingLogModal(),
    ).then((result) {
      if (result != null) {
        // 刷新页面数据
        setState(() {});
      }
    });
  }

  void _showDeleteSmokingRecordDialog(SmokingRecord record) {
    DialogWrapper.show(
      context: context,
      title: '删除吸烟记录',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('确认要删除这条吸烟记录吗？', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.warningRed.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.smoking_rooms,
                  color: AppColors.warningRed,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '${DateFormat('HH:mm').format(record.timestamp)} - ${record.cigarettesSmoked}支',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '此操作无法撤销。',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.warningRed),
          ),
        ],
      ),
      primaryActionText: '确认删除',
      secondaryActionText: '取消',
      onPrimaryAction: () => _deleteSmokingRecord(record),
      onSecondaryAction: () => Navigator.of(context).pop(),
    );
  }

  /// 构建烟瘾记录内容
  Widget _buildCravingLogsContent() {
    final cravingLogsAsync = ref.watch(
      dailyCravingLogsProvider(widget.selectedDate),
    );

    return cravingLogsAsync.when(
      data: (logs) {
        if (logs.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.successGreen.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: AppColors.successGreen,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '今天没有烟瘾记录，继续保持！',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.successGreen,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: logs.map((log) => _buildCravingLogItem(log)).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, stack) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.warningRed.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '加载烟瘾记录失败：$error',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.warningRed),
            ),
          ),
    );
  }

  /// 构建单个烟瘾记录项
  Widget _buildCravingLogItem(CravingLogEntry log) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.accentYellow.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.accentYellow.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.psychology, color: AppColors.accentYellow, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('HH:mm').format(log.timestamp),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (log.triggerTags != null && log.triggerTags!.isNotEmpty)
                  Text(
                    '触发因素: ${log.triggerTags!.join(', ')}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMediumGray,
                    ),
                  ),
                if (log.emotionTags != null && log.emotionTags!.isNotEmpty)
                  Text(
                    '情绪: ${log.emotionTags!.join(', ')}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMediumGray,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showDeleteCravingLogDialog(log),
            icon: Icon(
              Icons.delete_outline,
              color: AppColors.warningRed,
              size: 16,
            ),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  void _showDeleteCravingLogDialog(CravingLogEntry log) {
    DialogWrapper.show(
      context: context,
      title: '删除烟瘾记录',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('确认要删除这条烟瘾记录吗？', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.accentYellow.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.psychology, color: AppColors.accentYellow, size: 16),
                const SizedBox(width: 8),
                Text(
                  DateFormat('HH:mm').format(log.timestamp),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '此操作无法撤销。',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.warningRed),
          ),
        ],
      ),
      primaryActionText: '确认删除',
      secondaryActionText: '取消',
      onPrimaryAction: () => _deleteCravingLog(log),
      onSecondaryAction: () => Navigator.of(context).pop(),
    );
  }

  Future<void> _deleteCravingLog(CravingLogEntry log) async {
    try {
      Navigator.of(context).pop(); // 关闭对话框

      final controller = ref.read(cravingLogControllerProvider.notifier);
      await controller.deleteCravingLog(log.key);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('删除成功'),
          backgroundColor: AppColors.successGreen,
        ),
      );

      // 刷新页面
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('删除失败：$e'),
          backgroundColor: AppColors.warningRed,
        ),
      );
    }
  }

  // 业务逻辑方法
  Future<void> _performSupplementCheckIn() async {
    try {
      Navigator.of(context).pop(); // 关闭对话框

      // 检查当日是否有吸烟记录
      final smokingRecords = await ref
          .read(smokingRecordRepositoryProvider)
          .getSmokingRecordsForDate(widget.selectedDate);

      if (!mounted) return;

      if (smokingRecords.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('当日有吸烟记录，无法补充打卡'),
            backgroundColor: AppColors.warningRed,
          ),
        );
        return;
      }

      // 创建补充打卡记录
      final checkIn = DailyCheckIn(
        date: widget.selectedDate,
        isCheckedIn: true,
      );

      final repository = ref.read(dailyCheckInRepositoryProvider);
      await repository.addCheckIn(checkIn);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('补充打卡成功！'),
          backgroundColor: AppColors.successGreen,
        ),
      );

      // 刷新页面
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('补充打卡失败：$e'),
          backgroundColor: AppColors.warningRed,
        ),
      );
    }
  }

  Future<void> _deleteSmokingRecord(SmokingRecord record) async {
    try {
      Navigator.of(context).pop(); // 关闭对话框

      final repository = ref.read(smokingRecordRepositoryProvider);
      await repository.deleteSmokingRecord(record.key);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('删除成功'),
          backgroundColor: AppColors.successGreen,
        ),
      );

      // 刷新页面
      setState(() {});
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('删除失败：$e'),
          backgroundColor: AppColors.warningRed,
        ),
      );
    }
  }
}
