import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';

class QuitDatePage extends ConsumerStatefulWidget {
  const QuitDatePage({super.key});

  @override
  ConsumerState<QuitDatePage> createState() => _QuitDatePageState();
}

class _QuitDatePageState extends ConsumerState<QuitDatePage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadCurrentQuitDate();
  }

  void _loadCurrentQuitDate() {
    final authState = ref.read(authNotifierProvider);
    authState.maybeWhen(
      authenticated: (userProfile) {
        if (userProfile.quitDateTime != null) {
          setState(() {
            _selectedDate = userProfile.quitDateTime;
            _selectedTime = TimeOfDay.fromDateTime(userProfile.quitDateTime!);
          });
        } else {
          setState(() {
            _selectedDate = DateTime.now();
            _selectedTime = TimeOfDay.now();
          });
        }
      },
      orElse: () {
        // 默认为当前时间
        setState(() {
          _selectedDate = DateTime.now();
          _selectedTime = TimeOfDay.now();
        });
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(), // 不允许选择未来的日期
      helpText: '选择戒烟开始日期',
      cancelText: '取消',
      confirmText: '确认',
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      helpText: '选择戒烟开始时间',
      cancelText: '取消',
      confirmText: '确认',
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Future<void> _saveQuitDate() async {
    if (_selectedDate == null || _selectedTime == null) {
      setState(() {
        _errorMessage = '请选择日期和时间';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // 合并日期和时间
      final DateTime quitDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      // 调用AuthNotifier更新戒烟日期
      final authNotifier = ref.read(authNotifierProvider.notifier);
      await authNotifier.updateQuitDate(quitDateTime);

      // 显示成功提示
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('戒烟日期已更新')));
        Navigator.of(context).pop();
      }
    } catch (e) {
      setState(() {
        _errorMessage = '更新失败: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // 格式化日期和时间显示
    final dateFormatter = DateFormat('yyyy年MM月dd日');
    final String formattedDate =
        _selectedDate != null ? dateFormatter.format(_selectedDate!) : '未选择';

    final String formattedTime =
        _selectedTime != null
            ? '${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
            : '未选择';

    return Scaffold(
      appBar: AppBar(title: Text(localizations.quitDateSettingTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 说明文字
          Text(
            '您可以在这里更改戒烟开始日期和时间。请注意，这将重置您的戒烟进度。',
            style: theme.textTheme.bodyMedium,
          ),

          const SizedBox(height: 24),

          // 日期选择
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '戒烟日期',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.dividerColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, color: theme.primaryColor),
                          const SizedBox(width: 12),
                          Text(formattedDate, style: theme.textTheme.bodyLarge),
                          const Spacer(),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '戒烟时间',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () => _selectTime(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.dividerColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, color: theme.primaryColor),
                          const SizedBox(width: 12),
                          Text(formattedTime, style: theme.textTheme.bodyLarge),
                          const Spacer(),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_errorMessage != null) ...[
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: TextStyle(color: theme.colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: 32),

          // 确认按钮
          ElevatedButton(
            onPressed: _isLoading ? null : _saveQuitDate,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child:
                _isLoading
                    ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : const Text('保存更改'),
          ),

          const SizedBox(height: 16),

          // 取消按钮
          OutlinedButton(
            onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('取消'),
          ),
        ],
      ),
    );
  }
}
