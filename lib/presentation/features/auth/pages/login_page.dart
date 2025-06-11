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

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // 直接watch状态变化用于调试
    final currentAuthState = ref.watch(authNotifierProvider);
    logDebug('LoginPage build() - 当前认证状态: $currentAuthState', tag: 'LoginPage');

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      logDebug('登录页监听到认证状态变化: $previous -> $next', tag: 'LoginPage');

      // 检查是否是登录流程开始 - 只有当前页面在前台时才认为是登录操作
      final currentRoute = GoRouterState.of(context).matchedLocation;
      final isOnLoginPage = currentRoute == '/login';

      if (previous?.maybeWhen(loading: () => false, orElse: () => true) ==
              true &&
          next.maybeWhen(loading: () => true, orElse: () => false) &&
          isOnLoginPage) {
        _isLoggingIn = true;
        logDebug('登录流程开始 (当前在登录页)', tag: 'LoginPage');
      } else if (previous?.maybeWhen(
                loading: () => false,
                orElse: () => true,
              ) ==
              true &&
          next.maybeWhen(loading: () => true, orElse: () => false) &&
          !isOnLoginPage) {
        logDebug('检测到状态变化但不在登录页，忽略 (当前页面: $currentRoute)', tag: 'LoginPage');
      }

      next.whenOrNull(
        authenticated: (userProfile) {
          if (_isLoggingIn) {
            logInfo(
              '登录成功，用户资料: $userProfile, 引导完成状态: ${userProfile.onboardingCompleted}',
              tag: 'LoginPage',
            );
            _isLoggingIn = false;
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
          }
        },
        unauthenticated: (message) {
          logDebug(
            '登录页收到未认证状态: message=$message, isLoggingIn=$_isLoggingIn',
            tag: 'LoginPage',
          );

          // 只有在登录过程中才处理错误
          if (_isLoggingIn && message != null && message.isNotEmpty) {
            // 检查是否是注册相关的错误，如果是则不处理
            if (message == 'emailAlreadyExistsError' ||
                message == 'registrationFailedError' ||
                message == 'emailAlreadyInUseError') {
              logDebug('忽略注册相关错误: $message', tag: 'LoginPage');
              _isLoggingIn = false;
              return; // 不处理注册相关错误
            }

            _isLoggingIn = false;
            logWarning('登录失败，错误信息: $message', tag: 'LoginPage');
            String displayMessage;
            if (message == 'invalidCredentialsError') {
              displayMessage = l10n.invalidCredentialsError;
            } else if (message.startsWith('Failed to save user profile:')) {
              displayMessage =
                  l10n.loginFailedError; // Generic error for save failure
            } else if (message == 'loginFailedError') {
              displayMessage = l10n.loginFailedError;
            } else {
              // 对于其他未知错误，也当作登录错误处理
              displayMessage = l10n.loginFailedError;
              logDebug('登录页处理未知错误: $message', tag: 'LoginPage');
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(displayMessage),
                    backgroundColor: Theme.of(context).colorScheme.error,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 4),
                  ),
                );
                logInfo('登录页SnackBar已显示: $displayMessage', tag: 'LoginPage');
              } else {
                logWarning('登录页Context未挂载，无法显示SnackBar', tag: 'LoginPage');
              }
            });
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
                                  // 使用 go 替换 push，避免 LoginPage 留在栈中
                                  context.goNamed(AppRoute.registration.name);
                                  // GoRouter.of(
                                  //   context,
                                  // ).pushNamed(AppRoute.registration.name);
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
