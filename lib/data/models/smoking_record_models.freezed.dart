// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smoking_record_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateSmokingRecordRequestModel _$CreateSmokingRecordRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateSmokingRecordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateSmokingRecordRequestModel {
  /// 吸烟时间
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// 吸烟支数
  int get cigarettesSmoked => throw _privateConstructorUsedError;

  /// 触发因素标签
  List<String>? get triggerTags => throw _privateConstructorUsedError;

  /// 备注
  String? get notes => throw _privateConstructorUsedError;

  /// 位置信息
  LocationInfoModel? get location => throw _privateConstructorUsedError;

  /// Serializes this CreateSmokingRecordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateSmokingRecordRequestModelCopyWith<CreateSmokingRecordRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSmokingRecordRequestModelCopyWith<$Res> {
  factory $CreateSmokingRecordRequestModelCopyWith(
          CreateSmokingRecordRequestModel value,
          $Res Function(CreateSmokingRecordRequestModel) then) =
      _$CreateSmokingRecordRequestModelCopyWithImpl<$Res,
          CreateSmokingRecordRequestModel>;
  @useResult
  $Res call(
      {DateTime timestamp,
      int cigarettesSmoked,
      List<String>? triggerTags,
      String? notes,
      LocationInfoModel? location});

  $LocationInfoModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$CreateSmokingRecordRequestModelCopyWithImpl<$Res,
        $Val extends CreateSmokingRecordRequestModel>
    implements $CreateSmokingRecordRequestModelCopyWith<$Res> {
  _$CreateSmokingRecordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cigarettesSmoked: null == cigarettesSmoked
          ? _value.cigarettesSmoked
          : cigarettesSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      triggerTags: freezed == triggerTags
          ? _value.triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationInfoModel?,
    ) as $Val);
  }

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationInfoModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationInfoModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateSmokingRecordRequestModelImplCopyWith<$Res>
    implements $CreateSmokingRecordRequestModelCopyWith<$Res> {
  factory _$$CreateSmokingRecordRequestModelImplCopyWith(
          _$CreateSmokingRecordRequestModelImpl value,
          $Res Function(_$CreateSmokingRecordRequestModelImpl) then) =
      __$$CreateSmokingRecordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      int cigarettesSmoked,
      List<String>? triggerTags,
      String? notes,
      LocationInfoModel? location});

  @override
  $LocationInfoModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CreateSmokingRecordRequestModelImplCopyWithImpl<$Res>
    extends _$CreateSmokingRecordRequestModelCopyWithImpl<$Res,
        _$CreateSmokingRecordRequestModelImpl>
    implements _$$CreateSmokingRecordRequestModelImplCopyWith<$Res> {
  __$$CreateSmokingRecordRequestModelImplCopyWithImpl(
      _$CreateSmokingRecordRequestModelImpl _value,
      $Res Function(_$CreateSmokingRecordRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? location = freezed,
  }) {
    return _then(_$CreateSmokingRecordRequestModelImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cigarettesSmoked: null == cigarettesSmoked
          ? _value.cigarettesSmoked
          : cigarettesSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      triggerTags: freezed == triggerTags
          ? _value._triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSmokingRecordRequestModelImpl
    implements _CreateSmokingRecordRequestModel {
  const _$CreateSmokingRecordRequestModelImpl(
      {required this.timestamp,
      this.cigarettesSmoked = 1,
      final List<String>? triggerTags,
      this.notes,
      this.location})
      : _triggerTags = triggerTags;

  factory _$CreateSmokingRecordRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateSmokingRecordRequestModelImplFromJson(json);

  /// 吸烟时间
  @override
  final DateTime timestamp;

  /// 吸烟支数
  @override
  @JsonKey()
  final int cigarettesSmoked;

  /// 触发因素标签
  final List<String>? _triggerTags;

  /// 触发因素标签
  @override
  List<String>? get triggerTags {
    final value = _triggerTags;
    if (value == null) return null;
    if (_triggerTags is EqualUnmodifiableListView) return _triggerTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 备注
  @override
  final String? notes;

  /// 位置信息
  @override
  final LocationInfoModel? location;

  @override
  String toString() {
    return 'CreateSmokingRecordRequestModel(timestamp: $timestamp, cigarettesSmoked: $cigarettesSmoked, triggerTags: $triggerTags, notes: $notes, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSmokingRecordRequestModelImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cigarettesSmoked, cigarettesSmoked) ||
                other.cigarettesSmoked == cigarettesSmoked) &&
            const DeepCollectionEquality()
                .equals(other._triggerTags, _triggerTags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, cigarettesSmoked,
      const DeepCollectionEquality().hash(_triggerTags), notes, location);

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSmokingRecordRequestModelImplCopyWith<
          _$CreateSmokingRecordRequestModelImpl>
      get copyWith => __$$CreateSmokingRecordRequestModelImplCopyWithImpl<
          _$CreateSmokingRecordRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSmokingRecordRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateSmokingRecordRequestModel
    implements CreateSmokingRecordRequestModel {
  const factory _CreateSmokingRecordRequestModel(
          {required final DateTime timestamp,
          final int cigarettesSmoked,
          final List<String>? triggerTags,
          final String? notes,
          final LocationInfoModel? location}) =
      _$CreateSmokingRecordRequestModelImpl;

  factory _CreateSmokingRecordRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateSmokingRecordRequestModelImpl.fromJson;

  /// 吸烟时间
  @override
  DateTime get timestamp;

  /// 吸烟支数
  @override
  int get cigarettesSmoked;

  /// 触发因素标签
  @override
  List<String>? get triggerTags;

  /// 备注
  @override
  String? get notes;

  /// 位置信息
  @override
  LocationInfoModel? get location;

  /// Create a copy of CreateSmokingRecordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSmokingRecordRequestModelImplCopyWith<
          _$CreateSmokingRecordRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocationInfoModel _$LocationInfoModelFromJson(Map<String, dynamic> json) {
  return _LocationInfoModel.fromJson(json);
}

/// @nodoc
mixin _$LocationInfoModel {
  /// 位置名称
  String? get name => throw _privateConstructorUsedError;

  /// 坐标信息 [经度, 纬度]
  List<double>? get coordinates => throw _privateConstructorUsedError;

  /// Serializes this LocationInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationInfoModelCopyWith<LocationInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationInfoModelCopyWith<$Res> {
  factory $LocationInfoModelCopyWith(
          LocationInfoModel value, $Res Function(LocationInfoModel) then) =
      _$LocationInfoModelCopyWithImpl<$Res, LocationInfoModel>;
  @useResult
  $Res call({String? name, List<double>? coordinates});
}

/// @nodoc
class _$LocationInfoModelCopyWithImpl<$Res, $Val extends LocationInfoModel>
    implements $LocationInfoModelCopyWith<$Res> {
  _$LocationInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationInfoModelImplCopyWith<$Res>
    implements $LocationInfoModelCopyWith<$Res> {
  factory _$$LocationInfoModelImplCopyWith(_$LocationInfoModelImpl value,
          $Res Function(_$LocationInfoModelImpl) then) =
      __$$LocationInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, List<double>? coordinates});
}

/// @nodoc
class __$$LocationInfoModelImplCopyWithImpl<$Res>
    extends _$LocationInfoModelCopyWithImpl<$Res, _$LocationInfoModelImpl>
    implements _$$LocationInfoModelImplCopyWith<$Res> {
  __$$LocationInfoModelImplCopyWithImpl(_$LocationInfoModelImpl _value,
      $Res Function(_$LocationInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$LocationInfoModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationInfoModelImpl implements _LocationInfoModel {
  const _$LocationInfoModelImpl({this.name, final List<double>? coordinates})
      : _coordinates = coordinates;

  factory _$LocationInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationInfoModelImplFromJson(json);

  /// 位置名称
  @override
  final String? name;

  /// 坐标信息 [经度, 纬度]
  final List<double>? _coordinates;

  /// 坐标信息 [经度, 纬度]
  @override
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationInfoModel(name: $name, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationInfoModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_coordinates));

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationInfoModelImplCopyWith<_$LocationInfoModelImpl> get copyWith =>
      __$$LocationInfoModelImplCopyWithImpl<_$LocationInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationInfoModelImplToJson(
      this,
    );
  }
}

abstract class _LocationInfoModel implements LocationInfoModel {
  const factory _LocationInfoModel(
      {final String? name,
      final List<double>? coordinates}) = _$LocationInfoModelImpl;

  factory _LocationInfoModel.fromJson(Map<String, dynamic> json) =
      _$LocationInfoModelImpl.fromJson;

  /// 位置名称
  @override
  String? get name;

  /// 坐标信息 [经度, 纬度]
  @override
  List<double>? get coordinates;

  /// Create a copy of LocationInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationInfoModelImplCopyWith<_$LocationInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmokingRecordResponseModel _$SmokingRecordResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SmokingRecordResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SmokingRecordResponseModel {
  /// 记录ID
  String get id => throw _privateConstructorUsedError;

  /// 用户ID
  String get userId => throw _privateConstructorUsedError;

  /// 吸烟时间
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// 吸烟支数
  int get cigarettesSmoked => throw _privateConstructorUsedError;

  /// 触发因素标签
  List<String>? get triggerTags => throw _privateConstructorUsedError;

  /// 备注
  String? get notes => throw _privateConstructorUsedError;

  /// 位置信息
  LocationInfoModel? get location => throw _privateConstructorUsedError;

  /// 对戒烟进度的影响
  SmokingImpactModel? get impact => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SmokingRecordResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmokingRecordResponseModelCopyWith<SmokingRecordResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmokingRecordResponseModelCopyWith<$Res> {
  factory $SmokingRecordResponseModelCopyWith(SmokingRecordResponseModel value,
          $Res Function(SmokingRecordResponseModel) then) =
      _$SmokingRecordResponseModelCopyWithImpl<$Res,
          SmokingRecordResponseModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime timestamp,
      int cigarettesSmoked,
      List<String>? triggerTags,
      String? notes,
      LocationInfoModel? location,
      SmokingImpactModel? impact,
      DateTime createdAt,
      DateTime updatedAt});

  $LocationInfoModelCopyWith<$Res>? get location;
  $SmokingImpactModelCopyWith<$Res>? get impact;
}

/// @nodoc
class _$SmokingRecordResponseModelCopyWithImpl<$Res,
        $Val extends SmokingRecordResponseModel>
    implements $SmokingRecordResponseModelCopyWith<$Res> {
  _$SmokingRecordResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? impact = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cigarettesSmoked: null == cigarettesSmoked
          ? _value.cigarettesSmoked
          : cigarettesSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      triggerTags: freezed == triggerTags
          ? _value.triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationInfoModel?,
      impact: freezed == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as SmokingImpactModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationInfoModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationInfoModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SmokingImpactModelCopyWith<$Res>? get impact {
    if (_value.impact == null) {
      return null;
    }

    return $SmokingImpactModelCopyWith<$Res>(_value.impact!, (value) {
      return _then(_value.copyWith(impact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SmokingRecordResponseModelImplCopyWith<$Res>
    implements $SmokingRecordResponseModelCopyWith<$Res> {
  factory _$$SmokingRecordResponseModelImplCopyWith(
          _$SmokingRecordResponseModelImpl value,
          $Res Function(_$SmokingRecordResponseModelImpl) then) =
      __$$SmokingRecordResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime timestamp,
      int cigarettesSmoked,
      List<String>? triggerTags,
      String? notes,
      LocationInfoModel? location,
      SmokingImpactModel? impact,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $LocationInfoModelCopyWith<$Res>? get location;
  @override
  $SmokingImpactModelCopyWith<$Res>? get impact;
}

/// @nodoc
class __$$SmokingRecordResponseModelImplCopyWithImpl<$Res>
    extends _$SmokingRecordResponseModelCopyWithImpl<$Res,
        _$SmokingRecordResponseModelImpl>
    implements _$$SmokingRecordResponseModelImplCopyWith<$Res> {
  __$$SmokingRecordResponseModelImplCopyWithImpl(
      _$SmokingRecordResponseModelImpl _value,
      $Res Function(_$SmokingRecordResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? location = freezed,
    Object? impact = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SmokingRecordResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cigarettesSmoked: null == cigarettesSmoked
          ? _value.cigarettesSmoked
          : cigarettesSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      triggerTags: freezed == triggerTags
          ? _value._triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationInfoModel?,
      impact: freezed == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as SmokingImpactModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmokingRecordResponseModelImpl implements _SmokingRecordResponseModel {
  const _$SmokingRecordResponseModelImpl(
      {required this.id,
      required this.userId,
      required this.timestamp,
      required this.cigarettesSmoked,
      final List<String>? triggerTags,
      this.notes,
      this.location,
      this.impact,
      required this.createdAt,
      required this.updatedAt})
      : _triggerTags = triggerTags;

  factory _$SmokingRecordResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SmokingRecordResponseModelImplFromJson(json);

  /// 记录ID
  @override
  final String id;

  /// 用户ID
  @override
  final String userId;

  /// 吸烟时间
  @override
  final DateTime timestamp;

  /// 吸烟支数
  @override
  final int cigarettesSmoked;

  /// 触发因素标签
  final List<String>? _triggerTags;

  /// 触发因素标签
  @override
  List<String>? get triggerTags {
    final value = _triggerTags;
    if (value == null) return null;
    if (_triggerTags is EqualUnmodifiableListView) return _triggerTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 备注
  @override
  final String? notes;

  /// 位置信息
  @override
  final LocationInfoModel? location;

  /// 对戒烟进度的影响
  @override
  final SmokingImpactModel? impact;

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SmokingRecordResponseModel(id: $id, userId: $userId, timestamp: $timestamp, cigarettesSmoked: $cigarettesSmoked, triggerTags: $triggerTags, notes: $notes, location: $location, impact: $impact, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmokingRecordResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cigarettesSmoked, cigarettesSmoked) ||
                other.cigarettesSmoked == cigarettesSmoked) &&
            const DeepCollectionEquality()
                .equals(other._triggerTags, _triggerTags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      timestamp,
      cigarettesSmoked,
      const DeepCollectionEquality().hash(_triggerTags),
      notes,
      location,
      impact,
      createdAt,
      updatedAt);

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmokingRecordResponseModelImplCopyWith<_$SmokingRecordResponseModelImpl>
      get copyWith => __$$SmokingRecordResponseModelImplCopyWithImpl<
          _$SmokingRecordResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmokingRecordResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SmokingRecordResponseModel
    implements SmokingRecordResponseModel {
  const factory _SmokingRecordResponseModel(
      {required final String id,
      required final String userId,
      required final DateTime timestamp,
      required final int cigarettesSmoked,
      final List<String>? triggerTags,
      final String? notes,
      final LocationInfoModel? location,
      final SmokingImpactModel? impact,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SmokingRecordResponseModelImpl;

  factory _SmokingRecordResponseModel.fromJson(Map<String, dynamic> json) =
      _$SmokingRecordResponseModelImpl.fromJson;

  /// 记录ID
  @override
  String get id;

  /// 用户ID
  @override
  String get userId;

  /// 吸烟时间
  @override
  DateTime get timestamp;

  /// 吸烟支数
  @override
  int get cigarettesSmoked;

  /// 触发因素标签
  @override
  List<String>? get triggerTags;

  /// 备注
  @override
  String? get notes;

  /// 位置信息
  @override
  LocationInfoModel? get location;

  /// 对戒烟进度的影响
  @override
  SmokingImpactModel? get impact;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime get updatedAt;

  /// Create a copy of SmokingRecordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmokingRecordResponseModelImplCopyWith<_$SmokingRecordResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SmokingImpactModel _$SmokingImpactModelFromJson(Map<String, dynamic> json) {
  return _SmokingImpactModel.fromJson(json);
}

/// @nodoc
mixin _$SmokingImpactModel {
  /// 是否中断连续戒烟
  bool get streakBroken => throw _privateConstructorUsedError;

  /// 中断前的连续天数
  int? get previousStreak => throw _privateConstructorUsedError;

  /// 影响的成就
  List<String>? get affectedAchievements => throw _privateConstructorUsedError;

  /// 影响描述
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SmokingImpactModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmokingImpactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmokingImpactModelCopyWith<SmokingImpactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmokingImpactModelCopyWith<$Res> {
  factory $SmokingImpactModelCopyWith(
          SmokingImpactModel value, $Res Function(SmokingImpactModel) then) =
      _$SmokingImpactModelCopyWithImpl<$Res, SmokingImpactModel>;
  @useResult
  $Res call(
      {bool streakBroken,
      int? previousStreak,
      List<String>? affectedAchievements,
      String? description});
}

/// @nodoc
class _$SmokingImpactModelCopyWithImpl<$Res, $Val extends SmokingImpactModel>
    implements $SmokingImpactModelCopyWith<$Res> {
  _$SmokingImpactModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmokingImpactModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakBroken = null,
    Object? previousStreak = freezed,
    Object? affectedAchievements = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      streakBroken: null == streakBroken
          ? _value.streakBroken
          : streakBroken // ignore: cast_nullable_to_non_nullable
              as bool,
      previousStreak: freezed == previousStreak
          ? _value.previousStreak
          : previousStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedAchievements: freezed == affectedAchievements
          ? _value.affectedAchievements
          : affectedAchievements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmokingImpactModelImplCopyWith<$Res>
    implements $SmokingImpactModelCopyWith<$Res> {
  factory _$$SmokingImpactModelImplCopyWith(_$SmokingImpactModelImpl value,
          $Res Function(_$SmokingImpactModelImpl) then) =
      __$$SmokingImpactModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool streakBroken,
      int? previousStreak,
      List<String>? affectedAchievements,
      String? description});
}

/// @nodoc
class __$$SmokingImpactModelImplCopyWithImpl<$Res>
    extends _$SmokingImpactModelCopyWithImpl<$Res, _$SmokingImpactModelImpl>
    implements _$$SmokingImpactModelImplCopyWith<$Res> {
  __$$SmokingImpactModelImplCopyWithImpl(_$SmokingImpactModelImpl _value,
      $Res Function(_$SmokingImpactModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmokingImpactModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streakBroken = null,
    Object? previousStreak = freezed,
    Object? affectedAchievements = freezed,
    Object? description = freezed,
  }) {
    return _then(_$SmokingImpactModelImpl(
      streakBroken: null == streakBroken
          ? _value.streakBroken
          : streakBroken // ignore: cast_nullable_to_non_nullable
              as bool,
      previousStreak: freezed == previousStreak
          ? _value.previousStreak
          : previousStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedAchievements: freezed == affectedAchievements
          ? _value._affectedAchievements
          : affectedAchievements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmokingImpactModelImpl implements _SmokingImpactModel {
  const _$SmokingImpactModelImpl(
      {required this.streakBroken,
      this.previousStreak,
      final List<String>? affectedAchievements,
      this.description})
      : _affectedAchievements = affectedAchievements;

  factory _$SmokingImpactModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmokingImpactModelImplFromJson(json);

  /// 是否中断连续戒烟
  @override
  final bool streakBroken;

  /// 中断前的连续天数
  @override
  final int? previousStreak;

  /// 影响的成就
  final List<String>? _affectedAchievements;

  /// 影响的成就
  @override
  List<String>? get affectedAchievements {
    final value = _affectedAchievements;
    if (value == null) return null;
    if (_affectedAchievements is EqualUnmodifiableListView)
      return _affectedAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 影响描述
  @override
  final String? description;

  @override
  String toString() {
    return 'SmokingImpactModel(streakBroken: $streakBroken, previousStreak: $previousStreak, affectedAchievements: $affectedAchievements, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmokingImpactModelImpl &&
            (identical(other.streakBroken, streakBroken) ||
                other.streakBroken == streakBroken) &&
            (identical(other.previousStreak, previousStreak) ||
                other.previousStreak == previousStreak) &&
            const DeepCollectionEquality()
                .equals(other._affectedAchievements, _affectedAchievements) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, streakBroken, previousStreak,
      const DeepCollectionEquality().hash(_affectedAchievements), description);

  /// Create a copy of SmokingImpactModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmokingImpactModelImplCopyWith<_$SmokingImpactModelImpl> get copyWith =>
      __$$SmokingImpactModelImplCopyWithImpl<_$SmokingImpactModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmokingImpactModelImplToJson(
      this,
    );
  }
}

abstract class _SmokingImpactModel implements SmokingImpactModel {
  const factory _SmokingImpactModel(
      {required final bool streakBroken,
      final int? previousStreak,
      final List<String>? affectedAchievements,
      final String? description}) = _$SmokingImpactModelImpl;

  factory _SmokingImpactModel.fromJson(Map<String, dynamic> json) =
      _$SmokingImpactModelImpl.fromJson;

  /// 是否中断连续戒烟
  @override
  bool get streakBroken;

  /// 中断前的连续天数
  @override
  int? get previousStreak;

  /// 影响的成就
  @override
  List<String>? get affectedAchievements;

  /// 影响描述
  @override
  String? get description;

  /// Create a copy of SmokingImpactModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmokingImpactModelImplCopyWith<_$SmokingImpactModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SmokingRecordStatsResponseModel _$SmokingRecordStatsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SmokingRecordStatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SmokingRecordStatsResponseModel {
  /// 总吸烟次数
  int get totalRecords => throw _privateConstructorUsedError;

  /// 总吸烟支数
  int get totalCigarettes => throw _privateConstructorUsedError;

  /// 本月吸烟次数
  int get monthlyRecords => throw _privateConstructorUsedError;

  /// 本月吸烟支数
  int get monthlyCigarettes => throw _privateConstructorUsedError;

  /// 本周吸烟次数
  int get weeklyRecords => throw _privateConstructorUsedError;

  /// 本周吸烟支数
  int get weeklyCigarettes => throw _privateConstructorUsedError;

  /// 平均每日吸烟支数
  double get averageDailyCigarettes => throw _privateConstructorUsedError;

  /// 最常见触发因素
  List<String>? get commonTriggers => throw _privateConstructorUsedError;

  /// 最后吸烟时间
  DateTime? get lastSmokingTime => throw _privateConstructorUsedError;

  /// 统计计算时间
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this SmokingRecordStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmokingRecordStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmokingRecordStatsResponseModelCopyWith<SmokingRecordStatsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmokingRecordStatsResponseModelCopyWith<$Res> {
  factory $SmokingRecordStatsResponseModelCopyWith(
          SmokingRecordStatsResponseModel value,
          $Res Function(SmokingRecordStatsResponseModel) then) =
      _$SmokingRecordStatsResponseModelCopyWithImpl<$Res,
          SmokingRecordStatsResponseModel>;
  @useResult
  $Res call(
      {int totalRecords,
      int totalCigarettes,
      int monthlyRecords,
      int monthlyCigarettes,
      int weeklyRecords,
      int weeklyCigarettes,
      double averageDailyCigarettes,
      List<String>? commonTriggers,
      DateTime? lastSmokingTime,
      DateTime calculatedAt});
}

/// @nodoc
class _$SmokingRecordStatsResponseModelCopyWithImpl<$Res,
        $Val extends SmokingRecordStatsResponseModel>
    implements $SmokingRecordStatsResponseModelCopyWith<$Res> {
  _$SmokingRecordStatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmokingRecordStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? totalCigarettes = null,
    Object? monthlyRecords = null,
    Object? monthlyCigarettes = null,
    Object? weeklyRecords = null,
    Object? weeklyCigarettes = null,
    Object? averageDailyCigarettes = null,
    Object? commonTriggers = freezed,
    Object? lastSmokingTime = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalCigarettes: null == totalCigarettes
          ? _value.totalCigarettes
          : totalCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecords: null == monthlyRecords
          ? _value.monthlyRecords
          : monthlyRecords // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyCigarettes: null == monthlyCigarettes
          ? _value.monthlyCigarettes
          : monthlyCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRecords: null == weeklyRecords
          ? _value.weeklyRecords
          : weeklyRecords // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyCigarettes: null == weeklyCigarettes
          ? _value.weeklyCigarettes
          : weeklyCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      averageDailyCigarettes: null == averageDailyCigarettes
          ? _value.averageDailyCigarettes
          : averageDailyCigarettes // ignore: cast_nullable_to_non_nullable
              as double,
      commonTriggers: freezed == commonTriggers
          ? _value.commonTriggers
          : commonTriggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastSmokingTime: freezed == lastSmokingTime
          ? _value.lastSmokingTime
          : lastSmokingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmokingRecordStatsResponseModelImplCopyWith<$Res>
    implements $SmokingRecordStatsResponseModelCopyWith<$Res> {
  factory _$$SmokingRecordStatsResponseModelImplCopyWith(
          _$SmokingRecordStatsResponseModelImpl value,
          $Res Function(_$SmokingRecordStatsResponseModelImpl) then) =
      __$$SmokingRecordStatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalRecords,
      int totalCigarettes,
      int monthlyRecords,
      int monthlyCigarettes,
      int weeklyRecords,
      int weeklyCigarettes,
      double averageDailyCigarettes,
      List<String>? commonTriggers,
      DateTime? lastSmokingTime,
      DateTime calculatedAt});
}

/// @nodoc
class __$$SmokingRecordStatsResponseModelImplCopyWithImpl<$Res>
    extends _$SmokingRecordStatsResponseModelCopyWithImpl<$Res,
        _$SmokingRecordStatsResponseModelImpl>
    implements _$$SmokingRecordStatsResponseModelImplCopyWith<$Res> {
  __$$SmokingRecordStatsResponseModelImplCopyWithImpl(
      _$SmokingRecordStatsResponseModelImpl _value,
      $Res Function(_$SmokingRecordStatsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmokingRecordStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? totalCigarettes = null,
    Object? monthlyRecords = null,
    Object? monthlyCigarettes = null,
    Object? weeklyRecords = null,
    Object? weeklyCigarettes = null,
    Object? averageDailyCigarettes = null,
    Object? commonTriggers = freezed,
    Object? lastSmokingTime = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_$SmokingRecordStatsResponseModelImpl(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalCigarettes: null == totalCigarettes
          ? _value.totalCigarettes
          : totalCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyRecords: null == monthlyRecords
          ? _value.monthlyRecords
          : monthlyRecords // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyCigarettes: null == monthlyCigarettes
          ? _value.monthlyCigarettes
          : monthlyCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyRecords: null == weeklyRecords
          ? _value.weeklyRecords
          : weeklyRecords // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyCigarettes: null == weeklyCigarettes
          ? _value.weeklyCigarettes
          : weeklyCigarettes // ignore: cast_nullable_to_non_nullable
              as int,
      averageDailyCigarettes: null == averageDailyCigarettes
          ? _value.averageDailyCigarettes
          : averageDailyCigarettes // ignore: cast_nullable_to_non_nullable
              as double,
      commonTriggers: freezed == commonTriggers
          ? _value._commonTriggers
          : commonTriggers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastSmokingTime: freezed == lastSmokingTime
          ? _value.lastSmokingTime
          : lastSmokingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmokingRecordStatsResponseModelImpl
    implements _SmokingRecordStatsResponseModel {
  const _$SmokingRecordStatsResponseModelImpl(
      {required this.totalRecords,
      required this.totalCigarettes,
      required this.monthlyRecords,
      required this.monthlyCigarettes,
      required this.weeklyRecords,
      required this.weeklyCigarettes,
      required this.averageDailyCigarettes,
      final List<String>? commonTriggers,
      this.lastSmokingTime,
      required this.calculatedAt})
      : _commonTriggers = commonTriggers;

  factory _$SmokingRecordStatsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SmokingRecordStatsResponseModelImplFromJson(json);

  /// 总吸烟次数
  @override
  final int totalRecords;

  /// 总吸烟支数
  @override
  final int totalCigarettes;

  /// 本月吸烟次数
  @override
  final int monthlyRecords;

  /// 本月吸烟支数
  @override
  final int monthlyCigarettes;

  /// 本周吸烟次数
  @override
  final int weeklyRecords;

  /// 本周吸烟支数
  @override
  final int weeklyCigarettes;

  /// 平均每日吸烟支数
  @override
  final double averageDailyCigarettes;

  /// 最常见触发因素
  final List<String>? _commonTriggers;

  /// 最常见触发因素
  @override
  List<String>? get commonTriggers {
    final value = _commonTriggers;
    if (value == null) return null;
    if (_commonTriggers is EqualUnmodifiableListView) return _commonTriggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 最后吸烟时间
  @override
  final DateTime? lastSmokingTime;

  /// 统计计算时间
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'SmokingRecordStatsResponseModel(totalRecords: $totalRecords, totalCigarettes: $totalCigarettes, monthlyRecords: $monthlyRecords, monthlyCigarettes: $monthlyCigarettes, weeklyRecords: $weeklyRecords, weeklyCigarettes: $weeklyCigarettes, averageDailyCigarettes: $averageDailyCigarettes, commonTriggers: $commonTriggers, lastSmokingTime: $lastSmokingTime, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmokingRecordStatsResponseModelImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.totalCigarettes, totalCigarettes) ||
                other.totalCigarettes == totalCigarettes) &&
            (identical(other.monthlyRecords, monthlyRecords) ||
                other.monthlyRecords == monthlyRecords) &&
            (identical(other.monthlyCigarettes, monthlyCigarettes) ||
                other.monthlyCigarettes == monthlyCigarettes) &&
            (identical(other.weeklyRecords, weeklyRecords) ||
                other.weeklyRecords == weeklyRecords) &&
            (identical(other.weeklyCigarettes, weeklyCigarettes) ||
                other.weeklyCigarettes == weeklyCigarettes) &&
            (identical(other.averageDailyCigarettes, averageDailyCigarettes) ||
                other.averageDailyCigarettes == averageDailyCigarettes) &&
            const DeepCollectionEquality()
                .equals(other._commonTriggers, _commonTriggers) &&
            (identical(other.lastSmokingTime, lastSmokingTime) ||
                other.lastSmokingTime == lastSmokingTime) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRecords,
      totalCigarettes,
      monthlyRecords,
      monthlyCigarettes,
      weeklyRecords,
      weeklyCigarettes,
      averageDailyCigarettes,
      const DeepCollectionEquality().hash(_commonTriggers),
      lastSmokingTime,
      calculatedAt);

  /// Create a copy of SmokingRecordStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmokingRecordStatsResponseModelImplCopyWith<
          _$SmokingRecordStatsResponseModelImpl>
      get copyWith => __$$SmokingRecordStatsResponseModelImplCopyWithImpl<
          _$SmokingRecordStatsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmokingRecordStatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SmokingRecordStatsResponseModel
    implements SmokingRecordStatsResponseModel {
  const factory _SmokingRecordStatsResponseModel(
          {required final int totalRecords,
          required final int totalCigarettes,
          required final int monthlyRecords,
          required final int monthlyCigarettes,
          required final int weeklyRecords,
          required final int weeklyCigarettes,
          required final double averageDailyCigarettes,
          final List<String>? commonTriggers,
          final DateTime? lastSmokingTime,
          required final DateTime calculatedAt}) =
      _$SmokingRecordStatsResponseModelImpl;

  factory _SmokingRecordStatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$SmokingRecordStatsResponseModelImpl.fromJson;

  /// 总吸烟次数
  @override
  int get totalRecords;

  /// 总吸烟支数
  @override
  int get totalCigarettes;

  /// 本月吸烟次数
  @override
  int get monthlyRecords;

  /// 本月吸烟支数
  @override
  int get monthlyCigarettes;

  /// 本周吸烟次数
  @override
  int get weeklyRecords;

  /// 本周吸烟支数
  @override
  int get weeklyCigarettes;

  /// 平均每日吸烟支数
  @override
  double get averageDailyCigarettes;

  /// 最常见触发因素
  @override
  List<String>? get commonTriggers;

  /// 最后吸烟时间
  @override
  DateTime? get lastSmokingTime;

  /// 统计计算时间
  @override
  DateTime get calculatedAt;

  /// Create a copy of SmokingRecordStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmokingRecordStatsResponseModelImplCopyWith<
          _$SmokingRecordStatsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SmokingRecordHistoryRequestModel _$SmokingRecordHistoryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _SmokingRecordHistoryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SmokingRecordHistoryRequestModel {
  /// 开始日期
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// 结束日期
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// 触发因素过滤
  List<String>? get triggerTags => throw _privateConstructorUsedError;

  /// 页码（从1开始）
  int get page => throw _privateConstructorUsedError;

  /// 每页数量
  int get limit => throw _privateConstructorUsedError;

  /// 排序字段
  String get sortBy => throw _privateConstructorUsedError;

  /// 排序方向（asc/desc）
  String get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this SmokingRecordHistoryRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmokingRecordHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmokingRecordHistoryRequestModelCopyWith<SmokingRecordHistoryRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmokingRecordHistoryRequestModelCopyWith<$Res> {
  factory $SmokingRecordHistoryRequestModelCopyWith(
          SmokingRecordHistoryRequestModel value,
          $Res Function(SmokingRecordHistoryRequestModel) then) =
      _$SmokingRecordHistoryRequestModelCopyWithImpl<$Res,
          SmokingRecordHistoryRequestModel>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? triggerTags,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class _$SmokingRecordHistoryRequestModelCopyWithImpl<$Res,
        $Val extends SmokingRecordHistoryRequestModel>
    implements $SmokingRecordHistoryRequestModelCopyWith<$Res> {
  _$SmokingRecordHistoryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmokingRecordHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? triggerTags = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      triggerTags: freezed == triggerTags
          ? _value.triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmokingRecordHistoryRequestModelImplCopyWith<$Res>
    implements $SmokingRecordHistoryRequestModelCopyWith<$Res> {
  factory _$$SmokingRecordHistoryRequestModelImplCopyWith(
          _$SmokingRecordHistoryRequestModelImpl value,
          $Res Function(_$SmokingRecordHistoryRequestModelImpl) then) =
      __$$SmokingRecordHistoryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      List<String>? triggerTags,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class __$$SmokingRecordHistoryRequestModelImplCopyWithImpl<$Res>
    extends _$SmokingRecordHistoryRequestModelCopyWithImpl<$Res,
        _$SmokingRecordHistoryRequestModelImpl>
    implements _$$SmokingRecordHistoryRequestModelImplCopyWith<$Res> {
  __$$SmokingRecordHistoryRequestModelImplCopyWithImpl(
      _$SmokingRecordHistoryRequestModelImpl _value,
      $Res Function(_$SmokingRecordHistoryRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmokingRecordHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? triggerTags = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$SmokingRecordHistoryRequestModelImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      triggerTags: freezed == triggerTags
          ? _value._triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmokingRecordHistoryRequestModelImpl
    implements _SmokingRecordHistoryRequestModel {
  const _$SmokingRecordHistoryRequestModelImpl(
      {this.startDate,
      this.endDate,
      final List<String>? triggerTags,
      this.page = 1,
      this.limit = 20,
      this.sortBy = 'timestamp',
      this.sortOrder = 'desc'})
      : _triggerTags = triggerTags;

  factory _$SmokingRecordHistoryRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SmokingRecordHistoryRequestModelImplFromJson(json);

  /// 开始日期
  @override
  final DateTime? startDate;

  /// 结束日期
  @override
  final DateTime? endDate;

  /// 触发因素过滤
  final List<String>? _triggerTags;

  /// 触发因素过滤
  @override
  List<String>? get triggerTags {
    final value = _triggerTags;
    if (value == null) return null;
    if (_triggerTags is EqualUnmodifiableListView) return _triggerTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 页码（从1开始）
  @override
  @JsonKey()
  final int page;

  /// 每页数量
  @override
  @JsonKey()
  final int limit;

  /// 排序字段
  @override
  @JsonKey()
  final String sortBy;

  /// 排序方向（asc/desc）
  @override
  @JsonKey()
  final String sortOrder;

  @override
  String toString() {
    return 'SmokingRecordHistoryRequestModel(startDate: $startDate, endDate: $endDate, triggerTags: $triggerTags, page: $page, limit: $limit, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmokingRecordHistoryRequestModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._triggerTags, _triggerTags) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_triggerTags),
      page,
      limit,
      sortBy,
      sortOrder);

  /// Create a copy of SmokingRecordHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmokingRecordHistoryRequestModelImplCopyWith<
          _$SmokingRecordHistoryRequestModelImpl>
      get copyWith => __$$SmokingRecordHistoryRequestModelImplCopyWithImpl<
          _$SmokingRecordHistoryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmokingRecordHistoryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SmokingRecordHistoryRequestModel
    implements SmokingRecordHistoryRequestModel {
  const factory _SmokingRecordHistoryRequestModel(
      {final DateTime? startDate,
      final DateTime? endDate,
      final List<String>? triggerTags,
      final int page,
      final int limit,
      final String sortBy,
      final String sortOrder}) = _$SmokingRecordHistoryRequestModelImpl;

  factory _SmokingRecordHistoryRequestModel.fromJson(
          Map<String, dynamic> json) =
      _$SmokingRecordHistoryRequestModelImpl.fromJson;

  /// 开始日期
  @override
  DateTime? get startDate;

  /// 结束日期
  @override
  DateTime? get endDate;

  /// 触发因素过滤
  @override
  List<String>? get triggerTags;

  /// 页码（从1开始）
  @override
  int get page;

  /// 每页数量
  @override
  int get limit;

  /// 排序字段
  @override
  String get sortBy;

  /// 排序方向（asc/desc）
  @override
  String get sortOrder;

  /// Create a copy of SmokingRecordHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmokingRecordHistoryRequestModelImplCopyWith<
          _$SmokingRecordHistoryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
