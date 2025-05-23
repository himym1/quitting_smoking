import 'package:flutter/material.dart';
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';

class HealthMilestoneCountdown extends StatelessWidget {
  final HealthBenefitMilestone milestone;
  final Duration quitDuration;
  final VoidCallback onTap;

  const HealthMilestoneCountdown({
    super.key,
    required this.milestone,
    required this.quitDuration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate milestone duration in seconds
    final milestoneDurationInSeconds = milestone.timeThresholdInMinutes * 60;

    // Calculate elapsed time in seconds
    final elapsedSeconds = quitDuration.inSeconds;

    // Calculate progress percentage (capped at 100%)
    final progress = (elapsedSeconds / milestoneDurationInSeconds).clamp(
      0.0,
      1.0,
    );

    // Calculate remaining time
    final remainingSeconds = milestoneDurationInSeconds - elapsedSeconds;
    final bool achieved = remainingSeconds <= 0;

    // Format remaining time text
    String remainingTimeText;
    if (achieved) {
      remainingTimeText = "已达成";
    } else {
      final remainingDays = remainingSeconds ~/ (24 * 3600);
      final remainingHours = (remainingSeconds % (24 * 3600)) ~/ 3600;

      if (remainingDays > 0) {
        remainingTimeText = "还需 $remainingDays 天 $remainingHours 小时";
      } else if (remainingHours > 0) {
        final remainingMinutes = (remainingSeconds % 3600) ~/ 60;
        remainingTimeText = "还需 $remainingHours 小时 $remainingMinutes 分钟";
      } else {
        final remainingMinutes = remainingSeconds ~/ 60;
        remainingTimeText = "还需 $remainingMinutes 分钟";
      }
    }

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _getIconData(milestone.iconName),
                    color:
                        achieved
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getLocalizedTitle(context, milestone.titleKey),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          remainingTimeText,
                          style: TextStyle(
                            color: achieved ? Colors.green : Colors.grey[600],
                            fontWeight:
                                achieved ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (achieved)
                    const Icon(Icons.check_circle, color: Colors.green)
                  else
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    achieved ? Colors.green : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to get the correct icon based on the icon name
  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'favorite_border':
        return Icons.favorite_border;
      case 'bloodtype':
        return Icons.bloodtype;
      case 'local_hospital':
        return Icons.local_hospital;
      case 'self_improvement':
        return Icons.self_improvement;
      case 'directions_walk':
        return Icons.directions_walk;
      case 'healing':
        return Icons.healing;
      default:
        return Icons.help_outline; // Default icon
    }
  }

  // Helper method to get localized title
  String _getLocalizedTitle(BuildContext context, String titleKey) {
    // For now, we're just returning the key since we don't know the exact localization structure
    // In a real implementation, you would use the AppLocalizations to get the localized string
    return titleKey;
  }
}
