/// 焕新之旅 - 戒烟辅助应用
///
/// 网络异常处理 (NetworkExceptions)
/// 功能：
/// 1. 定义统一的网络异常类型
/// 2. 处理HTTP状态码和错误响应
/// 3. 提供用户友好的错误消息
/// 4. 支持错误重试和恢复策略
library;

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'network_exceptions.freezed.dart';

/// 网络异常类型定义
///
/// 使用Freezed生成不可变的异常类型
@freezed
class NetworkException with _$NetworkException {
  /// 请求取消
  const factory NetworkException.requestCancelled() = RequestCancelled;

  /// 未授权访问
  const factory NetworkException.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  /// 请求参数错误
  const factory NetworkException.badRequest(String reason) = BadRequest;

  /// 资源未找到
  const factory NetworkException.notFound(String reason) = NotFound;

  /// 请求方法不允许
  const factory NetworkException.methodNotAllowed() = MethodNotAllowed;

  /// 请求不可接受
  const factory NetworkException.notAcceptable() = NotAcceptable;

  /// 请求超时
  const factory NetworkException.requestTimeout() = RequestTimeout;

  /// 发送超时
  const factory NetworkException.sendTimeout() = SendTimeout;

  /// 冲突错误
  const factory NetworkException.conflict(String reason) = Conflict;

  /// 服务器内部错误
  const factory NetworkException.internalServerError() = InternalServerError;

  /// 服务不可用
  const factory NetworkException.serviceUnavailable() = ServiceUnavailable;

  /// 无网络连接
  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  /// 格式化异常
  const factory NetworkException.formatException() = FormatException;

  /// 无法处理的错误
  const factory NetworkException.unableToProcess() = UnableToProcess;

  /// 默认错误
  const factory NetworkException.defaultError(String error) = DefaultError;

  /// 意外错误
  const factory NetworkException.unexpectedError() = UnexpectedError;

  // ==================== 业务特定异常 ====================

  /// 数据同步失败
  const factory NetworkException.syncFailed(String message) =
      SyncFailedException;

  /// 打卡记录相关错误
  const factory NetworkException.checkInFailed(String message) =
      CheckInFailedException;
  const factory NetworkException.checkInAlreadyExists(String message) =
      CheckInAlreadyExistsException;
  const factory NetworkException.checkInNotFound(String message) =
      CheckInNotFoundException;

  /// 吸烟记录相关错误
  const factory NetworkException.smokingRecordFailed(String message) =
      SmokingRecordFailedException;
  const factory NetworkException.smokingRecordNotFound(String message) =
      SmokingRecordNotFoundException;
  const factory NetworkException.invalidSmokingData(String message) =
      InvalidSmokingDataException;

  /// 成就系统相关错误
  const factory NetworkException.achievementFailed(String message) =
      AchievementFailedException;
  const factory NetworkException.achievementAlreadyUnlocked(String message) =
      AchievementAlreadyUnlockedException;
  const factory NetworkException.achievementNotFound(String message) =
      AchievementNotFoundException;
  const factory NetworkException.achievementConditionNotMet(String message) =
      AchievementConditionNotMetException;
}

/// 网络异常处理工具类
class NetworkExceptionHandler {
  /// 从DioException创建NetworkException
  static NetworkException handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return const NetworkException.requestCancelled();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException.requestTimeout();

      case DioExceptionType.sendTimeout:
        return const NetworkException.sendTimeout();

      case DioExceptionType.badResponse:
        return _handleResponseError(dioException);

      case DioExceptionType.connectionError:
        return const NetworkException.noInternetConnection();

      case DioExceptionType.badCertificate:
        return const NetworkException.unexpectedError();

      case DioExceptionType.unknown:
        return _handleUnknownError(dioException);
    }
  }

  /// 处理HTTP响应错误
  static NetworkException _handleResponseError(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;

    switch (statusCode) {
      case 400:
        return NetworkException.badRequest(_extractErrorMessage(data));
      case 401:
        return NetworkException.unauthorizedRequest(_extractErrorMessage(data));
      case 404:
        return NetworkException.notFound(_extractErrorMessage(data));
      case 405:
        return const NetworkException.methodNotAllowed();
      case 406:
        return const NetworkException.notAcceptable();
      case 409:
        return NetworkException.conflict(_extractErrorMessage(data));
      case 408:
        return const NetworkException.requestTimeout();
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        return NetworkException.defaultError(
          'HTTP $statusCode: ${_extractErrorMessage(data)}',
        );
    }
  }

  /// 处理未知错误
  static NetworkException _handleUnknownError(DioException dioException) {
    if (dioException.message?.contains('SocketException') == true) {
      return const NetworkException.noInternetConnection();
    }

    if (dioException.message?.contains('FormatException') == true) {
      return const NetworkException.formatException();
    }

    return NetworkException.defaultError(
      dioException.message ?? 'Unknown error occurred',
    );
  }

  /// 从响应数据中提取错误消息
  static String _extractErrorMessage(dynamic data) {
    if (data == null) return 'Unknown error';

    try {
      if (data is Map<String, dynamic>) {
        // 尝试从API响应格式中提取错误消息
        if (data.containsKey('error')) {
          final error = data['error'];
          if (error is Map<String, dynamic> && error.containsKey('message')) {
            return error['message'] as String;
          }
        }

        // 尝试从message字段提取
        if (data.containsKey('message')) {
          return data['message'] as String;
        }
      }

      return data.toString();
    } catch (e) {
      return 'Error parsing response';
    }
  }

  /// 获取用户友好的错误消息
  static String getDisplayMessage(NetworkException exception) {
    return exception.when(
      requestCancelled: () => '请求已取消',
      unauthorizedRequest: (reason) => '认证失败：$reason',
      badRequest: (reason) => '请求参数错误：$reason',
      notFound: (reason) => '资源未找到：$reason',
      methodNotAllowed: () => '请求方法不允许',
      notAcceptable: () => '请求不可接受',
      requestTimeout: () => '请求超时，请检查网络连接',
      sendTimeout: () => '发送超时，请检查网络连接',
      conflict: (reason) => '数据冲突：$reason',
      internalServerError: () => '服务器内部错误，请稍后重试',
      serviceUnavailable: () => '服务暂时不可用，请稍后重试',
      noInternetConnection: () => '无网络连接，请检查网络设置',
      formatException: () => '数据格式错误',
      unableToProcess: () => '无法处理请求',
      defaultError: (error) => error,
      unexpectedError: () => '发生意外错误',
      // 业务特定异常
      syncFailed: (message) => '数据同步失败：$message',
      checkInFailed: (message) => '打卡失败：$message',
      checkInAlreadyExists: (message) => '今日已打卡：$message',
      checkInNotFound: (message) => '打卡记录未找到：$message',
      smokingRecordFailed: (message) => '吸烟记录失败：$message',
      smokingRecordNotFound: (message) => '吸烟记录未找到：$message',
      invalidSmokingData: (message) => '吸烟数据无效：$message',
      achievementFailed: (message) => '成就操作失败：$message',
      achievementAlreadyUnlocked: (message) => '成就已解锁：$message',
      achievementNotFound: (message) => '成就未找到：$message',
      achievementConditionNotMet: (message) => '成就解锁条件未满足：$message',
    );
  }

  /// 判断是否为可重试的错误
  static bool isRetryable(NetworkException exception) {
    return exception.when(
      requestCancelled: () => false,
      unauthorizedRequest: (_) => false,
      badRequest: (_) => false,
      notFound: (_) => false,
      methodNotAllowed: () => false,
      notAcceptable: () => false,
      requestTimeout: () => true,
      sendTimeout: () => true,
      conflict: (_) => false,
      internalServerError: () => true,
      serviceUnavailable: () => true,
      noInternetConnection: () => true,
      formatException: () => false,
      unableToProcess: () => false,
      defaultError: (_) => false,
      unexpectedError: () => false,
      // 业务特定异常
      syncFailed: (_) => true,
      checkInFailed: (_) => true,
      checkInAlreadyExists: (_) => false,
      checkInNotFound: (_) => false,
      smokingRecordFailed: (_) => true,
      smokingRecordNotFound: (_) => false,
      invalidSmokingData: (_) => false,
      achievementFailed: (_) => true,
      achievementAlreadyUnlocked: (_) => false,
      achievementNotFound: (_) => false,
      achievementConditionNotMet: (_) => false,
    );
  }

  /// 判断是否需要重新认证
  static bool requiresReauth(NetworkException exception) {
    return exception.when(
      requestCancelled: () => false,
      unauthorizedRequest: (_) => true,
      badRequest: (_) => false,
      notFound: (_) => false,
      methodNotAllowed: () => false,
      notAcceptable: () => false,
      requestTimeout: () => false,
      sendTimeout: () => false,
      conflict: (_) => false,
      internalServerError: () => false,
      serviceUnavailable: () => false,
      noInternetConnection: () => false,
      formatException: () => false,
      unableToProcess: () => false,
      defaultError: (_) => false,
      unexpectedError: () => false,
      // 业务特定异常
      syncFailed: (_) => false,
      checkInFailed: (_) => false,
      checkInAlreadyExists: (_) => false,
      checkInNotFound: (_) => false,
      smokingRecordFailed: (_) => false,
      smokingRecordNotFound: (_) => false,
      invalidSmokingData: (_) => false,
      achievementFailed: (_) => false,
      achievementAlreadyUnlocked: (_) => false,
      achievementNotFound: (_) => false,
      achievementConditionNotMet: (_) => false,
    );
  }
}
