import 'package:flutter/material.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class BreathingExerciseGuidePage extends StatefulWidget {
  const BreathingExerciseGuidePage({super.key});

  @override
  State<BreathingExerciseGuidePage> createState() =>
      _BreathingExerciseGuidePageState();
}

class _BreathingExerciseGuidePageState extends State<BreathingExerciseGuidePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  // 呼吸阶段
  String _breathPhase = '';
  int _secondsRemaining = 60; // 1分钟的练习时间
  bool _isExerciseCompleted = false;

  @override
  void initState() {
    super.initState();

    // 设置动画控制器
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), // 完整的呼吸周期是8秒
    );

    // 定义缩放动画
    _scaleAnimation = TweenSequence<double>([
      // 吸气阶段 (0-0.3)：从1.0缩放到1.4
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.4), weight: 30),
      // 屏息阶段 (0.3-0.6)：保持1.4
      TweenSequenceItem(tween: Tween<double>(begin: 1.4, end: 1.4), weight: 30),
      // 呼气阶段 (0.6-1.0)：从1.4缩放回1.0
      TweenSequenceItem(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 40),
    ]).animate(_animationController);

    // 定义颜色动画
    _colorAnimation = TweenSequence<Color?>([
      // 吸气阶段：从浅蓝色到深蓝色
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.lightBlue[200], end: Colors.blue[600]),
        weight: 30,
      ),
      // 屏息阶段：保持深蓝色
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue[600], end: Colors.blue[700]),
        weight: 30,
      ),
      // 呼气阶段：从深蓝色到浅蓝色
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue[700], end: Colors.lightBlue[200]),
        weight: 40,
      ),
    ]).animate(_animationController);

    // 监听动画值的变化，更新呼吸阶段提示
    _animationController.addListener(() {
      final value = _animationController.value;
      setState(() {
        if (value < 0.3) {
          _breathPhase = AppLocalizations.of(context).breathingPhaseInhale;
        } else if (value < 0.6) {
          _breathPhase = AppLocalizations.of(context).breathingPhaseHold;
        } else {
          _breathPhase = AppLocalizations.of(context).breathingPhaseExhale;
        }
      });
    });

    // 设置动画完成后的回调
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 一次呼吸周期结束后，重置动画继续下一个周期
        _animationController.reset();
        _animationController.forward();

        // 更新剩余时间
        setState(() {
          if (_secondsRemaining > 8) {
            _secondsRemaining -= 8; // 减去一个周期的时间
          } else {
            _secondsRemaining = 0;
            _isExerciseCompleted = true;
            _animationController.stop(); // 练习结束，停止动画
            _showCompletionDialog(); // 显示完成对话框
          }
        });
      }
    });

    // 启动动画
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                title: Text(
                  AppLocalizations.of(context).breathingExerciseCompletedTitle,
                ),
                content: Text(
                  AppLocalizations.of(context).breathingExerciseCompletedDesc,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // 关闭对话框
                      Navigator.of(context).pop();
                      // 返回到烟瘾应对策略页面
                      context.go('/craving-coping-strategies');
                    },
                    child: Text(
                      AppLocalizations.of(context).backToStrategiesButton,
                    ),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.breathingExerciseTitle),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // 返回上一页
            context.go('/craving-coping-strategies');
          },
        ),
      ),
      backgroundColor: Colors.lightBlue[50], // 轻柔的背景色
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isExerciseCompleted
                    ? localizations.breathingExerciseCompletedTitle
                    : localizations.breathingExerciseInstruction,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 剩余时间显示
              Text(
                _isExerciseCompleted
                    ? localizations.breathingExerciseCompleted
                    : localizations.breathingExerciseTimeRemaining(
                      _secondsRemaining.toString(),
                    ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),

              // 呼吸动画
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Column(
                    children: [
                      // 呼吸阶段文本
                      Text(
                        _breathPhase,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: _colorAnimation.value),
                      ),
                      const SizedBox(height: 30),

                      // 呼吸圆圈动画
                      Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _colorAnimation.value!.withOpacity(0.5),
                            border: Border.all(
                              color: _colorAnimation.value!,
                              width: 3,
                            ),
                          ),
                          child: Icon(Icons.air, size: 60, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 60),

              // 手动中止按钮
              if (!_isExerciseCompleted)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isExerciseCompleted = true;
                      _animationController.stop();
                    });
                    _showCompletionDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(localizations.breathingExerciseFinishEarly),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
