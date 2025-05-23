import 'package:flutter/material.dart';

/// A loading indicator widget with consistent styling throughout the app.
///
/// This widget can be used for full-screen loading states or inline loading.
class LoadingIndicator extends StatelessWidget {
  /// The size of the loading indicator
  final double size;

  /// The stroke width of the loading indicator
  final double strokeWidth;

  /// The color of the loading indicator, defaults to theme's primary color
  final Color? color;

  /// Whether to show a full-screen loading state with optional background
  final bool fullScreen;

  /// Background color when fullScreen is true
  final Color? backgroundColor;

  /// Optional text to display below the loading indicator
  final String? loadingText;

  const LoadingIndicator({
    super.key,
    this.size = 40,
    this.strokeWidth = 3,
    this.color,
    this.fullScreen = false,
    this.backgroundColor,
    this.loadingText,
  });

  /// Constructor for a full-screen loading indicator
  const LoadingIndicator.fullScreen({
    super.key,
    this.size = 50,
    this.strokeWidth = 4,
    this.color,
    this.backgroundColor,
    this.loadingText,
  }) : fullScreen = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.colorScheme.primary;

    final loadingIndicator = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            color: indicatorColor,
          ),
        ),
        if (loadingText != null) ...[
          const SizedBox(height: 16),
          Text(
            loadingText!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onBackground.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );

    if (!fullScreen) {
      return loadingIndicator;
    }

    return Container(
      color: backgroundColor ?? theme.colorScheme.background.withOpacity(0.9),
      width: double.infinity,
      height: double.infinity,
      child: Center(child: loadingIndicator),
    );
  }
}
