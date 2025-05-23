import 'package:flutter/material.dart';

/// A section title widget with consistent styling throughout the app.
///
/// This widget is used to display section titles in lists or pages.
class SectionTitle extends StatelessWidget {
  /// The title text to display
  final String title;

  /// Optional subtitle text to display
  final String? subtitle;

  /// Optional action text to display
  final String? actionText;

  /// Callback when the action text is tapped
  final VoidCallback? onAction;

  /// Text style override for the title
  final TextStyle? titleStyle;

  /// Text style override for the subtitle
  final TextStyle? subtitleStyle;

  /// Text style override for the action text
  final TextStyle? actionTextStyle;

  /// Icon to display with the action text
  final IconData? actionIcon;

  /// Padding around the section title
  final EdgeInsetsGeometry padding;

  /// Whether to show a divider below the section title
  final bool showDivider;

  /// Color of the divider, defaults to theme's divider color
  final Color? dividerColor;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onAction,
    this.titleStyle,
    this.subtitleStyle,
    this.actionTextStyle,
    this.actionIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.showDivider = false,
    this.dividerColor,
  }) : assert(
         actionText == null || onAction != null,
         'If actionText is provided, onAction must also be provided',
       );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          titleStyle ??
                          theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onBackground,
                          ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style:
                            subtitleStyle ??
                            theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onBackground.withOpacity(
                                0.7,
                              ),
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              if (actionText != null && onAction != null)
                InkWell(
                  onTap: onAction,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          actionText!,
                          style:
                              actionTextStyle ??
                              theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        if (actionIcon != null) ...[
                          const SizedBox(width: 4),
                          Icon(
                            actionIcon,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: dividerColor ?? theme.dividerColor.withOpacity(0.5),
          ),
      ],
    );
  }
}
