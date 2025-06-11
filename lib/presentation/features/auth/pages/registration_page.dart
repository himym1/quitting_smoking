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

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  // String? _pendingErrorMessage; // 移除，使用 ref.listen
  bool _isRegistering = false; // 标记是否由本页面发起的注册流程

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    // 仅 watch 状态用于 UI 更新（例如显示加载指示器）
    final currentAuthState = ref.watch(authNotifierProvider);
    logDebug(
      'RegistrationPage build() - 当前认证状态: $currentAuthState',
      tag: 'RegistrationPage',
    );

    // 使用 ref.listen 处理副作用：导航和显示 SnackBar
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      logDebug('注册页监听到认证状态变化: $previous -> $next', tag: 'RegistrationPage');

      // 检查是否是注册流程开始
      if (previous?.maybeWhen(loading: () => false, orElse: () => true) ==
              true &&
          next.maybeWhen(loading: () => true, orElse: () => false)) {
        // 只有当前页面在前台时才认为是注册操作
        final currentRoute = GoRouterState.of(context).matchedLocation;
        if (currentRoute == AppRoute.registration.path) {
          _isRegistering = true;
          logDebug('注册流程开始 (当前在注册页)', tag: 'RegistrationPage');
        } else {
          logDebug(
            '检测到状态变化但不在注册页，忽略 (当前页面: $currentRoute)',
            tag: 'RegistrationPage',
          );
        }
      }

      next.whenOrNull(
        loading: () {
          // UI 会通过 watch 自动更新，这里只记录日志
          logDebug('注册页面状态变为加载中', tag: 'RegistrationPage');
        },
        authenticated: (userProfile) {
          // 只有是从本页面发起的注册才处理成功逻辑
          if (_isRegistering) {
            logInfo(
              '注册成功，用户资料: $userProfile, 引导完成状态: ${userProfile.onboardingCompleted}',
              tag: 'RegistrationPage',
            );
            _isRegistering = false; // 重置标志
            // 导航由 router 的 redirect 逻辑处理，这里不再手动导航
            // 但如果需要确保立即导航，可以保留
            Future.delayed(const Duration(milliseconds: 100), () {
              if (!userProfile.onboardingCompleted) {
                logDebug('将导航到引导页', tag: 'RegistrationPage');
                if (context.mounted) {
                  context.go(AppRoute.onboarding.path);
                }
              } else {
                logDebug('将导航到主页', tag: 'RegistrationPage');
                if (context.mounted) {
                  context.go(AppRoute.home.path);
                }
              }
            });
          }
        },
        unauthenticated: (message) {
          // 只有是从本页面发起的注册，且有错误消息时才处理
          if (_isRegistering && message != null && message.isNotEmpty) {
            // 检查是否是注册相关的错误
            if (message == 'emailAlreadyExistsError' ||
                message == 'registrationFailedError' ||
                message == 'emailAlreadyInUseError' ||
                message == 'invalidInputError') {
              logInfo('注册页面检测到注册错误状态: $message', tag: 'RegistrationPage');
              _isRegistering = false; // 重置标志
              // 直接显示 SnackBar
              _showErrorSnackBar(context, localizations, message);
            } else {
              logDebug('忽略非注册相关错误: $message', tag: 'RegistrationPage');
              _isRegistering = false; // 重置标志
            }
          } else if (message == null || message.isEmpty) {
            // 如果状态变为 unauthenticated 但没有消息，也重置标志
            _isRegistering = false;
          }
        },
        // orElse: () {
        //    _isRegistering = false; // 其他状态也重置
        // },
      );
    });

    // // 如果有待显示的错误消息，也显示它 - 移除
    // if (_pendingErrorMessage != null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _showErrorSnackBar(context, localizations, _pendingErrorMessage!);
    //     _pendingErrorMessage = null;
    //   });
    // }

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

  void _showErrorSnackBar(
    BuildContext context,
    AppLocalizations localizations,
    String message,
  ) {
    logInfo('注册页面开始处理错误消息: $message', tag: 'RegistrationPage');
    String displayMessage;
    if (message == 'emailAlreadyInUseError' ||
        message == 'emailAlreadyExistsError') {
      displayMessage = localizations.emailAlreadyInUseError;
      logInfo('显示邮箱已存在错误: $displayMessage', tag: 'RegistrationPage');
    } else if (message == 'registrationFailedError') {
      displayMessage = localizations.registrationFailedError;
      logInfo('显示注册失败错误: $displayMessage', tag: 'RegistrationPage');
    } else if (message == 'invalidInputError') {
      // 对于输入验证错误，显示通用的注册失败消息
      // 具体的验证错误信息应该由表单字段自己处理
      displayMessage = localizations.registrationFailedError;
      logInfo('显示输入验证错误: $displayMessage', tag: 'RegistrationPage');
    } else {
      displayMessage =
          localizations.registrationFailedError; // Default fallback
      logWarning(
        '显示未知错误: $message -> $displayMessage',
        tag: 'RegistrationPage',
      );
    }

    // 显示错误提示 - 立即显示，不使用PostFrameCallback
    logInfo('准备显示SnackBar: $displayMessage', tag: 'RegistrationPage');
    if (context.mounted) {
      logDebug('Context已挂载，清除之前的SnackBar', tag: 'RegistrationPage');
      ScaffoldMessenger.of(context).clearSnackBars(); // 清除之前的提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(displayMessage),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5), // 延长显示时间
          action: SnackBarAction(
            label: '确定',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
      logInfo('SnackBar 已显示', tag: 'RegistrationPage');
    } else {
      logWarning(
        'Context未挂载，无法显示SnackBar: $displayMessage',
        tag: 'RegistrationPage',
      );
    }
  }
}
