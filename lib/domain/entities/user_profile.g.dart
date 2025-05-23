// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileAdapter extends TypeAdapter<UserProfile> {
  @override
  final int typeId = 0;

  @override
  UserProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfile(
      userId: fields[0] as String?,
      quitDateTime: fields[1] as DateTime?,
      dailyCigarettes: fields[2] as int?,
      packPrice: fields[3] as double?,
      smokingYears: fields[4] as int?,
      quitReason: fields[5] as String?,
      onboardingCompleted: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfile obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.quitDateTime)
      ..writeByte(2)
      ..write(obj.dailyCigarettes)
      ..writeByte(3)
      ..write(obj.packPrice)
      ..writeByte(4)
      ..write(obj.smokingYears)
      ..writeByte(5)
      ..write(obj.quitReason)
      ..writeByte(6)
      ..write(obj.onboardingCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['userId'] as String?,
      quitDateTime: json['quitDateTime'] == null
          ? null
          : DateTime.parse(json['quitDateTime'] as String),
      dailyCigarettes: (json['dailyCigarettes'] as num?)?.toInt(),
      packPrice: (json['packPrice'] as num?)?.toDouble(),
      smokingYears: (json['smokingYears'] as num?)?.toInt(),
      quitReason: json['quitReason'] as String?,
      onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'quitDateTime': instance.quitDateTime?.toIso8601String(),
      'dailyCigarettes': instance.dailyCigarettes,
      'packPrice': instance.packPrice,
      'smokingYears': instance.smokingYears,
      'quitReason': instance.quitReason,
      'onboardingCompleted': instance.onboardingCompleted,
    };
