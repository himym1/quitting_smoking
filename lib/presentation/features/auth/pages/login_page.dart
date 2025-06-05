import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/core/router/app_router.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/login_form.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      logDebug('登录页监听到认证状态变化: $previous -> $next', tag: 'LoginPage');
      next.whenOrNull(
        authenticated: (userProfile) {
          logInfo(
            '登录成功，用户资料: $userProfile, 引导完成状态: ${userProfile.onboardingCompleted}',
            tag: 'LoginPage',
          );
          // 使用更长的延迟，确保状态已完全更新
          Future.delayed(const Duration(milliseconds: 800), () {
            if (userProfile.onboardingCompleted) {
              logDebug('将导航到主页', tag: 'LoginPage');
              // 使用更直接的导航方式
              if (context.mounted) {
                context.go(AppRoute.home.path);
              }
            } else {
              logDebug('将导航到引导页', tag: 'LoginPage');
              if (context.mounted) {
                context.go(AppRoute.onboarding.path);
              }
            }
          });
        },
        unauthenticated: (message) {
          logWarning('登录失败，错误信息: $message', tag: 'LoginPage');
          if (message != null && message.isNotEmpty) {
            String displayMessage;
            if (message == 'invalidCredentialsError') {
              displayMessage = l10n.invalidCredentialsError;
            } else if (message.startsWith('Failed to save user profile:')) {
              displayMessage =
                  l10n.loginFailedError; // Generic error for save failure
            } else {
              displayMessage =
                  l10n.loginFailedError; // Default or map other specific messages
            }
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(displayMessage)));
          }
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.loginPageTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  l10n.welcomeBack,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.loginToContinue,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const LoginForm(),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.forgotPasswordNotImplemented),
                        ),
                      );
                    },
                    child: Text(l10n.forgotPasswordButtonText),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(l10n.orText),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: '${l10n.navigateToRegisterPrompt} ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: l10n.navigateToRegisterLink,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRoute.registration.name);
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Optional: Terms of Service and Privacy Policy
                Text(
                  l10n.termsAndPrivacyAgreement,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
