import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/core/router/app_router.dart'; // For AppRoute
import 'package:quitting_smoking/presentation/features/auth/providers/splash_screen_notifier.dart';

import '../../../../l10n/app_localizations.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay the call slightly to ensure the widget is built and ref is available.
    // Or, call it directly if it doesn't cause issues in your setup.
    Future.microtask(() {
      if (mounted) {
        ref.read(splashScreenNotifierProvider.notifier).checkAuthStatus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<SplashState>(splashScreenNotifierProvider, (previous, next) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          switch (next) {
            case SplashState.authenticatedAndOnboarded:
              GoRouter.of(context).goNamed(AppRoute.home.name);
              break;
            case SplashState.unauthenticated:
              GoRouter.of(context).goNamed(AppRoute.login.name);
              break;
            case SplashState.authenticatedButNotOnboarded:
              GoRouter.of(context).goNamed(AppRoute.onboarding.name);
              break;
            default:
              break;
          }
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(size: 80),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context).appSlogan,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).loadingYourFuture,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
