// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @HiveField(0)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime? get quitDateTime => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get dailyCigarettes => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get packPrice => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get smokingYears => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get quitReason => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get onboardingCompleted => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@HiveField(0) String? userId,
      @HiveField(1) DateTime? quitDateTime,
      @HiveField(2) int? dailyCigarettes,
      @HiveField(3) double? packPrice,
      @HiveField(4) int? smokingYears,
      @HiveField(5) String? quitReason,
      @HiveField(6) bool onboardingCompleted});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? quitDateTime = freezed,
    Object? dailyCigarettes = freezed,
    Object? packPrice = freezed,
    Object? smokingYears = freezed,
    Object? quitReason = freezed,
    Object? onboardingCompleted = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      quitDateTime: freezed == quitDateTime
          ? _value.quitDateTime
          : quitDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dailyCigarettes: freezed == dailyCigarettes
          ? _value.dailyCigarettes
          : dailyCigarettes // ignore: cast_nullable_to_non_nullable
              as int?,
      packPrice: freezed == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? userId,
      @HiveField(1) DateTime? quitDateTime,
      @HiveField(2) int? dailyCigarettes,
      @HiveField(3) double? packPrice,
      @HiveField(4) int? smokingYears,
      @HiveField(5) String? quitReason,
      @HiveField(6) bool onboardingCompleted});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? quitDateTime = freezed,
    Object? dailyCigarettes = freezed,
    Object? packPrice = freezed,
    Object? smokingYears = freezed,
    Object? quitReason = freezed,
    Object? onboardingCompleted = null,
  }) {
    return _then(_$UserProfileImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      quitDateTime: freezed == quitDateTime
          ? _value.quitDateTime
          : quitDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dailyCigarettes: freezed == dailyCigarettes
          ? _value.dailyCigarettes
          : dailyCigarettes // ignore: cast_nullable_to_non_nullable
              as int?,
      packPrice: freezed == packPrice
          ? _value.packPrice
          : packPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl extends _UserProfile {
  _$UserProfileImpl(
      {@HiveField(0) this.userId,
      @HiveField(1) this.quitDateTime,
      @HiveField(2) this.dailyCigarettes,
      @HiveField(3) this.packPrice,
      @HiveField(4) this.smokingYears,
      @HiveField(5) this.quitReason,
      @HiveField(6) this.onboardingCompleted = false})
      : super._();

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @HiveField(0)
  final String? userId;
  @override
  @HiveField(1)
  final DateTime? quitDateTime;
  @override
  @HiveField(2)
  final int? dailyCigarettes;
  @override
  @HiveField(3)
  final double? packPrice;
  @override
  @HiveField(4)
  final int? smokingYears;
  @override
  @HiveField(5)
  final String? quitReason;
  @override
  @JsonKey()
  @HiveField(6)
  final bool onboardingCompleted;

  @override
  String toString() {
    return 'UserProfile(userId: $userId, quitDateTime: $quitDateTime, dailyCigarettes: $dailyCigarettes, packPrice: $packPrice, smokingYears: $smokingYears, quitReason: $quitReason, onboardingCompleted: $onboardingCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quitDateTime, quitDateTime) ||
                other.quitDateTime == quitDateTime) &&
            (identical(other.dailyCigarettes, dailyCigarettes) ||
                other.dailyCigarettes == dailyCigarettes) &&
            (identical(other.packPrice, packPrice) ||
                other.packPrice == packPrice) &&
            (identical(other.smokingYears, smokingYears) ||
                other.smokingYears == smokingYears) &&
            (identical(other.quitReason, quitReason) ||
                other.quitReason == quitReason) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      quitDateTime,
      dailyCigarettes,
      packPrice,
      smokingYears,
      quitReason,
      onboardingCompleted);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile extends UserProfile {
  factory _UserProfile(
      {@HiveField(0) final String? userId,
      @HiveField(1) final DateTime? quitDateTime,
      @HiveField(2) final int? dailyCigarettes,
      @HiveField(3) final double? packPrice,
      @HiveField(4) final int? smokingYears,
      @HiveField(5) final String? quitReason,
      @HiveField(6) final bool onboardingCompleted}) = _$UserProfileImpl;
  _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @HiveField(0)
  String? get userId;
  @override
  @HiveField(1)
  DateTime? get quitDateTime;
  @override
  @HiveField(2)
  int? get dailyCigarettes;
  @override
  @HiveField(3)
  double? get packPrice;
  @override
  @HiveField(4)
  int? get smokingYears;
  @override
  @HiveField(5)
  String? get quitReason;
  @override
  @HiveField(6)
  bool get onboardingCompleted;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
