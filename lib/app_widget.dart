/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 应用程序主组件 (AppWidget)
 * 功能：
 * 1. 配置应用程序的全局设置
 * 2. 设置路由系统 (GoRouter)
 * 3. 管理主题模式（明亮/暗黑/跟随系统）
 * 4. 配置国际化支持 (中文/英文)
 * 5. 提供全局Material Design配置
 */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import ConsumerWidget
import 'package:quitting_smoking/core/router/app_router.dart'; // 确保路径正确
import 'package:quitting_smoking/core/theme/app_theme_provider.dart';
import 'package:quitting_smoking/core/providers/locale_provider.dart';

import 'l10n/app_localizations.dart'; // 确保路径正确

/// 应用程序主组件
///
/// 继承自 ConsumerWidget，可以使用 Riverpod 状态管理
/// 负责配置应用程序的核心设置和全局配置
class AppWidget extends ConsumerWidget {
  // Changed to ConsumerWidget
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ==================== 状态监听 ====================

    /// 获取路由配置
    /// 使用 GoRouter 进行页面导航管理
    final router = ref.watch(routerProvider); // Use routerProvider

    /// 获取当前主题模式
    /// 支持：明亮模式、暗黑模式、跟随系统设置
    final themeMode = ref.watch(flutterThemeModeProvider);

    /// 获取当前语言设置
    /// 支持：中文 (zh)、英文 (en)
    final currentLocale = ref.watch(currentLocaleProvider);

    // ==================== MaterialApp 配置 ====================

    return MaterialApp.router(
      // 路由配置
      routerConfig: router, // Use the router from provider
      // 开发调试
      debugShowCheckedModeBanner: false, // 移除右上角 Debug 标签
      // ==================== 主题配置 ====================

      /// 明亮模式主题
      /// 使用紫色为主色调，配合绿色作为成功色
      theme: lightTheme,

      /// 暗黑模式主题
      /// 深灰色背景，浅紫色为主色调
      darkTheme: darkTheme,

      /// 主题模式设置
      /// 用户可在设置页面切换：明亮/暗黑/跟随系统
      themeMode: themeMode,

      // ==================== 国际化配置 ====================

      /// 当前语言环境
      /// 默认中文，用户可在设置中切换为英文
      locale: currentLocale,

      /// 国际化代理
      /// 提供多语言支持和本地化格式
      localizationsDelegates: const [
        AppLocalizations.delegate, // 应用自定义本地化
        GlobalMaterialLocalizations.delegate, // Material组件本地化
        GlobalWidgetsLocalizations.delegate, // 基础Widget本地化
        GlobalCupertinoLocalizations.delegate, // Cupertino组件本地化
      ],

      /// 支持的语言列表
      /// 目前支持：中文 (zh) 和英文 (en)
      supportedLocales: AppLocalizations.supportedLocales,

      /// 动态应用标题
      /// 根据当前语言环境显示对应的应用名称
      /// 中文："焕新之旅"，英文："Quit Journey"
      onGenerateTitle: (BuildContext context) {
        return AppLocalizations.of(context).appTitle;
      },
    );
  }
}
