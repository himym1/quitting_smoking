import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/core/router/app_router.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/registration_form.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

import '../../../../l10n/app_localizations.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      logDebug('注册页监听到认证状态变化: $previous -> $next', tag: 'RegistrationPage');
      next.maybeWhen(
        authenticated: (userProfile) {
          logInfo(
            '注册成功，用户资料: $userProfile, 引导完成状态: ${userProfile.onboardingCompleted}',
            tag: 'RegistrationPage',
          );
          // 添加延迟，确保状态已完全更新
          Future.delayed(const Duration(milliseconds: 800), () {
            // Navigate to onboarding or home based on onboardingCompleted status
            if (!userProfile.onboardingCompleted) {
              logDebug('将导航到引导页', tag: 'RegistrationPage');
              if (context.mounted) {
                context.go(AppRoute.onboarding.path);
              }
            } else {
              // This case might be less common directly after registration
              // but good to handle if registration implies auto-login and profile already existed.
              logDebug('将导航到主页', tag: 'RegistrationPage');
              if (context.mounted) {
                context.go(AppRoute.home.path);
              }
            }
          });
        },
        unauthenticated: (message) {
          if (message != null && message.isNotEmpty) {
            String displayMessage;
            if (message == 'emailAlreadyInUseError') {
              displayMessage = localizations.emailAlreadyInUseError;
            } else if (message == 'registrationFailedError') {
              displayMessage = localizations.registrationFailedError;
            } else {
              displayMessage =
                  localizations.registrationFailedError; // Default fallback
            }
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(displayMessage)));
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.registrationPageTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                localizations.createYourAccount,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const RegistrationForm(),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: localizations.navigateToLoginPrompt,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: localizations.navigateToLoginLink,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  // Fallback if cannot pop (e.g. deep linked)
                                  context.goNamed(AppRoute.login.name);
                                }
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
