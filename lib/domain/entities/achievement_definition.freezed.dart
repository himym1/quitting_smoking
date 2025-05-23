// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchievementDefinition _$AchievementDefinitionFromJson(
    Map<String, dynamic> json) {
  return _AchievementDefinition.fromJson(json);
}

/// @nodoc
mixin _$AchievementDefinition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get unlockCondition =>
      throw _privateConstructorUsedError; // e.g., {"type": "consecutive_days", "value": 7}
  String get iconLockedAssetPath => throw _privateConstructorUsedError;
  String get iconUnlockedAssetPath =>
      throw _privateConstructorUsedError; // Localization keys
  String get nameKey => throw _privateConstructorUsedError;
  String get descriptionKey => throw _privateConstructorUsedError;
  String? get storyKey => throw _privateConstructorUsedError;

  /// Serializes this AchievementDefinition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementDefinitionCopyWith<AchievementDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementDefinitionCopyWith<$Res> {
  factory $AchievementDefinitionCopyWith(AchievementDefinition value,
          $Res Function(AchievementDefinition) then) =
      _$AchievementDefinitionCopyWithImpl<$Res, AchievementDefinition>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      Map<String, dynamic> unlockCondition,
      String iconLockedAssetPath,
      String iconUnlockedAssetPath,
      String nameKey,
      String descriptionKey,
      String? storyKey});
}

/// @nodoc
class _$AchievementDefinitionCopyWithImpl<$Res,
        $Val extends AchievementDefinition>
    implements $AchievementDefinitionCopyWith<$Res> {
  _$AchievementDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? unlockCondition = null,
    Object? iconLockedAssetPath = null,
    Object? iconUnlockedAssetPath = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? storyKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unlockCondition: null == unlockCondition
          ? _value.unlockCondition
          : unlockCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      iconLockedAssetPath: null == iconLockedAssetPath
          ? _value.iconLockedAssetPath
          : iconLockedAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      iconUnlockedAssetPath: null == iconUnlockedAssetPath
          ? _value.iconUnlockedAssetPath
          : iconUnlockedAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      nameKey: null == nameKey
          ? _value.nameKey
          : nameKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      storyKey: freezed == storyKey
          ? _value.storyKey
          : storyKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementDefinitionImplCopyWith<$Res>
    implements $AchievementDefinitionCopyWith<$Res> {
  factory _$$AchievementDefinitionImplCopyWith(
          _$AchievementDefinitionImpl value,
          $Res Function(_$AchievementDefinitionImpl) then) =
      __$$AchievementDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      Map<String, dynamic> unlockCondition,
      String iconLockedAssetPath,
      String iconUnlockedAssetPath,
      String nameKey,
      String descriptionKey,
      String? storyKey});
}

/// @nodoc
class __$$AchievementDefinitionImplCopyWithImpl<$Res>
    extends _$AchievementDefinitionCopyWithImpl<$Res,
        _$AchievementDefinitionImpl>
    implements _$$AchievementDefinitionImplCopyWith<$Res> {
  __$$AchievementDefinitionImplCopyWithImpl(_$AchievementDefinitionImpl _value,
      $Res Function(_$AchievementDefinitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementDefinition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? unlockCondition = null,
    Object? iconLockedAssetPath = null,
    Object? iconUnlockedAssetPath = null,
    Object? nameKey = null,
    Object? descriptionKey = null,
    Object? storyKey = freezed,
  }) {
    return _then(_$AchievementDefinitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      unlockCondition: null == unlockCondition
          ? _value._unlockCondition
          : unlockCondition // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      iconLockedAssetPath: null == iconLockedAssetPath
          ? _value.iconLockedAssetPath
          : iconLockedAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      iconUnlockedAssetPath: null == iconUnlockedAssetPath
          ? _value.iconUnlockedAssetPath
          : iconUnlockedAssetPath // ignore: cast_nullable_to_non_nullable
              as String,
      nameKey: null == nameKey
          ? _value.nameKey
          : nameKey // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionKey: null == descriptionKey
          ? _value.descriptionKey
          : descriptionKey // ignore: cast_nullable_to_non_nullable
              as String,
      storyKey: freezed == storyKey
          ? _value.storyKey
          : storyKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementDefinitionImpl extends _AchievementDefinition {
  const _$AchievementDefinitionImpl(
      {required this.id,
      required this.name,
      required this.description,
      required final Map<String, dynamic> unlockCondition,
      required this.iconLockedAssetPath,
      required this.iconUnlockedAssetPath,
      required this.nameKey,
      required this.descriptionKey,
      this.storyKey})
      : _unlockCondition = unlockCondition,
        super._();

  factory _$AchievementDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementDefinitionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  final Map<String, dynamic> _unlockCondition;
  @override
  Map<String, dynamic> get unlockCondition {
    if (_unlockCondition is EqualUnmodifiableMapView) return _unlockCondition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unlockCondition);
  }

// e.g., {"type": "consecutive_days", "value": 7}
  @override
  final String iconLockedAssetPath;
  @override
  final String iconUnlockedAssetPath;
// Localization keys
  @override
  final String nameKey;
  @override
  final String descriptionKey;
  @override
  final String? storyKey;

  @override
  String toString() {
    return 'AchievementDefinition(id: $id, name: $name, description: $description, unlockCondition: $unlockCondition, iconLockedAssetPath: $iconLockedAssetPath, iconUnlockedAssetPath: $iconUnlockedAssetPath, nameKey: $nameKey, descriptionKey: $descriptionKey, storyKey: $storyKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementDefinitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._unlockCondition, _unlockCondition) &&
            (identical(other.iconLockedAssetPath, iconLockedAssetPath) ||
                other.iconLockedAssetPath == iconLockedAssetPath) &&
            (identical(other.iconUnlockedAssetPath, iconUnlockedAssetPath) ||
                other.iconUnlockedAssetPath == iconUnlockedAssetPath) &&
            (identical(other.nameKey, nameKey) || other.nameKey == nameKey) &&
            (identical(other.descriptionKey, descriptionKey) ||
                other.descriptionKey == descriptionKey) &&
            (identical(other.storyKey, storyKey) ||
                other.storyKey == storyKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_unlockCondition),
      iconLockedAssetPath,
      iconUnlockedAssetPath,
      nameKey,
      descriptionKey,
      storyKey);

  /// Create a copy of AchievementDefinition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementDefinitionImplCopyWith<_$AchievementDefinitionImpl>
      get copyWith => __$$AchievementDefinitionImplCopyWithImpl<
          _$AchievementDefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementDefinitionImplToJson(
      this,
    );
  }
}

abstract class _AchievementDefinition extends AchievementDefinition {
  const factory _AchievementDefinition(
      {required final String id,
      required final String name,
      required final String description,
      required final Map<String, dynamic> unlockCondition,
      required final String iconLockedAssetPath,
      required final String iconUnlockedAssetPath,
      required final String nameKey,
      required final String descriptionKey,
      final String? storyKey}) = _$AchievementDefinitionImpl;
  const _AchievementDefinition._() : super._();

  factory _AchievementDefinition.fromJson(Map<String, dynamic> json) =
      _$AchievementDefinitionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  Map<String, dynamic>
      get unlockCondition; // e.g., {"type": "consecutive_days", "value": 7}
  @override
  String get iconLockedAssetPath;
  @override
  String get iconUnlockedAssetPath; // Localization keys
  @override
  String get nameKey;
  @override
  String get descriptionKey;
  @override
  String? get storyKey;

  /// Create a copy of AchievementDefinition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementDefinitionImplCopyWith<_$AchievementDefinitionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
