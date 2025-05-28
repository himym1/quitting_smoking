/// 焕新之旅 - 戒烟辅助应用
///
/// 语言环境提供者 (LocaleProvider)
/// 功能：
/// 1. 管理应用的国际化语言设置
/// 2. 支持中文和英文双语切换
/// 3. 持久化保存用户语言偏好
/// 4. 提供语言状态管理和切换功能
/// 5. 与Flutter国际化系统集成
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

// ==================== 语言定义 ====================

/// 应用语言类
///
/// 封装单个语言的完整信息
/// 包括语言代码、显示名称和Flutter Locale对象
class AppLanguage {
  /// 语言代码 (如: 'en', 'zh', 'zh_CN')
  final String code;

  /// 语言显示名称 (如: 'English', '中文')
  final String name;

  /// Flutter Locale 对象
  final Locale locale;

  const AppLanguage({
    required this.code,
    required this.name,
    required this.locale,
  });

  /// 重写相等性比较，基于语言代码
  @override
  bool operator ==(Object other) => other is AppLanguage && other.code == code;

  /// 重写哈希码，基于语言代码
  @override
  int get hashCode => code.hashCode;
}

/// 应用支持的语言常量
///
/// 定义应用支持的所有语言及其配置
/// 目前支持：英文、中文（简体）
class AppLanguages {
  /// 英语
  static const english = AppLanguage(
    code: 'en',
    name: 'English',
    locale: Locale('en'),
  );

  /// 中文（通用）
  static const chinese = AppLanguage(
    code: 'zh',
    name: '中文',
    locale: Locale('zh'),
  );

  /// 简体中文（推荐使用）
  static const zhCN = AppLanguage(
    code: 'zh_CN',
    name: '简体中文',
    locale: Locale('zh', 'CN'),
  );

  /// 所有支持的语言列表
  /// 用于设置页面的语言选择器
  static List<AppLanguage> all = [english, chinese, zhCN];

  /// 根据语言代码获取对应的AppLanguage对象
  ///
  /// [code] 语言代码
  /// 返回对应的AppLanguage，如果未找到则默认返回简体中文
  static AppLanguage fromCode(String code) {
    return all.firstWhere(
      (lang) => lang.code == code,
      orElse: () => zhCN, // 默认简体中文
    );
  }
}

// ==================== 语言状态管理 ====================

/// 语言状态类
///
/// 封装当前语言状态
/// 提供状态复制和Locale转换功能
class LocaleState {
  /// 当前选择的语言
  final AppLanguage language;

  const LocaleState({required this.language});

  /// 复制状态并可选更新语言
  LocaleState copyWith({AppLanguage? language}) {
    return LocaleState(language: language ?? this.language);
  }

  /// 获取Flutter Locale对象
  /// 直接用于MaterialApp的locale属性
  Locale get locale => language.locale;
}

/// 语言设置管理器 (StateNotifier)
///
/// 负责：
/// 1. 管理语言状态变化
/// 2. 与本地存储交互，持久化语言偏好
/// 3. 提供语言切换方法
class LocaleNotifier extends StateNotifier<LocaleState> {
  final HiveInterface _hive;

  LocaleNotifier({required HiveInterface hive})
    : _hive = hive,
      super(const LocaleState(language: AppLanguages.zhCN)) {
    // 默认使用简体中文
    _loadLocale(); // 初始化时加载保存的语言设置
  }

  /// 从本地存储加载语言设置
  ///
  /// 从Hive数据库中读取用户之前保存的语言偏好
  /// 如果没有保存的设置或读取失败，则使用默认的简体中文
  Future<void> _loadLocale() async {
    try {
      final box = await _getSettingsBox();
      final savedLanguageCode = box.get('languageCode');

      if (savedLanguageCode != null) {
        // 根据保存的语言代码恢复语言设置
        final language = AppLanguages.fromCode(savedLanguageCode);
        state = LocaleState(language: language);
      } else {
        // 如果没有存储的语言设置，使用默认简体中文
        state = const LocaleState(language: AppLanguages.zhCN);
      }
    } catch (e) {
      // 出错时使用默认简体中文
      logError('加载语言设置出错', tag: 'LocaleNotifier', error: e);
      state = const LocaleState(language: AppLanguages.zhCN);
    }
  }

  /// 保存语言设置到本地存储
  ///
  /// 将用户选择的语言代码持久化保存到Hive数据库
  /// 确保应用重启后能恢复用户的语言偏好
  Future<void> _saveLocale(String languageCode) async {
    try {
      final box = await _getSettingsBox();
      await box.put('languageCode', languageCode);
    } catch (e) {
      logError('保存语言设置出错', tag: 'LocaleNotifier', error: e);
    }
  }

  /// 获取设置存储盒子
  ///
  /// 获取或打开Hive设置数据库
  /// 用于读写语言设置和其他应用偏好
  Future<Box> _getSettingsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.settingsBoxName)) {
      return await _hive.openBox(HiveConstants.settingsBoxName);
    }
    return _hive.box(HiveConstants.settingsBoxName);
  }

  /// 设置应用语言
  ///
  /// 更新当前语言状态并保存到本地存储
  /// 这是语言切换的核心方法，会触发整个应用的重新渲染
  Future<void> setLocale(AppLanguage language) async {
    state = state.copyWith(language: language);
    await _saveLocale(language.code);
  }
}

// ==================== Provider 依赖注入 ====================

/// 语言状态提供者
///
/// 提供全局的语言状态管理
/// 其他Widget可以通过此Provider监听和修改语言设置
final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>((
  ref,
) {
  return LocaleNotifier(hive: Hive);
});

/// 当前Locale提供者
///
/// 提取当前语言的Locale对象
/// 直接用于MaterialApp的locale属性和国际化组件
final currentLocaleProvider = Provider<Locale>((ref) {
  final localeState = ref.watch(localeProvider);
  return localeState.locale;
});
