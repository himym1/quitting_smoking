// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) {
  return _RegisterRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequestModel {
  /// 邮箱地址
  String get email => throw _privateConstructorUsedError;

  /// 密码
  String get password => throw _privateConstructorUsedError;

  /// 用户姓名（可选）
  String? get name => throw _privateConstructorUsedError;

  /// 是否同意服务条款
  bool get agreeToTerms => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestModelCopyWith<RegisterRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestModelCopyWith<$Res> {
  factory $RegisterRequestModelCopyWith(RegisterRequestModel value,
          $Res Function(RegisterRequestModel) then) =
      _$RegisterRequestModelCopyWithImpl<$Res, RegisterRequestModel>;
  @useResult
  $Res call({String email, String password, String? name, bool agreeToTerms});
}

/// @nodoc
class _$RegisterRequestModelCopyWithImpl<$Res,
        $Val extends RegisterRequestModel>
    implements $RegisterRequestModelCopyWith<$Res> {
  _$RegisterRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = freezed,
    Object? agreeToTerms = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      agreeToTerms: null == agreeToTerms
          ? _value.agreeToTerms
          : agreeToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterRequestModelImplCopyWith<$Res>
    implements $RegisterRequestModelCopyWith<$Res> {
  factory _$$RegisterRequestModelImplCopyWith(_$RegisterRequestModelImpl value,
          $Res Function(_$RegisterRequestModelImpl) then) =
      __$$RegisterRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String? name, bool agreeToTerms});
}

/// @nodoc
class __$$RegisterRequestModelImplCopyWithImpl<$Res>
    extends _$RegisterRequestModelCopyWithImpl<$Res, _$RegisterRequestModelImpl>
    implements _$$RegisterRequestModelImplCopyWith<$Res> {
  __$$RegisterRequestModelImplCopyWithImpl(_$RegisterRequestModelImpl _value,
      $Res Function(_$RegisterRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = freezed,
    Object? agreeToTerms = null,
  }) {
    return _then(_$RegisterRequestModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      agreeToTerms: null == agreeToTerms
          ? _value.agreeToTerms
          : agreeToTerms // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestModelImpl implements _RegisterRequestModel {
  const _$RegisterRequestModelImpl(
      {required this.email,
      required this.password,
      this.name,
      this.agreeToTerms = false});

  factory _$RegisterRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestModelImplFromJson(json);

  /// 邮箱地址
  @override
  final String email;

  /// 密码
  @override
  final String password;

  /// 用户姓名（可选）
  @override
  final String? name;

  /// 是否同意服务条款
  @override
  @JsonKey()
  final bool agreeToTerms;

  @override
  String toString() {
    return 'RegisterRequestModel(email: $email, password: $password, name: $name, agreeToTerms: $agreeToTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.agreeToTerms, agreeToTerms) ||
                other.agreeToTerms == agreeToTerms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, name, agreeToTerms);

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
      get copyWith =>
          __$$RegisterRequestModelImplCopyWithImpl<_$RegisterRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterRequestModel implements RegisterRequestModel {
  const factory _RegisterRequestModel(
      {required final String email,
      required final String password,
      final String? name,
      final bool agreeToTerms}) = _$RegisterRequestModelImpl;

  factory _RegisterRequestModel.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestModelImpl.fromJson;

  /// 邮箱地址
  @override
  String get email;

  /// 密码
  @override
  String get password;

  /// 用户姓名（可选）
  @override
  String? get name;

  /// 是否同意服务条款
  @override
  bool get agreeToTerms;

  /// Create a copy of RegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestModelImplCopyWith<_$RegisterRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) {
  return _LoginRequestModel.fromJson(json);
}

/// @nodoc
mixin _$LoginRequestModel {
  /// 邮箱地址
  String get email => throw _privateConstructorUsedError;

  /// 密码
  String get password => throw _privateConstructorUsedError;

  /// 设备信息（可选）
  DeviceInfoModel? get deviceInfo => throw _privateConstructorUsedError;

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestModelCopyWith<LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestModelCopyWith<$Res> {
  factory $LoginRequestModelCopyWith(
          LoginRequestModel value, $Res Function(LoginRequestModel) then) =
      _$LoginRequestModelCopyWithImpl<$Res, LoginRequestModel>;
  @useResult
  $Res call({String email, String password, DeviceInfoModel? deviceInfo});

  $DeviceInfoModelCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res, $Val extends LoginRequestModel>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? deviceInfo = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoModel?,
    ) as $Val);
  }

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoModelCopyWith<$Res>? get deviceInfo {
    if (_value.deviceInfo == null) {
      return null;
    }

    return $DeviceInfoModelCopyWith<$Res>(_value.deviceInfo!, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginRequestModelImplCopyWith<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  factory _$$LoginRequestModelImplCopyWith(_$LoginRequestModelImpl value,
          $Res Function(_$LoginRequestModelImpl) then) =
      __$$LoginRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, DeviceInfoModel? deviceInfo});

  @override
  $DeviceInfoModelCopyWith<$Res>? get deviceInfo;
}

/// @nodoc
class __$$LoginRequestModelImplCopyWithImpl<$Res>
    extends _$LoginRequestModelCopyWithImpl<$Res, _$LoginRequestModelImpl>
    implements _$$LoginRequestModelImplCopyWith<$Res> {
  __$$LoginRequestModelImplCopyWithImpl(_$LoginRequestModelImpl _value,
      $Res Function(_$LoginRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? deviceInfo = freezed,
  }) {
    return _then(_$LoginRequestModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestModelImpl implements _LoginRequestModel {
  const _$LoginRequestModelImpl(
      {required this.email, required this.password, this.deviceInfo});

  factory _$LoginRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestModelImplFromJson(json);

  /// 邮箱地址
  @override
  final String email;

  /// 密码
  @override
  final String password;

  /// 设备信息（可选）
  @override
  final DeviceInfoModel? deviceInfo;

  @override
  String toString() {
    return 'LoginRequestModel(email: $email, password: $password, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, deviceInfo);

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      __$$LoginRequestModelImplCopyWithImpl<_$LoginRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestModelImplToJson(
      this,
    );
  }
}

abstract class _LoginRequestModel implements LoginRequestModel {
  const factory _LoginRequestModel(
      {required final String email,
      required final String password,
      final DeviceInfoModel? deviceInfo}) = _$LoginRequestModelImpl;

  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) =
      _$LoginRequestModelImpl.fromJson;

  /// 邮箱地址
  @override
  String get email;

  /// 密码
  @override
  String get password;

  /// 设备信息（可选）
  @override
  DeviceInfoModel? get deviceInfo;

  /// Create a copy of LoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestModelImplCopyWith<_$LoginRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceInfoModel _$DeviceInfoModelFromJson(Map<String, dynamic> json) {
  return _DeviceInfoModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfoModel {
  /// 设备ID
  String get deviceId => throw _privateConstructorUsedError;

  /// 平台类型
  String get platform => throw _privateConstructorUsedError;

  /// 应用版本
  String get version => throw _privateConstructorUsedError;

  /// Serializes this DeviceInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceInfoModelCopyWith<DeviceInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoModelCopyWith<$Res> {
  factory $DeviceInfoModelCopyWith(
          DeviceInfoModel value, $Res Function(DeviceInfoModel) then) =
      _$DeviceInfoModelCopyWithImpl<$Res, DeviceInfoModel>;
  @useResult
  $Res call({String deviceId, String platform, String version});
}

/// @nodoc
class _$DeviceInfoModelCopyWithImpl<$Res, $Val extends DeviceInfoModel>
    implements $DeviceInfoModelCopyWith<$Res> {
  _$DeviceInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? platform = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoModelImplCopyWith<$Res>
    implements $DeviceInfoModelCopyWith<$Res> {
  factory _$$DeviceInfoModelImplCopyWith(_$DeviceInfoModelImpl value,
          $Res Function(_$DeviceInfoModelImpl) then) =
      __$$DeviceInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String platform, String version});
}

/// @nodoc
class __$$DeviceInfoModelImplCopyWithImpl<$Res>
    extends _$DeviceInfoModelCopyWithImpl<$Res, _$DeviceInfoModelImpl>
    implements _$$DeviceInfoModelImplCopyWith<$Res> {
  __$$DeviceInfoModelImplCopyWithImpl(
      _$DeviceInfoModelImpl _value, $Res Function(_$DeviceInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? platform = null,
    Object? version = null,
  }) {
    return _then(_$DeviceInfoModelImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoModelImpl implements _DeviceInfoModel {
  const _$DeviceInfoModelImpl(
      {required this.deviceId, required this.platform, required this.version});

  factory _$DeviceInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoModelImplFromJson(json);

  /// 设备ID
  @override
  final String deviceId;

  /// 平台类型
  @override
  final String platform;

  /// 应用版本
  @override
  final String version;

  @override
  String toString() {
    return 'DeviceInfoModel(deviceId: $deviceId, platform: $platform, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, platform, version);

  /// Create a copy of DeviceInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoModelImplCopyWith<_$DeviceInfoModelImpl> get copyWith =>
      __$$DeviceInfoModelImplCopyWithImpl<_$DeviceInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfoModel implements DeviceInfoModel {
  const factory _DeviceInfoModel(
      {required final String deviceId,
      required final String platform,
      required final String version}) = _$DeviceInfoModelImpl;

  factory _DeviceInfoModel.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoModelImpl.fromJson;

  /// 设备ID
  @override
  String get deviceId;

  /// 平台类型
  @override
  String get platform;

  /// 应用版本
  @override
  String get version;

  /// Create a copy of DeviceInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoModelImplCopyWith<_$DeviceInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenRequestModel _$RefreshTokenRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RefreshTokenRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRequestModel {
  /// 刷新令牌
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenRequestModelCopyWith<RefreshTokenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRequestModelCopyWith<$Res> {
  factory $RefreshTokenRequestModelCopyWith(RefreshTokenRequestModel value,
          $Res Function(RefreshTokenRequestModel) then) =
      _$RefreshTokenRequestModelCopyWithImpl<$Res, RefreshTokenRequestModel>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$RefreshTokenRequestModelCopyWithImpl<$Res,
        $Val extends RefreshTokenRequestModel>
    implements $RefreshTokenRequestModelCopyWith<$Res> {
  _$RefreshTokenRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenRequestModelImplCopyWith<$Res>
    implements $RefreshTokenRequestModelCopyWith<$Res> {
  factory _$$RefreshTokenRequestModelImplCopyWith(
          _$RefreshTokenRequestModelImpl value,
          $Res Function(_$RefreshTokenRequestModelImpl) then) =
      __$$RefreshTokenRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$RefreshTokenRequestModelImplCopyWithImpl<$Res>
    extends _$RefreshTokenRequestModelCopyWithImpl<$Res,
        _$RefreshTokenRequestModelImpl>
    implements _$$RefreshTokenRequestModelImplCopyWith<$Res> {
  __$$RefreshTokenRequestModelImplCopyWithImpl(
      _$RefreshTokenRequestModelImpl _value,
      $Res Function(_$RefreshTokenRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenRequestModelImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenRequestModelImpl implements _RefreshTokenRequestModel {
  const _$RefreshTokenRequestModelImpl({required this.refreshToken});

  factory _$RefreshTokenRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenRequestModelImplFromJson(json);

  /// 刷新令牌
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenRequestModel(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRequestModelImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RefreshTokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRequestModelImplCopyWith<_$RefreshTokenRequestModelImpl>
      get copyWith => __$$RefreshTokenRequestModelImplCopyWithImpl<
          _$RefreshTokenRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenRequestModelImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenRequestModel implements RefreshTokenRequestModel {
  const factory _RefreshTokenRequestModel(
      {required final String refreshToken}) = _$RefreshTokenRequestModelImpl;

  factory _RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenRequestModelImpl.fromJson;

  /// 刷新令牌
  @override
  String get refreshToken;

  /// Create a copy of RefreshTokenRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenRequestModelImplCopyWith<_$RefreshTokenRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  /// 用户信息
  UserDtoModel get user => throw _privateConstructorUsedError;

  /// 令牌信息
  TokenInfoModel get tokens => throw _privateConstructorUsedError;

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call({UserDtoModel user, TokenInfoModel tokens});

  $UserDtoModelCopyWith<$Res> get user;
  $TokenInfoModelCopyWith<$Res> get tokens;
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDtoModel,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as TokenInfoModel,
    ) as $Val);
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDtoModelCopyWith<$Res> get user {
    return $UserDtoModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenInfoModelCopyWith<$Res> get tokens {
    return $TokenInfoModelCopyWith<$Res>(_value.tokens, (value) {
      return _then(_value.copyWith(tokens: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseModelImplCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$AuthResponseModelImplCopyWith(_$AuthResponseModelImpl value,
          $Res Function(_$AuthResponseModelImpl) then) =
      __$$AuthResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDtoModel user, TokenInfoModel tokens});

  @override
  $UserDtoModelCopyWith<$Res> get user;
  @override
  $TokenInfoModelCopyWith<$Res> get tokens;
}

/// @nodoc
class __$$AuthResponseModelImplCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$AuthResponseModelImpl>
    implements _$$AuthResponseModelImplCopyWith<$Res> {
  __$$AuthResponseModelImplCopyWithImpl(_$AuthResponseModelImpl _value,
      $Res Function(_$AuthResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tokens = null,
  }) {
    return _then(_$AuthResponseModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDtoModel,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as TokenInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseModelImpl implements _AuthResponseModel {
  const _$AuthResponseModelImpl({required this.user, required this.tokens});

  factory _$AuthResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseModelImplFromJson(json);

  /// 用户信息
  @override
  final UserDtoModel user;

  /// 令牌信息
  @override
  final TokenInfoModel tokens;

  @override
  String toString() {
    return 'AuthResponseModel(user: $user, tokens: $tokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tokens, tokens) || other.tokens == tokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, tokens);

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      __$$AuthResponseModelImplCopyWithImpl<_$AuthResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final UserDtoModel user,
      required final TokenInfoModel tokens}) = _$AuthResponseModelImpl;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$AuthResponseModelImpl.fromJson;

  /// 用户信息
  @override
  UserDtoModel get user;

  /// 令牌信息
  @override
  TokenInfoModel get tokens;

  /// Create a copy of AuthResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseModelImplCopyWith<_$AuthResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenInfoModel _$TokenInfoModelFromJson(Map<String, dynamic> json) {
  return _TokenInfoModel.fromJson(json);
}

/// @nodoc
mixin _$TokenInfoModel {
  /// 访问令牌
  String get accessToken => throw _privateConstructorUsedError;

  /// 刷新令牌
  String get refreshToken => throw _privateConstructorUsedError;

  /// 过期时间（秒）
  int get expiresIn => throw _privateConstructorUsedError;

  /// 令牌类型
  String get tokenType => throw _privateConstructorUsedError;

  /// Serializes this TokenInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenInfoModelCopyWith<TokenInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenInfoModelCopyWith<$Res> {
  factory $TokenInfoModelCopyWith(
          TokenInfoModel value, $Res Function(TokenInfoModel) then) =
      _$TokenInfoModelCopyWithImpl<$Res, TokenInfoModel>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      String tokenType});
}

/// @nodoc
class _$TokenInfoModelCopyWithImpl<$Res, $Val extends TokenInfoModel>
    implements $TokenInfoModelCopyWith<$Res> {
  _$TokenInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenInfoModelImplCopyWith<$Res>
    implements $TokenInfoModelCopyWith<$Res> {
  factory _$$TokenInfoModelImplCopyWith(_$TokenInfoModelImpl value,
          $Res Function(_$TokenInfoModelImpl) then) =
      __$$TokenInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      String tokenType});
}

/// @nodoc
class __$$TokenInfoModelImplCopyWithImpl<$Res>
    extends _$TokenInfoModelCopyWithImpl<$Res, _$TokenInfoModelImpl>
    implements _$$TokenInfoModelImplCopyWith<$Res> {
  __$$TokenInfoModelImplCopyWithImpl(
      _$TokenInfoModelImpl _value, $Res Function(_$TokenInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? tokenType = null,
  }) {
    return _then(_$TokenInfoModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenInfoModelImpl implements _TokenInfoModel {
  const _$TokenInfoModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      this.tokenType = 'Bearer'});

  factory _$TokenInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenInfoModelImplFromJson(json);

  /// 访问令牌
  @override
  final String accessToken;

  /// 刷新令牌
  @override
  final String refreshToken;

  /// 过期时间（秒）
  @override
  final int expiresIn;

  /// 令牌类型
  @override
  @JsonKey()
  final String tokenType;

  @override
  String toString() {
    return 'TokenInfoModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenInfoModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, expiresIn, tokenType);

  /// Create a copy of TokenInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenInfoModelImplCopyWith<_$TokenInfoModelImpl> get copyWith =>
      __$$TokenInfoModelImplCopyWithImpl<_$TokenInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenInfoModelImplToJson(
      this,
    );
  }
}

abstract class _TokenInfoModel implements TokenInfoModel {
  const factory _TokenInfoModel(
      {required final String accessToken,
      required final String refreshToken,
      required final int expiresIn,
      final String tokenType}) = _$TokenInfoModelImpl;

  factory _TokenInfoModel.fromJson(Map<String, dynamic> json) =
      _$TokenInfoModelImpl.fromJson;

  /// 访问令牌
  @override
  String get accessToken;

  /// 刷新令牌
  @override
  String get refreshToken;

  /// 过期时间（秒）
  @override
  int get expiresIn;

  /// 令牌类型
  @override
  String get tokenType;

  /// Create a copy of TokenInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenInfoModelImplCopyWith<_$TokenInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDtoModel _$UserDtoModelFromJson(Map<String, dynamic> json) {
  return _UserDtoModel.fromJson(json);
}

/// @nodoc
mixin _$UserDtoModel {
  /// 用户ID
  String get id => throw _privateConstructorUsedError;

  /// 邮箱地址
  String get email => throw _privateConstructorUsedError;

  /// 用户姓名
  String? get name => throw _privateConstructorUsedError;

  /// 邮箱是否已验证
  bool get emailVerified => throw _privateConstructorUsedError;

  /// 用户资料
  UserProfileDtoModel? get profile => throw _privateConstructorUsedError;

  /// 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserDtoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDtoModelCopyWith<UserDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoModelCopyWith<$Res> {
  factory $UserDtoModelCopyWith(
          UserDtoModel value, $Res Function(UserDtoModel) then) =
      _$UserDtoModelCopyWithImpl<$Res, UserDtoModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      bool emailVerified,
      UserProfileDtoModel? profile,
      DateTime createdAt});

  $UserProfileDtoModelCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserDtoModelCopyWithImpl<$Res, $Val extends UserDtoModel>
    implements $UserDtoModelCopyWith<$Res> {
  _$UserDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? emailVerified = null,
    Object? profile = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDtoModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDtoModelCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileDtoModelCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoModelImplCopyWith<$Res>
    implements $UserDtoModelCopyWith<$Res> {
  factory _$$UserDtoModelImplCopyWith(
          _$UserDtoModelImpl value, $Res Function(_$UserDtoModelImpl) then) =
      __$$UserDtoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      bool emailVerified,
      UserProfileDtoModel? profile,
      DateTime createdAt});

  @override
  $UserProfileDtoModelCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$UserDtoModelImplCopyWithImpl<$Res>
    extends _$UserDtoModelCopyWithImpl<$Res, _$UserDtoModelImpl>
    implements _$$UserDtoModelImplCopyWith<$Res> {
  __$$UserDtoModelImplCopyWithImpl(
      _$UserDtoModelImpl _value, $Res Function(_$UserDtoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? emailVerified = null,
    Object? profile = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UserDtoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileDtoModel?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoModelImpl implements _UserDtoModel {
  const _$UserDtoModelImpl(
      {required this.id,
      required this.email,
      this.name,
      required this.emailVerified,
      this.profile,
      required this.createdAt});

  factory _$UserDtoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoModelImplFromJson(json);

  /// 用户ID
  @override
  final String id;

  /// 邮箱地址
  @override
  final String email;

  /// 用户姓名
  @override
  final String? name;

  /// 邮箱是否已验证
  @override
  final bool emailVerified;

  /// 用户资料
  @override
  final UserProfileDtoModel? profile;

  /// 创建时间
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserDtoModel(id: $id, email: $email, name: $name, emailVerified: $emailVerified, profile: $profile, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, name, emailVerified, profile, createdAt);

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoModelImplCopyWith<_$UserDtoModelImpl> get copyWith =>
      __$$UserDtoModelImplCopyWithImpl<_$UserDtoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoModelImplToJson(
      this,
    );
  }
}

abstract class _UserDtoModel implements UserDtoModel {
  const factory _UserDtoModel(
      {required final String id,
      required final String email,
      final String? name,
      required final bool emailVerified,
      final UserProfileDtoModel? profile,
      required final DateTime createdAt}) = _$UserDtoModelImpl;

  factory _UserDtoModel.fromJson(Map<String, dynamic> json) =
      _$UserDtoModelImpl.fromJson;

  /// 用户ID
  @override
  String get id;

  /// 邮箱地址
  @override
  String get email;

  /// 用户姓名
  @override
  String? get name;

  /// 邮箱是否已验证
  @override
  bool get emailVerified;

  /// 用户资料
  @override
  UserProfileDtoModel? get profile;

  /// 创建时间
  @override
  DateTime get createdAt;

  /// Create a copy of UserDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDtoModelImplCopyWith<_$UserDtoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileDtoModel _$UserProfileDtoModelFromJson(Map<String, dynamic> json) {
  return _UserProfileDtoModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDtoModel {
  /// 戒烟开始日期
  DateTime? get quitDate => throw _privateConstructorUsedError;

  /// 戒烟理由
  String? get quitReason => throw _privateConstructorUsedError;

  /// 每日吸烟量
  int? get cigarettesPerDay => throw _privateConstructorUsedError;

  /// 香烟价格
  double? get cigarettePrice => throw _privateConstructorUsedError;

  /// 货币代码
  String get currency => throw _privateConstructorUsedError;

  /// 时区
  String get timezone => throw _privateConstructorUsedError;

  /// 语言代码
  String get locale => throw _privateConstructorUsedError;

  /// Serializes this UserProfileDtoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileDtoModelCopyWith<UserProfileDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDtoModelCopyWith<$Res> {
  factory $UserProfileDtoModelCopyWith(
          UserProfileDtoModel value, $Res Function(UserProfileDtoModel) then) =
      _$UserProfileDtoModelCopyWithImpl<$Res, UserProfileDtoModel>;
  @useResult
  $Res call(
      {DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      String currency,
      String timezone,
      String locale});
}

/// @nodoc
class _$UserProfileDtoModelCopyWithImpl<$Res, $Val extends UserProfileDtoModel>
    implements $UserProfileDtoModelCopyWith<$Res> {
  _$UserProfileDtoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
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
abstract class _$$UserProfileDtoModelImplCopyWith<$Res>
    implements $UserProfileDtoModelCopyWith<$Res> {
  factory _$$UserProfileDtoModelImplCopyWith(_$UserProfileDtoModelImpl value,
          $Res Function(_$UserProfileDtoModelImpl) then) =
      __$$UserProfileDtoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? quitDate,
      String? quitReason,
      int? cigarettesPerDay,
      double? cigarettePrice,
      String currency,
      String timezone,
      String locale});
}

/// @nodoc
class __$$UserProfileDtoModelImplCopyWithImpl<$Res>
    extends _$UserProfileDtoModelCopyWithImpl<$Res, _$UserProfileDtoModelImpl>
    implements _$$UserProfileDtoModelImplCopyWith<$Res> {
  __$$UserProfileDtoModelImplCopyWithImpl(_$UserProfileDtoModelImpl _value,
      $Res Function(_$UserProfileDtoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quitDate = freezed,
    Object? quitReason = freezed,
    Object? cigarettesPerDay = freezed,
    Object? cigarettePrice = freezed,
    Object? currency = null,
    Object? timezone = null,
    Object? locale = null,
  }) {
    return _then(_$UserProfileDtoModelImpl(
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
class _$UserProfileDtoModelImpl implements _UserProfileDtoModel {
  const _$UserProfileDtoModelImpl(
      {this.quitDate,
      this.quitReason,
      this.cigarettesPerDay,
      this.cigarettePrice,
      this.currency = 'CNY',
      this.timezone = 'UTC',
      this.locale = 'zh-CN'});

  factory _$UserProfileDtoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDtoModelImplFromJson(json);

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
    return 'UserProfileDtoModel(quitDate: $quitDate, quitReason: $quitReason, cigarettesPerDay: $cigarettesPerDay, cigarettePrice: $cigarettePrice, currency: $currency, timezone: $timezone, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDtoModelImpl &&
            (identical(other.quitDate, quitDate) ||
                other.quitDate == quitDate) &&
            (identical(other.quitReason, quitReason) ||
                other.quitReason == quitReason) &&
            (identical(other.cigarettesPerDay, cigarettesPerDay) ||
                other.cigarettesPerDay == cigarettesPerDay) &&
            (identical(other.cigarettePrice, cigarettePrice) ||
                other.cigarettePrice == cigarettePrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quitDate, quitReason,
      cigarettesPerDay, cigarettePrice, currency, timezone, locale);

  /// Create a copy of UserProfileDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDtoModelImplCopyWith<_$UserProfileDtoModelImpl> get copyWith =>
      __$$UserProfileDtoModelImplCopyWithImpl<_$UserProfileDtoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDtoModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileDtoModel implements UserProfileDtoModel {
  const factory _UserProfileDtoModel(
      {final DateTime? quitDate,
      final String? quitReason,
      final int? cigarettesPerDay,
      final double? cigarettePrice,
      final String currency,
      final String timezone,
      final String locale}) = _$UserProfileDtoModelImpl;

  factory _UserProfileDtoModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileDtoModelImpl.fromJson;

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

  /// 货币代码
  @override
  String get currency;

  /// 时区
  @override
  String get timezone;

  /// 语言代码
  @override
  String get locale;

  /// Create a copy of UserProfileDtoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileDtoModelImplCopyWith<_$UserProfileDtoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordRequestModel {
  /// 邮箱地址
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordRequestModelCopyWith<ForgotPasswordRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordRequestModelCopyWith<$Res> {
  factory $ForgotPasswordRequestModelCopyWith(ForgotPasswordRequestModel value,
          $Res Function(ForgotPasswordRequestModel) then) =
      _$ForgotPasswordRequestModelCopyWithImpl<$Res,
          ForgotPasswordRequestModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestModelCopyWithImpl<$Res,
        $Val extends ForgotPasswordRequestModel>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  _$ForgotPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordRequestModelImplCopyWith<$Res>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  factory _$$ForgotPasswordRequestModelImplCopyWith(
          _$ForgotPasswordRequestModelImpl value,
          $Res Function(_$ForgotPasswordRequestModelImpl) then) =
      __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordRequestModelImplCopyWithImpl<$Res>
    extends _$ForgotPasswordRequestModelCopyWithImpl<$Res,
        _$ForgotPasswordRequestModelImpl>
    implements _$$ForgotPasswordRequestModelImplCopyWith<$Res> {
  __$$ForgotPasswordRequestModelImplCopyWithImpl(
      _$ForgotPasswordRequestModelImpl _value,
      $Res Function(_$ForgotPasswordRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordRequestModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordRequestModelImpl implements _ForgotPasswordRequestModel {
  const _$ForgotPasswordRequestModelImpl({required this.email});

  factory _$ForgotPasswordRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ForgotPasswordRequestModelImplFromJson(json);

  /// 邮箱地址
  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRequestModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordRequestModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
      get copyWith => __$$ForgotPasswordRequestModelImplCopyWithImpl<
          _$ForgotPasswordRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordRequestModel
    implements ForgotPasswordRequestModel {
  const factory _ForgotPasswordRequestModel({required final String email}) =
      _$ForgotPasswordRequestModelImpl;

  factory _ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordRequestModelImpl.fromJson;

  /// 邮箱地址
  @override
  String get email;

  /// Create a copy of ForgotPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordRequestModelImplCopyWith<_$ForgotPasswordRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResetPasswordRequestModel _$ResetPasswordRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ResetPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordRequestModel {
  /// 重置令牌
  String get token => throw _privateConstructorUsedError;

  /// 新密码
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordRequestModelCopyWith<ResetPasswordRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordRequestModelCopyWith<$Res> {
  factory $ResetPasswordRequestModelCopyWith(ResetPasswordRequestModel value,
          $Res Function(ResetPasswordRequestModel) then) =
      _$ResetPasswordRequestModelCopyWithImpl<$Res, ResetPasswordRequestModel>;
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class _$ResetPasswordRequestModelCopyWithImpl<$Res,
        $Val extends ResetPasswordRequestModel>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  _$ResetPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordRequestModelImplCopyWith<$Res>
    implements $ResetPasswordRequestModelCopyWith<$Res> {
  factory _$$ResetPasswordRequestModelImplCopyWith(
          _$ResetPasswordRequestModelImpl value,
          $Res Function(_$ResetPasswordRequestModelImpl) then) =
      __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String newPassword});
}

/// @nodoc
class __$$ResetPasswordRequestModelImplCopyWithImpl<$Res>
    extends _$ResetPasswordRequestModelCopyWithImpl<$Res,
        _$ResetPasswordRequestModelImpl>
    implements _$$ResetPasswordRequestModelImplCopyWith<$Res> {
  __$$ResetPasswordRequestModelImplCopyWithImpl(
      _$ResetPasswordRequestModelImpl _value,
      $Res Function(_$ResetPasswordRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? newPassword = null,
  }) {
    return _then(_$ResetPasswordRequestModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordRequestModelImpl implements _ResetPasswordRequestModel {
  const _$ResetPasswordRequestModelImpl(
      {required this.token, required this.newPassword});

  factory _$ResetPasswordRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordRequestModelImplFromJson(json);

  /// 重置令牌
  @override
  final String token;

  /// 新密码
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ResetPasswordRequestModel(token: $token, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, newPassword);

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
      get copyWith => __$$ResetPasswordRequestModelImplCopyWithImpl<
          _$ResetPasswordRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordRequestModel implements ResetPasswordRequestModel {
  const factory _ResetPasswordRequestModel(
      {required final String token,
      required final String newPassword}) = _$ResetPasswordRequestModelImpl;

  factory _ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordRequestModelImpl.fromJson;

  /// 重置令牌
  @override
  String get token;

  /// 新密码
  @override
  String get newPassword;

  /// Create a copy of ResetPasswordRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordRequestModelImplCopyWith<_$ResetPasswordRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
