// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlocked_achievement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnlockedAchievementAdapter extends TypeAdapter<UnlockedAchievement> {
  @override
  final int typeId = 3;

  @override
  UnlockedAchievement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnlockedAchievement(
      achievementId: fields[0] as String,
      unlockDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UnlockedAchievement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.achievementId)
      ..writeByte(1)
      ..write(obj.unlockDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnlockedAchievementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnlockedAchievementImpl _$$UnlockedAchievementImplFromJson(
        Map<String, dynamic> json) =>
    _$UnlockedAchievementImpl(
      achievementId: json['achievementId'] as String,
      unlockDate: DateTime.parse(json['unlockDate'] as String),
    );

Map<String, dynamic> _$$UnlockedAchievementImplToJson(
        _$UnlockedAchievementImpl instance) =>
    <String, dynamic>{
      'achievementId': instance.achievementId,
      'unlockDate': instance.unlockDate.toIso8601String(),
    };
