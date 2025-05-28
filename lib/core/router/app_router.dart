import 'dart:async'; // Added for StreamSubscription
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/presentation/features/achievements/pages/achievements_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/login_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/onboarding_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/registration_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/splash_screen.dart';
import 'package:quitting_smoking/presentation/features/home/pages/home_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/health_benefits_detail_page.dart'; // Import the new page
import 'package:quitting_smoking/presentation/features/home/pages/craving_coping_strategies_page.dart'; // 导入新页面
import 'package:quitting_smoking/presentation/features/home/pages/breathing_exercise_guide_page.dart'; // Import the new page
import 'package:quitting_smoking/presentation/features/settings/pages/settings_page.dart';
// 导入设置页面的二级页面
import 'package:quitting_smoking/presentation/features/settings/pages/notification_settings/notification_settings_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/smoking_data/smoking_data_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/quit_date/quit_date_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/about/about_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/help_support/help_support_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/privacy_policy/privacy_policy_page.dart';
import 'package:quitting_smoking/presentation/shell/main_app_shell.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
// AuthState is not directly used in this new version, but authNotifierProvider provides it.
// import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';

enum AppRoute {
  splash,
  login,
  registration,
  onboarding,
  home,
  healthBenefitsDetail, // Add new route
  cravingCopingStrategies, // 添加新路由
  breathingExerciseGuide, // 添加呼吸练习指导页面的路由
  achievements,
  settings,
  // 设置页面的二级页面
  notificationSettings,
  smokingData,
  quitDate,
  aboutApp,
  helpSupport,
  privacyPolicy;

  String get path {
    if (this == AppRoute.splash) return '/'; // Splash is root
    // Other routes are top-level after splash
    if (this == AppRoute.login) return '/login';
    if (this == AppRoute.registration) return '/registration';
    if (this == AppRoute.onboarding) return '/onboarding';
    // Shell routes
    if (this == AppRoute.home) return '/home';
    // 将二级页面路由修改为顶级路由
    if (this == AppRoute.healthBenefitsDetail) {
      return '/health-benefits-detail/:id';
    }
    if (this == AppRoute.cravingCopingStrategies) {
      return '/craving-coping-strategies';
    }
    if (this == AppRoute.breathingExerciseGuide) {
      return '/breathing-exercise-guide';
    }
    if (this == AppRoute.achievements) return '/achievements';
    if (this == AppRoute.settings) return '/settings';

    // 设置页面的二级页面路由
    if (this == AppRoute.notificationSettings) return '/settings/notifications';
    if (this == AppRoute.smokingData) return '/settings/smoking-data';
    if (this == AppRoute.quitDate) return '/settings/quit-date';
    if (this == AppRoute.aboutApp) return '/settings/about';
    if (this == AppRoute.helpSupport) return '/settings/help-support';
    if (this == AppRoute.privacyPolicy) return '/settings/privacy-policy';

    return '/$name'; // Fallback, should not happen with explicit paths
  }
}

// Add GlobalKeys for ShellRoute navigators
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _shellNavigatorAchievementsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellAchievements');
final GlobalKey<NavigatorState> _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

final routerProvider = Provider<GoRouter>((ref) {
  // Listen to AuthNotifier for redirect logic
  // 使用ref.watch而不是ref.read来监听状态变化
  final authState = ref.watch(authNotifierProvider);
  print('路由提供者检测到认证状态变化: $authState');

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.splash.path,
    debugLogDiagnostics: true, // Helpful for debugging
    refreshListenable: _GoRouterRefreshStream(
      // Keep refresh listenable for auth changes
      ref.read(authNotifierProvider.notifier).stream,
    ),
    redirect: (BuildContext context, GoRouterState state) {
      // 如果当前状态是加载中，不进行重定向
      if (authState.maybeWhen(loading: () => true, orElse: () => false)) {
        print('GoRouter redirect: 认证状态加载中，不进行重定向');
        return null;
      }

      final bool loggedIn = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );
      final bool onboardingCompleted = authState.maybeWhen(
        authenticated: (userProfile) => userProfile.onboardingCompleted,
        orElse: () => false,
      );

      final String currentLocation = state.matchedLocation;

      // 添加调试日志
      print(
        'GoRouter redirect: currentLocation=$currentLocation, loggedIn=$loggedIn, onboardingCompleted=$onboardingCompleted, authState=$authState',
      );

      // 如果当前路径是/home且已登录，则允许导航
      if ((currentLocation == AppRoute.home.path ||
              currentLocation == AppRoute.healthBenefitsDetail.path ||
              currentLocation == AppRoute.cravingCopingStrategies.path ||
              currentLocation == AppRoute.breathingExerciseGuide.path ||
              currentLocation.startsWith('/settings/')) &&
          loggedIn) {
        print('GoRouter redirect: 已登录且当前路径是允许的路径，允许导航');
        return null;
      }

      // If not logged in and not on an auth path, redirect to login
      if (!loggedIn) {
        if (currentLocation != AppRoute.splash.path &&
            currentLocation != AppRoute.login.path &&
            currentLocation != AppRoute.registration.path) {
          print('GoRouter redirect: 未登录，重定向到登录页');
          return AppRoute.login.path;
        }
        return null; // Allow navigation to splash, login, registration
      }

      // If logged in but onboarding not complete, and not on onboarding path, redirect to onboarding
      if (loggedIn && !onboardingCompleted) {
        if (currentLocation != AppRoute.onboarding.path) {
          print('GoRouter redirect: 已登录但未完成引导，重定向到引导页');
          return AppRoute.onboarding.path;
        }
        return null; // Allow navigation to onboarding
      }

      // If logged in and onboarding complete, but currently on an auth/onboarding path, redirect to home
      if (loggedIn && onboardingCompleted) {
        if (currentLocation == AppRoute.splash.path ||
            currentLocation == AppRoute.login.path ||
            currentLocation == AppRoute.registration.path ||
            currentLocation == AppRoute.onboarding.path) {
          print('GoRouter redirect: 已登录且已完成引导，重定向到主页');
          return AppRoute.home.path; // Default to home path within shell
        }
      }
      return null; // No redirect needed
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoute.registration.path,
        name: AppRoute.registration.name,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: AppRoute.onboarding.path,
        name: AppRoute.onboarding.name,
        builder: (context, state) => const OnboardingPage(),
      ),
      // 添加二级页面为顶级路由
      GoRoute(
        path: AppRoute.healthBenefitsDetail.path,
        name: AppRoute.healthBenefitsDetail.name,
        parentNavigatorKey: _rootNavigatorKey, // 确保使用根导航器
        builder: (context, state) {
          // 从路径参数或查询参数中获取id，使用默认值以防万一
          final id =
              state.pathParameters['id'] ??
              state.uri.queryParameters['id'] ??
              '1';
          return HealthBenefitsDetailPage(milestoneId: id);
        },
      ),
      GoRoute(
        path: AppRoute.cravingCopingStrategies.path,
        name: AppRoute.cravingCopingStrategies.name,
        parentNavigatorKey: _rootNavigatorKey, // 确保使用根导航器
        builder: (context, state) => const CravingCopingStrategiesPage(),
      ),
      GoRoute(
        path: AppRoute.breathingExerciseGuide.path,
        name: AppRoute.breathingExerciseGuide.name,
        parentNavigatorKey: _rootNavigatorKey, // 确保使用根导航器
        builder: (context, state) => const BreathingExerciseGuidePage(),
      ),
      // StatefulShellRoute for main app navigation
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MainAppShell(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // Branch for Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.home.path, // e.g., '/home'
                name: AppRoute.home.name,
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const HomePage(),
              ),
            ],
          ),
          // Branch for Achievements
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAchievementsKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.achievements.path, // e.g., '/achievements'
                name: AppRoute.achievements.name,
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const AchievementsPage(),
                // Add sub-routes for achievements if any
              ),
            ],
          ),
          // Branch for Settings
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoute.settings.path, // e.g., '/settings'
                name: AppRoute.settings.name,
                builder:
                    (BuildContext context, GoRouterState state) =>
                        const SettingsPage(),
                routes: <RouteBase>[
                  // 添加设置页面的二级路由
                  GoRoute(
                    path: 'notifications',
                    name: AppRoute.notificationSettings.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder:
                        (context, state) => const NotificationSettingsPage(),
                  ),
                  GoRoute(
                    path: 'smoking-data',
                    name: AppRoute.smokingData.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const SmokingDataPage(),
                  ),
                  GoRoute(
                    path: 'quit-date',
                    name: AppRoute.quitDate.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const QuitDatePage(),
                  ),
                  GoRoute(
                    path: 'about',
                    name: AppRoute.aboutApp.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const AboutPage(),
                  ),
                  GoRoute(
                    path: 'help-support',
                    name: AppRoute.helpSupport.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const HelpSupportPage(),
                  ),
                  GoRoute(
                    path: 'privacy-policy',
                    name: AppRoute.privacyPolicy.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const PrivacyPolicyPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

// Helper class to trigger router refresh on auth state changes
// This class is kept as it's useful for auth-driven navigation.
class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(Stream<dynamic> stream) {
    print('_GoRouterRefreshStream 初始化');
    notifyListeners(); // 初始化时通知监听器
    _subscription = stream.asBroadcastStream().listen((dynamic data) {
      print('_GoRouterRefreshStream 收到新的状态变化: $data');
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    print('_GoRouterRefreshStream 被释放');
    _subscription.cancel();
    super.dispose();
  }
}
