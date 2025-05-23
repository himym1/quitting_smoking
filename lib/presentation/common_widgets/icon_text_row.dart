import 'package:flutter/material.dart';

/// A widget that displays an icon and text in a row with consistent styling.
///
/// This widget is commonly used in lists, settings pages, and other places
/// where an icon and text need to be displayed together.
class IconTextRow extends StatelessWidget {
  /// The icon to display
  final IconData icon;

  /// The text to display next to the icon
  final String text;

  /// Optional secondary text to display below the primary text
  final String? secondaryText;

  /// The color of the icon, defaults to theme's onBackground color
  final Color? iconColor;

  /// The size of the icon
  final double iconSize;

  /// The spacing between the icon and text
  final double spacing;

  /// Text style override for the primary text
  final TextStyle? textStyle;

  /// Text style override for the secondary text
  final TextStyle? secondaryTextStyle;

  /// Callback when the row is tapped
  final VoidCallback? onTap;

  /// Whether to show a trailing arrow icon
  final bool showTrailingArrow;

  /// Custom trailing widget to display instead of the arrow icon
  final Widget? trailing;

  /// Padding around the row
  final EdgeInsetsGeometry padding;

  const IconTextRow({
    super.key,
    required this.icon,
    required this.text,
    this.secondaryText,
    this.iconColor,
    this.iconSize = 24,
    this.spacing = 16,
    this.textStyle,
    this.secondaryTextStyle,
    this.onTap,
    this.showTrailingArrow = false,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  }) : assert(
         !(showTrailingArrow && trailing != null),
         'Cannot provide both showTrailingArrow and trailing',
       );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actualIconColor =
        iconColor ?? theme.colorScheme.onBackground.withOpacity(0.8);

    final content = Padding(
      padding: padding,
      child: Row(
        children: [
          Icon(icon, size: iconSize, color: actualIconColor),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style:
                      textStyle ??
                      theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onBackground,
                      ),
                ),
                if (secondaryText != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    secondaryText!,
                    style:
                        secondaryTextStyle ??
                        theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onBackground.withOpacity(
                            0.6,
                          ),
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (showTrailingArrow)
            Icon(
              Icons.chevron_right,
              size: 20,
              color: theme.colorScheme.onBackground.withOpacity(0.5),
            )
          else if (trailing != null)
            trailing!,
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(onTap: onTap, child: content);
  }
}

/// A widget that displays an icon and text in a column with consistent styling.
///
/// This is similar to IconTextRow but arranged vertically.
class IconTextColumn extends StatelessWidget {
  /// The icon to display
  final IconData icon;

  /// The text to display below the icon
  final String text;

  /// The color of the icon, defaults to theme's onBackground color
  final Color? iconColor;

  /// The size of the icon
  final double iconSize;

  /// The spacing between the icon and text
  final double spacing;

  /// Text style override for the text
  final TextStyle? textStyle;

  /// Callback when the column is tapped
  final VoidCallback? onTap;

  /// Padding around the column
  final EdgeInsetsGeometry padding;

  /// The maximum width of the column
  final double? maxWidth;

  /// Whether to center the content horizontally
  final bool centerContent;

  const IconTextColumn({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.iconSize = 24,
    this.spacing = 8,
    this.textStyle,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.maxWidth,
    this.centerContent = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actualIconColor =
        iconColor ?? theme.colorScheme.onBackground.withOpacity(0.8);

    final content = Padding(
      padding: padding,
      child: Container(
        constraints:
            maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              centerContent
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
          children: [
            Icon(icon, size: iconSize, color: actualIconColor),
            SizedBox(height: spacing),
            Text(
              text,
              style:
                  textStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
              textAlign: centerContent ? TextAlign.center : TextAlign.start,
            ),
          ],
        ),
      ),
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: content,
    );
  }
}
