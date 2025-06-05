// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorDetailImpl _$$ErrorDetailImplFromJson(Map<String, dynamic> json) =>
    _$ErrorDetailImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => FieldError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ErrorDetailImplToJson(_$ErrorDetailImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };

_$FieldErrorImpl _$$FieldErrorImplFromJson(Map<String, dynamic> json) =>
    _$FieldErrorImpl(
      field: json['field'] as String,
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$FieldErrorImplToJson(_$FieldErrorImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'code': instance.code,
      'message': instance.message,
    };

_$ResponseMetaImpl _$$ResponseMetaImplFromJson(Map<String, dynamic> json) =>
    _$ResponseMetaImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      requestId: json['requestId'] as String?,
      version: json['version'] as String? ?? '1.0',
    );

Map<String, dynamic> _$$ResponseMetaImplToJson(_$ResponseMetaImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'requestId': instance.requestId,
      'version': instance.version,
    };

_$PaginationInfoImpl _$$PaginationInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaginationInfoImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$$PaginationInfoImplToJson(
        _$PaginationInfoImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
