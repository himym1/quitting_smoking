// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingState {
  int get currentPageIndex => throw _privateConstructorUsedError;
  DateTime? get quitDateTime => throw _privateConstructorUsedError;
  int? get dailyCigarettes => throw _privateConstructorUsedError;
  double? get packPrice => throw _privateConstructorUsedError;
  int? get smokingYears => throw _privateConstructorUsedError;
  String? get quitReason => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  UserProfile? get userProfileToSave => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingStateCopyWith<OnboardingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
  @useResult
  $Res call(
      {int currentPageIndex,
      DateTime? quitDateTime,
      int? dailyCigarettes,
      double? packPrice,
      int? smokingYears,
      String? quitReason,
      bool isLoading,
      UserProfile? userProfileToSave});

  $UserProfileCopyWith<$Res>? get userProfileToSave;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
    Object? quitDateTime = freezed,
    Object? dailyCigarettes = freezed,
    Object? packPrice = freezed,
    Object? smokingYears = freezed,
    Object? quitReason = freezed,
    Object? isLoading = null,
    Object? userProfileToSave = freezed,
  }) {
    return _then(_value.copyWith(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileToSave: freezed == userProfileToSave
          ? _value.userProfileToSave
          : userProfileToSave // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
  }

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfileToSave {
    if (_value.userProfileToSave == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfileToSave!, (value) {
      return _then(_value.copyWith(userProfileToSave: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnboardingStateImplCopyWith<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  factory _$$OnboardingStateImplCopyWith(_$OnboardingStateImpl value,
          $Res Function(_$OnboardingStateImpl) then) =
      __$$OnboardingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPageIndex,
      DateTime? quitDateTime,
      int? dailyCigarettes,
      double? packPrice,
      int? smokingYears,
      String? quitReason,
      bool isLoading,
      UserProfile? userProfileToSave});

  @override
  $UserProfileCopyWith<$Res>? get userProfileToSave;
}

/// @nodoc
class __$$OnboardingStateImplCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$OnboardingStateImpl>
    implements _$$OnboardingStateImplCopyWith<$Res> {
  __$$OnboardingStateImplCopyWithImpl(
      _$OnboardingStateImpl _value, $Res Function(_$OnboardingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
    Object? quitDateTime = freezed,
    Object? dailyCigarettes = freezed,
    Object? packPrice = freezed,
    Object? smokingYears = freezed,
    Object? quitReason = freezed,
    Object? isLoading = null,
    Object? userProfileToSave = freezed,
  }) {
    return _then(_$OnboardingStateImpl(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileToSave: freezed == userProfileToSave
          ? _value.userProfileToSave
          : userProfileToSave // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc

class _$OnboardingStateImpl implements _OnboardingState {
  const _$OnboardingStateImpl(
      {this.currentPageIndex = 0,
      this.quitDateTime,
      this.dailyCigarettes,
      this.packPrice,
      this.smokingYears,
      this.quitReason,
      this.isLoading = false,
      this.userProfileToSave});

  @override
  @JsonKey()
  final int currentPageIndex;
  @override
  final DateTime? quitDateTime;
  @override
  final int? dailyCigarettes;
  @override
  final double? packPrice;
  @override
  final int? smokingYears;
  @override
  final String? quitReason;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserProfile? userProfileToSave;

  @override
  String toString() {
    return 'OnboardingState(currentPageIndex: $currentPageIndex, quitDateTime: $quitDateTime, dailyCigarettes: $dailyCigarettes, packPrice: $packPrice, smokingYears: $smokingYears, quitReason: $quitReason, isLoading: $isLoading, userProfileToSave: $userProfileToSave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingStateImpl &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex) &&
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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userProfileToSave, userProfileToSave) ||
                other.userProfileToSave == userProfileToSave));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPageIndex,
      quitDateTime,
      dailyCigarettes,
      packPrice,
      smokingYears,
      quitReason,
      isLoading,
      userProfileToSave);

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      __$$OnboardingStateImplCopyWithImpl<_$OnboardingStateImpl>(
          this, _$identity);
}

abstract class _OnboardingState implements OnboardingState {
  const factory _OnboardingState(
      {final int currentPageIndex,
      final DateTime? quitDateTime,
      final int? dailyCigarettes,
      final double? packPrice,
      final int? smokingYears,
      final String? quitReason,
      final bool isLoading,
      final UserProfile? userProfileToSave}) = _$OnboardingStateImpl;

  @override
  int get currentPageIndex;
  @override
  DateTime? get quitDateTime;
  @override
  int? get dailyCigarettes;
  @override
  double? get packPrice;
  @override
  int? get smokingYears;
  @override
  String? get quitReason;
  @override
  bool get isLoading;
  @override
  UserProfile? get userProfileToSave;

  /// Create a copy of OnboardingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingStateImplCopyWith<_$OnboardingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
