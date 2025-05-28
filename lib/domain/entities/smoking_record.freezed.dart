// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smoking_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmokingRecord _$SmokingRecordFromJson(Map<String, dynamic> json) {
  return _SmokingRecord.fromJson(json);
}

/// @nodoc
mixin _$SmokingRecord {
  @HiveField(0)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(1)
  int get cigarettesSmoked => throw _privateConstructorUsedError; // 抽了多少支
  @HiveField(2)
  List<String>? get triggerTags => throw _privateConstructorUsedError; // 触发因素
  @HiveField(3)
  String? get notes => throw _privateConstructorUsedError; // 备注
  @HiveField(4)
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this SmokingRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmokingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmokingRecordCopyWith<SmokingRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmokingRecordCopyWith<$Res> {
  factory $SmokingRecordCopyWith(
          SmokingRecord value, $Res Function(SmokingRecord) then) =
      _$SmokingRecordCopyWithImpl<$Res, SmokingRecord>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime timestamp,
      @HiveField(1) int cigarettesSmoked,
      @HiveField(2) List<String>? triggerTags,
      @HiveField(3) String? notes,
      @HiveField(4) String? userId});
}

/// @nodoc
class _$SmokingRecordCopyWithImpl<$Res, $Val extends SmokingRecord>
    implements $SmokingRecordCopyWith<$Res> {
  _$SmokingRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmokingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? userId = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmokingRecordImplCopyWith<$Res>
    implements $SmokingRecordCopyWith<$Res> {
  factory _$$SmokingRecordImplCopyWith(
          _$SmokingRecordImpl value, $Res Function(_$SmokingRecordImpl) then) =
      __$$SmokingRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime timestamp,
      @HiveField(1) int cigarettesSmoked,
      @HiveField(2) List<String>? triggerTags,
      @HiveField(3) String? notes,
      @HiveField(4) String? userId});
}

/// @nodoc
class __$$SmokingRecordImplCopyWithImpl<$Res>
    extends _$SmokingRecordCopyWithImpl<$Res, _$SmokingRecordImpl>
    implements _$$SmokingRecordImplCopyWith<$Res> {
  __$$SmokingRecordImplCopyWithImpl(
      _$SmokingRecordImpl _value, $Res Function(_$SmokingRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmokingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? cigarettesSmoked = null,
    Object? triggerTags = freezed,
    Object? notes = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$SmokingRecordImpl(
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmokingRecordImpl extends _SmokingRecord {
  _$SmokingRecordImpl(
      {@HiveField(0) required this.timestamp,
      @HiveField(1) required this.cigarettesSmoked,
      @HiveField(2) final List<String>? triggerTags,
      @HiveField(3) this.notes,
      @HiveField(4) this.userId})
      : _triggerTags = triggerTags,
        super._();

  factory _$SmokingRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmokingRecordImplFromJson(json);

  @override
  @HiveField(0)
  final DateTime timestamp;
  @override
  @HiveField(1)
  final int cigarettesSmoked;
// 抽了多少支
  final List<String>? _triggerTags;
// 抽了多少支
  @override
  @HiveField(2)
  List<String>? get triggerTags {
    final value = _triggerTags;
    if (value == null) return null;
    if (_triggerTags is EqualUnmodifiableListView) return _triggerTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// 触发因素
  @override
  @HiveField(3)
  final String? notes;
// 备注
  @override
  @HiveField(4)
  final String? userId;

  @override
  String toString() {
    return 'SmokingRecord(timestamp: $timestamp, cigarettesSmoked: $cigarettesSmoked, triggerTags: $triggerTags, notes: $notes, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmokingRecordImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.cigarettesSmoked, cigarettesSmoked) ||
                other.cigarettesSmoked == cigarettesSmoked) &&
            const DeepCollectionEquality()
                .equals(other._triggerTags, _triggerTags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, cigarettesSmoked,
      const DeepCollectionEquality().hash(_triggerTags), notes, userId);

  /// Create a copy of SmokingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmokingRecordImplCopyWith<_$SmokingRecordImpl> get copyWith =>
      __$$SmokingRecordImplCopyWithImpl<_$SmokingRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmokingRecordImplToJson(
      this,
    );
  }
}

abstract class _SmokingRecord extends SmokingRecord {
  factory _SmokingRecord(
      {@HiveField(0) required final DateTime timestamp,
      @HiveField(1) required final int cigarettesSmoked,
      @HiveField(2) final List<String>? triggerTags,
      @HiveField(3) final String? notes,
      @HiveField(4) final String? userId}) = _$SmokingRecordImpl;
  _SmokingRecord._() : super._();

  factory _SmokingRecord.fromJson(Map<String, dynamic> json) =
      _$SmokingRecordImpl.fromJson;

  @override
  @HiveField(0)
  DateTime get timestamp;
  @override
  @HiveField(1)
  int get cigarettesSmoked; // 抽了多少支
  @override
  @HiveField(2)
  List<String>? get triggerTags; // 触发因素
  @override
  @HiveField(3)
  String? get notes; // 备注
  @override
  @HiveField(4)
  String? get userId;

  /// Create a copy of SmokingRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmokingRecordImplCopyWith<_$SmokingRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
