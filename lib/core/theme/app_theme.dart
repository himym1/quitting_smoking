import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLightGray,
    fontFamily: 'Inter', // 备选字体: 'Noto Sans SC'. 如果应用未配置此字体，可能显示为默认字体。

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accentYellow,
      error: AppColors.warningRed,
      background: AppColors.backgroundLightGray,
      surface: AppColors.backgroundWhite, // 用于 Card 背景等
      onPrimary: AppColors.backgroundWhite, // AppColors.primary 上的文本/图标颜色
      onSecondary: AppColors.textDarkGray, // AppColors.accentYellow 上的文本/图标颜色
      onError: AppColors.backgroundWhite, // AppColors.warningRed 上的文本/图标颜色
      onBackground:
          AppColors.textDarkGray, // AppColors.backgroundLightGray 上的文本/图标颜色
      onSurface: AppColors.textDarkGray, // AppColors.backgroundWhite 上的文本/图标颜色
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundWhite, // AppBar 标题和图标的颜色
      elevation: 0, // 根据设计通常 AppBar 没有阴影或使用细微阴影
      iconTheme: IconThemeData(color: AppColors.backgroundWhite),
      titleTextStyle: TextStyle(
        color: AppColors.backgroundWhite,
        fontSize: 20.0, // 或者根据设计规范调整
        fontWeight: FontWeight.w500, // Medium weight
        fontFamily: 'Inter', // 确保与全局字体一致或单独指定
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      displayMedium: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      displaySmall: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      headlineLarge: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      headlineMedium: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      headlineSmall: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      titleLarge: TextStyle(
        color: AppColors.textDarkGray,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      titleMedium: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      titleSmall: TextStyle(color: AppColors.textDarkGray, fontFamily: 'Inter'),
      bodyLarge: TextStyle(
        color: AppColors.textDarkGray,
        fontSize: 16.0,
        fontFamily: 'Inter',
      ),
      bodyMedium: TextStyle(
        color: AppColors.textDarkGray,
        fontSize: 14.0,
        fontFamily: 'Inter',
      ),
      bodySmall: TextStyle(
        color: AppColors.textMediumGray,
        fontFamily: 'Inter',
      ), // 例如用于次要信息
      labelLarge: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
      ), // 例如用于按钮
      labelMedium: TextStyle(
        color: AppColors.textDarkGray,
        fontFamily: 'Inter',
      ),
      labelSmall: TextStyle(color: AppColors.textDarkGray, fontFamily: 'Inter'),
    ).apply(
      bodyColor: AppColors.textDarkGray,
      displayColor: AppColors.textDarkGray,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.backgroundWhite,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold, // 通常按钮文字较粗
          fontFamily: 'Inter',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // 根据设计调整圆角
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundWhite,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.textMediumGray,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.textMediumGray,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.warningRed, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.warningRed, width: 2.0),
      ),
      labelStyle: const TextStyle(
        color: AppColors.textMediumGray,
        fontFamily: 'Inter',
      ),
      hintStyle: const TextStyle(
        color: AppColors.textMediumGray,
        fontFamily: 'Inter',
      ),
    ),

    cardTheme: CardTheme(
      elevation: 2.0, // 卡片阴影大小
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // 卡片圆角
      ),
      color: AppColors.backgroundWhite, // 卡片背景色
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ), // 卡片外边距
    ),

    // 可以根据需要配置其他组件的主题，例如 BottomNavigationBarTheme, TabBarTheme 等
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedItemColor: AppColors.primary,
    //   unselectedItemColor: AppColors.textMediumGray,
    //   backgroundColor: AppColors.backgroundWhite,
    // ),

    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     foregroundColor: AppColors.primary,
    //     textStyle: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
    //   ),
    // ),

    // iconTheme: const IconThemeData(
    //   color: AppColors.textDarkGray, // 全局默认图标颜色
    // ),

    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.backgroundWhite,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12.0),
    //   ),
    //   titleTextStyle: const TextStyle(color: AppColors.textDarkGray, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
    //   contentTextStyle: const TextStyle(color: AppColors.textDarkGray, fontSize: 14, fontFamily: 'Inter'),
    // ),
  );

  // TODO: 在未来的任务中定义 darkTheme
  // static final ThemeData darkTheme = ThemeData(...);
}
