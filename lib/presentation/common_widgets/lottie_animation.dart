import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A widget that displays Lottie animations with common configuration options.
///
/// This widget simplifies the use of Lottie animations throughout the app by
/// providing a standardized interface with common options.
class LottieAnimation extends StatelessWidget {
  /// The Lottie animation asset path
  final String assetPath;

  /// The width of the animation
  final double? width;

  /// The height of the animation
  final double? height;

  /// Whether the animation should repeat
  final bool repeat;

  /// Whether the animation should play in reverse after completing
  final bool reverse;

  /// Whether the animation should automatically play
  final bool autoPlay;

  /// Animation duration override
  final Duration? duration;

  /// Callback when animation completes
  final VoidCallback? onComplete;

  /// Controller for manually controlling the animation
  final AnimationController? controller;

  /// Whether to maintain the animation's aspect ratio
  final bool maintainAspectRatio;

  const LottieAnimation({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.repeat = true,
    this.reverse = false,
    this.autoPlay = true,
    this.duration,
    this.onComplete,
    this.controller,
    this.maintainAspectRatio = true,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      width: width,
      height: height,
      repeat: repeat,
      reverse: reverse,
      animate: autoPlay,
      controller: controller,
      onLoaded:
          duration != null
              ? (composition) {
                if (controller != null) {
                  controller!.duration = duration ?? composition.duration;
                }
              }
              : null,
      fit: maintainAspectRatio ? BoxFit.contain : BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        debugPrint('Error loading Lottie animation: $error');
        return SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: Icon(Icons.error_outline, color: Colors.red),
          ),
        );
      },
    );
  }
}
