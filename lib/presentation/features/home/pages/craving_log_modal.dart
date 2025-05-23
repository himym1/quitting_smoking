import 'package:flutter/material.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

class CravingLogModal extends StatefulWidget {
  const CravingLogModal({super.key});

  @override
  State<CravingLogModal> createState() => _CravingLogModalState();
}

class _CravingLogModalState extends State<CravingLogModal> {
  int _cravingIntensity = 3; // 默认为中等强度 (1-5)
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
    final localizations = AppLocalizations.of(context)!;
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
            Text(
              localizations.cravingLogTitle,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 24),

            // 烟瘾强度评级
            Text(
              localizations.cravingLogIntensityLabel,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localizations.cravingLogIntensityLow,
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  localizations.cravingLogIntensityHigh,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Slider(
              value: _cravingIntensity.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: _cravingIntensity.toString(),
              onChanged: (double value) {
                setState(() {
                  _cravingIntensity = value.round();
                });
              },
            ),

            const SizedBox(height: 16),

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
                hintText: localizations.cravingLogNotesHint,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 24),

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
                      // TODO: 实现保存烟瘾记录的逻辑
                      // 这里应该调用一个provider来保存数据

                      // 暂时只是关闭模态框并显示一个成功消息
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localizations.cravingLogSavedMessage),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
}
