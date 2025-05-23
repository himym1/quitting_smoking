import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class OnboardingStepDailyCigarettes extends ConsumerStatefulWidget {
  const OnboardingStepDailyCigarettes({super.key});

  @override
  ConsumerState<OnboardingStepDailyCigarettes> createState() =>
      _OnboardingStepDailyCigarettesState();
}

class _OnboardingStepDailyCigarettesState
    extends ConsumerState<OnboardingStepDailyCigarettes> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentDailyCigarettes =
        ref.read(onboardingNotifierProvider).dailyCigarettes;
    if (currentDailyCigarettes != null) {
      _controller.text = currentDailyCigarettes.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(onboardingNotifierProvider.notifier)
          .updateDailyCigarettes(value);
    }
  }

  String? _validateInput(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.fieldCannotBeEmpty;
    }
    final intValue = int.tryParse(value);
    if (intValue == null) {
      return l10n.invalidNumberError; // Assuming you add this to .arb files
    }
    if (intValue <= 0) {
      return l10n.numberMustBePositiveError; // Assuming you add this
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ref.listen<OnboardingState>(onboardingNotifierProvider, (previous, next) {
      if (previous?.dailyCigarettes != next.dailyCigarettes) {
        if (next.dailyCigarettes != null) {
          final currentCursorPosition = _controller.selection;
          _controller.text = next.dailyCigarettes.toString();
          // Restore cursor position
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
              l10n.step2Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.step2Description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: l10n.dailyCigarettesLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) => _validateInput(value, l10n),
              onChanged: _onChanged,
              // Save on next button press, not on every change
              // onSaved: (value) {
              //   if (value != null) {
              //     ref.read(onboardingNotifierProvider.notifier).updateDailyCigarettes(value);
              //   }
              // },
            ),
          ],
        ),
      ),
    );
  }
}
