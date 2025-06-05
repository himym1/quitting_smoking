/**
 * 焕新之旅 - 戒烟辅助应用
 *
 * API响应模型 (ApiResponseModel)
 * 功能：
 * 1. 定义统一的API响应格式
 * 2. 支持成功和错误响应
 * 3. 提供JSON序列化/反序列化
 */

import 'package:freezed_annotation/freezed_annotation.dart';

// 代码生成文件导入
part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

/// 泛型API响应模型
///
/// 用于类型安全的响应处理
class ApiResponseModel<T> {
  final bool success;
  final T? data;
  final ErrorDetail? error;
  final ResponseMeta? meta;

  const ApiResponseModel({
    required this.success,
    this.data,
    this.error,
    this.meta,
  });

  /// 从JSON创建实例
  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) dataConverter,
  ) {
    return ApiResponseModel<T>(
      success: json['success'] as bool,
      data: json['data'] != null ? dataConverter(json['data']) : null,
      error:
          json['error'] != null
              ? ErrorDetail.fromJson(json['error'] as Map<String, dynamic>)
              : null,
      meta:
          json['meta'] != null
              ? ResponseMeta.fromJson(json['meta'] as Map<String, dynamic>)
              : null,
    );
  }

  /// 是否为成功响应
  bool get isSuccess => success && error == null;

  /// 是否为错误响应
  bool get isError => !success || error != null;

  /// 获取错误消息
  String? get errorMessage => error?.message;

  /// 获取错误代码
  String? get errorCode => error?.code;
}

/// 错误详情模型
@freezed
class ErrorDetail with _$ErrorDetail {
  const factory ErrorDetail({
    /// 错误代码
    required String code,

    /// 错误消息
    required String message,

    /// 详细错误信息
    List<FieldError>? details,
  }) = _ErrorDetail;

  /// 从JSON创建实例
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

/// 字段错误模型
@freezed
class FieldError with _$FieldError {
  const factory FieldError({
    /// 字段名
    required String field,

    /// 错误代码
    required String code,

    /// 错误消息
    required String message,
  }) = _FieldError;

  /// 从JSON创建实例
  factory FieldError.fromJson(Map<String, dynamic> json) =>
      _$FieldErrorFromJson(json);
}

/// 响应元数据模型
@freezed
class ResponseMeta with _$ResponseMeta {
  const factory ResponseMeta({
    /// 响应时间戳
    required DateTime timestamp,

    /// 请求ID
    String? requestId,

    /// API版本
    @Default('1.0') String version,
  }) = _ResponseMeta;

  /// 从JSON创建实例
  factory ResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetaFromJson(json);
}

/// 分页信息模型
@freezed
class PaginationInfo with _$PaginationInfo {
  const factory PaginationInfo({
    /// 当前页码
    required int page,

    /// 每页大小
    required int limit,

    /// 总记录数
    required int total,

    /// 总页数
    required int totalPages,

    /// 是否有下一页
    required bool hasNext,

    /// 是否有上一页
    required bool hasPrev,
  }) = _PaginationInfo;

  /// 从JSON创建实例
  factory PaginationInfo.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoFromJson(json);
}

/// API响应扩展方法
extension ApiResponseModelExtension<T> on ApiResponseModel<T> {
  /// 是否为成功响应
  bool get isSuccess => success && error == null;

  /// 是否为错误响应
  bool get isError => !success || error != null;

  /// 获取错误消息
  String? get errorMessage => error?.message;

  /// 获取错误代码
  String? get errorCode => error?.code;
}
