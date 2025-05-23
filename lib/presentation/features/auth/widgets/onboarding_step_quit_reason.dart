import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class OnboardingStepQuitReason extends ConsumerStatefulWidget {
  const OnboardingStepQuitReason({super.key});

  @override
  ConsumerState<OnboardingStepQuitReason> createState() =>
      _OnboardingStepQuitReasonState();
}

class _OnboardingStepQuitReasonState
    extends ConsumerState<OnboardingStepQuitReason> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentQuitReason = ref.read(onboardingNotifierProvider).quitReason;
    if (currentQuitReason != null) {
      _controller.text = currentQuitReason;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(onboardingNotifierProvider.notifier).updateQuitReason(value);
    }
  }

  String? _validateInput(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldCannotBeEmpty;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ref.listen<OnboardingState>(onboardingNotifierProvider, (previous, next) {
      if (previous?.quitReason != next.quitReason) {
        if (next.quitReason != null) {
          final currentCursorPosition = _controller.selection;
          _controller.text = next.quitReason!;
          if (currentCursorPosition.start < _controller.text.length &&
              currentCursorPosition.end < _controller.text.length) {
            _controller.selection = currentCursorPosition;
          } else {
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          }
        } else {
          _controller.clear();
        }
      }
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              l10n.step5Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.step5Description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: l10n.quitReasonHint,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
              minLines: 3,
              validator: (value) => _validateInput(value, l10n),
              onChanged: _onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
