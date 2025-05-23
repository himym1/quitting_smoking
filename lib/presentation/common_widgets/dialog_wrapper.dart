import 'package:flutter/material.dart';
import 'package:quitting_smoking/presentation/common_widgets/primary_button.dart';
import 'package:quitting_smoking/presentation/common_widgets/secondary_button.dart';

/// A wrapper widget for dialogs with consistent styling throughout the app.
///
/// This widget provides a standard layout for dialogs with optional title,
/// content, primary and secondary actions.
class DialogWrapper extends StatelessWidget {
  /// The title of the dialog
  final String? title;

  /// The content widget of the dialog
  final Widget content;

  /// The text for the primary action button
  final String? primaryActionText;

  /// Callback when the primary action button is pressed
  final VoidCallback? onPrimaryAction;

  /// The text for the secondary action button
  final String? secondaryActionText;

  /// Callback when the secondary action button is pressed
  final VoidCallback? onSecondaryAction;

  /// Whether to show a close icon in the top right corner
  final bool showCloseIcon;

  /// The padding around the dialog content
  final EdgeInsetsGeometry contentPadding;

  /// The padding around the dialog actions
  final EdgeInsetsGeometry actionsPadding;

  /// The spacing between action buttons
  final double actionsSpacing;

  /// Whether the primary button should be in loading state
  final bool isPrimaryActionLoading;

  /// Whether the dialog should be dismissible by tapping outside
  final bool barrierDismissible;

  /// Whether to arrange the action buttons vertically
  final bool verticalActions;

  const DialogWrapper({
    super.key,
    this.title,
    required this.content,
    this.primaryActionText,
    this.onPrimaryAction,
    this.secondaryActionText,
    this.onSecondaryAction,
    this.showCloseIcon = true,
    this.contentPadding = const EdgeInsets.all(16),
    this.actionsPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16),
    this.actionsSpacing = 12,
    this.isPrimaryActionLoading = false,
    this.barrierDismissible = true,
    this.verticalActions = false,
  });

  /// Show a dialog with this wrapper
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    String? primaryActionText,
    VoidCallback? onPrimaryAction,
    String? secondaryActionText,
    VoidCallback? onSecondaryAction,
    bool showCloseIcon = true,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(16),
    EdgeInsetsGeometry actionsPadding = const EdgeInsets.fromLTRB(
      16,
      0,
      16,
      16,
    ),
    double actionsSpacing = 12,
    bool isPrimaryActionLoading = false,
    bool barrierDismissible = true,
    bool verticalActions = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder:
          (context) => DialogWrapper(
            title: title,
            content: content,
            primaryActionText: primaryActionText,
            onPrimaryAction: onPrimaryAction,
            secondaryActionText: secondaryActionText,
            onSecondaryAction: onSecondaryAction,
            showCloseIcon: showCloseIcon,
            contentPadding: contentPadding,
            actionsPadding: actionsPadding,
            actionsSpacing: actionsSpacing,
            isPrimaryActionLoading: isPrimaryActionLoading,
            verticalActions: verticalActions,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: theme.colorScheme.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      iconSize: 24,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                ],
              ),
            ),
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
