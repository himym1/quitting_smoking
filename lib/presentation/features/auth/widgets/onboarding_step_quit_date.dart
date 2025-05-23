import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class OnboardingStepQuitDate extends ConsumerWidget {
  const OnboardingStepQuitDate({super.key});

  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final currentQuitDateTime =
        ref.read(onboardingNotifierProvider).quitDateTime;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentQuitDateTime ?? now,
      firstDate: now.subtract(
        const Duration(days: 30),
      ), // Allow past date for flexibility if needed, or just 'now'
      lastDate: now.add(
        const Duration(days: 365 * 5),
      ), // Allow up to 5 years in future
    );
    if (pickedDate != null) {
      final DateTime currentSelection = currentQuitDateTime ?? now;
      final newDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        currentSelection.hour,
        currentSelection.minute,
      );
      notifier.updateQuitDateTime(newDateTime);
    }
  }

  Future<void> _selectTime(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    final notifier = ref.read(onboardingNotifierProvider.notifier);
    final currentQuitDateTime =
        ref.read(onboardingNotifierProvider).quitDateTime;
    final initialTime = TimeOfDay.fromDateTime(currentQuitDateTime ?? now);

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      final DateTime currentSelection = currentQuitDateTime ?? now;
      final newDateTime = DateTime(
        currentSelection.year,
        currentSelection.month,
        currentSelection.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      notifier.updateQuitDateTime(newDateTime);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final quitDateTime = ref.watch(onboardingNotifierProvider).quitDateTime;
    final dateFormat = DateFormat.yMd(l10n.localeName);
    final timeFormat = DateFormat.jm(l10n.localeName);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.step1Title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.step1Description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Text(
            quitDateTime == null
                ? l10n.pleaseSelectDateTime
                : '${l10n.selectDateButton}: ${dateFormat.format(quitDateTime)}\n${l10n.selectTimeButton}: ${timeFormat.format(quitDateTime)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _selectDate(context, ref),
                child: Text(l10n.selectDateButton),
              ),
              ElevatedButton(
                onPressed: () => _selectTime(context, ref),
                child: Text(l10n.selectTimeButton),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
