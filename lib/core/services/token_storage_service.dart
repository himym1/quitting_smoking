/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 令牌存储服务 (TokenStorageService)
 * 功能：
 * 1. 安全存储JWT访问令牌和刷新令牌
 * 2. 提供令牌的读取、写入、删除操作
 * 3. 检查令牌有效性和过期时间
 * 4. 使用flutter_secure_storage确保安全性
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';

/// 令牌存储服务
/// 
/// 使用安全存储管理JWT令牌
class TokenStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';
  static const String _userIdKey = 'user_id';
  
  /// 安全存储实例
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );
  
  // ==================== 令牌存储操作 ====================
  
  /// 保存令牌信息
  /// 
  /// [tokenInfo] 令牌信息
  /// [userId] 用户ID
  static Future<void> saveTokens(TokenInfoModel tokenInfo, String userId) async {
    try {
      logInfo('保存令牌信息', tag: 'TokenStorageService');
      
      // 计算过期时间
      final expiryTime = DateTime.now().add(Duration(seconds: tokenInfo.expiresIn));
      
      await Future.wait([
        _secureStorage.write(key: _accessTokenKey, value: tokenInfo.accessToken),
        _secureStorage.write(key: _refreshTokenKey, value: tokenInfo.refreshToken),
        _secureStorage.write(key: _tokenExpiryKey, value: expiryTime.toIso8601String()),
        _secureStorage.write(key: _userIdKey, value: userId),
      ]);
      
      logInfo('令牌信息保存成功', tag: 'TokenStorageService');
    } catch (e) {
      logError('保存令牌信息失败', tag: 'TokenStorageService', error: e);
      rethrow;
    }
  }
  
  /// 获取访问令牌
  static Future<String?> getAccessToken() async {
    try {
      final token = await _secureStorage.read(key: _accessTokenKey);
      if (token != null) {
        logDebug('获取访问令牌成功', tag: 'TokenStorageService');
      }
      return token;
    } catch (e) {
      logError('获取访问令牌失败', tag: 'TokenStorageService', error: e);
      return null;
    }
  }
  
  /// 获取刷新令牌
  static Future<String?> getRefreshToken() async {
    try {
      final token = await _secureStorage.read(key: _refreshTokenKey);
      if (token != null) {
        logDebug('获取刷新令牌成功', tag: 'TokenStorageService');
      }
      return token;
    } catch (e) {
      logError('获取刷新令牌失败', tag: 'TokenStorageService', error: e);
      return null;
    }
  }
  
  /// 获取用户ID
  static Future<String?> getUserId() async {
    try {
      final userId = await _secureStorage.read(key: _userIdKey);
      if (userId != null) {
        logDebug('获取用户ID成功: $userId', tag: 'TokenStorageService');
      }
      return userId;
    } catch (e) {
      logError('获取用户ID失败', tag: 'TokenStorageService', error: e);
      return null;
    }
  }
  
  /// 获取令牌过期时间
  static Future<DateTime?> getTokenExpiry() async {
    try {
      final expiryString = await _secureStorage.read(key: _tokenExpiryKey);
      if (expiryString != null) {
        final expiry = DateTime.parse(expiryString);
        logDebug('获取令牌过期时间成功: $expiry', tag: 'TokenStorageService');
        return expiry;
      }
      return null;
    } catch (e) {
      logError('获取令牌过期时间失败', tag: 'TokenStorageService', error: e);
      return null;
    }
  }
  
  /// 清除所有令牌
  static Future<void> clearTokens() async {
    try {
      logInfo('清除所有令牌', tag: 'TokenStorageService');
      
      await Future.wait([
        _secureStorage.delete(key: _accessTokenKey),
        _secureStorage.delete(key: _refreshTokenKey),
        _secureStorage.delete(key: _tokenExpiryKey),
        _secureStorage.delete(key: _userIdKey),
      ]);
      
      logInfo('令牌清除成功', tag: 'TokenStorageService');
    } catch (e) {
      logError('清除令牌失败', tag: 'TokenStorageService', error: e);
      rethrow;
    }
  }
  
  // ==================== 令牌验证操作 ====================
  
  /// 检查访问令牌是否存在
  static Future<bool> hasAccessToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
  
  /// 检查刷新令牌是否存在
  static Future<bool> hasRefreshToken() async {
    final token = await getRefreshToken();
    return token != null && token.isNotEmpty;
  }
  
  /// 检查访问令牌是否过期
  static Future<bool> isAccessTokenExpired() async {
    try {
      final expiry = await getTokenExpiry();
      if (expiry == null) return true;
      
      final now = DateTime.now();
      final isExpired = now.isAfter(expiry);
      
      logDebug(
        '令牌过期检查: 当前时间=$now, 过期时间=$expiry, 是否过期=$isExpired',
        tag: 'TokenStorageService',
      );
      
      return isExpired;
    } catch (e) {
      logError('检查令牌过期状态失败', tag: 'TokenStorageService', error: e);
      return true; // 出错时认为已过期
    }
  }
  
  /// 检查令牌是否即将过期（5分钟内）
  static Future<bool> isAccessTokenExpiringSoon() async {
    try {
      final expiry = await getTokenExpiry();
      if (expiry == null) return true;
      
      final now = DateTime.now();
      final fiveMinutesLater = now.add(const Duration(minutes: 5));
      final expiringSoon = fiveMinutesLater.isAfter(expiry);
      
      logDebug(
        '令牌即将过期检查: 当前时间=$now, 5分钟后=$fiveMinutesLater, 过期时间=$expiry, 即将过期=$expiringSoon',
        tag: 'TokenStorageService',
      );
      
      return expiringSoon;
    } catch (e) {
      logError('检查令牌即将过期状态失败', tag: 'TokenStorageService', error: e);
      return true; // 出错时认为即将过期
    }
  }
  
  /// 获取令牌剩余有效时间（秒）
  static Future<int> getTokenRemainingTime() async {
    try {
      final expiry = await getTokenExpiry();
      if (expiry == null) return 0;
      
      final now = DateTime.now();
      final remaining = expiry.difference(now).inSeconds;
      
      return remaining > 0 ? remaining : 0;
    } catch (e) {
      logError('获取令牌剩余时间失败', tag: 'TokenStorageService', error: e);
      return 0;
    }
  }
  
  // ==================== 辅助方法 ====================
  
  /// 检查是否有有效的认证信息
  static Future<bool> hasValidAuth() async {
    final hasToken = await hasAccessToken();
    final isExpired = await isAccessTokenExpired();
    
    return hasToken && !isExpired;
  }
  
  /// 获取完整的令牌信息
  static Future<TokenInfoModel?> getTokenInfo() async {
    try {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      final remainingTime = await getTokenRemainingTime();
      
      if (accessToken == null || refreshToken == null) {
        return null;
      }
      
      return TokenInfoModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: remainingTime,
      );
    } catch (e) {
      logError('获取完整令牌信息失败', tag: 'TokenStorageService', error: e);
      return null;
    }
  }
}
