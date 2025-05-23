import 'package:flutter/material.dart';

/// A custom card widget with consistent styling throughout the app.
///
/// This card has customizable elevation, padding, background color,
/// border radius, and border.
class CustomCard extends StatelessWidget {
  /// The child widget to display inside the card
  final Widget child;

  /// The padding around the child
  final EdgeInsetsGeometry padding;

  /// The margin around the card
  final EdgeInsetsGeometry? margin;

  /// The elevation of the card
  final double elevation;

  /// The color of the card
  final Color? color;

  /// The border radius of the card
  final double borderRadius;

  /// The border of the card
  final Border? border;

  /// The width of the card, if null it will take the parent's width
  final double? width;

  /// The height of the card
  final double? height;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Whether to add a ripple effect when tapped
  final bool enableRipple;

  const CustomCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin,
    this.elevation = 1,
    this.color,
    this.borderRadius = 12,
    this.border,
    this.width,
    this.height,
    this.onTap,
    this.enableRipple = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = color ?? theme.colorScheme.surface;

    final Widget cardContent = Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow:
            elevation > 0
                ? [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.1),
                    blurRadius: elevation * 2,
                    spreadRadius: elevation / 2,
                    offset: Offset(0, elevation),
                  ),
                ]
                : null,
      ),
      child: child,
    );

    if (onTap == null) {
      return Container(margin: margin, child: cardContent);
    }

    return Container(
      margin: margin,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor:
              enableRipple
                  ? theme.colorScheme.primary.withOpacity(0.1)
                  : Colors.transparent,
          highlightColor:
              enableRipple
                  ? theme.colorScheme.primary.withOpacity(0.05)
                  : Colors.transparent,
          child: cardContent,
        ),
      ),
    );
  }
}
