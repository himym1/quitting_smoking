import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class OnboardingStepPackPrice extends ConsumerStatefulWidget {
  const OnboardingStepPackPrice({super.key});

  @override
  ConsumerState<OnboardingStepPackPrice> createState() =>
      _OnboardingStepPackPriceState();
}

class _OnboardingStepPackPriceState
    extends ConsumerState<OnboardingStepPackPrice> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentPackPrice = ref.read(onboardingNotifierProvider).packPrice;
    if (currentPackPrice != null) {
      _controller.text = currentPackPrice.toStringAsFixed(
        2,
      ); // Show two decimal places
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(onboardingNotifierProvider.notifier).updatePackPrice(value);
    }
  }

  String? _validateInput(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.fieldCannotBeEmpty;
    }
    final doubleValue = double.tryParse(value);
    if (doubleValue == null) {
      return l10n.invalidNumberError;
    }
    if (doubleValue <= 0) {
      return l10n.numberMustBePositiveError;
    }
    if (value.contains('.') && value.split('.')[1].length > 2) {
      return l10n.tooManyDecimalPlacesError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    ref.listen<OnboardingState>(onboardingNotifierProvider, (previous, next) {
      if (previous?.packPrice != next.packPrice) {
        if (next.packPrice != null) {
          final currentCursorPosition = _controller.selection;
          _controller.text = next.packPrice!.toStringAsFixed(2);
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
              l10n.step3Title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.step3Description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: l10n.packPriceLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              validator: (value) => _validateInput(value, l10n),
              onChanged: _onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
