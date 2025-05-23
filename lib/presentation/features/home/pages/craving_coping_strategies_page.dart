import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/home/pages/breathing_exercise_guide_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/craving_log_modal.dart';

class CravingCopingStrategiesPage extends StatelessWidget {
  const CravingCopingStrategiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.cravingCopingStrategiesTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.cravingCopingStrategiesSubtitle,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 24),

            // 深呼吸练习选项
            _buildStrategyCard(
              context,
              title: localizations.cravingStrategyBreathingTitle,
              description: localizations.cravingStrategyBreathingDesc,
              icon: Icons.air,
              onTap: () {
                context.goNamed('breathingExerciseGuide');
              },
            ),

            // 喝水提醒选项
            _buildStrategyCard(
              context,
              title: localizations.cravingStrategyWaterTitle,
              description: localizations.cravingStrategyWaterDesc,
              icon: Icons.water_drop,
              onTap: () {
                _showCompletionDialog(
                  context,
                  localizations.cravingStrategyWaterTitle,
                  localizations.cravingStrategyCompleted,
                );
              },
            ),

            // 分散注意力小技巧选项
            _buildStrategyCard(
              context,
              title: localizations.cravingStrategyDistractionTitle,
              description: localizations.cravingStrategyDistractionDesc,
              icon: Icons.psychology,
              onTap: () {
                _showDistractionTipsDialog(context);
              },
            ),

            const SizedBox(height: 40),

            // 记录本次烟瘾按钮
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit_note),
                label: Text(localizations.cravingLogButtonText),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  _showCravingLogModal(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStrategyCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(
                  context,
                ).primaryColor.withOpacity(0.1),
                child: Icon(icon, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showDistractionTipsDialog(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(localizations.cravingStrategyDistractionTipsTitle),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDistractionTip(
                    context,
                    localizations.cravingStrategyDistractionTip1Title,
                    localizations.cravingStrategyDistractionTip1Desc,
                    Icons.music_note,
                  ),
                  const Divider(),
                  _buildDistractionTip(
                    context,
                    localizations.cravingStrategyDistractionTip2Title,
                    localizations.cravingStrategyDistractionTip2Desc,
                    Icons.directions_walk,
                  ),
                  const Divider(),
                  _buildDistractionTip(
                    context,
                    localizations.cravingStrategyDistractionTip3Title,
                    localizations.cravingStrategyDistractionTip3Desc,
                    Icons.phone,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showCompletionDialog(
                    context,
                    localizations.cravingStrategyDistractionTitle,
                    localizations.cravingStrategyCompleted,
                  );
                },
                child: Text(localizations.dialogCloseButton),
              ),
            ],
          ),
    );
  }

  Widget _buildDistractionTip(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCompletionDialog(
    BuildContext context,
    String strategy,
    String message,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(strategy),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.dialogCloseButton),
              ),
            ],
          ),
    );
  }

  void _showCravingLogModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const CravingLogModal(),
    );
  }
}
