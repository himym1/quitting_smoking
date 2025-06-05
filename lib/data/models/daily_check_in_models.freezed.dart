// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_check_in_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateCheckInRequestModel _$CreateCheckInRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateCheckInRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateCheckInRequestModel {
  /// 打卡日期
  DateTime get date => throw _privateConstructorUsedError;

  /// 打卡时间（可选，默认为当前时间）
  DateTime? get checkinTime => throw _privateConstructorUsedError;

  /// 打卡备注
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateCheckInRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCheckInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCheckInRequestModelCopyWith<CreateCheckInRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCheckInRequestModelCopyWith<$Res> {
  factory $CreateCheckInRequestModelCopyWith(CreateCheckInRequestModel value,
          $Res Function(CreateCheckInRequestModel) then) =
      _$CreateCheckInRequestModelCopyWithImpl<$Res, CreateCheckInRequestModel>;
  @useResult
  $Res call({DateTime date, DateTime? checkinTime, String? note});
}

/// @nodoc
class _$CreateCheckInRequestModelCopyWithImpl<$Res,
        $Val extends CreateCheckInRequestModel>
    implements $CreateCheckInRequestModelCopyWith<$Res> {
  _$CreateCheckInRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCheckInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? checkinTime = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkinTime: freezed == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateCheckInRequestModelImplCopyWith<$Res>
    implements $CreateCheckInRequestModelCopyWith<$Res> {
  factory _$$CreateCheckInRequestModelImplCopyWith(
          _$CreateCheckInRequestModelImpl value,
          $Res Function(_$CreateCheckInRequestModelImpl) then) =
      __$$CreateCheckInRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, DateTime? checkinTime, String? note});
}

/// @nodoc
class __$$CreateCheckInRequestModelImplCopyWithImpl<$Res>
    extends _$CreateCheckInRequestModelCopyWithImpl<$Res,
        _$CreateCheckInRequestModelImpl>
    implements _$$CreateCheckInRequestModelImplCopyWith<$Res> {
  __$$CreateCheckInRequestModelImplCopyWithImpl(
      _$CreateCheckInRequestModelImpl _value,
      $Res Function(_$CreateCheckInRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCheckInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? checkinTime = freezed,
    Object? note = freezed,
  }) {
    return _then(_$CreateCheckInRequestModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkinTime: freezed == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCheckInRequestModelImpl implements _CreateCheckInRequestModel {
  const _$CreateCheckInRequestModelImpl(
      {required this.date, this.checkinTime, this.note});

  factory _$CreateCheckInRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCheckInRequestModelImplFromJson(json);

  /// 打卡日期
  @override
  final DateTime date;

  /// 打卡时间（可选，默认为当前时间）
  @override
  final DateTime? checkinTime;

  /// 打卡备注
  @override
  final String? note;

  @override
  String toString() {
    return 'CreateCheckInRequestModel(date: $date, checkinTime: $checkinTime, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCheckInRequestModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, checkinTime, note);

  /// Create a copy of CreateCheckInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCheckInRequestModelImplCopyWith<_$CreateCheckInRequestModelImpl>
      get copyWith => __$$CreateCheckInRequestModelImplCopyWithImpl<
          _$CreateCheckInRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCheckInRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateCheckInRequestModel implements CreateCheckInRequestModel {
  const factory _CreateCheckInRequestModel(
      {required final DateTime date,
      final DateTime? checkinTime,
      final String? note}) = _$CreateCheckInRequestModelImpl;

  factory _CreateCheckInRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateCheckInRequestModelImpl.fromJson;

  /// 打卡日期
  @override
  DateTime get date;

  /// 打卡时间（可选，默认为当前时间）
  @override
  DateTime? get checkinTime;

  /// 打卡备注
  @override
  String? get note;

  /// Create a copy of CreateCheckInRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCheckInRequestModelImplCopyWith<_$CreateCheckInRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckInResponseModel _$CheckInResponseModelFromJson(Map<String, dynamic> json) {
  return _CheckInResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInResponseModel {
  /// 打卡记录ID
  String get id => throw _privateConstructorUsedError;

  /// 用户ID
  String get userId => throw _privateConstructorUsedError;

  /// 打卡日期
  DateTime get date => throw _privateConstructorUsedError;

  /// 打卡时间
  DateTime get checkinTime => throw _privateConstructorUsedError;

  /// 打卡备注
  String? get note => throw _privateConstructorUsedError;

  /// 连续打卡天数
  int get consecutiveDays => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CheckInResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInResponseModelCopyWith<CheckInResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInResponseModelCopyWith<$Res> {
  factory $CheckInResponseModelCopyWith(CheckInResponseModel value,
          $Res Function(CheckInResponseModel) then) =
      _$CheckInResponseModelCopyWithImpl<$Res, CheckInResponseModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      DateTime checkinTime,
      String? note,
      int consecutiveDays,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CheckInResponseModelCopyWithImpl<$Res,
        $Val extends CheckInResponseModel>
    implements $CheckInResponseModelCopyWith<$Res> {
  _$CheckInResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? checkinTime = null,
    Object? note = freezed,
    Object? consecutiveDays = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkinTime: null == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$CheckInResponseModelImplCopyWith<$Res>
    implements $CheckInResponseModelCopyWith<$Res> {
  factory _$$CheckInResponseModelImplCopyWith(_$CheckInResponseModelImpl value,
          $Res Function(_$CheckInResponseModelImpl) then) =
      __$$CheckInResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      DateTime checkinTime,
      String? note,
      int consecutiveDays,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$CheckInResponseModelImplCopyWithImpl<$Res>
    extends _$CheckInResponseModelCopyWithImpl<$Res, _$CheckInResponseModelImpl>
    implements _$$CheckInResponseModelImplCopyWith<$Res> {
  __$$CheckInResponseModelImplCopyWithImpl(_$CheckInResponseModelImpl _value,
      $Res Function(_$CheckInResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? checkinTime = null,
    Object? note = freezed,
    Object? consecutiveDays = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CheckInResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkinTime: null == checkinTime
          ? _value.checkinTime
          : checkinTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$CheckInResponseModelImpl implements _CheckInResponseModel {
  const _$CheckInResponseModelImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required this.checkinTime,
      this.note,
      required this.consecutiveDays,
      required this.createdAt,
      required this.updatedAt});

  factory _$CheckInResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInResponseModelImplFromJson(json);

  /// 打卡记录ID
  @override
  final String id;

  /// 用户ID
  @override
  final String userId;

  /// 打卡日期
  @override
  final DateTime date;

  /// 打卡时间
  @override
  final DateTime checkinTime;

  /// 打卡备注
  @override
  final String? note;

  /// 连续打卡天数
  @override
  final int consecutiveDays;

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CheckInResponseModel(id: $id, userId: $userId, date: $date, checkinTime: $checkinTime, note: $note, consecutiveDays: $consecutiveDays, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.checkinTime, checkinTime) ||
                other.checkinTime == checkinTime) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.consecutiveDays, consecutiveDays) ||
                other.consecutiveDays == consecutiveDays) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date, checkinTime,
      note, consecutiveDays, createdAt, updatedAt);

  /// Create a copy of CheckInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInResponseModelImplCopyWith<_$CheckInResponseModelImpl>
      get copyWith =>
          __$$CheckInResponseModelImplCopyWithImpl<_$CheckInResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CheckInResponseModel implements CheckInResponseModel {
  const factory _CheckInResponseModel(
      {required final String id,
      required final String userId,
      required final DateTime date,
      required final DateTime checkinTime,
      final String? note,
      required final int consecutiveDays,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CheckInResponseModelImpl;

  factory _CheckInResponseModel.fromJson(Map<String, dynamic> json) =
      _$CheckInResponseModelImpl.fromJson;

  /// 打卡记录ID
  @override
  String get id;

  /// 用户ID
  @override
  String get userId;

  /// 打卡日期
  @override
  DateTime get date;

  /// 打卡时间
  @override
  DateTime get checkinTime;

  /// 打卡备注
  @override
  String? get note;

  /// 连续打卡天数
  @override
  int get consecutiveDays;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime get updatedAt;

  /// Create a copy of CheckInResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInResponseModelImplCopyWith<_$CheckInResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckInStatsResponseModel _$CheckInStatsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CheckInStatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInStatsResponseModel {
  /// 总打卡天数
  int get totalCheckIns => throw _privateConstructorUsedError;

  /// 当前连续打卡天数
  int get currentStreak => throw _privateConstructorUsedError;

  /// 最长连续打卡天数
  int get longestStreak => throw _privateConstructorUsedError;

  /// 本月打卡天数
  int get monthlyCheckIns => throw _privateConstructorUsedError;

  /// 本周打卡天数
  int get weeklyCheckIns => throw _privateConstructorUsedError;

  /// 打卡成功率（百分比）
  double get successRate => throw _privateConstructorUsedError;

  /// 最近打卡日期
  DateTime? get lastCheckInDate => throw _privateConstructorUsedError;

  /// 统计计算时间
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this CheckInStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInStatsResponseModelCopyWith<CheckInStatsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInStatsResponseModelCopyWith<$Res> {
  factory $CheckInStatsResponseModelCopyWith(CheckInStatsResponseModel value,
          $Res Function(CheckInStatsResponseModel) then) =
      _$CheckInStatsResponseModelCopyWithImpl<$Res, CheckInStatsResponseModel>;
  @useResult
  $Res call(
      {int totalCheckIns,
      int currentStreak,
      int longestStreak,
      int monthlyCheckIns,
      int weeklyCheckIns,
      double successRate,
      DateTime? lastCheckInDate,
      DateTime calculatedAt});
}

/// @nodoc
class _$CheckInStatsResponseModelCopyWithImpl<$Res,
        $Val extends CheckInStatsResponseModel>
    implements $CheckInStatsResponseModelCopyWith<$Res> {
  _$CheckInStatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCheckIns = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? monthlyCheckIns = null,
    Object? weeklyCheckIns = null,
    Object? successRate = null,
    Object? lastCheckInDate = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyCheckIns: null == monthlyCheckIns
          ? _value.monthlyCheckIns
          : monthlyCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyCheckIns: null == weeklyCheckIns
          ? _value.weeklyCheckIns
          : weeklyCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      successRate: null == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastCheckInDate: freezed == lastCheckInDate
          ? _value.lastCheckInDate
          : lastCheckInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInStatsResponseModelImplCopyWith<$Res>
    implements $CheckInStatsResponseModelCopyWith<$Res> {
  factory _$$CheckInStatsResponseModelImplCopyWith(
          _$CheckInStatsResponseModelImpl value,
          $Res Function(_$CheckInStatsResponseModelImpl) then) =
      __$$CheckInStatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCheckIns,
      int currentStreak,
      int longestStreak,
      int monthlyCheckIns,
      int weeklyCheckIns,
      double successRate,
      DateTime? lastCheckInDate,
      DateTime calculatedAt});
}

/// @nodoc
class __$$CheckInStatsResponseModelImplCopyWithImpl<$Res>
    extends _$CheckInStatsResponseModelCopyWithImpl<$Res,
        _$CheckInStatsResponseModelImpl>
    implements _$$CheckInStatsResponseModelImplCopyWith<$Res> {
  __$$CheckInStatsResponseModelImplCopyWithImpl(
      _$CheckInStatsResponseModelImpl _value,
      $Res Function(_$CheckInStatsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCheckIns = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? monthlyCheckIns = null,
    Object? weeklyCheckIns = null,
    Object? successRate = null,
    Object? lastCheckInDate = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_$CheckInStatsResponseModelImpl(
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      monthlyCheckIns: null == monthlyCheckIns
          ? _value.monthlyCheckIns
          : monthlyCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyCheckIns: null == weeklyCheckIns
          ? _value.weeklyCheckIns
          : weeklyCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      successRate: null == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastCheckInDate: freezed == lastCheckInDate
          ? _value.lastCheckInDate
          : lastCheckInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInStatsResponseModelImpl implements _CheckInStatsResponseModel {
  const _$CheckInStatsResponseModelImpl(
      {required this.totalCheckIns,
      required this.currentStreak,
      required this.longestStreak,
      required this.monthlyCheckIns,
      required this.weeklyCheckIns,
      required this.successRate,
      this.lastCheckInDate,
      required this.calculatedAt});

  factory _$CheckInStatsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInStatsResponseModelImplFromJson(json);

  /// 总打卡天数
  @override
  final int totalCheckIns;

  /// 当前连续打卡天数
  @override
  final int currentStreak;

  /// 最长连续打卡天数
  @override
  final int longestStreak;

  /// 本月打卡天数
  @override
  final int monthlyCheckIns;

  /// 本周打卡天数
  @override
  final int weeklyCheckIns;

  /// 打卡成功率（百分比）
  @override
  final double successRate;

  /// 最近打卡日期
  @override
  final DateTime? lastCheckInDate;

  /// 统计计算时间
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'CheckInStatsResponseModel(totalCheckIns: $totalCheckIns, currentStreak: $currentStreak, longestStreak: $longestStreak, monthlyCheckIns: $monthlyCheckIns, weeklyCheckIns: $weeklyCheckIns, successRate: $successRate, lastCheckInDate: $lastCheckInDate, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInStatsResponseModelImpl &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.monthlyCheckIns, monthlyCheckIns) ||
                other.monthlyCheckIns == monthlyCheckIns) &&
            (identical(other.weeklyCheckIns, weeklyCheckIns) ||
                other.weeklyCheckIns == weeklyCheckIns) &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            (identical(other.lastCheckInDate, lastCheckInDate) ||
                other.lastCheckInDate == lastCheckInDate) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCheckIns,
      currentStreak,
      longestStreak,
      monthlyCheckIns,
      weeklyCheckIns,
      successRate,
      lastCheckInDate,
      calculatedAt);

  /// Create a copy of CheckInStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInStatsResponseModelImplCopyWith<_$CheckInStatsResponseModelImpl>
      get copyWith => __$$CheckInStatsResponseModelImplCopyWithImpl<
          _$CheckInStatsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInStatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CheckInStatsResponseModel implements CheckInStatsResponseModel {
  const factory _CheckInStatsResponseModel(
      {required final int totalCheckIns,
      required final int currentStreak,
      required final int longestStreak,
      required final int monthlyCheckIns,
      required final int weeklyCheckIns,
      required final double successRate,
      final DateTime? lastCheckInDate,
      required final DateTime calculatedAt}) = _$CheckInStatsResponseModelImpl;

  factory _CheckInStatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$CheckInStatsResponseModelImpl.fromJson;

  /// 总打卡天数
  @override
  int get totalCheckIns;

  /// 当前连续打卡天数
  @override
  int get currentStreak;

  /// 最长连续打卡天数
  @override
  int get longestStreak;

  /// 本月打卡天数
  @override
  int get monthlyCheckIns;

  /// 本周打卡天数
  @override
  int get weeklyCheckIns;

  /// 打卡成功率（百分比）
  @override
  double get successRate;

  /// 最近打卡日期
  @override
  DateTime? get lastCheckInDate;

  /// 统计计算时间
  @override
  DateTime get calculatedAt;

  /// Create a copy of CheckInStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInStatsResponseModelImplCopyWith<_$CheckInStatsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CheckInHistoryRequestModel _$CheckInHistoryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CheckInHistoryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInHistoryRequestModel {
  /// 开始日期
  DateTime? get startDate => throw _privateConstructorUsedError;

  /// 结束日期
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// 页码（从1开始）
  int get page => throw _privateConstructorUsedError;

  /// 每页数量
  int get limit => throw _privateConstructorUsedError;

  /// 排序字段
  String get sortBy => throw _privateConstructorUsedError;

  /// 排序方向（asc/desc）
  String get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this CheckInHistoryRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInHistoryRequestModelCopyWith<CheckInHistoryRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInHistoryRequestModelCopyWith<$Res> {
  factory $CheckInHistoryRequestModelCopyWith(CheckInHistoryRequestModel value,
          $Res Function(CheckInHistoryRequestModel) then) =
      _$CheckInHistoryRequestModelCopyWithImpl<$Res,
          CheckInHistoryRequestModel>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class _$CheckInHistoryRequestModelCopyWithImpl<$Res,
        $Val extends CheckInHistoryRequestModel>
    implements $CheckInHistoryRequestModelCopyWith<$Res> {
  _$CheckInHistoryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInHistoryRequestModelImplCopyWith<$Res>
    implements $CheckInHistoryRequestModelCopyWith<$Res> {
  factory _$$CheckInHistoryRequestModelImplCopyWith(
          _$CheckInHistoryRequestModelImpl value,
          $Res Function(_$CheckInHistoryRequestModelImpl) then) =
      __$$CheckInHistoryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? endDate,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class __$$CheckInHistoryRequestModelImplCopyWithImpl<$Res>
    extends _$CheckInHistoryRequestModelCopyWithImpl<$Res,
        _$CheckInHistoryRequestModelImpl>
    implements _$$CheckInHistoryRequestModelImplCopyWith<$Res> {
  __$$CheckInHistoryRequestModelImplCopyWithImpl(
      _$CheckInHistoryRequestModelImpl _value,
      $Res Function(_$CheckInHistoryRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$CheckInHistoryRequestModelImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInHistoryRequestModelImpl implements _CheckInHistoryRequestModel {
  const _$CheckInHistoryRequestModelImpl(
      {this.startDate,
      this.endDate,
      this.page = 1,
      this.limit = 20,
      this.sortBy = 'date',
      this.sortOrder = 'desc'});

  factory _$CheckInHistoryRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckInHistoryRequestModelImplFromJson(json);

  /// 开始日期
  @override
  final DateTime? startDate;

  /// 结束日期
  @override
  final DateTime? endDate;

  /// 页码（从1开始）
  @override
  @JsonKey()
  final int page;

  /// 每页数量
  @override
  @JsonKey()
  final int limit;

  /// 排序字段
  @override
  @JsonKey()
  final String sortBy;

  /// 排序方向（asc/desc）
  @override
  @JsonKey()
  final String sortOrder;

  @override
  String toString() {
    return 'CheckInHistoryRequestModel(startDate: $startDate, endDate: $endDate, page: $page, limit: $limit, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInHistoryRequestModelImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startDate, endDate, page, limit, sortBy, sortOrder);

  /// Create a copy of CheckInHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInHistoryRequestModelImplCopyWith<_$CheckInHistoryRequestModelImpl>
      get copyWith => __$$CheckInHistoryRequestModelImplCopyWithImpl<
          _$CheckInHistoryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInHistoryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CheckInHistoryRequestModel
    implements CheckInHistoryRequestModel {
  const factory _CheckInHistoryRequestModel(
      {final DateTime? startDate,
      final DateTime? endDate,
      final int page,
      final int limit,
      final String sortBy,
      final String sortOrder}) = _$CheckInHistoryRequestModelImpl;

  factory _CheckInHistoryRequestModel.fromJson(Map<String, dynamic> json) =
      _$CheckInHistoryRequestModelImpl.fromJson;

  /// 开始日期
  @override
  DateTime? get startDate;

  /// 结束日期
  @override
  DateTime? get endDate;

  /// 页码（从1开始）
  @override
  int get page;

  /// 每页数量
  @override
  int get limit;

  /// 排序字段
  @override
  String get sortBy;

  /// 排序方向（asc/desc）
  @override
  String get sortOrder;

  /// Create a copy of CheckInHistoryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInHistoryRequestModelImplCopyWith<_$CheckInHistoryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
