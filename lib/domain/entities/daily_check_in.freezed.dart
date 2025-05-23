// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_check_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyCheckIn _$DailyCheckInFromJson(Map<String, dynamic> json) {
  return _DailyCheckIn.fromJson(json);
}

/// @nodoc
mixin _$DailyCheckIn {
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get isCheckedIn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this DailyCheckIn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyCheckInCopyWith<DailyCheckIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyCheckInCopyWith<$Res> {
  factory $DailyCheckInCopyWith(
          DailyCheckIn value, $Res Function(DailyCheckIn) then) =
      _$DailyCheckInCopyWithImpl<$Res, DailyCheckIn>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) bool isCheckedIn,
      @HiveField(2) String? userId});
}

/// @nodoc
class _$DailyCheckInCopyWithImpl<$Res, $Val extends DailyCheckIn>
    implements $DailyCheckInCopyWith<$Res> {
  _$DailyCheckInCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isCheckedIn = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyCheckInImplCopyWith<$Res>
    implements $DailyCheckInCopyWith<$Res> {
  factory _$$DailyCheckInImplCopyWith(
          _$DailyCheckInImpl value, $Res Function(_$DailyCheckInImpl) then) =
      __$$DailyCheckInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime date,
      @HiveField(1) bool isCheckedIn,
      @HiveField(2) String? userId});
}

/// @nodoc
class __$$DailyCheckInImplCopyWithImpl<$Res>
    extends _$DailyCheckInCopyWithImpl<$Res, _$DailyCheckInImpl>
    implements _$$DailyCheckInImplCopyWith<$Res> {
  __$$DailyCheckInImplCopyWithImpl(
      _$DailyCheckInImpl _value, $Res Function(_$DailyCheckInImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? isCheckedIn = null,
    Object? userId = freezed,
  }) {
    return _then(_$DailyCheckInImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCheckedIn: null == isCheckedIn
          ? _value.isCheckedIn
          : isCheckedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyCheckInImpl extends _DailyCheckIn {
  _$DailyCheckInImpl(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.isCheckedIn,
      @HiveField(2) this.userId})
      : super._();

  factory _$DailyCheckInImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyCheckInImplFromJson(json);

  @override
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final bool isCheckedIn;
  @override
  @HiveField(2)
  final String? userId;

  @override
  String toString() {
    return 'DailyCheckIn(date: $date, isCheckedIn: $isCheckedIn, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyCheckInImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCheckedIn, isCheckedIn) ||
                other.isCheckedIn == isCheckedIn) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, isCheckedIn, userId);

  /// Create a copy of DailyCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyCheckInImplCopyWith<_$DailyCheckInImpl> get copyWith =>
      __$$DailyCheckInImplCopyWithImpl<_$DailyCheckInImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyCheckInImplToJson(
      this,
    );
  }
}

abstract class _DailyCheckIn extends DailyCheckIn {
  factory _DailyCheckIn(
      {@HiveField(0) required final DateTime date,
      @HiveField(1) required final bool isCheckedIn,
      @HiveField(2) final String? userId}) = _$DailyCheckInImpl;
  _DailyCheckIn._() : super._();

  factory _DailyCheckIn.fromJson(Map<String, dynamic> json) =
      _$DailyCheckInImpl.fromJson;

  @override
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  bool get isCheckedIn;
  @override
  @HiveField(2)
  String? get userId;

  /// Create a copy of DailyCheckIn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyCheckInImplCopyWith<_$DailyCheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
