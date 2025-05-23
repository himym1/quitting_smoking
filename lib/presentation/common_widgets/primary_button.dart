import 'package:flutter/material.dart';

/// A primary styled button with consistent appearance throughout the app.
///
/// This button has the primary color of the app theme and is used for
/// primary actions in the UI.
class PrimaryButton extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// The callback when the button is pressed
  final VoidCallback? onPressed;

  /// Whether to show a loading indicator instead of text
  final bool isLoading;

  /// The width of the button, if null it will take the parent's width
  final double? width;

  /// The height of the button, defaults to 50
  final double height;

  /// Optional icon to display before the text
  final IconData? iconData;

  /// Padding around the button content
  final EdgeInsetsGeometry padding;

  /// Border radius of the button
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
    this.iconData,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          padding: padding,
          disabledBackgroundColor: theme.colorScheme.primary.withOpacity(0.5),
          disabledForegroundColor: theme.colorScheme.onPrimary.withOpacity(0.7),
        ),
        child: _buildChild(theme),
      ),
    );
  }

  Widget _buildChild(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: theme.colorScheme.onPrimary,
        ),
      );
    }

    if (iconData != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
