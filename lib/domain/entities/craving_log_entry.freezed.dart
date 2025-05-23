// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'craving_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CravingLogEntry _$CravingLogEntryFromJson(Map<String, dynamic> json) {
  return _CravingLogEntry.fromJson(json);
}

/// @nodoc
mixin _$CravingLogEntry {
  @HiveField(0)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(1)
  List<String>? get triggerTags => throw _privateConstructorUsedError;
  @HiveField(2)
  List<String>? get emotionTags => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this CravingLogEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CravingLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CravingLogEntryCopyWith<CravingLogEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CravingLogEntryCopyWith<$Res> {
  factory $CravingLogEntryCopyWith(
          CravingLogEntry value, $Res Function(CravingLogEntry) then) =
      _$CravingLogEntryCopyWithImpl<$Res, CravingLogEntry>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime timestamp,
      @HiveField(1) List<String>? triggerTags,
      @HiveField(2) List<String>? emotionTags,
      @HiveField(3) String? userId});
}

/// @nodoc
class _$CravingLogEntryCopyWithImpl<$Res, $Val extends CravingLogEntry>
    implements $CravingLogEntryCopyWith<$Res> {
  _$CravingLogEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CravingLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? triggerTags = freezed,
    Object? emotionTags = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      triggerTags: freezed == triggerTags
          ? _value.triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      emotionTags: freezed == emotionTags
          ? _value.emotionTags
          : emotionTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CravingLogEntryImplCopyWith<$Res>
    implements $CravingLogEntryCopyWith<$Res> {
  factory _$$CravingLogEntryImplCopyWith(_$CravingLogEntryImpl value,
          $Res Function(_$CravingLogEntryImpl) then) =
      __$$CravingLogEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime timestamp,
      @HiveField(1) List<String>? triggerTags,
      @HiveField(2) List<String>? emotionTags,
      @HiveField(3) String? userId});
}

/// @nodoc
class __$$CravingLogEntryImplCopyWithImpl<$Res>
    extends _$CravingLogEntryCopyWithImpl<$Res, _$CravingLogEntryImpl>
    implements _$$CravingLogEntryImplCopyWith<$Res> {
  __$$CravingLogEntryImplCopyWithImpl(
      _$CravingLogEntryImpl _value, $Res Function(_$CravingLogEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CravingLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? triggerTags = freezed,
    Object? emotionTags = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$CravingLogEntryImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      triggerTags: freezed == triggerTags
          ? _value._triggerTags
          : triggerTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      emotionTags: freezed == emotionTags
          ? _value._emotionTags
          : emotionTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CravingLogEntryImpl extends _CravingLogEntry {
  _$CravingLogEntryImpl(
      {@HiveField(0) required this.timestamp,
      @HiveField(1) final List<String>? triggerTags,
      @HiveField(2) final List<String>? emotionTags,
      @HiveField(3) this.userId})
      : _triggerTags = triggerTags,
        _emotionTags = emotionTags,
        super._();

  factory _$CravingLogEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CravingLogEntryImplFromJson(json);

  @override
  @HiveField(0)
  final DateTime timestamp;
  final List<String>? _triggerTags;
  @override
  @HiveField(1)
  List<String>? get triggerTags {
    final value = _triggerTags;
    if (value == null) return null;
    if (_triggerTags is EqualUnmodifiableListView) return _triggerTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _emotionTags;
  @override
  @HiveField(2)
  List<String>? get emotionTags {
    final value = _emotionTags;
    if (value == null) return null;
    if (_emotionTags is EqualUnmodifiableListView) return _emotionTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(3)
  final String? userId;

  @override
  String toString() {
    return 'CravingLogEntry(timestamp: $timestamp, triggerTags: $triggerTags, emotionTags: $emotionTags, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CravingLogEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._triggerTags, _triggerTags) &&
            const DeepCollectionEquality()
                .equals(other._emotionTags, _emotionTags) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      timestamp,
      const DeepCollectionEquality().hash(_triggerTags),
      const DeepCollectionEquality().hash(_emotionTags),
      userId);

  /// Create a copy of CravingLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CravingLogEntryImplCopyWith<_$CravingLogEntryImpl> get copyWith =>
      __$$CravingLogEntryImplCopyWithImpl<_$CravingLogEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CravingLogEntryImplToJson(
      this,
    );
  }
}

abstract class _CravingLogEntry extends CravingLogEntry {
  factory _CravingLogEntry(
      {@HiveField(0) required final DateTime timestamp,
      @HiveField(1) final List<String>? triggerTags,
      @HiveField(2) final List<String>? emotionTags,
      @HiveField(3) final String? userId}) = _$CravingLogEntryImpl;
  _CravingLogEntry._() : super._();

  factory _CravingLogEntry.fromJson(Map<String, dynamic> json) =
      _$CravingLogEntryImpl.fromJson;

  @override
  @HiveField(0)
  DateTime get timestamp;
  @override
  @HiveField(1)
  List<String>? get triggerTags;
  @override
  @HiveField(2)
  List<String>? get emotionTags;
  @override
  @HiveField(3)
  String? get userId;

  /// Create a copy of CravingLogEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CravingLogEntryImplCopyWith<_$CravingLogEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
