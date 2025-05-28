import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/local/achievement_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/achievement_definition.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';
import 'package:flutter/widgets.dart' show Locale;

class AchievementLocalDataSourceImpl implements AchievementLocalDataSource {
  final HiveInterface _hive;
  final Locale _locale;

  AchievementLocalDataSourceImpl(this._hive, this._locale);

  @override
  Future<List<AchievementDefinition>> getAchievementDefinitions() async {
    try {
      // Determine which language file to use based on locale
      final String languageCode = _locale.languageCode;
      final String countryCode = _locale.countryCode ?? '';

      String assetPath;
      if (languageCode == 'zh' && countryCode == 'CN') {
        assetPath = 'assets/data/achievement_definitions_zh_CN.json';
      } else {
        // Default to English
        assetPath = 'assets/data/achievement_definitions_en.json';
      }

      final String jsonString = await rootBundle.loadString(assetPath);
      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList
          .map((dynamic json) => AchievementDefinition.fromJson(json))
          .toList();
    } catch (e) {
      logError('加载成就定义时出错', tag: 'AchievementLocalDataSource', error: e);
      return [];
    }
  }

  @override
  Future<List<UnlockedAchievement>> getUnlockedAchievements() async {
    try {
      final box = await _getUnlockedAchievementsBox();
      return box.values.toList();
    } catch (e) {
      logError('获取已解锁成就时出错', tag: 'AchievementLocalDataSource', error: e);
      return [];
    }
  }

  @override
  Future<bool> saveUnlockedAchievement(
    UnlockedAchievement unlockedAchievement,
  ) async {
    try {
      final box = await _getUnlockedAchievementsBox();
      await box.put(unlockedAchievement.achievementId, unlockedAchievement);
      return true;
    } catch (e) {
      logError('保存已解锁成就时出错', tag: 'AchievementLocalDataSource', error: e);
      return false;
    }
  }

  @override
  Future<bool> isAchievementUnlocked(String achievementId) async {
    try {
      final box = await _getUnlockedAchievementsBox();
      return box.containsKey(achievementId);
    } catch (e) {
      logError('检查成就解锁状态时出错', tag: 'AchievementLocalDataSource', error: e);
      return false;
    }
  }

  /// 清除所有解锁的成就数据（用于调试和重置）
  Future<bool> clearAllUnlockedAchievements() async {
    try {
      final box = await _getUnlockedAchievementsBox();
      await box.clear();
      logInfo('所有已解锁成就已清除', tag: 'AchievementLocalDataSource');
      return true;
    } catch (e) {
      logError('清除已解锁成就时出错', tag: 'AchievementLocalDataSource', error: e);
      return false;
    }
  }

  Future<Box<UnlockedAchievement>> _getUnlockedAchievementsBox() async {
    if (!_hive.isBoxOpen(HiveConstants.unlockedAchievementsBoxName)) {
      return await _hive.openBox<UnlockedAchievement>(
        HiveConstants.unlockedAchievementsBoxName,
      );
    }
    return _hive.box<UnlockedAchievement>(
      HiveConstants.unlockedAchievementsBoxName,
    );
  }
}
