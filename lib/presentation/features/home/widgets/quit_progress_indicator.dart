import 'package:flutter/material.dart';

class QuitProgressIndicator extends StatelessWidget {
  final Duration quitDuration;
  final int totalDaysToGoal;
  final String centerText;
  final String bottomLabel;
  final Color progressColor;

  /// A widget that displays circular progress indicator for quitting smoking journey
  ///
  /// [quitDuration] - How long since the user quit smoking
  /// [totalDaysToGoal] - Total days to reach the goal (for progress calculation)
  /// [centerText] - Text to display in the center of the circle (usually days count)
  /// [bottomLabel] - Label to display below the progress indicator
  /// [progressColor] - Color of the progress indicator
  const QuitProgressIndicator({
    super.key,
    required this.quitDuration,
    required this.totalDaysToGoal,
    required this.centerText,
    required this.bottomLabel,
    this.progressColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress =
        totalDaysToGoal > 0
            ? (quitDuration.inDays / totalDaysToGoal).clamp(0.0, 1.0)
            : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 10,
                backgroundColor: Colors.grey.shade200,
                color: progressColor,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  centerText,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
                Text('天', style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          bottomLabel,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
