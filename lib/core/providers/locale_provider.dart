import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';

/// 支持的语言
class AppLanguage {
  final String code;
  final String name;
  final Locale locale;

  const AppLanguage({
    required this.code,
    required this.name,
    required this.locale,
  });

  @override
  bool operator ==(Object other) => other is AppLanguage && other.code == code;

  @override
  int get hashCode => code.hashCode;
}

/// 预定义的支持语言
class AppLanguages {
  static const english = AppLanguage(
    code: 'en',
    name: 'English',
    locale: Locale('en'),
  );

  static const chinese = AppLanguage(
    code: 'zh',
    name: '中文',
    locale: Locale('zh'),
  );

  static const zhCN = AppLanguage(
    code: 'zh_CN',
    name: '简体中文',
    locale: Locale('zh', 'CN'),
  );

  /// 所有支持的语言列表
  static List<AppLanguage> all = [english, chinese, zhCN];

  /// 根据语言代码获取对应的AppLanguage
  static AppLanguage fromCode(String code) {
    return all.firstWhere(
      (lang) => lang.code == code,
      orElse: () => zhCN, // 默认中文
    );
  }
}

/// 语言状态类
class LocaleState {
  final AppLanguage language;

  const LocaleState({required this.language});

  LocaleState copyWith({AppLanguage? language}) {
    return LocaleState(language: language ?? this.language);
  }

  Locale get locale => language.locale;
}

/// 语言设置Notifier
class LocaleNotifier extends StateNotifier<LocaleState> {
  final HiveInterface _hive;

  LocaleNotifier({required HiveInterface hive})
    : _hive = hive,
      super(const LocaleState(language: AppLanguages.zhCN)) {
    // 默认中文
    _loadLocale();
  }

  /// 从存储中加载语言设置
  Future<void> _loadLocale() async {
    try {
      final box = await _getSettingsBox();
      final savedLanguageCode = box.get('languageCode');

      if (savedLanguageCode != null) {
        final language = AppLanguages.fromCode(savedLanguageCode);
        state = LocaleState(language: language);
      } else {
        // 如果没有存储的语言设置，使用默认中文
        state = const LocaleState(language: AppLanguages.zhCN);
      }
    } catch (e) {
      // 出错时使用默认中文
      state = const LocaleState(language: AppLanguages.zhCN);
    }
  }

  /// 保存语言设置
  Future<void> _saveLocale(String languageCode) async {
    try {
      final box = await _getSettingsBox();
      await box.put('languageCode', languageCode);
    } catch (e) {
      print('保存语言设置出错: $e');
    }
  }

  /// 获取设置Box
  Future<Box> _getSettingsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.settingsBoxName)) {
      return await _hive.openBox(HiveConstants.settingsBoxName);
    }
    return _hive.box(HiveConstants.settingsBoxName);
  }

  /// 切换语言
  Future<void> setLocale(AppLanguage language) async {
    state = state.copyWith(language: language);
    await _saveLocale(language.code);
  }
}

/// 语言提供者
final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>((
  ref,
) {
  return LocaleNotifier(hive: Hive);
});

/// 当前Locale提供者
final currentLocaleProvider = Provider<Locale>((ref) {
  final localeState = ref.watch(localeProvider);
  return localeState.locale;
});
