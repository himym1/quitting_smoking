import 'package:flutter/material.dart';

/// A secondary styled button with consistent appearance throughout the app.
///
/// This button has an outlined style and is used for secondary actions in the UI.
class SecondaryButton extends StatelessWidget {
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

  /// Border color override, default is theme's primary color
  final Color? borderColor;

  /// Text color override, default is theme's primary color
  final Color? textColor;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 50,
    this.iconData,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.borderRadius = 12,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final actualBorderColor = borderColor ?? primaryColor;
    final actualTextColor = textColor ?? primaryColor;

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: actualTextColor,
          side: BorderSide(color: actualBorderColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: _buildChild(theme, actualTextColor),
      ),
    );
  }

  Widget _buildChild(ThemeData theme, Color textColor) {
    if (isLoading) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 2, color: textColor),
      );
    }

    if (iconData != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 20, color: textColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
