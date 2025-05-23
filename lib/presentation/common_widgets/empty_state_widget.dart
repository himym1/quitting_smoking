import 'package:flutter/material.dart';
import 'package:quitting_smoking/presentation/common_widgets/lottie_animation.dart';
import 'package:quitting_smoking/presentation/common_widgets/primary_button.dart';

/// A widget to display an empty state with consistent styling throughout the app.
///
/// This widget can be used for empty lists, search results, or other states
/// where no data is available to display.
class EmptyStateWidget extends StatelessWidget {
  /// The title text to display
  final String title;

  /// The description text to display
  final String? description;

  /// The icon to display above the title
  final IconData? icon;

  /// The color of the icon, defaults to theme's primary color
  final Color? iconColor;

  /// The size of the icon
  final double iconSize;

  /// Optional lottie animation asset path to display instead of the icon
  final String? lottieAssetPath;

  /// The width of the lottie animation
  final double lottieWidth;

  /// The height of the lottie animation
  final double lottieHeight;

  /// Optional primary action button text
  final String? actionButtonText;

  /// Callback when the action button is pressed
  final VoidCallback? onActionPressed;

  const EmptyStateWidget({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.iconColor,
    this.iconSize = 80,
    this.lottieAssetPath,
    this.lottieWidth = 200,
    this.lottieHeight = 200,
    this.actionButtonText,
    this.onActionPressed,
  }) : assert(
         icon != null || lottieAssetPath != null,
         'Either icon or lottieAssetPath must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMedia(theme),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: 12),
              Text(
                description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionButtonText != null && onActionPressed != null) ...[
              const SizedBox(height: 24),
              PrimaryButton(
                text: actionButtonText!,
                onPressed: onActionPressed,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMedia(ThemeData theme) {
    if (lottieAssetPath != null) {
      return LottieAnimation(
        assetPath: lottieAssetPath!,
        width: lottieWidth,
        height: lottieHeight,
      );
    }

    return Icon(
      icon!,
      size: iconSize,
      color: iconColor ?? theme.colorScheme.primary.withOpacity(0.8),
    );
  }
}
