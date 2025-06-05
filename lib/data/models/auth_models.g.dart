// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestModelImpl _$$RegisterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestModelImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String?,
      agreeToTerms: json['agreeToTerms'] as bool? ?? false,
    );

Map<String, dynamic> _$$RegisterRequestModelImplToJson(
        _$RegisterRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'agreeToTerms': instance.agreeToTerms,
    };

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginRequestModelImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfoModel.fromJson(
              json['deviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginRequestModelImplToJson(
        _$LoginRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'deviceInfo': instance.deviceInfo,
    };

_$DeviceInfoModelImpl _$$DeviceInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceInfoModelImpl(
      deviceId: json['deviceId'] as String,
      platform: json['platform'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$DeviceInfoModelImplToJson(
        _$DeviceInfoModelImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'platform': instance.platform,
      'version': instance.version,
    };

_$RefreshTokenRequestModelImpl _$$RefreshTokenRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenRequestModelImpl(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenRequestModelImplToJson(
        _$RefreshTokenRequestModelImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      user: UserDtoModel.fromJson(json['user'] as Map<String, dynamic>),
      tokens: TokenInfoModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

_$TokenInfoModelImpl _$$TokenInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenInfoModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      tokenType: json['tokenType'] as String? ?? 'Bearer',
    );

Map<String, dynamic> _$$TokenInfoModelImplToJson(
        _$TokenInfoModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'tokenType': instance.tokenType,
    };

_$UserDtoModelImpl _$$UserDtoModelImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      emailVerified: json['emailVerified'] as bool,
      profile: json['profile'] == null
          ? null
          : UserProfileDtoModel.fromJson(
              json['profile'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserDtoModelImplToJson(_$UserDtoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'emailVerified': instance.emailVerified,
      'profile': instance.profile,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$UserProfileDtoModelImpl _$$UserProfileDtoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileDtoModelImpl(
      quitDate: json['quitDate'] == null
          ? null
          : DateTime.parse(json['quitDate'] as String),
      quitReason: json['quitReason'] as String?,
      cigarettesPerDay: (json['cigarettesPerDay'] as num?)?.toInt(),
      cigarettePrice: (json['cigarettePrice'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'CNY',
      timezone: json['timezone'] as String? ?? 'UTC',
      locale: json['locale'] as String? ?? 'zh-CN',
    );

Map<String, dynamic> _$$UserProfileDtoModelImplToJson(
        _$UserProfileDtoModelImpl instance) =>
    <String, dynamic>{
      'quitDate': instance.quitDate?.toIso8601String(),
      'quitReason': instance.quitReason,
      'cigarettesPerDay': instance.cigarettesPerDay,
      'cigarettePrice': instance.cigarettePrice,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'locale': instance.locale,
    };

_$ForgotPasswordRequestModelImpl _$$ForgotPasswordRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordRequestModelImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$ForgotPasswordRequestModelImplToJson(
        _$ForgotPasswordRequestModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$ResetPasswordRequestModelImpl _$$ResetPasswordRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordRequestModelImpl(
      token: json['token'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$$ResetPasswordRequestModelImplToJson(
        _$ResetPasswordRequestModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'newPassword': instance.newPassword,
    };
