import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/presentation/providers/smoking_record_provider.dart';
import 'package:quitting_smoking/presentation/features/home/providers/daily_check_in_notifier.dart';

class SmokingRecordModal extends ConsumerStatefulWidget {
  const SmokingRecordModal({super.key});

  @override
  ConsumerState<SmokingRecordModal> createState() => _SmokingRecordModalState();
}

class _SmokingRecordModalState extends ConsumerState<SmokingRecordModal> {
  int _cigarettesSmoked = 1; // 默认1支
  String? _selectedTrigger;
  final TextEditingController _notesController = TextEditingController();

  final List<String> _triggerOptions = [
    'triggerStress',
    'triggerBoredom',
    'triggerSocialSituation',
    'triggerMeal',
    'triggerAlcohol',
    'triggerCoffee',
    'triggerOther',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  String _getTriggerLocalizedName(
    String triggerId,
    AppLocalizations localizations,
  ) {
    switch (triggerId) {
      case 'triggerStress':
        return localizations.cravingLogTriggerStress;
      case 'triggerBoredom':
        return localizations.cravingLogTriggerBoredom;
      case 'triggerSocialSituation':
        return localizations.cravingLogTriggerSocial;
      case 'triggerMeal':
        return localizations.cravingLogTriggerMeal;
      case 'triggerAlcohol':
        return localizations.cravingLogTriggerAlcohol;
      case 'triggerCoffee':
        return localizations.cravingLogTriggerCoffee;
      case 'triggerOther':
        return localizations.cravingLogTriggerOther;
      default:
        return triggerId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.only(
        bottom: mediaQuery.viewInsets.bottom + 16,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Icon(Icons.smoking_rooms, color: Colors.red[600], size: 24),
                const SizedBox(width: 8),
                Text(
                  localizations.recordSmokingTitle,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              localizations.recordSmokingDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),

            // 吸烟数量选择
            Text(
              localizations.howManyCigarettes,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed:
                      _cigarettesSmoked > 1
                          ? () {
                            setState(() {
                              _cigarettesSmoked--;
                            });
                          }
                          : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$_cigarettesSmoked${localizations.cigarettesUnit}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      _cigarettesSmoked < 50
                          ? () {
                            setState(() {
                              _cigarettesSmoked++;
                            });
                          }
                          : null,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // 触发因素选择
            Text(
              localizations.cravingLogTriggerLabel,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  _triggerOptions.map((trigger) {
                    final isSelected = _selectedTrigger == trigger;
                    return ChoiceChip(
                      label: Text(
                        _getTriggerLocalizedName(trigger, localizations),
                      ),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedTrigger = selected ? trigger : null;
                        });
                      },
                    );
                  }).toList(),
            ),

            const SizedBox(height: 16),

            // 附加说明
            Text(
              localizations.cravingLogNotesLabel,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                hintText: localizations.additionalThoughts,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 24),

            // 警告提示
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.orange[700],
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      localizations.relapseLearning,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 提交按钮
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(localizations.cancelButtonLabel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _saveSmokingRecord();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                    ),
                    child: Text(localizations.saveButtonLabel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveSmokingRecord() async {
    final localizations = AppLocalizations.of(context);
    final record = SmokingRecord(
      timestamp: DateTime.now(),
      cigarettesSmoked: _cigarettesSmoked,
      triggerTags: _selectedTrigger != null ? [_selectedTrigger!] : null,
      notes: _notesController.text.isNotEmpty ? _notesController.text : null,
    );

    try {
      // 使用repository保存吸烟记录
      final repository = ref.read(smokingRecordRepositoryProvider);
      await repository.addSmokingRecord(record);

      // 通知打卡系统更新状态
      final dailyCheckInNotifier = ref.read(
        dailyCheckInNotifierProvider.notifier,
      );
      await dailyCheckInNotifier.onSmokingRecorded();

      Navigator.of(context).pop(record);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localizations.smokingRecordSaved),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(localizations.saveFailed(e.toString())),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
