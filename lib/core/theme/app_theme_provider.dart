import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';

/// 应用主题模式枚举
enum AppThemeMode {
  system, // 跟随系统
  light, // 明亮模式
  dark, // 暗黑模式
}

/// 主题状态类
class ThemeState {
  final AppThemeMode themeMode;

  const ThemeState({required this.themeMode});

  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  bool get isDarkMode => themeMode == AppThemeMode.dark;

  // 转换为Flutter的ThemeMode
  ThemeMode get flutterThemeMode {
    switch (themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
      return ThemeMode.system;
    }
  }
}

/// 主题状态Notifier
class ThemeNotifier extends StateNotifier<ThemeState> {
  final HiveInterface _hive;

  ThemeNotifier({required HiveInterface hive})
    : _hive = hive,
      super(const ThemeState(themeMode: AppThemeMode.system)) {
    _loadTheme();
  }

  /// 从存储中加载主题设置
  Future<void> _loadTheme() async {
    try {
      final box = await _getSettingsBox();
      final themeModeIndex = box.get('themeMode');
      if (themeModeIndex != null) {
        state = ThemeState(themeMode: AppThemeMode.values[themeModeIndex]);
      }
    } catch (e) {
      // 出错时使用默认主题
      state = const ThemeState(themeMode: AppThemeMode.system);
    }
  }

  /// 保存主题设置
  Future<void> _saveTheme(AppThemeMode mode) async {
    try {
      final box = await _getSettingsBox();
      await box.put('themeMode', mode.index);
    } catch (e) {
      print('保存主题设置出错: $e');
    }
  }

  /// 获取设置Box
  Future<Box> _getSettingsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.settingsBoxName)) {
      return await _hive.openBox(HiveConstants.settingsBoxName);
    }
    return _hive.box(HiveConstants.settingsBoxName);
  }

  /// 切换主题模式
  Future<void> setThemeMode(AppThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _saveTheme(mode);
  }

  /// 切换至暗黑模式
  Future<void> toggleDarkMode() async {
    final newMode = state.isDarkMode ? AppThemeMode.light : AppThemeMode.dark;
    await setThemeMode(newMode);
  }
}

/// 主题提供者
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier(hive: Hive);
});

/// 当前是否处于暗黑模式的提供者
final isDarkModeProvider = Provider<bool>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.isDarkMode;
});

/// 获取当前Flutter ThemeMode的提供者
final flutterThemeModeProvider = Provider<ThemeMode>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.flutterThemeMode;
});

/// 获取当前主题数据的提供者
final currentThemeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(isDarkModeProvider);
  return isDarkMode ? darkTheme : lightTheme;
});

/// 明亮主题
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF5E35B1), // 紫色为主色调
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF5E35B1),
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF5E35B1),
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  // 其他主题配置...
);

/// 暗黑主题
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFB39DDB), // 紫色为主色调，但使用更亮的色调
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFB39DDB),
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    foregroundColor: const Color(0xFFB39DDB),
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  // 其他主题配置...
);
