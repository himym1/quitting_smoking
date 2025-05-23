// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_check_in.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyCheckInAdapter extends TypeAdapter<DailyCheckIn> {
  @override
  final int typeId = 1;

  @override
  DailyCheckIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyCheckIn(
      date: fields[0] as DateTime,
      isCheckedIn: fields[1] as bool,
      userId: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyCheckIn obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.isCheckedIn)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyCheckInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyCheckInImpl _$$DailyCheckInImplFromJson(Map<String, dynamic> json) =>
    _$DailyCheckInImpl(
      date: DateTime.parse(json['date'] as String),
      isCheckedIn: json['isCheckedIn'] as bool,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$DailyCheckInImplToJson(_$DailyCheckInImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'isCheckedIn': instance.isCheckedIn,
      'userId': instance.userId,
    };
