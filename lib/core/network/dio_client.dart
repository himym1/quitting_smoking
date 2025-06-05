/// 焕新之旅 - 戒烟辅助应用
///
/// Dio HTTP客户端 (DioClient)
/// 功能：
/// 1. 配置Dio HTTP客户端
/// 2. 添加认证拦截器
/// 3. 添加错误处理拦截器
/// 4. 添加日志拦截器
/// 5. 提供统一的网络请求接口
library;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quitting_smoking/core/config/api_config.dart';
import 'package:quitting_smoking/core/errors/network_exceptions.dart';
import 'package:quitting_smoking/core/services/logger_service.dart';

/// Dio HTTP客户端
/// 
/// 提供统一的网络请求配置和拦截器
class DioClient {
  late final Dio _dio;
  
  /// 构造函数
  DioClient() {
    _dio = Dio();
    _configureDio();
    _addInterceptors();
  }
  
  /// 获取Dio实例
  Dio get dio => _dio;
  
  /// 配置Dio基础设置
  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConfig.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConfig.receiveTimeout),
      sendTimeout: Duration(milliseconds: ApiConfig.sendTimeout),
      headers: ApiConfig.defaultHeaders,
      responseType: ResponseType.json,
      contentType: Headers.jsonContentType,
    );
  }
  
  /// 添加拦截器
  void _addInterceptors() {
    // 添加日志拦截器（仅在调试模式下）
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          error: true,
          logPrint: (object) {
            logDebug(object.toString(), tag: 'DioClient');
          },
        ),
      );
    }
    
    // 添加错误处理拦截器
    _dio.interceptors.add(ErrorInterceptor());
  }
  
  /// 设置认证令牌
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  /// 清除认证令牌
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
  
  /// 更新基础URL
  void updateBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }
  
  // ==================== HTTP请求方法 ====================
  
  /// GET请求
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptionHandler.handleDioException(e);
    }
  }
  
  /// POST请求
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptionHandler.handleDioException(e);
    }
  }
  
  /// PUT请求
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptionHandler.handleDioException(e);
    }
  }
  
  /// DELETE请求
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptionHandler.handleDioException(e);
    }
  }
  
  /// PATCH请求
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptionHandler.handleDioException(e);
    }
  }
}

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logError(
      'HTTP Error: ${err.type} - ${err.message}',
      tag: 'ErrorInterceptor',
      error: err,
    );
    
    // 继续传递错误
    handler.next(err);
  }
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 检查业务层面的错误
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;
      if (data.containsKey('success') && data['success'] == false) {
        logWarning(
          'Business Error: ${data['error']}',
          tag: 'ErrorInterceptor',
        );
      }
    }
    
    handler.next(response);
  }
}
