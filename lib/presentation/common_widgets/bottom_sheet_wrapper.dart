import 'package:flutter/material.dart';
import 'package:quitting_smoking/presentation/common_widgets/primary_button.dart';
import 'package:quitting_smoking/presentation/common_widgets/secondary_button.dart';

/// A wrapper widget for bottom sheets with consistent styling throughout the app.
///
/// This widget provides a standard layout for bottom sheets with optional title,
/// content, primary and secondary actions.
class BottomSheetWrapper extends StatelessWidget {
  /// The title of the bottom sheet
  final String? title;

  /// The content widget of the bottom sheet
  final Widget content;

  /// The text for the primary action button
  final String? primaryActionText;

  /// Callback when the primary action button is pressed
  final VoidCallback? onPrimaryAction;

  /// The text for the secondary action button
  final String? secondaryActionText;

  /// Callback when the secondary action button is pressed
  final VoidCallback? onSecondaryAction;

  /// Whether to show a handle at the top of the bottom sheet
  final bool showHandle;

  /// Whether to show a close icon in the top right corner
  final bool showCloseIcon;

  /// The padding around the bottom sheet content
  final EdgeInsetsGeometry contentPadding;

  /// The padding around the bottom sheet actions
  final EdgeInsetsGeometry actionsPadding;

  /// The spacing between action buttons
  final double actionsSpacing;

  /// Whether the primary button should be in loading state
  final bool isPrimaryActionLoading;

  /// Whether to arrange the action buttons vertically
  final bool verticalActions;

  /// The maximum height of the bottom sheet as a fraction of the screen height
  final double maxHeightFactor;

  /// The minimum height of the bottom sheet
  final double? minHeight;

  /// Whether the bottom sheet should be scrollable
  final bool isScrollable;

  const BottomSheetWrapper({
    super.key,
    this.title,
    required this.content,
    this.primaryActionText,
    this.onPrimaryAction,
    this.secondaryActionText,
    this.onSecondaryAction,
    this.showHandle = true,
    this.showCloseIcon = false,
    this.contentPadding = const EdgeInsets.all(16),
    this.actionsPadding = const EdgeInsets.all(16),
    this.actionsSpacing = 12,
    this.isPrimaryActionLoading = false,
    this.verticalActions = true,
    this.maxHeightFactor = 0.9,
    this.minHeight,
    this.isScrollable = true,
  });

  /// Show a modal bottom sheet with this wrapper
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    String? primaryActionText,
    VoidCallback? onPrimaryAction,
    String? secondaryActionText,
    VoidCallback? onSecondaryAction,
    bool showHandle = true,
    bool showCloseIcon = false,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(16),
    EdgeInsetsGeometry actionsPadding = const EdgeInsets.all(16),
    double actionsSpacing = 12,
    bool isPrimaryActionLoading = false,
    bool verticalActions = true,
    double maxHeightFactor = 0.9,
    double? minHeight,
    bool isScrollable = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape:
          shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
      builder:
          (context) => BottomSheetWrapper(
            title: title,
            content: content,
            primaryActionText: primaryActionText,
            onPrimaryAction: onPrimaryAction,
            secondaryActionText: secondaryActionText,
            onSecondaryAction: onSecondaryAction,
            showHandle: showHandle,
            showCloseIcon: showCloseIcon,
            contentPadding: contentPadding,
            actionsPadding: actionsPadding,
            actionsSpacing: actionsSpacing,
            isPrimaryActionLoading: isPrimaryActionLoading,
            verticalActions: verticalActions,
            maxHeightFactor: maxHeightFactor,
            minHeight: minHeight,
            isScrollable: isScrollable,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: screenHeight * maxHeightFactor,
        minHeight: minHeight ?? 0,
      ),
      padding: EdgeInsets.only(bottom: viewInsets),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showHandle)
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          if (title != null || showCloseIcon)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  if (showCloseIcon)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                      iconSize: 24,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                ],
              ),
            ),
          if (isScrollable)
            Flexible(
              child: SingleChildScrollView(
                padding: contentPadding,
                child: content,
              ),
            )
          else
            Padding(padding: contentPadding, child: content),
          if (primaryActionText != null || secondaryActionText != null)
            Padding(padding: actionsPadding, child: _buildActions(context)),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    if (verticalActions) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (primaryActionText != null)
            PrimaryButton(
              text: primaryActionText!,
              onPressed:
                  onPrimaryAction != null
                      ? () {
                        onPrimaryAction!();
                      }
                      : null,
              isLoading: isPrimaryActionLoading,
            ),
          if (primaryActionText != null && secondaryActionText != null)
            SizedBox(height: actionsSpacing),
          if (secondaryActionText != null)
            SecondaryButton(
              text: secondaryActionText!,
              onPressed: onSecondaryAction ?? () => Navigator.of(context).pop(),
            ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (secondaryActionText != null)
          Expanded(
            child: SecondaryButton(
              text: secondaryActionText!,
              onPressed: onSecondaryAction ?? () => Navigator.of(context).pop(),
            ),
          ),
        if (secondaryActionText != null && primaryActionText != null)
          SizedBox(width: actionsSpacing),
        if (primaryActionText != null)
          Expanded(
            child: PrimaryButton(
              text: primaryActionText!,
              onPressed:
                  onPrimaryAction != null
                      ? () {
                        onPrimaryAction!();
                      }
                      : null,
              isLoading: isPrimaryActionLoading,
            ),
          ),
      ],
    );
  }
}
