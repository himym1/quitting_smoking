// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoking_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmokingRecordAdapter extends TypeAdapter<SmokingRecord> {
  @override
  final int typeId = 4;

  @override
  SmokingRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmokingRecord(
      timestamp: fields[0] as DateTime,
      cigarettesSmoked: fields[1] as int,
      triggerTags: (fields[2] as List?)?.cast<String>(),
      notes: fields[3] as String?,
      userId: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SmokingRecord obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.cigarettesSmoked)
      ..writeByte(2)
      ..write(obj.triggerTags)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmokingRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmokingRecordImpl _$$SmokingRecordImplFromJson(Map<String, dynamic> json) =>
    _$SmokingRecordImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      cigarettesSmoked: (json['cigarettesSmoked'] as num).toInt(),
      triggerTags: (json['triggerTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$SmokingRecordImplToJson(_$SmokingRecordImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'cigarettesSmoked': instance.cigarettesSmoked,
      'triggerTags': instance.triggerTags,
      'notes': instance.notes,
      'userId': instance.userId,
    };
