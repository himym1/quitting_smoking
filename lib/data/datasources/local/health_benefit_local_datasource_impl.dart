import 'dart:convert';
import 'package:flutter/material.dart'; // For Locale
import 'package:flutter/services.dart' show rootBundle;
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'health_benefit_local_datasource.dart';

class HealthBenefitLocalDataSourceImpl implements HealthBenefitLocalDataSource {
  @override
  Future<List<HealthBenefitMilestone>> getAllHealthBenefits(
    Locale locale,
  ) async {
    final String langCode = locale.languageCode;
    // Determine which JSON file to load based on language code
    // Default to English if a specific localization is not found or not supported
    String filePath;
    if (langCode == 'zh') {
      // Could also check for locale.countryCode == 'CN' if more specific zh variants exist
      filePath = 'assets/data/health_benefits_zh_CN.json';
    } else {
      filePath = 'assets/data/health_benefits_en.json'; // Default
    }

    try {
      final String jsonString = await rootBundle.loadString(filePath);
      final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
      return jsonList
          .map(
            (jsonItem) => HealthBenefitMilestone.fromJson(
              jsonItem as Map<String, dynamic>,
            ),
          )
          .toList();
    } catch (e) {
      // If the specific locale file fails, try falling back to English
      if (filePath != 'assets/data/health_benefits_en.json') {
        try {
          final String jsonString = await rootBundle.loadString(
            'assets/data/health_benefits_en.json',
          );
          final List<dynamic> jsonList =
              json.decode(jsonString) as List<dynamic>;
          return jsonList
              .map(
                (jsonItem) => HealthBenefitMilestone.fromJson(
                  jsonItem as Map<String, dynamic>,
                ),
              )
              .toList();
        } catch (fallbackError) {
          // If English fallback also fails, rethrow the original error or a custom one
          // For simplicity, rethrowing the original error related to the specific locale.
          // Consider logging this error.
          logError(
            '加载健康效益数据失败，英文备用方案也失败了',
            tag: 'HealthBenefitLocalDataSource',
            error: fallbackError,
          );
          throw Exception('Failed to load health benefits data: $e');
        }
      }
      logError('加载健康效益数据时出错', tag: 'HealthBenefitLocalDataSource', error: e);
      throw Exception('Failed to load health benefits data: $e');
    }
  }
}
