// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AchievementsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<AchievementDefinition> get allAchievements =>
      throw _privateConstructorUsedError;
  List<UnlockedAchievement> get unlockedAchievements =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  AchievementDefinition? get lastUnlockedAchievement =>
      throw _privateConstructorUsedError;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementsStateCopyWith<AchievementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementsStateCopyWith<$Res> {
  factory $AchievementsStateCopyWith(
          AchievementsState value, $Res Function(AchievementsState) then) =
      _$AchievementsStateCopyWithImpl<$Res, AchievementsState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<AchievementDefinition> allAchievements,
      List<UnlockedAchievement> unlockedAchievements,
      String? errorMessage,
      AchievementDefinition? lastUnlockedAchievement});

  $AchievementDefinitionCopyWith<$Res>? get lastUnlockedAchievement;
}

/// @nodoc
class _$AchievementsStateCopyWithImpl<$Res, $Val extends AchievementsState>
    implements $AchievementsStateCopyWith<$Res> {
  _$AchievementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allAchievements = null,
    Object? unlockedAchievements = null,
    Object? errorMessage = freezed,
    Object? lastUnlockedAchievement = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allAchievements: null == allAchievements
          ? _value.allAchievements
          : allAchievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementDefinition>,
      unlockedAchievements: null == unlockedAchievements
          ? _value.unlockedAchievements
          : unlockedAchievements // ignore: cast_nullable_to_non_nullable
              as List<UnlockedAchievement>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUnlockedAchievement: freezed == lastUnlockedAchievement
          ? _value.lastUnlockedAchievement
          : lastUnlockedAchievement // ignore: cast_nullable_to_non_nullable
              as AchievementDefinition?,
    ) as $Val);
  }

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementDefinitionCopyWith<$Res>? get lastUnlockedAchievement {
    if (_value.lastUnlockedAchievement == null) {
      return null;
    }

    return $AchievementDefinitionCopyWith<$Res>(_value.lastUnlockedAchievement!,
        (value) {
      return _then(_value.copyWith(lastUnlockedAchievement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AchievementsStateImplCopyWith<$Res>
    implements $AchievementsStateCopyWith<$Res> {
  factory _$$AchievementsStateImplCopyWith(_$AchievementsStateImpl value,
          $Res Function(_$AchievementsStateImpl) then) =
      __$$AchievementsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<AchievementDefinition> allAchievements,
      List<UnlockedAchievement> unlockedAchievements,
      String? errorMessage,
      AchievementDefinition? lastUnlockedAchievement});

  @override
  $AchievementDefinitionCopyWith<$Res>? get lastUnlockedAchievement;
}

/// @nodoc
class __$$AchievementsStateImplCopyWithImpl<$Res>
    extends _$AchievementsStateCopyWithImpl<$Res, _$AchievementsStateImpl>
    implements _$$AchievementsStateImplCopyWith<$Res> {
  __$$AchievementsStateImplCopyWithImpl(_$AchievementsStateImpl _value,
      $Res Function(_$AchievementsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? allAchievements = null,
    Object? unlockedAchievements = null,
    Object? errorMessage = freezed,
    Object? lastUnlockedAchievement = freezed,
  }) {
    return _then(_$AchievementsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allAchievements: null == allAchievements
          ? _value._allAchievements
          : allAchievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementDefinition>,
      unlockedAchievements: null == unlockedAchievements
          ? _value._unlockedAchievements
          : unlockedAchievements // ignore: cast_nullable_to_non_nullable
              as List<UnlockedAchievement>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUnlockedAchievement: freezed == lastUnlockedAchievement
          ? _value.lastUnlockedAchievement
          : lastUnlockedAchievement // ignore: cast_nullable_to_non_nullable
              as AchievementDefinition?,
    ));
  }
}

/// @nodoc

class _$AchievementsStateImpl implements _AchievementsState {
  const _$AchievementsStateImpl(
      {this.isLoading = true,
      final List<AchievementDefinition> allAchievements = const [],
      final List<UnlockedAchievement> unlockedAchievements = const [],
      this.errorMessage,
      this.lastUnlockedAchievement})
      : _allAchievements = allAchievements,
        _unlockedAchievements = unlockedAchievements;

  @override
  @JsonKey()
  final bool isLoading;
  final List<AchievementDefinition> _allAchievements;
  @override
  @JsonKey()
  List<AchievementDefinition> get allAchievements {
    if (_allAchievements is EqualUnmodifiableListView) return _allAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAchievements);
  }

  final List<UnlockedAchievement> _unlockedAchievements;
  @override
  @JsonKey()
  List<UnlockedAchievement> get unlockedAchievements {
    if (_unlockedAchievements is EqualUnmodifiableListView)
      return _unlockedAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedAchievements);
  }

  @override
  final String? errorMessage;
  @override
  final AchievementDefinition? lastUnlockedAchievement;

  @override
  String toString() {
    return 'AchievementsState(isLoading: $isLoading, allAchievements: $allAchievements, unlockedAchievements: $unlockedAchievements, errorMessage: $errorMessage, lastUnlockedAchievement: $lastUnlockedAchievement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._allAchievements, _allAchievements) &&
            const DeepCollectionEquality()
                .equals(other._unlockedAchievements, _unlockedAchievements) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(
                    other.lastUnlockedAchievement, lastUnlockedAchievement) ||
                other.lastUnlockedAchievement == lastUnlockedAchievement));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_allAchievements),
      const DeepCollectionEquality().hash(_unlockedAchievements),
      errorMessage,
      lastUnlockedAchievement);

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementsStateImplCopyWith<_$AchievementsStateImpl> get copyWith =>
      __$$AchievementsStateImplCopyWithImpl<_$AchievementsStateImpl>(
          this, _$identity);
}

abstract class _AchievementsState implements AchievementsState {
  const factory _AchievementsState(
          {final bool isLoading,
          final List<AchievementDefinition> allAchievements,
          final List<UnlockedAchievement> unlockedAchievements,
          final String? errorMessage,
          final AchievementDefinition? lastUnlockedAchievement}) =
      _$AchievementsStateImpl;

  @override
  bool get isLoading;
  @override
  List<AchievementDefinition> get allAchievements;
  @override
  List<UnlockedAchievement> get unlockedAchievements;
  @override
  String? get errorMessage;
  @override
  AchievementDefinition? get lastUnlockedAchievement;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementsStateImplCopyWith<_$AchievementsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
