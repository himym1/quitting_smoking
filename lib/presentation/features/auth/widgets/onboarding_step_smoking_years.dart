import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class OnboardingStepSmokingYears extends ConsumerStatefulWidget {
  const OnboardingStepSmokingYears({super.key});

  @override
  ConsumerState<OnboardingStepSmokingYears> createState() =>
      _OnboardingStepSmokingYearsState();
}

class _OnboardingStepSmokingYearsState
    extends ConsumerState<OnboardingStepSmokingYears> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentSmokingYears =
        ref.read(onboardingNotifierProvider).smokingYears;
    if (currentSmokingYears != null) {
      _controller.text = currentSmokingYears.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    ref.read(onboardingNotifierProvider.notifier).updateSmokingYears(value);
  }

  String? _validateInput(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return null; // Optional field can be empty
    }
    final intValue = int.tryParse(value);
    if (intValue == null) {
      return l10n.invalidNumberError;
    }
    if (intValue < 0) {
      // Smoking years can be 0 (e.g. started very recently)
      return l10n.numberCannotBeNegativeError; // Add this to .arb
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    ref.listen<OnboardingState>(onboardingNotifierProvider, (previous, next) {
      if (previous?.smokingYears != next.smokingYears) {
        if (next.smokingYears != null) {
          final currentCursorPosition = _controller.selection;
          _controller.text = next.smokingYears.toString();
          if (currentCursorPosition.start < _controller.text.length &&
              currentCursorPosition.end < _controller.text.length) {
            _controller.selection = currentCursorPosition;
          } else {
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          }
        } else {
          // If user clears it or it becomes null through other means
          _controller.clear();
        }
      }
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.step4Title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.step4Description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: l10n.smokingYearsLabel,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) => _validateInput(value, l10n),
            onChanged: _onChanged,
          ),
        ],
      ),
    );
  }
}
