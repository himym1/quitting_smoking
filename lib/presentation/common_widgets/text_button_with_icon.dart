import 'package:flutter/material.dart';

/// A text button with an icon for consistent styling throughout the app.
///
/// This button is used for tertiary actions or links in the UI.
class TextButtonWithIcon extends StatelessWidget {
  /// The text to display on the button
  final String text;

  /// The callback when the button is pressed
  final VoidCallback? onPressed;

  /// The icon to display next to the text
  final IconData iconData;

  /// Whether the icon should be displayed before or after the text
  final bool iconBefore;

  /// The spacing between the icon and text
  final double spacing;

  /// The color of the button, defaults to theme's primary color
  final Color? color;

  /// The text style override
  final TextStyle? textStyle;

  /// The icon size
  final double iconSize;

  const TextButtonWithIcon({
    super.key,
    required this.text,
    this.onPressed,
    required this.iconData,
    this.iconBefore = true,
    this.spacing = 8,
    this.color,
    this.textStyle,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = color ?? theme.colorScheme.primary;

    final buttonText = Text(
      text,
      style: (textStyle ?? theme.textTheme.labelLarge)?.copyWith(
        color: buttonColor,
        fontWeight: FontWeight.w500,
      ),
    );

    final buttonIcon = Icon(iconData, size: iconSize, color: buttonColor);

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            iconBefore
                ? [buttonIcon, SizedBox(width: spacing), buttonText]
                : [buttonText, SizedBox(width: spacing), buttonIcon],
      ),
    );
  }
}
