// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) {
  return _ErrorDetail.fromJson(json);
}

/// @nodoc
mixin _$ErrorDetail {
  /// 错误代码
  String get code => throw _privateConstructorUsedError;

  /// 错误消息
  String get message => throw _privateConstructorUsedError;

  /// 详细错误信息
  List<FieldError>? get details => throw _privateConstructorUsedError;

  /// Serializes this ErrorDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorDetailCopyWith<ErrorDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDetailCopyWith<$Res> {
  factory $ErrorDetailCopyWith(
          ErrorDetail value, $Res Function(ErrorDetail) then) =
      _$ErrorDetailCopyWithImpl<$Res, ErrorDetail>;
  @useResult
  $Res call({String code, String message, List<FieldError>? details});
}

/// @nodoc
class _$ErrorDetailCopyWithImpl<$Res, $Val extends ErrorDetail>
    implements $ErrorDetailCopyWith<$Res> {
  _$ErrorDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<FieldError>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorDetailImplCopyWith<$Res>
    implements $ErrorDetailCopyWith<$Res> {
  factory _$$ErrorDetailImplCopyWith(
          _$ErrorDetailImpl value, $Res Function(_$ErrorDetailImpl) then) =
      __$$ErrorDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, List<FieldError>? details});
}

/// @nodoc
class __$$ErrorDetailImplCopyWithImpl<$Res>
    extends _$ErrorDetailCopyWithImpl<$Res, _$ErrorDetailImpl>
    implements _$$ErrorDetailImplCopyWith<$Res> {
  __$$ErrorDetailImplCopyWithImpl(
      _$ErrorDetailImpl _value, $Res Function(_$ErrorDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$ErrorDetailImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<FieldError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorDetailImpl implements _ErrorDetail {
  const _$ErrorDetailImpl(
      {required this.code,
      required this.message,
      final List<FieldError>? details})
      : _details = details;

  factory _$ErrorDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorDetailImplFromJson(json);

  /// 错误代码
  @override
  final String code;

  /// 错误消息
  @override
  final String message;

  /// 详细错误信息
  final List<FieldError>? _details;

  /// 详细错误信息
  @override
  List<FieldError>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ErrorDetail(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of ErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailImplCopyWith<_$ErrorDetailImpl> get copyWith =>
      __$$ErrorDetailImplCopyWithImpl<_$ErrorDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorDetailImplToJson(
      this,
    );
  }
}

abstract class _ErrorDetail implements ErrorDetail {
  const factory _ErrorDetail(
      {required final String code,
      required final String message,
      final List<FieldError>? details}) = _$ErrorDetailImpl;

  factory _ErrorDetail.fromJson(Map<String, dynamic> json) =
      _$ErrorDetailImpl.fromJson;

  /// 错误代码
  @override
  String get code;

  /// 错误消息
  @override
  String get message;

  /// 详细错误信息
  @override
  List<FieldError>? get details;

  /// Create a copy of ErrorDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDetailImplCopyWith<_$ErrorDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldError _$FieldErrorFromJson(Map<String, dynamic> json) {
  return _FieldError.fromJson(json);
}

/// @nodoc
mixin _$FieldError {
  /// 字段名
  String get field => throw _privateConstructorUsedError;

  /// 错误代码
  String get code => throw _privateConstructorUsedError;

  /// 错误消息
  String get message => throw _privateConstructorUsedError;

  /// Serializes this FieldError to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldErrorCopyWith<FieldError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldErrorCopyWith<$Res> {
  factory $FieldErrorCopyWith(
          FieldError value, $Res Function(FieldError) then) =
      _$FieldErrorCopyWithImpl<$Res, FieldError>;
  @useResult
  $Res call({String field, String code, String message});
}

/// @nodoc
class _$FieldErrorCopyWithImpl<$Res, $Val extends FieldError>
    implements $FieldErrorCopyWith<$Res> {
  _$FieldErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldErrorImplCopyWith<$Res>
    implements $FieldErrorCopyWith<$Res> {
  factory _$$FieldErrorImplCopyWith(
          _$FieldErrorImpl value, $Res Function(_$FieldErrorImpl) then) =
      __$$FieldErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String field, String code, String message});
}

/// @nodoc
class __$$FieldErrorImplCopyWithImpl<$Res>
    extends _$FieldErrorCopyWithImpl<$Res, _$FieldErrorImpl>
    implements _$$FieldErrorImplCopyWith<$Res> {
  __$$FieldErrorImplCopyWithImpl(
      _$FieldErrorImpl _value, $Res Function(_$FieldErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$FieldErrorImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldErrorImpl implements _FieldError {
  const _$FieldErrorImpl(
      {required this.field, required this.code, required this.message});

  factory _$FieldErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldErrorImplFromJson(json);

  /// 字段名
  @override
  final String field;

  /// 错误代码
  @override
  final String code;

  /// 错误消息
  @override
  final String message;

  @override
  String toString() {
    return 'FieldError(field: $field, code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldErrorImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, field, code, message);

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldErrorImplCopyWith<_$FieldErrorImpl> get copyWith =>
      __$$FieldErrorImplCopyWithImpl<_$FieldErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldErrorImplToJson(
      this,
    );
  }
}

abstract class _FieldError implements FieldError {
  const factory _FieldError(
      {required final String field,
      required final String code,
      required final String message}) = _$FieldErrorImpl;

  factory _FieldError.fromJson(Map<String, dynamic> json) =
      _$FieldErrorImpl.fromJson;

  /// 字段名
  @override
  String get field;

  /// 错误代码
  @override
  String get code;

  /// 错误消息
  @override
  String get message;

  /// Create a copy of FieldError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldErrorImplCopyWith<_$FieldErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseMeta _$ResponseMetaFromJson(Map<String, dynamic> json) {
  return _ResponseMeta.fromJson(json);
}

/// @nodoc
mixin _$ResponseMeta {
  /// 响应时间戳
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// 请求ID
  String? get requestId => throw _privateConstructorUsedError;

  /// API版本
  String get version => throw _privateConstructorUsedError;

  /// Serializes this ResponseMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseMetaCopyWith<ResponseMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseMetaCopyWith<$Res> {
  factory $ResponseMetaCopyWith(
          ResponseMeta value, $Res Function(ResponseMeta) then) =
      _$ResponseMetaCopyWithImpl<$Res, ResponseMeta>;
  @useResult
  $Res call({DateTime timestamp, String? requestId, String version});
}

/// @nodoc
class _$ResponseMetaCopyWithImpl<$Res, $Val extends ResponseMeta>
    implements $ResponseMetaCopyWith<$Res> {
  _$ResponseMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? requestId = freezed,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseMetaImplCopyWith<$Res>
    implements $ResponseMetaCopyWith<$Res> {
  factory _$$ResponseMetaImplCopyWith(
          _$ResponseMetaImpl value, $Res Function(_$ResponseMetaImpl) then) =
      __$$ResponseMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, String? requestId, String version});
}

/// @nodoc
class __$$ResponseMetaImplCopyWithImpl<$Res>
    extends _$ResponseMetaCopyWithImpl<$Res, _$ResponseMetaImpl>
    implements _$$ResponseMetaImplCopyWith<$Res> {
  __$$ResponseMetaImplCopyWithImpl(
      _$ResponseMetaImpl _value, $Res Function(_$ResponseMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? requestId = freezed,
    Object? version = null,
  }) {
    return _then(_$ResponseMetaImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseMetaImpl implements _ResponseMeta {
  const _$ResponseMetaImpl(
      {required this.timestamp, this.requestId, this.version = '1.0'});

  factory _$ResponseMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseMetaImplFromJson(json);

  /// 响应时间戳
  @override
  final DateTime timestamp;

  /// 请求ID
  @override
  final String? requestId;

  /// API版本
  @override
  @JsonKey()
  final String version;

  @override
  String toString() {
    return 'ResponseMeta(timestamp: $timestamp, requestId: $requestId, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseMetaImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, requestId, version);

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseMetaImplCopyWith<_$ResponseMetaImpl> get copyWith =>
      __$$ResponseMetaImplCopyWithImpl<_$ResponseMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseMetaImplToJson(
      this,
    );
  }
}

abstract class _ResponseMeta implements ResponseMeta {
  const factory _ResponseMeta(
      {required final DateTime timestamp,
      final String? requestId,
      final String version}) = _$ResponseMetaImpl;

  factory _ResponseMeta.fromJson(Map<String, dynamic> json) =
      _$ResponseMetaImpl.fromJson;

  /// 响应时间戳
  @override
  DateTime get timestamp;

  /// 请求ID
  @override
  String? get requestId;

  /// API版本
  @override
  String get version;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseMetaImplCopyWith<_$ResponseMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationInfo _$PaginationInfoFromJson(Map<String, dynamic> json) {
  return _PaginationInfo.fromJson(json);
}

/// @nodoc
mixin _$PaginationInfo {
  /// 当前页码
  int get page => throw _privateConstructorUsedError;

  /// 每页大小
  int get limit => throw _privateConstructorUsedError;

  /// 总记录数
  int get total => throw _privateConstructorUsedError;

  /// 总页数
  int get totalPages => throw _privateConstructorUsedError;

  /// 是否有下一页
  bool get hasNext => throw _privateConstructorUsedError;

  /// 是否有上一页
  bool get hasPrev => throw _privateConstructorUsedError;

  /// Serializes this PaginationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationInfoCopyWith<PaginationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationInfoCopyWith<$Res> {
  factory $PaginationInfoCopyWith(
          PaginationInfo value, $Res Function(PaginationInfo) then) =
      _$PaginationInfoCopyWithImpl<$Res, PaginationInfo>;
  @useResult
  $Res call(
      {int page,
      int limit,
      int total,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class _$PaginationInfoCopyWithImpl<$Res, $Val extends PaginationInfo>
    implements $PaginationInfoCopyWith<$Res> {
  _$PaginationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationInfoImplCopyWith<$Res>
    implements $PaginationInfoCopyWith<$Res> {
  factory _$$PaginationInfoImplCopyWith(_$PaginationInfoImpl value,
          $Res Function(_$PaginationInfoImpl) then) =
      __$$PaginationInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int limit,
      int total,
      int totalPages,
      bool hasNext,
      bool hasPrev});
}

/// @nodoc
class __$$PaginationInfoImplCopyWithImpl<$Res>
    extends _$PaginationInfoCopyWithImpl<$Res, _$PaginationInfoImpl>
    implements _$$PaginationInfoImplCopyWith<$Res> {
  __$$PaginationInfoImplCopyWithImpl(
      _$PaginationInfoImpl _value, $Res Function(_$PaginationInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrev = null,
  }) {
    return _then(_$PaginationInfoImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrev: null == hasPrev
          ? _value.hasPrev
          : hasPrev // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationInfoImpl implements _PaginationInfo {
  const _$PaginationInfoImpl(
      {required this.page,
      required this.limit,
      required this.total,
      required this.totalPages,
      required this.hasNext,
      required this.hasPrev});

  factory _$PaginationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationInfoImplFromJson(json);

  /// 当前页码
  @override
  final int page;

  /// 每页大小
  @override
  final int limit;

  /// 总记录数
  @override
  final int total;

  /// 总页数
  @override
  final int totalPages;

  /// 是否有下一页
  @override
  final bool hasNext;

  /// 是否有上一页
  @override
  final bool hasPrev;

  @override
  String toString() {
    return 'PaginationInfo(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationInfoImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, page, limit, total, totalPages, hasNext, hasPrev);

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      __$$PaginationInfoImplCopyWithImpl<_$PaginationInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationInfoImplToJson(
      this,
    );
  }
}

abstract class _PaginationInfo implements PaginationInfo {
  const factory _PaginationInfo(
      {required final int page,
      required final int limit,
      required final int total,
      required final int totalPages,
      required final bool hasNext,
      required final bool hasPrev}) = _$PaginationInfoImpl;

  factory _PaginationInfo.fromJson(Map<String, dynamic> json) =
      _$PaginationInfoImpl.fromJson;

  /// 当前页码
  @override
  int get page;

  /// 每页大小
  @override
  int get limit;

  /// 总记录数
  @override
  int get total;

  /// 总页数
  @override
  int get totalPages;

  /// 是否有下一页
  @override
  bool get hasNext;

  /// 是否有上一页
  @override
  bool get hasPrev;

  /// Create a copy of PaginationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationInfoImplCopyWith<_$PaginationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
