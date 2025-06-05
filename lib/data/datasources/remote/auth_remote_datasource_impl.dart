/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证远程数据源实现 (AuthRemoteDataSourceImpl)
 * 功能：
 * 1. 实现认证API接口
 * 2. 使用Dio客户端进行HTTP请求
 * 3. 处理API响应和错误
 * 4. 提供认证相关的网络操作
 */

import 'package:dio/dio.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';
import 'package:quitting_smoking/data/datasources/remote/auth_remote_datasource.dart';
import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';

/// 认证远程数据源实现
///
/// 使用Dio客户端实现认证API调用
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  /// 构造函数
  AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResponseModel<AuthResponseModel>> register(
    RegisterRequestModel request,
  ) async {
    try {
      logInfo('发起用户注册请求: ${request.email}', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authRegister,
        data: request.toJson(),
      );

      logInfo('注册请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<AuthResponseModel>.fromJson(
        response.data!,
        (json) => AuthResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('注册请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<AuthResponseModel>> login(
    LoginRequestModel request,
  ) async {
    try {
      logInfo('发起用户登录请求: ${request.email}', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authLogin,
        data: request.toJson(),
      );

      logInfo('登录请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<AuthResponseModel>.fromJson(
        response.data!,
        (json) => AuthResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('登录请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<TokenInfoModel>> refreshToken(
    RefreshTokenRequestModel request,
  ) async {
    try {
      logInfo('发起令牌刷新请求', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authRefresh,
        data: request.toJson(),
      );

      logInfo('令牌刷新成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<TokenInfoModel>.fromJson(
        response.data!,
        (json) => TokenInfoModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      logError('令牌刷新失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> logout(String token) async {
    try {
      logInfo('发起用户登出请求', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authLogout,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      logInfo('登出请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('登出请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    try {
      logInfo('发起忘记密码请求: ${request.email}', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authForgotPassword,
        data: request.toJson(),
      );

      logInfo('忘记密码请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('忘记密码请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    try {
      logInfo('发起重置密码请求', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.authResetPassword,
        data: request.toJson(),
      );

      logInfo('重置密码请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('重置密码请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<ApiResponseModel<String>> verifyEmail(String token) async {
    try {
      logInfo('发起邮箱验证请求', tag: 'AuthRemoteDataSource');

      final response = await _dioClient.get<Map<String, dynamic>>(
        ApiConfig.authVerifyEmail,
        queryParameters: {'token': token},
      );

      logInfo('邮箱验证请求成功', tag: 'AuthRemoteDataSource');

      return ApiResponseModel<String>.fromJson(
        response.data!,
        (json) => json as String,
      );
    } catch (e) {
      logError('邮箱验证请求失败', tag: 'AuthRemoteDataSource', error: e);
      rethrow;
    }
  }
}
