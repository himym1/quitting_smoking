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

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化动画
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    // 启动动画
    _animationController.forward();

    // Delay the call slightly to ensure the widget is built and ref is available.
    Future.microtask(() {
      if (mounted) {
        ref.read(splashScreenNotifierProvider.notifier).checkAuthStatus();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
      backgroundColor: const Color(0xFFE8F5E8), // 与启动屏幕背景色保持一致
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 应用图标
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/app_icon.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // 如果图标加载失败，显示默认图标
                            return Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.eco,
                                size: 60,
                                color: Colors.green.shade600,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // 应用标语
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    AppLocalizations.of(context).appSlogan,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 64),

                // 加载指示器
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green.shade600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 加载文本
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    AppLocalizations.of(context).loadingYourFuture,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.green.shade600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
