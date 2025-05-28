import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({super.key});

  @override
  ConsumerState<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // MVP: Add _termsAccepted check if implemented
      // if (!_termsAccepted) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(AppLocalizations.of(context)!.pleaseAcceptTerms)), // Add this to l10n
      //   );
      //   return;
      // }
      ref
          .read(authNotifierProvider.notifier)
          .register(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    final localizations = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: localizations.emailLabel,
              hintText: localizations.emailHint,
              prefixIcon: const Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.fieldRequiredError;
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return localizations.invalidEmailFormatError;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: localizations.passwordLabel,
              hintText: localizations.passwordHint,
              prefixIcon: const Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.fieldRequiredError;
              }
              // Add more password strength validation if needed
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              labelText: localizations.confirmPasswordLabel,
              hintText: localizations.confirmPasswordHint,
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.fieldRequiredError;
              }
              if (value != _passwordController.text) {
                return localizations.passwordMismatchError;
              }
              return null;
            },
          ),
          const SizedBox(height: 24), // Spacing before terms (optional)
          // MVP: Optional Terms and Conditions Checkbox
          // CheckboxListTile(
          //   title: Text(localizations.termsAndConditionsCheckboxLabel),
          //   value: _termsAccepted,
          //   onChanged: (bool? newValue) {
          //     setState(() {
          //       _termsAccepted = newValue ?? false;
          //     });
          //   },
          //   controlAffinity: ListTileControlAffinity.leading,
          //   contentPadding: EdgeInsets.zero,
          //   validator: (value) { // This validator on CheckboxListTile might not work as expected for form validation
          //     if (!value!) { // This needs to be handled in _submitForm
          //       return localizations.pleaseAcceptTerms; // Add this to l10n
          //     }
          //     return null;
          //   },
          // ),
          // const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isLoading ? null : _submitForm,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child:
                isLoading
                    ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                    : Text(localizations.registerButtonText),
          ),
        ],
      ),
    );
  }
}
