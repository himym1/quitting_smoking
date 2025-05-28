/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 应用主题提供者 (AppThemeProvider)
 * 功能：
 * 1. 管理应用主题模式（明亮/暗黑/跟随系统）
 * 2. 持久化保存用户主题偏好
 * 3. 提供主题切换功能
 * 4. 定义应用的视觉风格和颜色方案
 * 5. 支持响应式主题切换
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务

// ==================== 主题模式枚举 ====================

/// 应用主题模式枚举
///
/// 定义应用支持的三种主题模式：
/// - system: 跟随系统设置自动切换
/// - light: 强制使用明亮模式
/// - dark: 强制使用暗黑模式
enum AppThemeMode {
  system, // 跟随系统设置
  light, // 明亮模式
  dark, // 暗黑模式
}

// ==================== 主题状态管理 ====================

/// 主题状态类
///
/// 封装当前主题模式状态
/// 提供状态复制和Flutter ThemeMode转换功能
class ThemeState {
  /// 当前主题模式
  final AppThemeMode themeMode;

  const ThemeState({required this.themeMode});

  /// 复制状态并可选更新主题模式
  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  /// 是否为暗黑模式
  /// 注意：跟随系统时此属性可能不准确，应结合系统设置判断
  bool get isDarkMode => themeMode == AppThemeMode.dark;

  /// 转换为Flutter原生的ThemeMode枚举
  /// 用于MaterialApp的themeMode属性
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

/// 主题状态管理器 (StateNotifier)
///
/// 负责：
/// 1. 管理主题状态变化
/// 2. 与本地存储交互，持久化主题偏好
/// 3. 提供主题切换方法
class ThemeNotifier extends StateNotifier<ThemeState> {
  final HiveInterface _hive;

  ThemeNotifier({required HiveInterface hive})
    : _hive = hive,
      super(const ThemeState(themeMode: AppThemeMode.system)) {
    _loadTheme(); // 初始化时加载保存的主题设置
  }

  /// 从本地存储加载主题设置
  ///
  /// 从Hive数据库中读取用户之前保存的主题偏好
  /// 如果没有保存的设置或读取失败，则使用默认的跟随系统模式
  Future<void> _loadTheme() async {
    try {
      final box = await _getSettingsBox();
      final themeModeIndex = box.get('themeMode');
      if (themeModeIndex != null) {
        // 根据保存的索引值恢复主题模式
        state = ThemeState(themeMode: AppThemeMode.values[themeModeIndex]);
      }
    } catch (e) {
      // 出错时使用默认主题（跟随系统）
      logError('加载主题设置出错', tag: 'ThemeNotifier', error: e);
      state = const ThemeState(themeMode: AppThemeMode.system);
    }
  }

  /// 保存主题设置到本地存储
  ///
  /// 将用户选择的主题模式持久化保存到Hive数据库
  /// 确保应用重启后能恢复用户的主题偏好
  Future<void> _saveTheme(AppThemeMode mode) async {
    try {
      final box = await _getSettingsBox();
      // 保存主题模式的索引值
      await box.put('themeMode', mode.index);
    } catch (e) {
      logError('保存主题设置出错', tag: 'ThemeNotifier', error: e);
    }
  }

  /// 获取设置存储盒子
  ///
  /// 获取或打开Hive设置数据库
  /// 用于读写主题设置和其他应用偏好
  Future<Box> _getSettingsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.settingsBoxName)) {
      return await _hive.openBox(HiveConstants.settingsBoxName);
    }
    return _hive.box(HiveConstants.settingsBoxName);
  }

  /// 设置主题模式
  ///
  /// 更新当前主题状态并保存到本地存储
  /// 这是主题切换的核心方法
  Future<void> setThemeMode(AppThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _saveTheme(mode);
  }

  /// 切换明亮/暗黑模式
  ///
  /// 在明亮模式和暗黑模式之间快速切换
  /// 注意：此方法不包含跟随系统选项
  Future<void> toggleDarkMode() async {
    final newMode = state.isDarkMode ? AppThemeMode.light : AppThemeMode.dark;
    await setThemeMode(newMode);
  }
}

// ==================== Provider 依赖注入 ====================

/// 主题状态提供者
///
/// 提供全局的主题状态管理
/// 其他Widget可以通过此Provider监听和修改主题
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier(hive: Hive);
});

/// 暗黑模式状态提供者
///
/// 提供简化的布尔值表示当前是否为暗黑模式
/// 用于需要根据主题调整UI的场景
final isDarkModeProvider = Provider<bool>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.isDarkMode;
});

/// Flutter ThemeMode 提供者
///
/// 将自定义主题模式转换为Flutter原生ThemeMode
/// 直接用于MaterialApp的themeMode属性
final flutterThemeModeProvider = Provider<ThemeMode>((ref) {
  final themeState = ref.watch(themeProvider);
  return themeState.flutterThemeMode;
});

/// 当前主题数据提供者
///
/// 根据当前主题模式返回对应的ThemeData
/// 提供明亮或暗黑主题的完整配置
final currentThemeProvider = Provider<ThemeData>((ref) {
  final isDarkMode = ref.watch(isDarkModeProvider);
  return isDarkMode ? darkTheme : lightTheme;
});

// ==================== 主题配置定义 ====================

/// 明亮模式主题配置
///
/// 定义应用在明亮模式下的视觉风格：
/// - 紫色主色调 (#5E35B1) - 专业稳重
/// - 白色背景 - 清新明亮
/// - 适中的阴影和圆角 - 现代简约
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF5E35B1), // 深紫色主色调
  /// 颜色方案
  /// 基于种子颜色生成一套和谐的颜色系统
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF5E35B1),
    brightness: Brightness.light,
  ),

  /// 应用栏主题
  /// 白色背景，紫色文字，无阴影，标题居中
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF5E35B1),
    elevation: 0,
    centerTitle: true,
  ),

  /// 卡片主题
  /// 轻微阴影，圆角设计，营造层次感
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  /// 按钮主题
  /// 轻微阴影，圆角按钮，现代化设计
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);

/// 暗黑模式主题配置
///
/// 定义应用在暗黑模式下的视觉风格：
/// - 浅紫色主色调 (#B39DDB) - 在深色背景下更柔和
/// - 深灰色背景 (#121212) - 护眼且节能
/// - 更强的阴影效果 - 增强层次感
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFB39DDB), // 浅紫色主色调
  /// 暗黑模式颜色方案
  /// 使用更亮的紫色作为种子色，适配深色背景
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFB39DDB),
    brightness: Brightness.dark,
  ),

  /// 暗黑模式应用栏
  /// 深灰色背景，浅紫色文字
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    foregroundColor: const Color(0xFFB39DDB),
    elevation: 0,
    centerTitle: true,
  ),

  /// 暗黑模式卡片
  /// 更强的阴影，增强深色背景下的层次感
  cardTheme: CardTheme(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  /// 深色背景
  /// Material Design 推荐的深色背景色
  scaffoldBackgroundColor: const Color(0xFF121212),

  /// 暗黑模式按钮
  /// 更强的阴影效果，提升按钮的视觉重量
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);
