// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchievementResponseModel _$AchievementResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementResponseModel {
  /// 成就ID
  String get id => throw _privateConstructorUsedError;

  /// 成就标识符
  String get identifier => throw _privateConstructorUsedError;

  /// 成就名称
  String get name => throw _privateConstructorUsedError;

  /// 成就描述
  String get description => throw _privateConstructorUsedError;

  /// 成就图标
  String get icon => throw _privateConstructorUsedError;

  /// 成就类型
  String get type => throw _privateConstructorUsedError;

  /// 解锁条件
  Map<String, dynamic> get unlockConditions =>
      throw _privateConstructorUsedError;

  /// 奖励信息
  Map<String, dynamic>? get rewards => throw _privateConstructorUsedError;

  /// 是否为隐藏成就
  bool get isHidden => throw _privateConstructorUsedError;

  /// 成就等级
  int get level => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AchievementResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementResponseModelCopyWith<AchievementResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementResponseModelCopyWith<$Res> {
  factory $AchievementResponseModelCopyWith(AchievementResponseModel value,
          $Res Function(AchievementResponseModel) then) =
      _$AchievementResponseModelCopyWithImpl<$Res, AchievementResponseModel>;
  @useResult
  $Res call(
      {String id,
      String identifier,
      String name,
      String description,
      String icon,
      String type,
      Map<String, dynamic> unlockConditions,
      Map<String, dynamic>? rewards,
      bool isHidden,
      int level,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AchievementResponseModelCopyWithImpl<$Res,
        $Val extends AchievementResponseModel>
    implements $AchievementResponseModelCopyWith<$Res> {
  _$AchievementResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? identifier = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? type = null,
    Object? unlockConditions = null,
    Object? rewards = freezed,
    Object? isHidden = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unlockConditions: null == unlockConditions
          ? _value.unlockConditions
          : unlockConditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      rewards: freezed == rewards
          ? _value.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AchievementResponseModelImplCopyWith<$Res>
    implements $AchievementResponseModelCopyWith<$Res> {
  factory _$$AchievementResponseModelImplCopyWith(
          _$AchievementResponseModelImpl value,
          $Res Function(_$AchievementResponseModelImpl) then) =
      __$$AchievementResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String identifier,
      String name,
      String description,
      String icon,
      String type,
      Map<String, dynamic> unlockConditions,
      Map<String, dynamic>? rewards,
      bool isHidden,
      int level,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AchievementResponseModelImplCopyWithImpl<$Res>
    extends _$AchievementResponseModelCopyWithImpl<$Res,
        _$AchievementResponseModelImpl>
    implements _$$AchievementResponseModelImplCopyWith<$Res> {
  __$$AchievementResponseModelImplCopyWithImpl(
      _$AchievementResponseModelImpl _value,
      $Res Function(_$AchievementResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? identifier = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? type = null,
    Object? unlockConditions = null,
    Object? rewards = freezed,
    Object? isHidden = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AchievementResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      unlockConditions: null == unlockConditions
          ? _value._unlockConditions
          : unlockConditions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      rewards: freezed == rewards
          ? _value._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
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
class _$AchievementResponseModelImpl implements _AchievementResponseModel {
  const _$AchievementResponseModelImpl(
      {required this.id,
      required this.identifier,
      required this.name,
      required this.description,
      required this.icon,
      required this.type,
      required final Map<String, dynamic> unlockConditions,
      final Map<String, dynamic>? rewards,
      this.isHidden = false,
      this.level = 1,
      required this.createdAt,
      required this.updatedAt})
      : _unlockConditions = unlockConditions,
        _rewards = rewards;

  factory _$AchievementResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementResponseModelImplFromJson(json);

  /// 成就ID
  @override
  final String id;

  /// 成就标识符
  @override
  final String identifier;

  /// 成就名称
  @override
  final String name;

  /// 成就描述
  @override
  final String description;

  /// 成就图标
  @override
  final String icon;

  /// 成就类型
  @override
  final String type;

  /// 解锁条件
  final Map<String, dynamic> _unlockConditions;

  /// 解锁条件
  @override
  Map<String, dynamic> get unlockConditions {
    if (_unlockConditions is EqualUnmodifiableMapView) return _unlockConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unlockConditions);
  }

  /// 奖励信息
  final Map<String, dynamic>? _rewards;

  /// 奖励信息
  @override
  Map<String, dynamic>? get rewards {
    final value = _rewards;
    if (value == null) return null;
    if (_rewards is EqualUnmodifiableMapView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// 是否为隐藏成就
  @override
  @JsonKey()
  final bool isHidden;

  /// 成就等级
  @override
  @JsonKey()
  final int level;

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AchievementResponseModel(id: $id, identifier: $identifier, name: $name, description: $description, icon: $icon, type: $type, unlockConditions: $unlockConditions, rewards: $rewards, isHidden: $isHidden, level: $level, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._unlockConditions, _unlockConditions) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      identifier,
      name,
      description,
      icon,
      type,
      const DeepCollectionEquality().hash(_unlockConditions),
      const DeepCollectionEquality().hash(_rewards),
      isHidden,
      level,
      createdAt,
      updatedAt);

  /// Create a copy of AchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementResponseModelImplCopyWith<_$AchievementResponseModelImpl>
      get copyWith => __$$AchievementResponseModelImplCopyWithImpl<
          _$AchievementResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementResponseModel implements AchievementResponseModel {
  const factory _AchievementResponseModel(
      {required final String id,
      required final String identifier,
      required final String name,
      required final String description,
      required final String icon,
      required final String type,
      required final Map<String, dynamic> unlockConditions,
      final Map<String, dynamic>? rewards,
      final bool isHidden,
      final int level,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AchievementResponseModelImpl;

  factory _AchievementResponseModel.fromJson(Map<String, dynamic> json) =
      _$AchievementResponseModelImpl.fromJson;

  /// 成就ID
  @override
  String get id;

  /// 成就标识符
  @override
  String get identifier;

  /// 成就名称
  @override
  String get name;

  /// 成就描述
  @override
  String get description;

  /// 成就图标
  @override
  String get icon;

  /// 成就类型
  @override
  String get type;

  /// 解锁条件
  @override
  Map<String, dynamic> get unlockConditions;

  /// 奖励信息
  @override
  Map<String, dynamic>? get rewards;

  /// 是否为隐藏成就
  @override
  bool get isHidden;

  /// 成就等级
  @override
  int get level;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime get updatedAt;

  /// Create a copy of AchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementResponseModelImplCopyWith<_$AchievementResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserAchievementResponseModel _$UserAchievementResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserAchievementResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserAchievementResponseModel {
  /// 用户成就ID
  String get id => throw _privateConstructorUsedError;

  /// 用户ID
  String get userId => throw _privateConstructorUsedError;

  /// 成就信息
  AchievementResponseModel get achievement =>
      throw _privateConstructorUsedError;

  /// 解锁时间
  DateTime get unlockedAt => throw _privateConstructorUsedError;

  /// 当前进度
  double get progress => throw _privateConstructorUsedError;

  /// 是否已解锁
  bool get isUnlocked => throw _privateConstructorUsedError;

  /// 解锁时的数据快照
  Map<String, dynamic>? get unlockData => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserAchievementResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementResponseModelCopyWith<UserAchievementResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementResponseModelCopyWith<$Res> {
  factory $UserAchievementResponseModelCopyWith(
          UserAchievementResponseModel value,
          $Res Function(UserAchievementResponseModel) then) =
      _$UserAchievementResponseModelCopyWithImpl<$Res,
          UserAchievementResponseModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      AchievementResponseModel achievement,
      DateTime unlockedAt,
      double progress,
      bool isUnlocked,
      Map<String, dynamic>? unlockData,
      DateTime createdAt,
      DateTime updatedAt});

  $AchievementResponseModelCopyWith<$Res> get achievement;
}

/// @nodoc
class _$UserAchievementResponseModelCopyWithImpl<$Res,
        $Val extends UserAchievementResponseModel>
    implements $UserAchievementResponseModelCopyWith<$Res> {
  _$UserAchievementResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievement = null,
    Object? unlockedAt = null,
    Object? progress = null,
    Object? isUnlocked = null,
    Object? unlockData = freezed,
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
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as AchievementResponseModel,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockData: freezed == unlockData
          ? _value.unlockData
          : unlockData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementResponseModelCopyWith<$Res> get achievement {
    return $AchievementResponseModelCopyWith<$Res>(_value.achievement, (value) {
      return _then(_value.copyWith(achievement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAchievementResponseModelImplCopyWith<$Res>
    implements $UserAchievementResponseModelCopyWith<$Res> {
  factory _$$UserAchievementResponseModelImplCopyWith(
          _$UserAchievementResponseModelImpl value,
          $Res Function(_$UserAchievementResponseModelImpl) then) =
      __$$UserAchievementResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      AchievementResponseModel achievement,
      DateTime unlockedAt,
      double progress,
      bool isUnlocked,
      Map<String, dynamic>? unlockData,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $AchievementResponseModelCopyWith<$Res> get achievement;
}

/// @nodoc
class __$$UserAchievementResponseModelImplCopyWithImpl<$Res>
    extends _$UserAchievementResponseModelCopyWithImpl<$Res,
        _$UserAchievementResponseModelImpl>
    implements _$$UserAchievementResponseModelImplCopyWith<$Res> {
  __$$UserAchievementResponseModelImplCopyWithImpl(
      _$UserAchievementResponseModelImpl _value,
      $Res Function(_$UserAchievementResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievement = null,
    Object? unlockedAt = null,
    Object? progress = null,
    Object? isUnlocked = null,
    Object? unlockData = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserAchievementResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      achievement: null == achievement
          ? _value.achievement
          : achievement // ignore: cast_nullable_to_non_nullable
              as AchievementResponseModel,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockData: freezed == unlockData
          ? _value._unlockData
          : unlockData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
class _$UserAchievementResponseModelImpl
    implements _UserAchievementResponseModel {
  const _$UserAchievementResponseModelImpl(
      {required this.id,
      required this.userId,
      required this.achievement,
      required this.unlockedAt,
      required this.progress,
      required this.isUnlocked,
      final Map<String, dynamic>? unlockData,
      required this.createdAt,
      required this.updatedAt})
      : _unlockData = unlockData;

  factory _$UserAchievementResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserAchievementResponseModelImplFromJson(json);

  /// 用户成就ID
  @override
  final String id;

  /// 用户ID
  @override
  final String userId;

  /// 成就信息
  @override
  final AchievementResponseModel achievement;

  /// 解锁时间
  @override
  final DateTime unlockedAt;

  /// 当前进度
  @override
  final double progress;

  /// 是否已解锁
  @override
  final bool isUnlocked;

  /// 解锁时的数据快照
  final Map<String, dynamic>? _unlockData;

  /// 解锁时的数据快照
  @override
  Map<String, dynamic>? get unlockData {
    final value = _unlockData;
    if (value == null) return null;
    if (_unlockData is EqualUnmodifiableMapView) return _unlockData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// 创建时间
  @override
  final DateTime createdAt;

  /// 更新时间
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserAchievementResponseModel(id: $id, userId: $userId, achievement: $achievement, unlockedAt: $unlockedAt, progress: $progress, isUnlocked: $isUnlocked, unlockData: $unlockData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.achievement, achievement) ||
                other.achievement == achievement) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            const DeepCollectionEquality()
                .equals(other._unlockData, _unlockData) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      achievement,
      unlockedAt,
      progress,
      isUnlocked,
      const DeepCollectionEquality().hash(_unlockData),
      createdAt,
      updatedAt);

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementResponseModelImplCopyWith<
          _$UserAchievementResponseModelImpl>
      get copyWith => __$$UserAchievementResponseModelImplCopyWithImpl<
          _$UserAchievementResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAchievementResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserAchievementResponseModel
    implements UserAchievementResponseModel {
  const factory _UserAchievementResponseModel(
      {required final String id,
      required final String userId,
      required final AchievementResponseModel achievement,
      required final DateTime unlockedAt,
      required final double progress,
      required final bool isUnlocked,
      final Map<String, dynamic>? unlockData,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserAchievementResponseModelImpl;

  factory _UserAchievementResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserAchievementResponseModelImpl.fromJson;

  /// 用户成就ID
  @override
  String get id;

  /// 用户ID
  @override
  String get userId;

  /// 成就信息
  @override
  AchievementResponseModel get achievement;

  /// 解锁时间
  @override
  DateTime get unlockedAt;

  /// 当前进度
  @override
  double get progress;

  /// 是否已解锁
  @override
  bool get isUnlocked;

  /// 解锁时的数据快照
  @override
  Map<String, dynamic>? get unlockData;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// 更新时间
  @override
  DateTime get updatedAt;

  /// Create a copy of UserAchievementResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementResponseModelImplCopyWith<
          _$UserAchievementResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AchievementProgressResponseModel _$AchievementProgressResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementProgressResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementProgressResponseModel {
  /// 成就ID
  String get achievementId => throw _privateConstructorUsedError;

  /// 成就标识符
  String get identifier => throw _privateConstructorUsedError;

  /// 成就名称
  String get name => throw _privateConstructorUsedError;

  /// 当前进度值
  double get currentProgress => throw _privateConstructorUsedError;

  /// 目标进度值
  double get targetProgress => throw _privateConstructorUsedError;

  /// 进度百分比（0-100）
  double get progressPercentage => throw _privateConstructorUsedError;

  /// 是否已解锁
  bool get isUnlocked => throw _privateConstructorUsedError;

  /// 解锁时间（如果已解锁）
  DateTime? get unlockedAt => throw _privateConstructorUsedError;

  /// 距离解锁还需要的进度
  double? get remainingProgress => throw _privateConstructorUsedError;

  /// 预计解锁时间（基于当前进度速度）
  DateTime? get estimatedUnlockTime => throw _privateConstructorUsedError;

  /// Serializes this AchievementProgressResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementProgressResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementProgressResponseModelCopyWith<AchievementProgressResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementProgressResponseModelCopyWith<$Res> {
  factory $AchievementProgressResponseModelCopyWith(
          AchievementProgressResponseModel value,
          $Res Function(AchievementProgressResponseModel) then) =
      _$AchievementProgressResponseModelCopyWithImpl<$Res,
          AchievementProgressResponseModel>;
  @useResult
  $Res call(
      {String achievementId,
      String identifier,
      String name,
      double currentProgress,
      double targetProgress,
      double progressPercentage,
      bool isUnlocked,
      DateTime? unlockedAt,
      double? remainingProgress,
      DateTime? estimatedUnlockTime});
}

/// @nodoc
class _$AchievementProgressResponseModelCopyWithImpl<$Res,
        $Val extends AchievementProgressResponseModel>
    implements $AchievementProgressResponseModelCopyWith<$Res> {
  _$AchievementProgressResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementProgressResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? identifier = null,
    Object? name = null,
    Object? currentProgress = null,
    Object? targetProgress = null,
    Object? progressPercentage = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? remainingProgress = freezed,
    Object? estimatedUnlockTime = freezed,
  }) {
    return _then(_value.copyWith(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as double,
      targetProgress: null == targetProgress
          ? _value.targetProgress
          : targetProgress // ignore: cast_nullable_to_non_nullable
              as double,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingProgress: freezed == remainingProgress
          ? _value.remainingProgress
          : remainingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedUnlockTime: freezed == estimatedUnlockTime
          ? _value.estimatedUnlockTime
          : estimatedUnlockTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementProgressResponseModelImplCopyWith<$Res>
    implements $AchievementProgressResponseModelCopyWith<$Res> {
  factory _$$AchievementProgressResponseModelImplCopyWith(
          _$AchievementProgressResponseModelImpl value,
          $Res Function(_$AchievementProgressResponseModelImpl) then) =
      __$$AchievementProgressResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String achievementId,
      String identifier,
      String name,
      double currentProgress,
      double targetProgress,
      double progressPercentage,
      bool isUnlocked,
      DateTime? unlockedAt,
      double? remainingProgress,
      DateTime? estimatedUnlockTime});
}

/// @nodoc
class __$$AchievementProgressResponseModelImplCopyWithImpl<$Res>
    extends _$AchievementProgressResponseModelCopyWithImpl<$Res,
        _$AchievementProgressResponseModelImpl>
    implements _$$AchievementProgressResponseModelImplCopyWith<$Res> {
  __$$AchievementProgressResponseModelImplCopyWithImpl(
      _$AchievementProgressResponseModelImpl _value,
      $Res Function(_$AchievementProgressResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementProgressResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? identifier = null,
    Object? name = null,
    Object? currentProgress = null,
    Object? targetProgress = null,
    Object? progressPercentage = null,
    Object? isUnlocked = null,
    Object? unlockedAt = freezed,
    Object? remainingProgress = freezed,
    Object? estimatedUnlockTime = freezed,
  }) {
    return _then(_$AchievementProgressResponseModelImpl(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      currentProgress: null == currentProgress
          ? _value.currentProgress
          : currentProgress // ignore: cast_nullable_to_non_nullable
              as double,
      targetProgress: null == targetProgress
          ? _value.targetProgress
          : targetProgress // ignore: cast_nullable_to_non_nullable
              as double,
      progressPercentage: null == progressPercentage
          ? _value.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isUnlocked: null == isUnlocked
          ? _value.isUnlocked
          : isUnlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingProgress: freezed == remainingProgress
          ? _value.remainingProgress
          : remainingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedUnlockTime: freezed == estimatedUnlockTime
          ? _value.estimatedUnlockTime
          : estimatedUnlockTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementProgressResponseModelImpl
    implements _AchievementProgressResponseModel {
  const _$AchievementProgressResponseModelImpl(
      {required this.achievementId,
      required this.identifier,
      required this.name,
      required this.currentProgress,
      required this.targetProgress,
      required this.progressPercentage,
      required this.isUnlocked,
      this.unlockedAt,
      this.remainingProgress,
      this.estimatedUnlockTime});

  factory _$AchievementProgressResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AchievementProgressResponseModelImplFromJson(json);

  /// 成就ID
  @override
  final String achievementId;

  /// 成就标识符
  @override
  final String identifier;

  /// 成就名称
  @override
  final String name;

  /// 当前进度值
  @override
  final double currentProgress;

  /// 目标进度值
  @override
  final double targetProgress;

  /// 进度百分比（0-100）
  @override
  final double progressPercentage;

  /// 是否已解锁
  @override
  final bool isUnlocked;

  /// 解锁时间（如果已解锁）
  @override
  final DateTime? unlockedAt;

  /// 距离解锁还需要的进度
  @override
  final double? remainingProgress;

  /// 预计解锁时间（基于当前进度速度）
  @override
  final DateTime? estimatedUnlockTime;

  @override
  String toString() {
    return 'AchievementProgressResponseModel(achievementId: $achievementId, identifier: $identifier, name: $name, currentProgress: $currentProgress, targetProgress: $targetProgress, progressPercentage: $progressPercentage, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt, remainingProgress: $remainingProgress, estimatedUnlockTime: $estimatedUnlockTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementProgressResponseModelImpl &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currentProgress, currentProgress) ||
                other.currentProgress == currentProgress) &&
            (identical(other.targetProgress, targetProgress) ||
                other.targetProgress == targetProgress) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.remainingProgress, remainingProgress) ||
                other.remainingProgress == remainingProgress) &&
            (identical(other.estimatedUnlockTime, estimatedUnlockTime) ||
                other.estimatedUnlockTime == estimatedUnlockTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      achievementId,
      identifier,
      name,
      currentProgress,
      targetProgress,
      progressPercentage,
      isUnlocked,
      unlockedAt,
      remainingProgress,
      estimatedUnlockTime);

  /// Create a copy of AchievementProgressResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementProgressResponseModelImplCopyWith<
          _$AchievementProgressResponseModelImpl>
      get copyWith => __$$AchievementProgressResponseModelImplCopyWithImpl<
          _$AchievementProgressResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementProgressResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementProgressResponseModel
    implements AchievementProgressResponseModel {
  const factory _AchievementProgressResponseModel(
          {required final String achievementId,
          required final String identifier,
          required final String name,
          required final double currentProgress,
          required final double targetProgress,
          required final double progressPercentage,
          required final bool isUnlocked,
          final DateTime? unlockedAt,
          final double? remainingProgress,
          final DateTime? estimatedUnlockTime}) =
      _$AchievementProgressResponseModelImpl;

  factory _AchievementProgressResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$AchievementProgressResponseModelImpl.fromJson;

  /// 成就ID
  @override
  String get achievementId;

  /// 成就标识符
  @override
  String get identifier;

  /// 成就名称
  @override
  String get name;

  /// 当前进度值
  @override
  double get currentProgress;

  /// 目标进度值
  @override
  double get targetProgress;

  /// 进度百分比（0-100）
  @override
  double get progressPercentage;

  /// 是否已解锁
  @override
  bool get isUnlocked;

  /// 解锁时间（如果已解锁）
  @override
  DateTime? get unlockedAt;

  /// 距离解锁还需要的进度
  @override
  double? get remainingProgress;

  /// 预计解锁时间（基于当前进度速度）
  @override
  DateTime? get estimatedUnlockTime;

  /// Create a copy of AchievementProgressResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementProgressResponseModelImplCopyWith<
          _$AchievementProgressResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AchievementStatsResponseModel _$AchievementStatsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementStatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementStatsResponseModel {
  /// 总成就数量
  int get totalAchievements => throw _privateConstructorUsedError;

  /// 已解锁成就数量
  int get unlockedAchievements => throw _privateConstructorUsedError;

  /// 解锁率（百分比）
  double get unlockRate => throw _privateConstructorUsedError;

  /// 最近解锁的成就
  List<UserAchievementResponseModel>? get recentUnlocks =>
      throw _privateConstructorUsedError;

  /// 即将解锁的成就
  List<AchievementProgressResponseModel>? get nearUnlocks =>
      throw _privateConstructorUsedError;

  /// 按类型分组的统计
  Map<String, int>? get achievementsByType =>
      throw _privateConstructorUsedError;

  /// 统计计算时间
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this AchievementStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementStatsResponseModelCopyWith<AchievementStatsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementStatsResponseModelCopyWith<$Res> {
  factory $AchievementStatsResponseModelCopyWith(
          AchievementStatsResponseModel value,
          $Res Function(AchievementStatsResponseModel) then) =
      _$AchievementStatsResponseModelCopyWithImpl<$Res,
          AchievementStatsResponseModel>;
  @useResult
  $Res call(
      {int totalAchievements,
      int unlockedAchievements,
      double unlockRate,
      List<UserAchievementResponseModel>? recentUnlocks,
      List<AchievementProgressResponseModel>? nearUnlocks,
      Map<String, int>? achievementsByType,
      DateTime calculatedAt});
}

/// @nodoc
class _$AchievementStatsResponseModelCopyWithImpl<$Res,
        $Val extends AchievementStatsResponseModel>
    implements $AchievementStatsResponseModelCopyWith<$Res> {
  _$AchievementStatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAchievements = null,
    Object? unlockedAchievements = null,
    Object? unlockRate = null,
    Object? recentUnlocks = freezed,
    Object? nearUnlocks = freezed,
    Object? achievementsByType = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      totalAchievements: null == totalAchievements
          ? _value.totalAchievements
          : totalAchievements // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedAchievements: null == unlockedAchievements
          ? _value.unlockedAchievements
          : unlockedAchievements // ignore: cast_nullable_to_non_nullable
              as int,
      unlockRate: null == unlockRate
          ? _value.unlockRate
          : unlockRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentUnlocks: freezed == recentUnlocks
          ? _value.recentUnlocks
          : recentUnlocks // ignore: cast_nullable_to_non_nullable
              as List<UserAchievementResponseModel>?,
      nearUnlocks: freezed == nearUnlocks
          ? _value.nearUnlocks
          : nearUnlocks // ignore: cast_nullable_to_non_nullable
              as List<AchievementProgressResponseModel>?,
      achievementsByType: freezed == achievementsByType
          ? _value.achievementsByType
          : achievementsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementStatsResponseModelImplCopyWith<$Res>
    implements $AchievementStatsResponseModelCopyWith<$Res> {
  factory _$$AchievementStatsResponseModelImplCopyWith(
          _$AchievementStatsResponseModelImpl value,
          $Res Function(_$AchievementStatsResponseModelImpl) then) =
      __$$AchievementStatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalAchievements,
      int unlockedAchievements,
      double unlockRate,
      List<UserAchievementResponseModel>? recentUnlocks,
      List<AchievementProgressResponseModel>? nearUnlocks,
      Map<String, int>? achievementsByType,
      DateTime calculatedAt});
}

/// @nodoc
class __$$AchievementStatsResponseModelImplCopyWithImpl<$Res>
    extends _$AchievementStatsResponseModelCopyWithImpl<$Res,
        _$AchievementStatsResponseModelImpl>
    implements _$$AchievementStatsResponseModelImplCopyWith<$Res> {
  __$$AchievementStatsResponseModelImplCopyWithImpl(
      _$AchievementStatsResponseModelImpl _value,
      $Res Function(_$AchievementStatsResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAchievements = null,
    Object? unlockedAchievements = null,
    Object? unlockRate = null,
    Object? recentUnlocks = freezed,
    Object? nearUnlocks = freezed,
    Object? achievementsByType = freezed,
    Object? calculatedAt = null,
  }) {
    return _then(_$AchievementStatsResponseModelImpl(
      totalAchievements: null == totalAchievements
          ? _value.totalAchievements
          : totalAchievements // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedAchievements: null == unlockedAchievements
          ? _value.unlockedAchievements
          : unlockedAchievements // ignore: cast_nullable_to_non_nullable
              as int,
      unlockRate: null == unlockRate
          ? _value.unlockRate
          : unlockRate // ignore: cast_nullable_to_non_nullable
              as double,
      recentUnlocks: freezed == recentUnlocks
          ? _value._recentUnlocks
          : recentUnlocks // ignore: cast_nullable_to_non_nullable
              as List<UserAchievementResponseModel>?,
      nearUnlocks: freezed == nearUnlocks
          ? _value._nearUnlocks
          : nearUnlocks // ignore: cast_nullable_to_non_nullable
              as List<AchievementProgressResponseModel>?,
      achievementsByType: freezed == achievementsByType
          ? _value._achievementsByType
          : achievementsByType // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementStatsResponseModelImpl
    implements _AchievementStatsResponseModel {
  const _$AchievementStatsResponseModelImpl(
      {required this.totalAchievements,
      required this.unlockedAchievements,
      required this.unlockRate,
      final List<UserAchievementResponseModel>? recentUnlocks,
      final List<AchievementProgressResponseModel>? nearUnlocks,
      final Map<String, int>? achievementsByType,
      required this.calculatedAt})
      : _recentUnlocks = recentUnlocks,
        _nearUnlocks = nearUnlocks,
        _achievementsByType = achievementsByType;

  factory _$AchievementStatsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AchievementStatsResponseModelImplFromJson(json);

  /// 总成就数量
  @override
  final int totalAchievements;

  /// 已解锁成就数量
  @override
  final int unlockedAchievements;

  /// 解锁率（百分比）
  @override
  final double unlockRate;

  /// 最近解锁的成就
  final List<UserAchievementResponseModel>? _recentUnlocks;

  /// 最近解锁的成就
  @override
  List<UserAchievementResponseModel>? get recentUnlocks {
    final value = _recentUnlocks;
    if (value == null) return null;
    if (_recentUnlocks is EqualUnmodifiableListView) return _recentUnlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 即将解锁的成就
  final List<AchievementProgressResponseModel>? _nearUnlocks;

  /// 即将解锁的成就
  @override
  List<AchievementProgressResponseModel>? get nearUnlocks {
    final value = _nearUnlocks;
    if (value == null) return null;
    if (_nearUnlocks is EqualUnmodifiableListView) return _nearUnlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 按类型分组的统计
  final Map<String, int>? _achievementsByType;

  /// 按类型分组的统计
  @override
  Map<String, int>? get achievementsByType {
    final value = _achievementsByType;
    if (value == null) return null;
    if (_achievementsByType is EqualUnmodifiableMapView)
      return _achievementsByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// 统计计算时间
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'AchievementStatsResponseModel(totalAchievements: $totalAchievements, unlockedAchievements: $unlockedAchievements, unlockRate: $unlockRate, recentUnlocks: $recentUnlocks, nearUnlocks: $nearUnlocks, achievementsByType: $achievementsByType, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementStatsResponseModelImpl &&
            (identical(other.totalAchievements, totalAchievements) ||
                other.totalAchievements == totalAchievements) &&
            (identical(other.unlockedAchievements, unlockedAchievements) ||
                other.unlockedAchievements == unlockedAchievements) &&
            (identical(other.unlockRate, unlockRate) ||
                other.unlockRate == unlockRate) &&
            const DeepCollectionEquality()
                .equals(other._recentUnlocks, _recentUnlocks) &&
            const DeepCollectionEquality()
                .equals(other._nearUnlocks, _nearUnlocks) &&
            const DeepCollectionEquality()
                .equals(other._achievementsByType, _achievementsByType) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalAchievements,
      unlockedAchievements,
      unlockRate,
      const DeepCollectionEquality().hash(_recentUnlocks),
      const DeepCollectionEquality().hash(_nearUnlocks),
      const DeepCollectionEquality().hash(_achievementsByType),
      calculatedAt);

  /// Create a copy of AchievementStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementStatsResponseModelImplCopyWith<
          _$AchievementStatsResponseModelImpl>
      get copyWith => __$$AchievementStatsResponseModelImplCopyWithImpl<
          _$AchievementStatsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementStatsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementStatsResponseModel
    implements AchievementStatsResponseModel {
  const factory _AchievementStatsResponseModel(
          {required final int totalAchievements,
          required final int unlockedAchievements,
          required final double unlockRate,
          final List<UserAchievementResponseModel>? recentUnlocks,
          final List<AchievementProgressResponseModel>? nearUnlocks,
          final Map<String, int>? achievementsByType,
          required final DateTime calculatedAt}) =
      _$AchievementStatsResponseModelImpl;

  factory _AchievementStatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$AchievementStatsResponseModelImpl.fromJson;

  /// 总成就数量
  @override
  int get totalAchievements;

  /// 已解锁成就数量
  @override
  int get unlockedAchievements;

  /// 解锁率（百分比）
  @override
  double get unlockRate;

  /// 最近解锁的成就
  @override
  List<UserAchievementResponseModel>? get recentUnlocks;

  /// 即将解锁的成就
  @override
  List<AchievementProgressResponseModel>? get nearUnlocks;

  /// 按类型分组的统计
  @override
  Map<String, int>? get achievementsByType;

  /// 统计计算时间
  @override
  DateTime get calculatedAt;

  /// Create a copy of AchievementStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementStatsResponseModelImplCopyWith<
          _$AchievementStatsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UnlockAchievementRequestModel _$UnlockAchievementRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UnlockAchievementRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UnlockAchievementRequestModel {
  /// 成就标识符
  String get achievementIdentifier => throw _privateConstructorUsedError;

  /// 解锁时的数据快照
  Map<String, dynamic>? get unlockData => throw _privateConstructorUsedError;

  /// 解锁原因/备注
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this UnlockAchievementRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnlockAchievementRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnlockAchievementRequestModelCopyWith<UnlockAchievementRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockAchievementRequestModelCopyWith<$Res> {
  factory $UnlockAchievementRequestModelCopyWith(
          UnlockAchievementRequestModel value,
          $Res Function(UnlockAchievementRequestModel) then) =
      _$UnlockAchievementRequestModelCopyWithImpl<$Res,
          UnlockAchievementRequestModel>;
  @useResult
  $Res call(
      {String achievementIdentifier,
      Map<String, dynamic>? unlockData,
      String? reason});
}

/// @nodoc
class _$UnlockAchievementRequestModelCopyWithImpl<$Res,
        $Val extends UnlockAchievementRequestModel>
    implements $UnlockAchievementRequestModelCopyWith<$Res> {
  _$UnlockAchievementRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnlockAchievementRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementIdentifier = null,
    Object? unlockData = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      achievementIdentifier: null == achievementIdentifier
          ? _value.achievementIdentifier
          : achievementIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      unlockData: freezed == unlockData
          ? _value.unlockData
          : unlockData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnlockAchievementRequestModelImplCopyWith<$Res>
    implements $UnlockAchievementRequestModelCopyWith<$Res> {
  factory _$$UnlockAchievementRequestModelImplCopyWith(
          _$UnlockAchievementRequestModelImpl value,
          $Res Function(_$UnlockAchievementRequestModelImpl) then) =
      __$$UnlockAchievementRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String achievementIdentifier,
      Map<String, dynamic>? unlockData,
      String? reason});
}

/// @nodoc
class __$$UnlockAchievementRequestModelImplCopyWithImpl<$Res>
    extends _$UnlockAchievementRequestModelCopyWithImpl<$Res,
        _$UnlockAchievementRequestModelImpl>
    implements _$$UnlockAchievementRequestModelImplCopyWith<$Res> {
  __$$UnlockAchievementRequestModelImplCopyWithImpl(
      _$UnlockAchievementRequestModelImpl _value,
      $Res Function(_$UnlockAchievementRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnlockAchievementRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementIdentifier = null,
    Object? unlockData = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$UnlockAchievementRequestModelImpl(
      achievementIdentifier: null == achievementIdentifier
          ? _value.achievementIdentifier
          : achievementIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      unlockData: freezed == unlockData
          ? _value._unlockData
          : unlockData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnlockAchievementRequestModelImpl
    implements _UnlockAchievementRequestModel {
  const _$UnlockAchievementRequestModelImpl(
      {required this.achievementIdentifier,
      final Map<String, dynamic>? unlockData,
      this.reason})
      : _unlockData = unlockData;

  factory _$UnlockAchievementRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UnlockAchievementRequestModelImplFromJson(json);

  /// 成就标识符
  @override
  final String achievementIdentifier;

  /// 解锁时的数据快照
  final Map<String, dynamic>? _unlockData;

  /// 解锁时的数据快照
  @override
  Map<String, dynamic>? get unlockData {
    final value = _unlockData;
    if (value == null) return null;
    if (_unlockData is EqualUnmodifiableMapView) return _unlockData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// 解锁原因/备注
  @override
  final String? reason;

  @override
  String toString() {
    return 'UnlockAchievementRequestModel(achievementIdentifier: $achievementIdentifier, unlockData: $unlockData, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlockAchievementRequestModelImpl &&
            (identical(other.achievementIdentifier, achievementIdentifier) ||
                other.achievementIdentifier == achievementIdentifier) &&
            const DeepCollectionEquality()
                .equals(other._unlockData, _unlockData) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, achievementIdentifier,
      const DeepCollectionEquality().hash(_unlockData), reason);

  /// Create a copy of UnlockAchievementRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlockAchievementRequestModelImplCopyWith<
          _$UnlockAchievementRequestModelImpl>
      get copyWith => __$$UnlockAchievementRequestModelImplCopyWithImpl<
          _$UnlockAchievementRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnlockAchievementRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UnlockAchievementRequestModel
    implements UnlockAchievementRequestModel {
  const factory _UnlockAchievementRequestModel(
      {required final String achievementIdentifier,
      final Map<String, dynamic>? unlockData,
      final String? reason}) = _$UnlockAchievementRequestModelImpl;

  factory _UnlockAchievementRequestModel.fromJson(Map<String, dynamic> json) =
      _$UnlockAchievementRequestModelImpl.fromJson;

  /// 成就标识符
  @override
  String get achievementIdentifier;

  /// 解锁时的数据快照
  @override
  Map<String, dynamic>? get unlockData;

  /// 解锁原因/备注
  @override
  String? get reason;

  /// Create a copy of UnlockAchievementRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlockAchievementRequestModelImplCopyWith<
          _$UnlockAchievementRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AchievementQueryRequestModel _$AchievementQueryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AchievementQueryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementQueryRequestModel {
  /// 成就类型过滤
  List<String>? get types => throw _privateConstructorUsedError;

  /// 是否包含隐藏成就
  bool get includeHidden => throw _privateConstructorUsedError;

  /// 是否只返回已解锁的成就
  bool? get unlockedOnly => throw _privateConstructorUsedError;

  /// 页码（从1开始）
  int get page => throw _privateConstructorUsedError;

  /// 每页数量
  int get limit => throw _privateConstructorUsedError;

  /// 排序字段
  String get sortBy => throw _privateConstructorUsedError;

  /// 排序方向（asc/desc）
  String get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this AchievementQueryRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementQueryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementQueryRequestModelCopyWith<AchievementQueryRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementQueryRequestModelCopyWith<$Res> {
  factory $AchievementQueryRequestModelCopyWith(
          AchievementQueryRequestModel value,
          $Res Function(AchievementQueryRequestModel) then) =
      _$AchievementQueryRequestModelCopyWithImpl<$Res,
          AchievementQueryRequestModel>;
  @useResult
  $Res call(
      {List<String>? types,
      bool includeHidden,
      bool? unlockedOnly,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class _$AchievementQueryRequestModelCopyWithImpl<$Res,
        $Val extends AchievementQueryRequestModel>
    implements $AchievementQueryRequestModelCopyWith<$Res> {
  _$AchievementQueryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementQueryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = freezed,
    Object? includeHidden = null,
    Object? unlockedOnly = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      includeHidden: null == includeHidden
          ? _value.includeHidden
          : includeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedOnly: freezed == unlockedOnly
          ? _value.unlockedOnly
          : unlockedOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$AchievementQueryRequestModelImplCopyWith<$Res>
    implements $AchievementQueryRequestModelCopyWith<$Res> {
  factory _$$AchievementQueryRequestModelImplCopyWith(
          _$AchievementQueryRequestModelImpl value,
          $Res Function(_$AchievementQueryRequestModelImpl) then) =
      __$$AchievementQueryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? types,
      bool includeHidden,
      bool? unlockedOnly,
      int page,
      int limit,
      String sortBy,
      String sortOrder});
}

/// @nodoc
class __$$AchievementQueryRequestModelImplCopyWithImpl<$Res>
    extends _$AchievementQueryRequestModelCopyWithImpl<$Res,
        _$AchievementQueryRequestModelImpl>
    implements _$$AchievementQueryRequestModelImplCopyWith<$Res> {
  __$$AchievementQueryRequestModelImplCopyWithImpl(
      _$AchievementQueryRequestModelImpl _value,
      $Res Function(_$AchievementQueryRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementQueryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? types = freezed,
    Object? includeHidden = null,
    Object? unlockedOnly = freezed,
    Object? page = null,
    Object? limit = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$AchievementQueryRequestModelImpl(
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      includeHidden: null == includeHidden
          ? _value.includeHidden
          : includeHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedOnly: freezed == unlockedOnly
          ? _value.unlockedOnly
          : unlockedOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$AchievementQueryRequestModelImpl
    implements _AchievementQueryRequestModel {
  const _$AchievementQueryRequestModelImpl(
      {final List<String>? types,
      this.includeHidden = false,
      this.unlockedOnly,
      this.page = 1,
      this.limit = 50,
      this.sortBy = 'createdAt',
      this.sortOrder = 'asc'})
      : _types = types;

  factory _$AchievementQueryRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AchievementQueryRequestModelImplFromJson(json);

  /// 成就类型过滤
  final List<String>? _types;

  /// 成就类型过滤
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// 是否包含隐藏成就
  @override
  @JsonKey()
  final bool includeHidden;

  /// 是否只返回已解锁的成就
  @override
  final bool? unlockedOnly;

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
    return 'AchievementQueryRequestModel(types: $types, includeHidden: $includeHidden, unlockedOnly: $unlockedOnly, page: $page, limit: $limit, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementQueryRequestModelImpl &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.includeHidden, includeHidden) ||
                other.includeHidden == includeHidden) &&
            (identical(other.unlockedOnly, unlockedOnly) ||
                other.unlockedOnly == unlockedOnly) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_types),
      includeHidden,
      unlockedOnly,
      page,
      limit,
      sortBy,
      sortOrder);

  /// Create a copy of AchievementQueryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementQueryRequestModelImplCopyWith<
          _$AchievementQueryRequestModelImpl>
      get copyWith => __$$AchievementQueryRequestModelImplCopyWithImpl<
          _$AchievementQueryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementQueryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementQueryRequestModel
    implements AchievementQueryRequestModel {
  const factory _AchievementQueryRequestModel(
      {final List<String>? types,
      final bool includeHidden,
      final bool? unlockedOnly,
      final int page,
      final int limit,
      final String sortBy,
      final String sortOrder}) = _$AchievementQueryRequestModelImpl;

  factory _AchievementQueryRequestModel.fromJson(Map<String, dynamic> json) =
      _$AchievementQueryRequestModelImpl.fromJson;

  /// 成就类型过滤
  @override
  List<String>? get types;

  /// 是否包含隐藏成就
  @override
  bool get includeHidden;

  /// 是否只返回已解锁的成就
  @override
  bool? get unlockedOnly;

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

  /// Create a copy of AchievementQueryRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementQueryRequestModelImplCopyWith<
          _$AchievementQueryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
