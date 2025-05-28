import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import ConsumerWidget
import 'package:quitting_smoking/core/router/app_router.dart'; // 确保路径正确
import 'package:quitting_smoking/core/theme/app_theme_provider.dart';
import 'package:quitting_smoking/core/providers/locale_provider.dart';

import 'l10n/app_localizations.dart'; // 确保路径正确

class AppWidget extends ConsumerWidget {
  // Changed to ConsumerWidget
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Added WidgetRef ref
    final router = ref.watch(routerProvider); // Use routerProvider

    // 获取Flutter主题模式
    final themeMode = ref.watch(flutterThemeModeProvider);

    // 获取当前语言设置 - 暂时强制使用中文
    final currentLocale = ref.watch(currentLocaleProvider);

    return MaterialApp.router(
      routerConfig: router, // Use the router from provider
      debugShowCheckedModeBanner: false,
      // title: 'Quit Journey', // 将由 onGenerateTitle 处理

      // 使用主题提供者定义的主题
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,

      // 设置当前语言环境
      locale: currentLocale,

      // 配置国际化
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,

      // 动态设置应用标题，使其也支持国际化
      onGenerateTitle: (BuildContext context) {
        return AppLocalizations.of(context).appTitle;
      },
    );
  }
}
