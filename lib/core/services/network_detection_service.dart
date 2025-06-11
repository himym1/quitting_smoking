/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 网络检测服务 (NetworkDetectionService)
 * 功能：
 * 1. 检测可用的API服务器地址
 * 2. 自动选择最佳的baseUrl
 * 3. 提供网络连接状态检测
 * 4. 支持开发环境的动态配置
 */

import 'package:dio/dio.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

/// 网络检测服务
///
/// 用于检测和选择可用的API服务器地址
class NetworkDetectionService {
  static final NetworkDetectionService _instance =
      NetworkDetectionService._internal();
  factory NetworkDetectionService() => _instance;
  NetworkDetectionService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 5000), // 5秒超时
      receiveTimeout: Duration(milliseconds: 5000),
    ),
  );

  String? _cachedBaseUrl;

  /// 检测并返回可用的基础URL
  Future<String> detectAvailableBaseUrl() async {
    if (_cachedBaseUrl != null) {
      logInfo('使用缓存的BaseURL: $_cachedBaseUrl', tag: 'NetworkDetectionService');
      return _cachedBaseUrl!;
    }

    // 在开发环境中检测可用的服务器
    if (ApiConfig.currentEnvironment.isDevelopment) {
      for (String url in ApiConfig.developmentUrls) {
        try {
          logDebug('测试连接: $url', tag: 'NetworkDetectionService');

          // 使用更简单的连接测试 - 直接测试根路径
          final response = await _dio.get(
            url.replaceAll('/api/v1', ''),
            options: Options(
              validateStatus: (status) => status != null && status < 500,
              followRedirects: false,
            ),
          );

          // 如果能连接到服务器（任何非5xx响应都表示服务器可达）
          if (response.statusCode != null && response.statusCode! < 500) {
            _cachedBaseUrl = url;
            logInfo('检测到可用的API服务器: $url', tag: 'NetworkDetectionService');
            return url;
          }
        } catch (e) {
          logDebug('连接测试失败: $url - $e', tag: 'NetworkDetectionService');
          continue;
        }
      }

      // 如果所有URL都不可用，使用默认值
      logWarning('所有API服务器都不可用，使用默认配置', tag: 'NetworkDetectionService');
      return ApiConfig.baseUrl;
    }

    // 非开发环境直接返回配置的URL
    return ApiConfig.baseUrl;
  }

  /// 清除缓存的BaseURL（用于重新检测）
  void clearCachedBaseUrl() {
    _cachedBaseUrl = null;
    logInfo('已清除缓存的BaseURL', tag: 'NetworkDetectionService');
  }

  /// 测试指定URL是否可用
  Future<bool> testConnection(String baseUrl) async {
    try {
      final response = await _dio.get(baseUrl);
      return response.statusCode != null && response.statusCode! < 500;
    } catch (e) {
      return false;
    }
  }

  /// 获取当前使用的BaseURL
  String? get currentBaseUrl => _cachedBaseUrl;
}
