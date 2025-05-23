import 'package:flutter/material.dart';

class QuitProgressIndicator extends StatelessWidget {
  final Duration quitDuration;
  final int targetDays;
  final String centerText;
  final Color progressColor;
  final Color backgroundColor;
  final double size;
  final double strokeWidth;

  const QuitProgressIndicator({
    super.key,
    required this.quitDuration,
    this.targetDays = 30, // 默认目标为30天
    required this.centerText,
    this.progressColor = Colors.green,
    this.backgroundColor = Colors.grey,
    this.size = 150.0,
    this.strokeWidth = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    // 计算戒烟天数所占的比例，最大为1.0（100%）
    final daysQuit = quitDuration.inDays;
    final progress = (daysQuit / targetDays).clamp(0.0, 1.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景圆圈
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                backgroundColor.withOpacity(0.1),
              ),
            ),
          ),

          // 进度圆圈
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: strokeWidth,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),

          // 中心文字
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                centerText,
                style: TextStyle(
                  fontSize: size * 0.18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "$daysQuit / $targetDays 天",
                style: TextStyle(
                  fontSize: size * 0.12,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
