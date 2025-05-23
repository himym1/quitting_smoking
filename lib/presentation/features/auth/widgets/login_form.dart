import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';

import '../../../../l10n/app_localizations.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authNotifierProvider.notifier)
          .login(_emailController.text.trim(), _passwordController.text.trim());
    }
  }

  String? _validateEmail(String? value) {
    final l10n = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return l10n.fieldRequiredError;
    }
    // Basic email validation regex
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegex.hasMatch(value)) {
      return l10n.invalidEmailFormatError;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.fieldRequiredError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authNotifierProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: l10n.emailLabel,
              hintText: l10n.emailHint,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: l10n.passwordLabel,
              hintText: l10n.passwordHint,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            obscureText: !_passwordVisible,
            validator: _validatePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed:
                authState.whenOrNull(loading: () => true) == true
                    ? null
                    : _submitForm,
            child: authState.when(
              initial: () => Text(l10n.loginButtonText),
              loading:
                  () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
              authenticated:
                  (_) => Text(
                    l10n.loginButtonText,
                  ), // Button should ideally be disabled or hidden
              unauthenticated: (_) => Text(l10n.loginButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
