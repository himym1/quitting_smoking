// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_benefit_milestone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthBenefitMilestone _$HealthBenefitMilestoneFromJson(
    Map<String, dynamic> json) {
  return _HealthBenefitMilestone.fromJson(json);
}

/// @nodoc
mixin _$HealthBenefitMilestone {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get timeThresholdInMinutes =>
      throw _privateConstructorUsedError; // e.g., 20 (for 20 minutes), 480 (for 8 hours)
  String get titleKey =>
      throw _privateConstructorUsedError; // Renamed from title
  String get descriptionKey =>
      throw _privateConstructorUsedError; // Renamed from description
  String? get iconName => throw _privateConstructorUsedError;

  /// Serializes this HealthBenefitMilestone to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthBenefitMilestone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthBenefitMilestoneCopyWith<HealthBenefitMilestone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthBenefitMilestoneCopyWith<$Res> {
  factory $HealthBenefitMilestoneCopyWith(HealthBenefitMilestone value,
          $Res Function(HealthBenefitMilestone) then) =
      _$HealthBenefitMilestoneCopyWithImpl<$Res, HealthBenefitMilestone>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: 0) int timeThresholdInMinutes,
      String titleKey,
      String descriptionKey,
      String? iconName});
}

/// @nodoc
class _$HealthBenefitMilestoneCopyWithImpl<$Res,
        $Val extends HealthBenefitMilestone>
    implements $HealthBenefitMilestoneCopyWith<$Res> {
  _$HealthBenefitMilestoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthBenefitMilestone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeThresholdInMinutes = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? iconName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timeThresholdInMinutes: null == timeThresholdInMinutes
          ? _value.timeThresholdInMinutes
          : timeThresholdInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthBenefitMilestoneImplCopyWith<$Res>
    implements $HealthBenefitMilestoneCopyWith<$Res> {
  factory _$$HealthBenefitMilestoneImplCopyWith(
          _$HealthBenefitMilestoneImpl value,
          $Res Function(_$HealthBenefitMilestoneImpl) then) =
      __$$HealthBenefitMilestoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: 0) int timeThresholdInMinutes,
      String titleKey,
      String descriptionKey,
      String? iconName});
}

/// @nodoc
class __$$HealthBenefitMilestoneImplCopyWithImpl<$Res>
    extends _$HealthBenefitMilestoneCopyWithImpl<$Res,
        _$HealthBenefitMilestoneImpl>
    implements _$$HealthBenefitMilestoneImplCopyWith<$Res> {
  __$$HealthBenefitMilestoneImplCopyWithImpl(
      _$HealthBenefitMilestoneImpl _value,
      $Res Function(_$HealthBenefitMilestoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthBenefitMilestone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timeThresholdInMinutes = null,
    Object? titleKey = null,
    Object? descriptionKey = null,
    Object? iconName = freezed,
  }) {
    return _then(_$HealthBenefitMilestoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timeThresholdInMinutes: null == timeThresholdInMinutes
          ? _value.timeThresholdInMinutes
          : timeThresholdInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      titleKey: null == titleKey
          ? _value.titleKey
          : titleKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: freezed == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthBenefitMilestoneImpl extends _HealthBenefitMilestone {
  const _$HealthBenefitMilestoneImpl(
      {required this.id,
      @JsonKey(defaultValue: 0) required this.timeThresholdInMinutes,
      required this.titleKey,
      required this.descriptionKey,
      this.iconName})
      : super._();

  factory _$HealthBenefitMilestoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthBenefitMilestoneImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: 0)
  final int timeThresholdInMinutes;
// e.g., 20 (for 20 minutes), 480 (for 8 hours)
  @override
  final String titleKey;
// Renamed from title
  @override
  final String descriptionKey;
// Renamed from description
  @override
  final String? iconName;

  @override
  String toString() {
    return 'HealthBenefitMilestone(id: $id, timeThresholdInMinutes: $timeThresholdInMinutes, titleKey: $titleKey, descriptionKey: $descriptionKey, iconName: $iconName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthBenefitMilestoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeThresholdInMinutes, timeThresholdInMinutes) ||
                other.timeThresholdInMinutes == timeThresholdInMinutes) &&
            (identical(other.titleKey, titleKey) ||
                other.titleKey == titleKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, timeThresholdInMinutes,
      titleKey, descriptionKey, iconName);

  /// Create a copy of HealthBenefitMilestone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthBenefitMilestoneImplCopyWith<_$HealthBenefitMilestoneImpl>
      get copyWith => __$$HealthBenefitMilestoneImplCopyWithImpl<
          _$HealthBenefitMilestoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthBenefitMilestoneImplToJson(
      this,
    );
  }
}

abstract class _HealthBenefitMilestone extends HealthBenefitMilestone {
  const factory _HealthBenefitMilestone(
      {required final String id,
      @JsonKey(defaultValue: 0) required final int timeThresholdInMinutes,
      required final String titleKey,
      required final String descriptionKey,
      final String? iconName}) = _$HealthBenefitMilestoneImpl;
  const _HealthBenefitMilestone._() : super._();

  factory _HealthBenefitMilestone.fromJson(Map<String, dynamic> json) =
      _$HealthBenefitMilestoneImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: 0)
  int get timeThresholdInMinutes; // e.g., 20 (for 20 minutes), 480 (for 8 hours)
  @override
  String get titleKey; // Renamed from title
  @override
  String get descriptionKey; // Renamed from description
  @override
  String? get iconName;

  /// Create a copy of HealthBenefitMilestone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthBenefitMilestoneImplCopyWith<_$HealthBenefitMilestoneImpl>
      get copyWith => throw _privateConstructorUsedError;
}
