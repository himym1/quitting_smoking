// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUserProfileRequestModel _$UpdateUserProfileRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UpdateUserProfileRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserProfileRequestModel {
  /// 戒烟开始日期
  DateTime? get quitDate => throw _privateConstructorUsedError;

  /// 戒烟理由
  String? get quitReason => throw _privateConstructorUsedError;

  /// 每日吸烟量
  int? get cigarettesPerDay => throw _privateConstructorUsedError;

  /// 香烟价格
  double? get cigarettePrice => throw _privateConstructorUsedError;

  /// 吸烟年数
  int? get smokingYears => throw _privateConstructorUsedError;

  /// 货币代码
  String get currency => throw _privateConstructorUsedError;

  /// 时区
  String get timezone => throw _privateConstructorUsedError;

  /// 语言代码
  String get locale => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserProfileRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserProfileRequestModelCopyWith<UpdateUserProfileRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserProfileRequestModelCopyWith<$Res> {
  factory $UpdateUserProfileRequestModelCopyWith(
          UpdateUserProfileRequestModel value,
          $Res Function(UpdateUserProfileRequestModel) then) =
      _$UpdateUserProfileRequestModelCopyWithImpl<$Res,
          UpdateUserProfileRequestModel>;
  @useResult
  $Res call(
      {DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      int? smokingYears,
      String currency,
      String timezone,
      String locale});
}

/// @nodoc
class _$UpdateUserProfileRequestModelCopyWithImpl<$Res,
        $Val extends UpdateUserProfileRequestModel>
    implements $UpdateUserProfileRequestModelCopyWith<$Res> {
  _$UpdateUserProfileRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
    Object? smokingYears = freezed,
    Object? currency = null,
    Object? timezone = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      quitDate: freezed == quitDate
          ? _value.quitDate
          : quitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cigarettesPerDay: freezed == cigarettesPerDay
          ? _value.cigarettesPerDay
          : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      cigarettePrice: freezed == cigarettePrice
          ? _value.cigarettePrice
          : cigarettePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserProfileRequestModelImplCopyWith<$Res>
    implements $UpdateUserProfileRequestModelCopyWith<$Res> {
  factory _$$UpdateUserProfileRequestModelImplCopyWith(
          _$UpdateUserProfileRequestModelImpl value,
          $Res Function(_$UpdateUserProfileRequestModelImpl) then) =
      __$$UpdateUserProfileRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      int? smokingYears,
      String currency,
      String timezone,
      String locale});
}

/// @nodoc
class __$$UpdateUserProfileRequestModelImplCopyWithImpl<$Res>
    extends _$UpdateUserProfileRequestModelCopyWithImpl<$Res,
        _$UpdateUserProfileRequestModelImpl>
    implements _$$UpdateUserProfileRequestModelImplCopyWith<$Res> {
  __$$UpdateUserProfileRequestModelImplCopyWithImpl(
      _$UpdateUserProfileRequestModelImpl _value,
      $Res Function(_$UpdateUserProfileRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
    Object? smokingYears = freezed,
    Object? currency = null,
    Object? timezone = null,
    Object? locale = null,
  }) {
    return _then(_$UpdateUserProfileRequestModelImpl(
      quitDate: freezed == quitDate
          ? _value.quitDate
          : quitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cigarettesPerDay: freezed == cigarettesPerDay
          ? _value.cigarettesPerDay
          : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      cigarettePrice: freezed == cigarettePrice
          ? _value.cigarettePrice
          : cigarettePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserProfileRequestModelImpl
    implements _UpdateUserProfileRequestModel {
  const _$UpdateUserProfileRequestModelImpl(
      {this.quitDate,
      this.quitReason,
      this.cigarettesPerDay,
      this.cigarettePrice,
      this.smokingYears,
      this.currency = 'CNY',
      this.timezone = 'Asia/Shanghai',
      this.locale = 'zh-CN'});

  factory _$UpdateUserProfileRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateUserProfileRequestModelImplFromJson(json);

  /// 戒烟开始日期
  @override
  final DateTime? quitDate;

  /// 戒烟理由
  @override
  final String? quitReason;

  /// 每日吸烟量
  @override
  final int? cigarettesPerDay;

  /// 香烟价格
  @override
  final double? cigarettePrice;

  /// 吸烟年数
  @override
  final int? smokingYears;

  /// 货币代码
  @override
  @JsonKey()
  final String currency;

  /// 时区
  @override
  @JsonKey()
  final String timezone;

  /// 语言代码
  @override
  @JsonKey()
  final String locale;

  @override
  String toString() {
    return 'UpdateUserProfileRequestModel(quitDate: $quitDate, quitReason: $quitReason, cigarettesPerDay: $cigarettesPerDay, cigarettePrice: $cigarettePrice, smokingYears: $smokingYears, currency: $currency, timezone: $timezone, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserProfileRequestModelImpl &&
            (identical(other.quitDate, quitDate) ||
                other.quitDate == quitDate) &&
            (identical(other.quitReason, quitReason) ||
                other.quitReason == quitReason) &&
            (identical(other.cigarettesPerDay, cigarettesPerDay) ||
                other.cigarettesPerDay == cigarettesPerDay) &&
            (identical(other.cigarettePrice, cigarettePrice) ||
                other.cigarettePrice == cigarettePrice) &&
            (identical(other.smokingYears, smokingYears) ||
                other.smokingYears == smokingYears) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quitDate,
      quitReason,
      cigarettesPerDay,
      cigarettePrice,
      smokingYears,
      currency,
      timezone,
      locale);

  /// Create a copy of UpdateUserProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserProfileRequestModelImplCopyWith<
          _$UpdateUserProfileRequestModelImpl>
      get copyWith => __$$UpdateUserProfileRequestModelImplCopyWithImpl<
          _$UpdateUserProfileRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserProfileRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserProfileRequestModel
    implements UpdateUserProfileRequestModel {
  const factory _UpdateUserProfileRequestModel(
      {final DateTime? quitDate,
      final String? quitReason,
      final int? cigarettesPerDay,
      final double? cigarettePrice,
      final int? smokingYears,
      final String currency,
      final String timezone,
      final String locale}) = _$UpdateUserProfileRequestModelImpl;

  factory _UpdateUserProfileRequestModel.fromJson(Map<String, dynamic> json) =
      _$UpdateUserProfileRequestModelImpl.fromJson;

  /// 戒烟开始日期
  @override
  DateTime? get quitDate;

  /// 戒烟理由
  @override
  String? get quitReason;

  /// 每日吸烟量
  @override
  int? get cigarettesPerDay;

  /// 香烟价格
  @override
  double? get cigarettePrice;

  /// 吸烟年数
  @override
  int? get smokingYears;

  /// 货币代码
  @override
  String get currency;

  /// 时区
  @override
  String get timezone;

  /// 语言代码
  @override
  String get locale;

  /// Create a copy of UpdateUserProfileRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserProfileRequestModelImplCopyWith<
          _$UpdateUserProfileRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserProfileResponseModel _$UserProfileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserProfileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileResponseModel {
  /// 用户ID
  String get userId => throw _privateConstructorUsedError;

  /// 戒烟开始日期
  DateTime? get quitDate => throw _privateConstructorUsedError;

  /// 戒烟理由
  String? get quitReason => throw _privateConstructorUsedError;

  /// 每日吸烟量
  int? get cigarettesPerDay => throw _privateConstructorUsedError;

  /// 香烟价格
  double? get cigarettePrice => throw _privateConstructorUsedError;

  /// 吸烟年数
  int? get smokingYears => throw _privateConstructorUsedError;

  /// 货币代码
  String get currency => throw _privateConstructorUsedError;

  /// 时区
  String get timezone => throw _privateConstructorUsedError;

  /// 语言代码
  String get locale => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileResponseModelCopyWith<UserProfileResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileResponseModelCopyWith<$Res> {
  factory $UserProfileResponseModelCopyWith(UserProfileResponseModel value,
          $Res Function(UserProfileResponseModel) then) =
      _$UserProfileResponseModelCopyWithImpl<$Res, UserProfileResponseModel>;
  @useResult
  $Res call(
      {String userId,
      DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      int? smokingYears,
      String currency,
      String timezone,
      String locale,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserProfileResponseModelCopyWithImpl<$Res,
        $Val extends UserProfileResponseModel>
    implements $UserProfileResponseModelCopyWith<$Res> {
  _$UserProfileResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
    Object? smokingYears = freezed,
    Object? currency = null,
    Object? timezone = null,
    Object? locale = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quitDate: freezed == quitDate
          ? _value.quitDate
          : quitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cigarettesPerDay: freezed == cigarettesPerDay
          ? _value.cigarettesPerDay
          : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      cigarettePrice: freezed == cigarettePrice
          ? _value.cigarettePrice
          : cigarettePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$UserProfileResponseModelImplCopyWith<$Res>
    implements $UserProfileResponseModelCopyWith<$Res> {
  factory _$$UserProfileResponseModelImplCopyWith(
          _$UserProfileResponseModelImpl value,
          $Res Function(_$UserProfileResponseModelImpl) then) =
      __$$UserProfileResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      int? smokingYears,
      String currency,
      String timezone,
      String locale,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserProfileResponseModelImplCopyWithImpl<$Res>
    extends _$UserProfileResponseModelCopyWithImpl<$Res,
        _$UserProfileResponseModelImpl>
    implements _$$UserProfileResponseModelImplCopyWith<$Res> {
  __$$UserProfileResponseModelImplCopyWithImpl(
      _$UserProfileResponseModelImpl _value,
      $Res Function(_$UserProfileResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
    Object? smokingYears = freezed,
    Object? currency = null,
    Object? timezone = null,
    Object? locale = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserProfileResponseModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quitDate: freezed == quitDate
          ? _value.quitDate
          : quitDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quitReason: freezed == quitReason
          ? _value.quitReason
          : quitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cigarettesPerDay: freezed == cigarettesPerDay
          ? _value.cigarettesPerDay
          : cigarettesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      cigarettePrice: freezed == cigarettePrice
          ? _value.cigarettePrice
          : cigarettePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      smokingYears: freezed == smokingYears
          ? _value.smokingYears
          : smokingYears // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$UserProfileResponseModelImpl implements _UserProfileResponseModel {
  const _$UserProfileResponseModelImpl(
      {required this.userId,
      this.quitDate,
      this.quitReason,
      this.cigarettesPerDay,
      this.cigarettePrice,
      this.smokingYears,
      this.currency = 'CNY',
      this.timezone = 'Asia/Shanghai',
      this.locale = 'zh-CN',
      required this.createdAt,
      required this.updatedAt});

  factory _$UserProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileResponseModelImplFromJson(json);

  /// 用户ID
  @override
  final String userId;

  /// 戒烟开始日期
  @override
  final DateTime? quitDate;

  /// 戒烟理由
  @override
  final String? quitReason;

  /// 每日吸烟量
  @override
  final int? cigarettesPerDay;

  /// 香烟价格
  @override
  final double? cigarettePrice;

  /// 吸烟年数
  @override
  final int? smokingYears;

  /// 货币代码
  @override
  @JsonKey()
  final String currency;

  /// 时区
  @override
  @JsonKey()
  final String timezone;

  /// 语言代码
  @override
  @JsonKey()
  final String locale;

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserProfileResponseModel(userId: $userId, quitDate: $quitDate, quitReason: $quitReason, cigarettesPerDay: $cigarettesPerDay, cigarettePrice: $cigarettePrice, smokingYears: $smokingYears, currency: $currency, timezone: $timezone, locale: $locale, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileResponseModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quitDate, quitDate) ||
                other.quitDate == quitDate) &&
            (identical(other.quitReason, quitReason) ||
                other.quitReason == quitReason) &&
            (identical(other.cigarettesPerDay, cigarettesPerDay) ||
                other.cigarettesPerDay == cigarettesPerDay) &&
            (identical(other.cigarettePrice, cigarettePrice) ||
                other.cigarettePrice == cigarettePrice) &&
            (identical(other.smokingYears, smokingYears) ||
                other.smokingYears == smokingYears) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      quitDate,
      quitReason,
      cigarettesPerDay,
      cigarettePrice,
      smokingYears,
      currency,
      timezone,
      locale,
      createdAt,
      updatedAt);

  /// Create a copy of UserProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileResponseModelImplCopyWith<_$UserProfileResponseModelImpl>
      get copyWith => __$$UserProfileResponseModelImplCopyWithImpl<
          _$UserProfileResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileResponseModel implements UserProfileResponseModel {
  const factory _UserProfileResponseModel(
      {required final String userId,
      final DateTime? quitDate,
      final String? quitReason,
      final int? cigarettesPerDay,
      final double? cigarettePrice,
      final int? smokingYears,
      final String currency,
      final String timezone,
      final String locale,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserProfileResponseModelImpl;

  factory _UserProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileResponseModelImpl.fromJson;

  /// 用户ID
  @override
  String get userId;

  /// 戒烟开始日期
  @override
  DateTime? get quitDate;

  /// 戒烟理由
  @override
  String? get quitReason;

  /// 每日吸烟量
  @override
  int? get cigarettesPerDay;

  /// 香烟价格
  @override
  double? get cigarettePrice;

  /// 吸烟年数
  @override
  int? get smokingYears;

  /// 货币代码
  @override
  String get currency;

  /// 时区
  @override
  String get timezone;

  /// 语言代码
  @override
  String get locale;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime get updatedAt;

  /// Create a copy of UserProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileResponseModelImplCopyWith<_$UserProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserStatsResponseModel _$UserStatsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserStatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserStatsResponseModel {
  /// 戒烟天数
  int get quitDays => throw _privateConstructorUsedError;

  /// 节省的金钱
  double get moneySaved => throw _privateConstructorUsedError;

  /// 未吸的香烟数量
  int get cigarettesNotSmoked => throw _privateConstructorUsedError;

  /// 连续打卡天数
  int get consecutiveCheckIns => throw _privateConstructorUsedError;

  /// 总打卡次数
  int get totalCheckIns => throw _privateConstructorUsedError;

  /// 最长连续戒烟天数
  int get longestQuitStreak => throw _privateConstructorUsedError;

  /// 当前连续戒烟天数
  int get currentQuitStreak => throw _privateConstructorUsedError;

  /// 统计计算时间
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsResponseModelCopyWith<UserStatsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsResponseModelCopyWith<$Res> {
  factory $UserStatsResponseModelCopyWith(UserStatsResponseModel value,
          $Res Function(UserStatsResponseModel) then) =
      _$UserStatsResponseModelCopyWithImpl<$Res, UserStatsResponseModel>;
  @useResult
  $Res call(
      {int quitDays,
      double moneySaved,
      int cigarettesNotSmoked,
      int consecutiveCheckIns,
      int totalCheckIns,
      int longestQuitStreak,
      int currentQuitStreak,
      DateTime calculatedAt});
}

/// @nodoc
class _$UserStatsResponseModelCopyWithImpl<$Res,
        $Val extends UserStatsResponseModel>
    implements $UserStatsResponseModelCopyWith<$Res> {
  _$UserStatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDays = null,
    Object? moneySaved = null,
    Object? cigarettesNotSmoked = null,
    Object? consecutiveCheckIns = null,
    Object? totalCheckIns = null,
    Object? longestQuitStreak = null,
    Object? currentQuitStreak = null,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      quitDays: null == quitDays
          ? _value.quitDays
          : quitDays // ignore: cast_nullable_to_non_nullable
              as int,
      moneySaved: null == moneySaved
          ? _value.moneySaved
          : moneySaved // ignore: cast_nullable_to_non_nullable
              as double,
      cigarettesNotSmoked: null == cigarettesNotSmoked
          ? _value.cigarettesNotSmoked
          : cigarettesNotSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveCheckIns: null == consecutiveCheckIns
          ? _value.consecutiveCheckIns
          : consecutiveCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      longestQuitStreak: null == longestQuitStreak
          ? _value.longestQuitStreak
          : longestQuitStreak // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuitStreak: null == currentQuitStreak
          ? _value.currentQuitStreak
          : currentQuitStreak // ignore: cast_nullable_to_non_nullable
              as int,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatsResponseModelImplCopyWith<$Res>
    implements $UserStatsResponseModelCopyWith<$Res> {
  factory _$$UserStatsResponseModelImplCopyWith(
          _$UserStatsResponseModelImpl value,
          $Res Function(_$UserStatsResponseModelImpl) then) =
      __$$UserStatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quitDays,
      double moneySaved,
      int cigarettesNotSmoked,
      int consecutiveCheckIns,
      int totalCheckIns,
      int longestQuitStreak,
      int currentQuitStreak,
      DateTime calculatedAt});
}

/// @nodoc
class __$$UserStatsResponseModelImplCopyWithImpl<$Res>
    extends _$UserStatsResponseModelCopyWithImpl<$Res,
        _$UserStatsResponseModelImpl>
    implements _$$UserStatsResponseModelImplCopyWith<$Res> {
  __$$UserStatsResponseModelImplCopyWithImpl(
      _$UserStatsResponseModelImpl _value,
      $Res Function(_$UserStatsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDays = null,
    Object? moneySaved = null,
    Object? cigarettesNotSmoked = null,
    Object? consecutiveCheckIns = null,
    Object? totalCheckIns = null,
    Object? longestQuitStreak = null,
    Object? currentQuitStreak = null,
    Object? calculatedAt = null,
  }) {
    return _then(_$UserStatsResponseModelImpl(
      quitDays: null == quitDays
          ? _value.quitDays
          : quitDays // ignore: cast_nullable_to_non_nullable
              as int,
      moneySaved: null == moneySaved
          ? _value.moneySaved
          : moneySaved // ignore: cast_nullable_to_non_nullable
              as double,
      cigarettesNotSmoked: null == cigarettesNotSmoked
          ? _value.cigarettesNotSmoked
          : cigarettesNotSmoked // ignore: cast_nullable_to_non_nullable
              as int,
      consecutiveCheckIns: null == consecutiveCheckIns
          ? _value.consecutiveCheckIns
          : consecutiveCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      longestQuitStreak: null == longestQuitStreak
          ? _value.longestQuitStreak
          : longestQuitStreak // ignore: cast_nullable_to_non_nullable
              as int,
      currentQuitStreak: null == currentQuitStreak
          ? _value.currentQuitStreak
          : currentQuitStreak // ignore: cast_nullable_to_non_nullable
              as int,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsResponseModelImpl implements _UserStatsResponseModel {
  const _$UserStatsResponseModelImpl(
      {required this.quitDays,
      required this.moneySaved,
      required this.cigarettesNotSmoked,
      required this.consecutiveCheckIns,
      required this.totalCheckIns,
      required this.longestQuitStreak,
      required this.currentQuitStreak,
      required this.calculatedAt});

  factory _$UserStatsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsResponseModelImplFromJson(json);

  /// 戒烟天数
  @override
  final int quitDays;

  /// 节省的金钱
  @override
  final double moneySaved;

  /// 未吸的香烟数量
  @override
  final int cigarettesNotSmoked;

  /// 连续打卡天数
  @override
  final int consecutiveCheckIns;

  /// 总打卡次数
  @override
  final int totalCheckIns;

  /// 最长连续戒烟天数
  @override
  final int longestQuitStreak;

  /// 当前连续戒烟天数
  @override
  final int currentQuitStreak;

  /// 统计计算时间
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'UserStatsResponseModel(quitDays: $quitDays, moneySaved: $moneySaved, cigarettesNotSmoked: $cigarettesNotSmoked, consecutiveCheckIns: $consecutiveCheckIns, totalCheckIns: $totalCheckIns, longestQuitStreak: $longestQuitStreak, currentQuitStreak: $currentQuitStreak, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsResponseModelImpl &&
            (identical(other.quitDays, quitDays) ||
                other.quitDays == quitDays) &&
            (identical(other.moneySaved, moneySaved) ||
                other.moneySaved == moneySaved) &&
            (identical(other.cigarettesNotSmoked, cigarettesNotSmoked) ||
                other.cigarettesNotSmoked == cigarettesNotSmoked) &&
            (identical(other.consecutiveCheckIns, consecutiveCheckIns) ||
                other.consecutiveCheckIns == consecutiveCheckIns) &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.longestQuitStreak, longestQuitStreak) ||
                other.longestQuitStreak == longestQuitStreak) &&
            (identical(other.currentQuitStreak, currentQuitStreak) ||
                other.currentQuitStreak == currentQuitStreak) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      quitDays,
      moneySaved,
      cigarettesNotSmoked,
      consecutiveCheckIns,
      totalCheckIns,
      longestQuitStreak,
      currentQuitStreak,
      calculatedAt);

  /// Create a copy of UserStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsResponseModelImplCopyWith<_$UserStatsResponseModelImpl>
      get copyWith => __$$UserStatsResponseModelImplCopyWithImpl<
          _$UserStatsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserStatsResponseModel implements UserStatsResponseModel {
  const factory _UserStatsResponseModel(
      {required final int quitDays,
      required final double moneySaved,
      required final int cigarettesNotSmoked,
      required final int consecutiveCheckIns,
      required final int totalCheckIns,
      required final int longestQuitStreak,
      required final int currentQuitStreak,
      required final DateTime calculatedAt}) = _$UserStatsResponseModelImpl;

  factory _UserStatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserStatsResponseModelImpl.fromJson;

  /// 戒烟天数
  @override
  int get quitDays;

  /// 节省的金钱
  @override
  double get moneySaved;

  /// 未吸的香烟数量
  @override
  int get cigarettesNotSmoked;

  /// 连续打卡天数
  @override
  int get consecutiveCheckIns;

  /// 总打卡次数
  @override
  int get totalCheckIns;

  /// 最长连续戒烟天数
  @override
  int get longestQuitStreak;

  /// 当前连续戒烟天数
  @override
  int get currentQuitStreak;

  /// 统计计算时间
  @override
  DateTime get calculatedAt;

  /// Create a copy of UserStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsResponseModelImplCopyWith<_$UserStatsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSettingsModel _$UserSettingsModelFromJson(Map<String, dynamic> json) {
  return _UserSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsModel {
  /// 通知设置
  NotificationSettingsModel get notifications =>
      throw _privateConstructorUsedError;

  /// 隐私设置
  PrivacySettingsModel get privacy => throw _privateConstructorUsedError;

  /// 显示设置
  DisplaySettingsModel get display => throw _privateConstructorUsedError;

  /// Serializes this UserSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsModelCopyWith<UserSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsModelCopyWith<$Res> {
  factory $UserSettingsModelCopyWith(
          UserSettingsModel value, $Res Function(UserSettingsModel) then) =
      _$UserSettingsModelCopyWithImpl<$Res, UserSettingsModel>;
  @useResult
  $Res call(
      {NotificationSettingsModel notifications,
      PrivacySettingsModel privacy,
      DisplaySettingsModel display});

  $NotificationSettingsModelCopyWith<$Res> get notifications;
  $PrivacySettingsModelCopyWith<$Res> get privacy;
  $DisplaySettingsModelCopyWith<$Res> get display;
}

/// @nodoc
class _$UserSettingsModelCopyWithImpl<$Res, $Val extends UserSettingsModel>
    implements $UserSettingsModelCopyWith<$Res> {
  _$UserSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? privacy = null,
    Object? display = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as NotificationSettingsModel,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacySettingsModel,
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as DisplaySettingsModel,
    ) as $Val);
  }

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsModelCopyWith<$Res> get notifications {
    return $NotificationSettingsModelCopyWith<$Res>(_value.notifications,
        (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsModelCopyWith<$Res> get privacy {
    return $PrivacySettingsModelCopyWith<$Res>(_value.privacy, (value) {
      return _then(_value.copyWith(privacy: value) as $Val);
    });
  }

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplaySettingsModelCopyWith<$Res> get display {
    return $DisplaySettingsModelCopyWith<$Res>(_value.display, (value) {
      return _then(_value.copyWith(display: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSettingsModelImplCopyWith<$Res>
    implements $UserSettingsModelCopyWith<$Res> {
  factory _$$UserSettingsModelImplCopyWith(_$UserSettingsModelImpl value,
          $Res Function(_$UserSettingsModelImpl) then) =
      __$$UserSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotificationSettingsModel notifications,
      PrivacySettingsModel privacy,
      DisplaySettingsModel display});

  @override
  $NotificationSettingsModelCopyWith<$Res> get notifications;
  @override
  $PrivacySettingsModelCopyWith<$Res> get privacy;
  @override
  $DisplaySettingsModelCopyWith<$Res> get display;
}

/// @nodoc
class __$$UserSettingsModelImplCopyWithImpl<$Res>
    extends _$UserSettingsModelCopyWithImpl<$Res, _$UserSettingsModelImpl>
    implements _$$UserSettingsModelImplCopyWith<$Res> {
  __$$UserSettingsModelImplCopyWithImpl(_$UserSettingsModelImpl _value,
      $Res Function(_$UserSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? privacy = null,
    Object? display = null,
  }) {
    return _then(_$UserSettingsModelImpl(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as NotificationSettingsModel,
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacySettingsModel,
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as DisplaySettingsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsModelImpl implements _UserSettingsModel {
  const _$UserSettingsModelImpl(
      {required this.notifications,
      required this.privacy,
      required this.display});

  factory _$UserSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsModelImplFromJson(json);

  /// 通知设置
  @override
  final NotificationSettingsModel notifications;

  /// 隐私设置
  @override
  final PrivacySettingsModel privacy;

  /// 显示设置
  @override
  final DisplaySettingsModel display;

  @override
  String toString() {
    return 'UserSettingsModel(notifications: $notifications, privacy: $privacy, display: $display)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsModelImpl &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.display, display) || other.display == display));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notifications, privacy, display);

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      __$$UserSettingsModelImplCopyWithImpl<_$UserSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _UserSettingsModel implements UserSettingsModel {
  const factory _UserSettingsModel(
      {required final NotificationSettingsModel notifications,
      required final PrivacySettingsModel privacy,
      required final DisplaySettingsModel display}) = _$UserSettingsModelImpl;

  factory _UserSettingsModel.fromJson(Map<String, dynamic> json) =
      _$UserSettingsModelImpl.fromJson;

  /// 通知设置
  @override
  NotificationSettingsModel get notifications;

  /// 隐私设置
  @override
  PrivacySettingsModel get privacy;

  /// 显示设置
  @override
  DisplaySettingsModel get display;

  /// Create a copy of UserSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsModelImplCopyWith<_$UserSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettingsModel _$NotificationSettingsModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettingsModel {
  /// 是否启用推送通知
  bool get pushEnabled => throw _privateConstructorUsedError;

  /// 是否启用每日提醒
  bool get dailyReminder => throw _privateConstructorUsedError;

  /// 每日提醒时间（小时）
  int get dailyReminderHour => throw _privateConstructorUsedError;

  /// 是否启用成就通知
  bool get achievementNotifications => throw _privateConstructorUsedError;

  /// 是否启用渴望提醒
  bool get cravingReminders => throw _privateConstructorUsedError;

  /// 是否启用励志消息
  bool get motivationalMessages => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsModelCopyWith<NotificationSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsModelCopyWith<$Res> {
  factory $NotificationSettingsModelCopyWith(NotificationSettingsModel value,
          $Res Function(NotificationSettingsModel) then) =
      _$NotificationSettingsModelCopyWithImpl<$Res, NotificationSettingsModel>;
  @useResult
  $Res call(
      {bool pushEnabled,
      bool dailyReminder,
      int dailyReminderHour,
      bool achievementNotifications,
      bool cravingReminders,
      bool motivationalMessages});
}

/// @nodoc
class _$NotificationSettingsModelCopyWithImpl<$Res,
        $Val extends NotificationSettingsModel>
    implements $NotificationSettingsModelCopyWith<$Res> {
  _$NotificationSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushEnabled = null,
    Object? dailyReminder = null,
    Object? dailyReminderHour = null,
    Object? achievementNotifications = null,
    Object? cravingReminders = null,
    Object? motivationalMessages = null,
  }) {
    return _then(_value.copyWith(
      pushEnabled: null == pushEnabled
          ? _value.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminder: null == dailyReminder
          ? _value.dailyReminder
          : dailyReminder // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminderHour: null == dailyReminderHour
          ? _value.dailyReminderHour
          : dailyReminderHour // ignore: cast_nullable_to_non_nullable
              as int,
      achievementNotifications: null == achievementNotifications
          ? _value.achievementNotifications
          : achievementNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      cravingReminders: null == cravingReminders
          ? _value.cravingReminders
          : cravingReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      motivationalMessages: null == motivationalMessages
          ? _value.motivationalMessages
          : motivationalMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsModelImplCopyWith<$Res>
    implements $NotificationSettingsModelCopyWith<$Res> {
  factory _$$NotificationSettingsModelImplCopyWith(
          _$NotificationSettingsModelImpl value,
          $Res Function(_$NotificationSettingsModelImpl) then) =
      __$$NotificationSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool pushEnabled,
      bool dailyReminder,
      int dailyReminderHour,
      bool achievementNotifications,
      bool cravingReminders,
      bool motivationalMessages});
}

/// @nodoc
class __$$NotificationSettingsModelImplCopyWithImpl<$Res>
    extends _$NotificationSettingsModelCopyWithImpl<$Res,
        _$NotificationSettingsModelImpl>
    implements _$$NotificationSettingsModelImplCopyWith<$Res> {
  __$$NotificationSettingsModelImplCopyWithImpl(
      _$NotificationSettingsModelImpl _value,
      $Res Function(_$NotificationSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushEnabled = null,
    Object? dailyReminder = null,
    Object? dailyReminderHour = null,
    Object? achievementNotifications = null,
    Object? cravingReminders = null,
    Object? motivationalMessages = null,
  }) {
    return _then(_$NotificationSettingsModelImpl(
      pushEnabled: null == pushEnabled
          ? _value.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminder: null == dailyReminder
          ? _value.dailyReminder
          : dailyReminder // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyReminderHour: null == dailyReminderHour
          ? _value.dailyReminderHour
          : dailyReminderHour // ignore: cast_nullable_to_non_nullable
              as int,
      achievementNotifications: null == achievementNotifications
          ? _value.achievementNotifications
          : achievementNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      cravingReminders: null == cravingReminders
          ? _value.cravingReminders
          : cravingReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      motivationalMessages: null == motivationalMessages
          ? _value.motivationalMessages
          : motivationalMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsModelImpl implements _NotificationSettingsModel {
  const _$NotificationSettingsModelImpl(
      {this.pushEnabled = true,
      this.dailyReminder = true,
      this.dailyReminderHour = 9,
      this.achievementNotifications = true,
      this.cravingReminders = true,
      this.motivationalMessages = true});

  factory _$NotificationSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsModelImplFromJson(json);

  /// 是否启用推送通知
  @override
  @JsonKey()
  final bool pushEnabled;

  /// 是否启用每日提醒
  @override
  @JsonKey()
  final bool dailyReminder;

  /// 每日提醒时间（小时）
  @override
  @JsonKey()
  final int dailyReminderHour;

  /// 是否启用成就通知
  @override
  @JsonKey()
  final bool achievementNotifications;

  /// 是否启用渴望提醒
  @override
  @JsonKey()
  final bool cravingReminders;

  /// 是否启用励志消息
  @override
  @JsonKey()
  final bool motivationalMessages;

  @override
  String toString() {
    return 'NotificationSettingsModel(pushEnabled: $pushEnabled, dailyReminder: $dailyReminder, dailyReminderHour: $dailyReminderHour, achievementNotifications: $achievementNotifications, cravingReminders: $cravingReminders, motivationalMessages: $motivationalMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsModelImpl &&
            (identical(other.pushEnabled, pushEnabled) ||
                other.pushEnabled == pushEnabled) &&
            (identical(other.dailyReminder, dailyReminder) ||
                other.dailyReminder == dailyReminder) &&
            (identical(other.dailyReminderHour, dailyReminderHour) ||
                other.dailyReminderHour == dailyReminderHour) &&
            (identical(
                    other.achievementNotifications, achievementNotifications) ||
                other.achievementNotifications == achievementNotifications) &&
            (identical(other.cravingReminders, cravingReminders) ||
                other.cravingReminders == cravingReminders) &&
            (identical(other.motivationalMessages, motivationalMessages) ||
                other.motivationalMessages == motivationalMessages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pushEnabled,
      dailyReminder,
      dailyReminderHour,
      achievementNotifications,
      cravingReminders,
      motivationalMessages);

  /// Create a copy of NotificationSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsModelImplCopyWith<_$NotificationSettingsModelImpl>
      get copyWith => __$$NotificationSettingsModelImplCopyWithImpl<
          _$NotificationSettingsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettingsModel implements NotificationSettingsModel {
  const factory _NotificationSettingsModel(
      {final bool pushEnabled,
      final bool dailyReminder,
      final int dailyReminderHour,
      final bool achievementNotifications,
      final bool cravingReminders,
      final bool motivationalMessages}) = _$NotificationSettingsModelImpl;

  factory _NotificationSettingsModel.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsModelImpl.fromJson;

  /// 是否启用推送通知
  @override
  bool get pushEnabled;

  /// 是否启用每日提醒
  @override
  bool get dailyReminder;

  /// 每日提醒时间（小时）
  @override
  int get dailyReminderHour;

  /// 是否启用成就通知
  @override
  bool get achievementNotifications;

  /// 是否启用渴望提醒
  @override
  bool get cravingReminders;

  /// 是否启用励志消息
  @override
  bool get motivationalMessages;

  /// Create a copy of NotificationSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsModelImplCopyWith<_$NotificationSettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrivacySettingsModel _$PrivacySettingsModelFromJson(Map<String, dynamic> json) {
  return _PrivacySettingsModel.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettingsModel {
  /// 是否允许数据分析
  bool get allowAnalytics => throw _privateConstructorUsedError;

  /// 是否允许崩溃报告
  bool get allowCrashReports => throw _privateConstructorUsedError;

  /// 是否允许个性化推荐
  bool get allowPersonalization => throw _privateConstructorUsedError;

  /// 数据保留天数
  int get dataRetentionDays => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsModelCopyWith<PrivacySettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsModelCopyWith<$Res> {
  factory $PrivacySettingsModelCopyWith(PrivacySettingsModel value,
          $Res Function(PrivacySettingsModel) then) =
      _$PrivacySettingsModelCopyWithImpl<$Res, PrivacySettingsModel>;
  @useResult
  $Res call(
      {bool allowAnalytics,
      bool allowCrashReports,
      bool allowPersonalization,
      int dataRetentionDays});
}

/// @nodoc
class _$PrivacySettingsModelCopyWithImpl<$Res,
        $Val extends PrivacySettingsModel>
    implements $PrivacySettingsModelCopyWith<$Res> {
  _$PrivacySettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowAnalytics = null,
    Object? allowCrashReports = null,
    Object? allowPersonalization = null,
    Object? dataRetentionDays = null,
  }) {
    return _then(_value.copyWith(
      allowAnalytics: null == allowAnalytics
          ? _value.allowAnalytics
          : allowAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCrashReports: null == allowCrashReports
          ? _value.allowCrashReports
          : allowCrashReports // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPersonalization: null == allowPersonalization
          ? _value.allowPersonalization
          : allowPersonalization // ignore: cast_nullable_to_non_nullable
              as bool,
      dataRetentionDays: null == dataRetentionDays
          ? _value.dataRetentionDays
          : dataRetentionDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingsModelImplCopyWith<$Res>
    implements $PrivacySettingsModelCopyWith<$Res> {
  factory _$$PrivacySettingsModelImplCopyWith(_$PrivacySettingsModelImpl value,
          $Res Function(_$PrivacySettingsModelImpl) then) =
      __$$PrivacySettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool allowAnalytics,
      bool allowCrashReports,
      bool allowPersonalization,
      int dataRetentionDays});
}

/// @nodoc
class __$$PrivacySettingsModelImplCopyWithImpl<$Res>
    extends _$PrivacySettingsModelCopyWithImpl<$Res, _$PrivacySettingsModelImpl>
    implements _$$PrivacySettingsModelImplCopyWith<$Res> {
  __$$PrivacySettingsModelImplCopyWithImpl(_$PrivacySettingsModelImpl _value,
      $Res Function(_$PrivacySettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowAnalytics = null,
    Object? allowCrashReports = null,
    Object? allowPersonalization = null,
    Object? dataRetentionDays = null,
  }) {
    return _then(_$PrivacySettingsModelImpl(
      allowAnalytics: null == allowAnalytics
          ? _value.allowAnalytics
          : allowAnalytics // ignore: cast_nullable_to_non_nullable
              as bool,
      allowCrashReports: null == allowCrashReports
          ? _value.allowCrashReports
          : allowCrashReports // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPersonalization: null == allowPersonalization
          ? _value.allowPersonalization
          : allowPersonalization // ignore: cast_nullable_to_non_nullable
              as bool,
      dataRetentionDays: null == dataRetentionDays
          ? _value.dataRetentionDays
          : dataRetentionDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsModelImpl implements _PrivacySettingsModel {
  const _$PrivacySettingsModelImpl(
      {this.allowAnalytics = true,
      this.allowCrashReports = true,
      this.allowPersonalization = true,
      this.dataRetentionDays = 365});

  factory _$PrivacySettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsModelImplFromJson(json);

  /// 是否允许数据分析
  @override
  @JsonKey()
  final bool allowAnalytics;

  /// 是否允许崩溃报告
  @override
  @JsonKey()
  final bool allowCrashReports;

  /// 是否允许个性化推荐
  @override
  @JsonKey()
  final bool allowPersonalization;

  /// 数据保留天数
  @override
  @JsonKey()
  final int dataRetentionDays;

  @override
  String toString() {
    return 'PrivacySettingsModel(allowAnalytics: $allowAnalytics, allowCrashReports: $allowCrashReports, allowPersonalization: $allowPersonalization, dataRetentionDays: $dataRetentionDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsModelImpl &&
            (identical(other.allowAnalytics, allowAnalytics) ||
                other.allowAnalytics == allowAnalytics) &&
            (identical(other.allowCrashReports, allowCrashReports) ||
                other.allowCrashReports == allowCrashReports) &&
            (identical(other.allowPersonalization, allowPersonalization) ||
                other.allowPersonalization == allowPersonalization) &&
            (identical(other.dataRetentionDays, dataRetentionDays) ||
                other.dataRetentionDays == dataRetentionDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allowAnalytics,
      allowCrashReports, allowPersonalization, dataRetentionDays);

  /// Create a copy of PrivacySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsModelImplCopyWith<_$PrivacySettingsModelImpl>
      get copyWith =>
          __$$PrivacySettingsModelImplCopyWithImpl<_$PrivacySettingsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsModelImplToJson(
      this,
    );
  }
}

abstract class _PrivacySettingsModel implements PrivacySettingsModel {
  const factory _PrivacySettingsModel(
      {final bool allowAnalytics,
      final bool allowCrashReports,
      final bool allowPersonalization,
      final int dataRetentionDays}) = _$PrivacySettingsModelImpl;

  factory _PrivacySettingsModel.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsModelImpl.fromJson;

  /// 是否允许数据分析
  @override
  bool get allowAnalytics;

  /// 是否允许崩溃报告
  @override
  bool get allowCrashReports;

  /// 是否允许个性化推荐
  @override
  bool get allowPersonalization;

  /// 数据保留天数
  @override
  int get dataRetentionDays;

  /// Create a copy of PrivacySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsModelImplCopyWith<_$PrivacySettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DisplaySettingsModel _$DisplaySettingsModelFromJson(Map<String, dynamic> json) {
  return _DisplaySettingsModel.fromJson(json);
}

/// @nodoc
mixin _$DisplaySettingsModel {
  /// 主题模式
  String get themeMode =>
      throw _privateConstructorUsedError; // 'light', 'dark', 'system'
  /// 语言代码
  String get language => throw _privateConstructorUsedError;

  /// 货币显示格式
  String get currency => throw _privateConstructorUsedError;

  /// 日期格式
  String get dateFormat => throw _privateConstructorUsedError;

  /// 时间格式
  String get timeFormat => throw _privateConstructorUsedError;

  /// 是否显示详细统计
  bool get showDetailedStats => throw _privateConstructorUsedError;

  /// 是否显示进度动画
  bool get showProgressAnimations => throw _privateConstructorUsedError;

  /// Serializes this DisplaySettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplaySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplaySettingsModelCopyWith<DisplaySettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplaySettingsModelCopyWith<$Res> {
  factory $DisplaySettingsModelCopyWith(DisplaySettingsModel value,
          $Res Function(DisplaySettingsModel) then) =
      _$DisplaySettingsModelCopyWithImpl<$Res, DisplaySettingsModel>;
  @useResult
  $Res call(
      {String themeMode,
      String language,
      String currency,
      String dateFormat,
      String timeFormat,
      bool showDetailedStats,
      bool showProgressAnimations});
}

/// @nodoc
class _$DisplaySettingsModelCopyWithImpl<$Res,
        $Val extends DisplaySettingsModel>
    implements $DisplaySettingsModelCopyWith<$Res> {
  _$DisplaySettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplaySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? language = null,
    Object? currency = null,
    Object? dateFormat = null,
    Object? timeFormat = null,
    Object? showDetailedStats = null,
    Object? showProgressAnimations = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateFormat: null == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      timeFormat: null == timeFormat
          ? _value.timeFormat
          : timeFormat // ignore: cast_nullable_to_non_nullable
              as String,
      showDetailedStats: null == showDetailedStats
          ? _value.showDetailedStats
          : showDetailedStats // ignore: cast_nullable_to_non_nullable
              as bool,
      showProgressAnimations: null == showProgressAnimations
          ? _value.showProgressAnimations
          : showProgressAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplaySettingsModelImplCopyWith<$Res>
    implements $DisplaySettingsModelCopyWith<$Res> {
  factory _$$DisplaySettingsModelImplCopyWith(_$DisplaySettingsModelImpl value,
          $Res Function(_$DisplaySettingsModelImpl) then) =
      __$$DisplaySettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String themeMode,
      String language,
      String currency,
      String dateFormat,
      String timeFormat,
      bool showDetailedStats,
      bool showProgressAnimations});
}

/// @nodoc
class __$$DisplaySettingsModelImplCopyWithImpl<$Res>
    extends _$DisplaySettingsModelCopyWithImpl<$Res, _$DisplaySettingsModelImpl>
    implements _$$DisplaySettingsModelImplCopyWith<$Res> {
  __$$DisplaySettingsModelImplCopyWithImpl(_$DisplaySettingsModelImpl _value,
      $Res Function(_$DisplaySettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisplaySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? language = null,
    Object? currency = null,
    Object? dateFormat = null,
    Object? timeFormat = null,
    Object? showDetailedStats = null,
    Object? showProgressAnimations = null,
  }) {
    return _then(_$DisplaySettingsModelImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateFormat: null == dateFormat
          ? _value.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      timeFormat: null == timeFormat
          ? _value.timeFormat
          : timeFormat // ignore: cast_nullable_to_non_nullable
              as String,
      showDetailedStats: null == showDetailedStats
          ? _value.showDetailedStats
          : showDetailedStats // ignore: cast_nullable_to_non_nullable
              as bool,
      showProgressAnimations: null == showProgressAnimations
          ? _value.showProgressAnimations
          : showProgressAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplaySettingsModelImpl implements _DisplaySettingsModel {
  const _$DisplaySettingsModelImpl(
      {this.themeMode = 'system',
      this.language = 'zh-CN',
      this.currency = 'CNY',
      this.dateFormat = 'yyyy-MM-dd',
      this.timeFormat = 'HH:mm',
      this.showDetailedStats = true,
      this.showProgressAnimations = true});

  factory _$DisplaySettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplaySettingsModelImplFromJson(json);

  /// 主题模式
  @override
  @JsonKey()
  final String themeMode;
// 'light', 'dark', 'system'
  /// 语言代码
  @override
  @JsonKey()
  final String language;

  /// 货币显示格式
  @override
  @JsonKey()
  final String currency;

  /// 日期格式
  @override
  @JsonKey()
  final String dateFormat;

  /// 时间格式
  @override
  @JsonKey()
  final String timeFormat;

  /// 是否显示详细统计
  @override
  @JsonKey()
  final bool showDetailedStats;

  /// 是否显示进度动画
  @override
  @JsonKey()
  final bool showProgressAnimations;

  @override
  String toString() {
    return 'DisplaySettingsModel(themeMode: $themeMode, language: $language, currency: $currency, dateFormat: $dateFormat, timeFormat: $timeFormat, showDetailedStats: $showDetailedStats, showProgressAnimations: $showProgressAnimations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplaySettingsModelImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat) &&
            (identical(other.timeFormat, timeFormat) ||
                other.timeFormat == timeFormat) &&
            (identical(other.showDetailedStats, showDetailedStats) ||
                other.showDetailedStats == showDetailedStats) &&
            (identical(other.showProgressAnimations, showProgressAnimations) ||
                other.showProgressAnimations == showProgressAnimations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode, language, currency,
      dateFormat, timeFormat, showDetailedStats, showProgressAnimations);

  /// Create a copy of DisplaySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplaySettingsModelImplCopyWith<_$DisplaySettingsModelImpl>
      get copyWith =>
          __$$DisplaySettingsModelImplCopyWithImpl<_$DisplaySettingsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplaySettingsModelImplToJson(
      this,
    );
  }
}

abstract class _DisplaySettingsModel implements DisplaySettingsModel {
  const factory _DisplaySettingsModel(
      {final String themeMode,
      final String language,
      final String currency,
      final String dateFormat,
      final String timeFormat,
      final bool showDetailedStats,
      final bool showProgressAnimations}) = _$DisplaySettingsModelImpl;

  factory _DisplaySettingsModel.fromJson(Map<String, dynamic> json) =
      _$DisplaySettingsModelImpl.fromJson;

  /// 主题模式
  @override
  String get themeMode; // 'light', 'dark', 'system'
  /// 语言代码
  @override
  String get language;

  /// 货币显示格式
  @override
  String get currency;

  /// 日期格式
  @override
  String get dateFormat;

  /// 时间格式
  @override
  String get timeFormat;

  /// 是否显示详细统计
  @override
  bool get showDetailedStats;

  /// 是否显示进度动画
  @override
  bool get showProgressAnimations;

  /// Create a copy of DisplaySettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplaySettingsModelImplCopyWith<_$DisplaySettingsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SyncStatusModel _$SyncStatusModelFromJson(Map<String, dynamic> json) {
  return _SyncStatusModel.fromJson(json);
}

/// @nodoc
mixin _$SyncStatusModel {
  /// 最后同步时间
  DateTime? get lastSyncTime => throw _privateConstructorUsedError;

  /// 是否正在同步
  bool get isSyncing => throw _privateConstructorUsedError;

  /// 同步状态
  SyncState get state => throw _privateConstructorUsedError;

  /// 待同步的数据类型
  List<String> get pendingDataTypes => throw _privateConstructorUsedError;

  /// 同步错误信息
  String? get errorMessage => throw _privateConstructorUsedError;

  /// 下次同步时间
  DateTime? get nextSyncTime => throw _privateConstructorUsedError;

  /// Serializes this SyncStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncStatusModelCopyWith<SyncStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStatusModelCopyWith<$Res> {
  factory $SyncStatusModelCopyWith(
          SyncStatusModel value, $Res Function(SyncStatusModel) then) =
      _$SyncStatusModelCopyWithImpl<$Res, SyncStatusModel>;
  @useResult
  $Res call(
      {DateTime? lastSyncTime,
      bool isSyncing,
      SyncState state,
      List<String> pendingDataTypes,
      String? errorMessage,
      DateTime? nextSyncTime});
}

/// @nodoc
class _$SyncStatusModelCopyWithImpl<$Res, $Val extends SyncStatusModel>
    implements $SyncStatusModelCopyWith<$Res> {
  _$SyncStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSyncTime = freezed,
    Object? isSyncing = null,
    Object? state = null,
    Object? pendingDataTypes = null,
    Object? errorMessage = freezed,
    Object? nextSyncTime = freezed,
  }) {
    return _then(_value.copyWith(
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SyncState,
      pendingDataTypes: null == pendingDataTypes
          ? _value.pendingDataTypes
          : pendingDataTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      nextSyncTime: freezed == nextSyncTime
          ? _value.nextSyncTime
          : nextSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncStatusModelImplCopyWith<$Res>
    implements $SyncStatusModelCopyWith<$Res> {
  factory _$$SyncStatusModelImplCopyWith(_$SyncStatusModelImpl value,
          $Res Function(_$SyncStatusModelImpl) then) =
      __$$SyncStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? lastSyncTime,
      bool isSyncing,
      SyncState state,
      List<String> pendingDataTypes,
      String? errorMessage,
      DateTime? nextSyncTime});
}

/// @nodoc
class __$$SyncStatusModelImplCopyWithImpl<$Res>
    extends _$SyncStatusModelCopyWithImpl<$Res, _$SyncStatusModelImpl>
    implements _$$SyncStatusModelImplCopyWith<$Res> {
  __$$SyncStatusModelImplCopyWithImpl(
      _$SyncStatusModelImpl _value, $Res Function(_$SyncStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastSyncTime = freezed,
    Object? isSyncing = null,
    Object? state = null,
    Object? pendingDataTypes = null,
    Object? errorMessage = freezed,
    Object? nextSyncTime = freezed,
  }) {
    return _then(_$SyncStatusModelImpl(
      lastSyncTime: freezed == lastSyncTime
          ? _value.lastSyncTime
          : lastSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SyncState,
      pendingDataTypes: null == pendingDataTypes
          ? _value._pendingDataTypes
          : pendingDataTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      nextSyncTime: freezed == nextSyncTime
          ? _value.nextSyncTime
          : nextSyncTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncStatusModelImpl implements _SyncStatusModel {
  const _$SyncStatusModelImpl(
      {this.lastSyncTime,
      this.isSyncing = false,
      this.state = SyncState.idle,
      final List<String> pendingDataTypes = const [],
      this.errorMessage,
      this.nextSyncTime})
      : _pendingDataTypes = pendingDataTypes;

  factory _$SyncStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncStatusModelImplFromJson(json);

  /// 最后同步时间
  @override
  final DateTime? lastSyncTime;

  /// 是否正在同步
  @override
  @JsonKey()
  final bool isSyncing;

  /// 同步状态
  @override
  @JsonKey()
  final SyncState state;

  /// 待同步的数据类型
  final List<String> _pendingDataTypes;

  /// 待同步的数据类型
  @override
  @JsonKey()
  List<String> get pendingDataTypes {
    if (_pendingDataTypes is EqualUnmodifiableListView)
      return _pendingDataTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingDataTypes);
  }

  /// 同步错误信息
  @override
  final String? errorMessage;

  /// 下次同步时间
  @override
  final DateTime? nextSyncTime;

  @override
  String toString() {
    return 'SyncStatusModel(lastSyncTime: $lastSyncTime, isSyncing: $isSyncing, state: $state, pendingDataTypes: $pendingDataTypes, errorMessage: $errorMessage, nextSyncTime: $nextSyncTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStatusModelImpl &&
            (identical(other.lastSyncTime, lastSyncTime) ||
                other.lastSyncTime == lastSyncTime) &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._pendingDataTypes, _pendingDataTypes) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.nextSyncTime, nextSyncTime) ||
                other.nextSyncTime == nextSyncTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastSyncTime,
      isSyncing,
      state,
      const DeepCollectionEquality().hash(_pendingDataTypes),
      errorMessage,
      nextSyncTime);

  /// Create a copy of SyncStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStatusModelImplCopyWith<_$SyncStatusModelImpl> get copyWith =>
      __$$SyncStatusModelImplCopyWithImpl<_$SyncStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncStatusModelImplToJson(
      this,
    );
  }
}

abstract class _SyncStatusModel implements SyncStatusModel {
  const factory _SyncStatusModel(
      {final DateTime? lastSyncTime,
      final bool isSyncing,
      final SyncState state,
      final List<String> pendingDataTypes,
      final String? errorMessage,
      final DateTime? nextSyncTime}) = _$SyncStatusModelImpl;

  factory _SyncStatusModel.fromJson(Map<String, dynamic> json) =
      _$SyncStatusModelImpl.fromJson;

  /// 最后同步时间
  @override
  DateTime? get lastSyncTime;

  /// 是否正在同步
  @override
  bool get isSyncing;

  /// 同步状态
  @override
  SyncState get state;

  /// 待同步的数据类型
  @override
  List<String> get pendingDataTypes;

  /// 同步错误信息
  @override
  String? get errorMessage;

  /// 下次同步时间
  @override
  DateTime? get nextSyncTime;

  /// Create a copy of SyncStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStatusModelImplCopyWith<_$SyncStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
