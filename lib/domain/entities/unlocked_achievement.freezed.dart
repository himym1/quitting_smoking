// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unlocked_achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnlockedAchievement _$UnlockedAchievementFromJson(Map<String, dynamic> json) {
  return _UnlockedAchievement.fromJson(json);
}

/// @nodoc
mixin _$UnlockedAchievement {
  @HiveField(0)
  String get achievementId => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get unlockDate => throw _privateConstructorUsedError;

  /// Serializes this UnlockedAchievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnlockedAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnlockedAchievementCopyWith<UnlockedAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockedAchievementCopyWith<$Res> {
  factory $UnlockedAchievementCopyWith(
          UnlockedAchievement value, $Res Function(UnlockedAchievement) then) =
      _$UnlockedAchievementCopyWithImpl<$Res, UnlockedAchievement>;
  @useResult
  $Res call(
      {@HiveField(0) String achievementId, @HiveField(1) DateTime unlockDate});
}

/// @nodoc
class _$UnlockedAchievementCopyWithImpl<$Res, $Val extends UnlockedAchievement>
    implements $UnlockedAchievementCopyWith<$Res> {
  _$UnlockedAchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnlockedAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? unlockDate = null,
  }) {
    return _then(_value.copyWith(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockDate: null == unlockDate
          ? _value.unlockDate
          : unlockDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnlockedAchievementImplCopyWith<$Res>
    implements $UnlockedAchievementCopyWith<$Res> {
  factory _$$UnlockedAchievementImplCopyWith(_$UnlockedAchievementImpl value,
          $Res Function(_$UnlockedAchievementImpl) then) =
      __$$UnlockedAchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String achievementId, @HiveField(1) DateTime unlockDate});
}

/// @nodoc
class __$$UnlockedAchievementImplCopyWithImpl<$Res>
    extends _$UnlockedAchievementCopyWithImpl<$Res, _$UnlockedAchievementImpl>
    implements _$$UnlockedAchievementImplCopyWith<$Res> {
  __$$UnlockedAchievementImplCopyWithImpl(_$UnlockedAchievementImpl _value,
      $Res Function(_$UnlockedAchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnlockedAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? unlockDate = null,
  }) {
    return _then(_$UnlockedAchievementImpl(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockDate: null == unlockDate
          ? _value.unlockDate
          : unlockDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$UnlockedAchievementImpl extends _UnlockedAchievement {
  _$UnlockedAchievementImpl(
      {@HiveField(0) required this.achievementId,
      @HiveField(1) required this.unlockDate})
      : super._();

  factory _$UnlockedAchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnlockedAchievementImplFromJson(json);

  @override
  @HiveField(0)
  final String achievementId;
  @override
  @HiveField(1)
  final DateTime unlockDate;

  @override
  String toString() {
    return 'UnlockedAchievement(achievementId: $achievementId, unlockDate: $unlockDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockedAchievementImpl &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.unlockDate, unlockDate) ||
                other.unlockDate == unlockDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, achievementId, unlockDate);

  /// Create a copy of UnlockedAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockedAchievementImplCopyWith<_$UnlockedAchievementImpl> get copyWith =>
      __$$UnlockedAchievementImplCopyWithImpl<_$UnlockedAchievementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlockedAchievementImplToJson(
      this,
    );
  }
}

abstract class _UnlockedAchievement extends UnlockedAchievement {
  factory _UnlockedAchievement(
          {@HiveField(0) required final String achievementId,
          @HiveField(1) required final DateTime unlockDate}) =
      _$UnlockedAchievementImpl;
  _UnlockedAchievement._() : super._();

  factory _UnlockedAchievement.fromJson(Map<String, dynamic> json) =
      _$UnlockedAchievementImpl.fromJson;

  @override
  @HiveField(0)
  String get achievementId;
  @override
  @HiveField(1)
  DateTime get unlockDate;

  /// Create a copy of UnlockedAchievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockedAchievementImplCopyWith<_$UnlockedAchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
