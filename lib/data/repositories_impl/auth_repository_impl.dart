/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证仓库实现 (AuthRepositoryImpl)
 * 功能：
 * 1. 实现认证仓库接口
 * 2. 集成本地和远程数据源
 * 3. 处理认证逻辑和数据同步
 * 4. 管理令牌存储和用户状态
 */

import 'package:quitting_smoking/domain/repositories/auth_repository.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';
import 'package:quitting_smoking/data/datasources/remote/auth_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/local/user_local_datasource.dart';
import 'package:quitting_smoking/data/mappers/auth_mapper.dart';
import 'package:quitting_smoking/core/services/token_storage_service.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io';

/// 认证仓库实现
/// 
/// 集成本地和远程数据源，提供完整的认证服务
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final UserLocalDatasource _localDataSource;
  final DioClient _dioClient;
  
  /// 构造函数
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required UserLocalDatasource localDataSource,
    required DioClient dioClient,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _dioClient = dioClient;

  @override
  Future<AuthResult> register({
    required String email,
    required String password,
    String? name,
    bool agreeToTerms = false,
  }) async {
    try {
      logInfo('开始用户注册: $email', tag: 'AuthRepository');
      
      // 创建注册请求
      final request = AuthMapper.createRegisterRequest(
        email: email,
        password: password,
        name: name,
        agreeToTerms: agreeToTerms,
      );
      
      // 发送注册请求
      final response = await _remoteDataSource.register(request);
      
      if (!response.isSuccess) {
        throw NetworkException.badRequest(response.errorMessage ?? '注册失败');
      }
      
      final authResponse = response.data!;
      
      // 保存令牌
      await TokenStorageService.saveTokens(
        authResponse.tokens,
        authResponse.user.id,
      );
      
      // 设置认证令牌到HTTP客户端
      _dioClient.setAuthToken(authResponse.tokens.accessToken);
      
      // 提取用户资料
      final userProfile = AuthMapper.extractUserProfileFromAuthResponse(authResponse);
      
      // 保存用户资料到本地
      if (userProfile != null) {
        await _localDataSource.saveUserProfile(userProfile);
      }
      
      logInfo('用户注册成功: ${authResponse.user.id}', tag: 'AuthRepository');
      
      return AuthResult(
        userProfile: userProfile!,
        tokens: authResponse.tokens,
        isNewUser: true,
      );
    } catch (e) {
      logError('用户注册失败', tag: 'AuthRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    try {
      logInfo('开始用户登录: $email', tag: 'AuthRepository');
      
      // 获取设备信息
      final deviceInfo = await _getDeviceInfo();
      
      // 创建登录请求
      final request = AuthMapper.createLoginRequest(
        email: email,
        password: password,
        deviceId: deviceInfo['deviceId'],
        platform: deviceInfo['platform'],
        version: deviceInfo['version'],
      );
      
      // 发送登录请求
      final response = await _remoteDataSource.login(request);
      
      if (!response.isSuccess) {
        throw NetworkException.unauthorizedRequest(response.errorMessage ?? '登录失败');
      }
      
      final authResponse = response.data!;
      
      // 保存令牌
      await TokenStorageService.saveTokens(
        authResponse.tokens,
        authResponse.user.id,
      );
      
      // 设置认证令牌到HTTP客户端
      _dioClient.setAuthToken(authResponse.tokens.accessToken);
      
      // 提取用户资料
      final userProfile = AuthMapper.extractUserProfileFromAuthResponse(authResponse);
      
      // 合并本地和远程用户资料
      final localProfile = await _localDataSource.getUserProfile();
      final mergedProfile = await mergeUserProfiles(localProfile, userProfile);
      
      // 保存合并后的用户资料
      await _localDataSource.saveUserProfile(mergedProfile);
      
      logInfo('用户登录成功: ${authResponse.user.id}', tag: 'AuthRepository');
      
      return AuthResult(
        userProfile: mergedProfile,
        tokens: authResponse.tokens,
        isNewUser: false,
      );
    } catch (e) {
      logError('用户登录失败', tag: 'AuthRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<TokenInfoModel> refreshToken() async {
    try {
      logInfo('开始刷新令牌', tag: 'AuthRepository');
      
      final refreshToken = await TokenStorageService.getRefreshToken();
      if (refreshToken == null) {
        throw NetworkException.unauthorizedRequest('刷新令牌不存在');
      }
      
      final request = AuthMapper.createRefreshTokenRequest(refreshToken);
      final response = await _remoteDataSource.refreshToken(request);
      
      if (!response.isSuccess) {
        throw NetworkException.unauthorizedRequest(response.errorMessage ?? '令牌刷新失败');
      }
      
      final tokenInfo = response.data!;
      final userId = await TokenStorageService.getUserId();
      
      if (userId != null) {
        // 保存新令牌
        await TokenStorageService.saveTokens(tokenInfo, userId);
        
        // 更新HTTP客户端的认证令牌
        _dioClient.setAuthToken(tokenInfo.accessToken);
      }
      
      logInfo('令牌刷新成功', tag: 'AuthRepository');
      return tokenInfo;
    } catch (e) {
      logError('令牌刷新失败', tag: 'AuthRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      logInfo('开始用户登出', tag: 'AuthRepository');
      
      final accessToken = await TokenStorageService.getAccessToken();
      
      // 向服务器发送登出请求（如果有令牌）
      if (accessToken != null) {
        try {
          await _remoteDataSource.logout(accessToken);
        } catch (e) {
          // 登出请求失败不影响本地清理
          logWarning('服务器登出请求失败，继续本地清理', tag: 'AuthRepository');
        }
      }
      
      // 清除本地令牌
      await TokenStorageService.clearTokens();
      
      // 清除HTTP客户端的认证令牌
      _dioClient.clearAuthToken();
      
      logInfo('用户登出成功', tag: 'AuthRepository');
    } catch (e) {
      logError('用户登出失败', tag: 'AuthRepository', error: e);
      rethrow;
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      logInfo('发送忘记密码请求: $email', tag: 'AuthRepository');
      
      final request = AuthMapper.createForgotPasswordRequest(email);
      final response = await _remoteDataSource.forgotPassword(request);
      
      if (!response.isSuccess) {
        logWarning('忘记密码请求失败: ${response.errorMessage}', tag: 'AuthRepository');
        return false;
      }
      
      logInfo('忘记密码请求成功', tag: 'AuthRepository');
      return true;
    } catch (e) {
      logError('忘记密码请求失败', tag: 'AuthRepository', error: e);
      return false;
    }
  }

  @override
  Future<bool> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      logInfo('重置密码请求', tag: 'AuthRepository');
      
      final request = AuthMapper.createResetPasswordRequest(
        token: token,
        newPassword: newPassword,
      );
      final response = await _remoteDataSource.resetPassword(request);
      
      if (!response.isSuccess) {
        logWarning('重置密码失败: ${response.errorMessage}', tag: 'AuthRepository');
        return false;
      }
      
      logInfo('重置密码成功', tag: 'AuthRepository');
      return true;
    } catch (e) {
      logError('重置密码失败', tag: 'AuthRepository', error: e);
      return false;
    }
  }

  @override
  Future<bool> verifyEmail(String token) async {
    try {
      logInfo('验证邮箱请求', tag: 'AuthRepository');
      
      final response = await _remoteDataSource.verifyEmail(token);
      
      if (!response.isSuccess) {
        logWarning('邮箱验证失败: ${response.errorMessage}', tag: 'AuthRepository');
        return false;
      }
      
      logInfo('邮箱验证成功', tag: 'AuthRepository');
      return true;
    } catch (e) {
      logError('邮箱验证失败', tag: 'AuthRepository', error: e);
      return false;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return await TokenStorageService.hasValidAuth();
  }

  @override
  Future<bool> isTokenValid() async {
    final isExpired = await TokenStorageService.isAccessTokenExpired();
    return !isExpired;
  }

  @override
  Future<bool> isTokenExpiringSoon() async {
    return await TokenStorageService.isAccessTokenExpiringSoon();
  }

  @override
  Future<String?> getCurrentUserId() async {
    return await TokenStorageService.getUserId();
  }

  @override
  Future<String?> getCurrentAccessToken() async {
    return await TokenStorageService.getAccessToken();
  }

  @override
  Future<UserProfile> syncUserProfileToServer(UserProfile userProfile) async {
    // TODO: 实现用户资料同步到服务器
    // 这需要用户资料相关的API端点
    logInfo('同步用户资料到服务器（待实现）', tag: 'AuthRepository');
    return userProfile;
  }

  @override
  Future<UserProfile?> getUserProfileFromServer() async {
    // TODO: 实现从服务器获取用户资料
    // 这需要用户资料相关的API端点
    logInfo('从服务器获取用户资料（待实现）', tag: 'AuthRepository');
    return null;
  }

  @override
  Future<UserProfile> mergeUserProfiles(
    UserProfile? localProfile,
    UserProfile? remoteProfile,
  ) async {
    // 如果只有一个资料，直接返回
    if (localProfile == null && remoteProfile == null) {
      throw Exception('本地和远程用户资料都不存在');
    }
    
    if (localProfile == null) return remoteProfile!;
    if (remoteProfile == null) return localProfile;
    
    // 合并策略：优先使用远程数据，但保留本地的引导完成状态
    return remoteProfile.copyWith(
      onboardingCompleted: localProfile.onboardingCompleted,
      // 如果远程数据缺少某些字段，使用本地数据
      smokingYears: remoteProfile.smokingYears ?? localProfile.smokingYears,
    );
  }

  /// 获取设备信息
  Future<Map<String, String?>> _getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final packageInfo = await PackageInfo.fromPlatform();
      
      String? deviceId;
      String platform;
      
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
        platform = 'Android';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
        platform = 'iOS';
      } else {
        platform = Platform.operatingSystem;
      }
      
      return {
        'deviceId': deviceId,
        'platform': platform,
        'version': packageInfo.version,
      };
    } catch (e) {
      logError('获取设备信息失败', tag: 'AuthRepository', error: e);
      return {
        'deviceId': 'unknown',
        'platform': Platform.operatingSystem,
        'version': '1.0.0',
      };
    }
  }
}
