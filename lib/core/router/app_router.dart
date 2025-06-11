/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 应用程序路由配置 (AppRouter)
 * 功能：
 * 1. 定义所有页面路由路径
 * 2. 配置导航结构和层级关系
 * 3. 实现基于认证状态的路由重定向
 * 4. 管理底部导航栏 (Shell Route)
 * 5. 处理深层链接和参数传递
 */

import 'dart:async'; // StreamSubscription 异步流订阅
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务

// ==================== 页面导入 ====================
// 认证相关页面
import 'package:quitting_smoking/presentation/features/auth/pages/login_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/onboarding_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/registration_page.dart';
import 'package:quitting_smoking/presentation/features/auth/pages/splash_screen.dart';

// 主功能页面
import 'package:quitting_smoking/presentation/features/achievements/pages/achievements_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/home_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/health_benefits_detail_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/craving_coping_strategies_page.dart';
import 'package:quitting_smoking/presentation/features/home/pages/breathing_exercise_guide_page.dart';

// 设置相关页面
import 'package:quitting_smoking/presentation/features/settings/pages/settings_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/notification_settings/notification_settings_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/smoking_data/smoking_data_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/quit_date/quit_date_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/about/about_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/help_support/help_support_page.dart';
import 'package:quitting_smoking/presentation/features/settings/pages/privacy_policy/privacy_policy_page.dart';

// Shell 导航结构
import 'package:quitting_smoking/presentation/shell/main_app_shell.dart';

// 认证状态管理
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';

// ==================== 路由枚举定义 ====================

/// 应用程序路由枚举
///
/// 定义应用中所有页面的路由名称
/// 包括：认证流程、主要功能页面、设置页面等
enum AppRoute {
  // 认证流程
  splash, // 启动页
  login, // 登录页
  registration, // 注册页
  onboarding, // 初始化引导页

  // 主要功能页面
  home, // 首页/主看板
  healthBenefitsDetail, // 健康效益详情页
  cravingCopingStrategies, // 烟瘾应对策略页
  breathingExerciseGuide, // 呼吸练习指导页
  achievements, // 成就页面

  // 设置页面
  settings, // 设置主页

  // 设置二级页面
  notificationSettings, // 通知设置
  smokingData, // 吸烟数据设置
  quitDate, // 戒烟日期设置
  aboutApp, // 关于应用
  helpSupport, // 帮助与支持
  privacyPolicy; // 隐私政策

  /// 获取路由路径
  ///
  /// 返回每个路由对应的URL路径
  /// 支持参数传递和嵌套路由
  String get path {
    // 认证流程路由
    if (this == AppRoute.splash) return '/'; // 根路径为启动页
    if (this == AppRoute.login) return '/login';
    if (this == AppRoute.registration) return '/registration';
    if (this == AppRoute.onboarding) return '/onboarding';

    // 主功能页面路由（Shell 内部）
    if (this == AppRoute.home) return '/home';
    if (this == AppRoute.achievements) return '/achievements';
    if (this == AppRoute.settings) return '/settings';

    // 二级页面路由（顶级导航）
    if (this == AppRoute.healthBenefitsDetail) {
      return '/health-benefits-detail/:id'; // 支持ID参数
    }
    if (this == AppRoute.cravingCopingStrategies) {
      return '/craving-coping-strategies';
    }
    if (this == AppRoute.breathingExerciseGuide) {
      return '/breathing-exercise-guide';
    }

    // 设置二级页面路由
    if (this == AppRoute.notificationSettings) return '/settings/notifications';
    if (this == AppRoute.smokingData) return '/settings/smoking-data';
    if (this == AppRoute.quitDate) return '/settings/quit-date';
    if (this == AppRoute.aboutApp) return '/settings/about';
    if (this == AppRoute.helpSupport) return '/settings/help-support';
    if (this == AppRoute.privacyPolicy) return '/settings/privacy-policy';

    return '/$name'; // 默认fallback，通常不会执行到
  }
}

// ==================== 导航器键配置 ====================

/// 全局导航器键
/// 用于管理不同层级的导航堆栈

/// 根导航器 - 管理整个应用的导航
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// Shell 导航器 - 首页Tab
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');

/// Shell 导航器 - 成就Tab
final GlobalKey<NavigatorState> _shellNavigatorAchievementsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellAchievements');

/// Shell 导航器 - 设置Tab
final GlobalKey<NavigatorState> _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

// ==================== 路由提供者 ====================

/// GoRouter 实例提供者
///
/// 负责：
/// 1. 监听认证状态变化
/// 2. 实现基于认证的路由重定向
/// 3. 配置所有路由规则
/// 4. 管理导航堆栈
final routerProvider = Provider<GoRouter>((ref) {
  /// 监听认证状态
  /// 当用户登录/登出时自动更新路由
  // 使用 refreshListenable 代替 watch 来触发 redirect
  // final authState = ref.watch(authNotifierProvider);
  logDebug('路由提供者初始化', tag: 'AppRouter');

  return GoRouter(
    // 基础配置
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.splash.path, // 应用启动时的初始路由
    debugLogDiagnostics: true, // 开启调试日志
    /// 路由刷新监听器
    /// 当认证状态变化时触发路由重新评估
    refreshListenable: _GoRouterRefreshStream(
      ref.read(authNotifierProvider.notifier).stream,
    ),

    /// 路由重定向逻辑
    ///
    /// 根据用户认证状态和引导完成状态决定重定向目标：
    /// - 未登录 → 登录页
    /// - 已登录但未完成引导 → 引导页
    /// - 已完成引导 → 主应用页面
    redirect: (BuildContext context, GoRouterState state) {
      // 在 redirect 内部读取最新状态
      final authState = ref.read(authNotifierProvider);
      final String currentLocation = state.matchedLocation;

      // 调试日志
      logDebug(
        '路由重定向检查: 当前位置=$currentLocation, 状态=$authState',
        tag: 'AppRouter',
      );

      // 认证状态加载中，不进行重定向
      if (authState.maybeWhen(loading: () => true, orElse: () => false)) {
        logDebug('认证状态加载中，不进行重定向', tag: 'AppRouter');
        return null;
      }

      // 如果有错误状态，并且当前在登录或注册页，不进行重定向，让页面自己处理
      final hasError = authState.maybeWhen(
        unauthenticated: (message) => message != null && message.isNotEmpty,
        orElse: () => false,
      );
      final isOnAuthPage =
          currentLocation == AppRoute.login.path ||
          currentLocation == AppRoute.registration.path;

      if (hasError && isOnAuthPage) {
        logDebug('在认证页面 ($currentLocation) 且有错误状态，不进行重定向', tag: 'AppRouter');
        return null;
      }

      // 检查登录状态
      final bool loggedIn = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      // 检查引导完成状态
      final bool onboardingCompleted = authState.maybeWhen(
        authenticated: (userProfile) => userProfile.onboardingCompleted,
        orElse: () => false,
      );

      // // 调试日志 - 已移动
      // logDebug(
      //   '路由重定向检查: 当前位置=$currentLocation, 已登录=$loggedIn, 引导已完成=$onboardingCompleted',
      //   tag: 'AppRouter',
      // );

      // 允许已登录用户访问主应用页面
      if ((currentLocation == AppRoute.home.path ||
              currentLocation == AppRoute.healthBenefitsDetail.path ||
              currentLocation == AppRoute.cravingCopingStrategies.path ||
              currentLocation == AppRoute.breathingExerciseGuide.path ||
              currentLocation.startsWith('/settings/')) &&
          loggedIn) {
        logDebug('已登录且当前路径是允许的路径，允许导航', tag: 'AppRouter');
        return null;
      }

      // 未登录用户重定向逻辑
      if (!loggedIn) {
        // 允许访问认证相关页面
        if (currentLocation != AppRoute.splash.path &&
            currentLocation != AppRoute.login.path &&
            currentLocation != AppRoute.registration.path) {
          logInfo('用户未登录，重定向到登录页', tag: 'AppRouter');
          return AppRoute.login.path;
        }

        // 如果当前在登录页面或注册页面，保持在当前页面
        // 不要因为错误状态而触发页面跳转
        if (currentLocation == AppRoute.login.path ||
            currentLocation == AppRoute.registration.path) {
          logDebug('在认证页面，保持在当前页面', tag: 'AppRouter');
          return null; // 保持在当前页面
        }

        // 如果在根路径且未登录，重定向到登录页（避免在引导完成后又回到splash）
        if (currentLocation == AppRoute.splash.path) {
          logInfo('在根路径且未登录，重定向到登录页', tag: 'AppRouter');
          return AppRoute.login.path;
        }

        return null; // 允许在启动页、登录页、注册页之间导航
      }

      // 已登录但未完成引导的重定向逻辑
      if (loggedIn && !onboardingCompleted) {
        if (currentLocation != AppRoute.onboarding.path) {
          logInfo('用户已登录但未完成引导，重定向到引导页', tag: 'AppRouter');
          return AppRoute.onboarding.path;
        }
        return null; // 允许访问引导页
      }

      // 已完成引导的用户重定向逻辑
      if (loggedIn && onboardingCompleted) {
        // 如果还在认证页面，重定向到主页
        if (currentLocation == AppRoute.splash.path ||
            currentLocation == AppRoute.login.path ||
            currentLocation == AppRoute.registration.path ||
            currentLocation == AppRoute.onboarding.path) {
          logInfo('用户已登录且已完成引导，重定向到主页', tag: 'AppRouter');
          return AppRoute.home.path;
        }
      }

      return null; // 无需重定向
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
    logDebug('GoRouterRefreshStream 初始化', tag: 'AppRouter');
    notifyListeners(); // 初始化时通知监听器
    _subscription = stream.asBroadcastStream().listen((dynamic data) {
      logDebug('GoRouterRefreshStream 收到新的状态变化: $data', tag: 'AppRouter');
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    logDebug('GoRouterRefreshStream 被释放', tag: 'AppRouter');
    _subscription.cancel();
    super.dispose();
  }
}
