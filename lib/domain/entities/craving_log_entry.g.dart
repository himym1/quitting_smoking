// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craving_log_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CravingLogEntryAdapter extends TypeAdapter<CravingLogEntry> {
  @override
  final int typeId = 2;

  @override
  CravingLogEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CravingLogEntry(
      timestamp: fields[0] as DateTime,
      triggerTags: (fields[1] as List?)?.cast<String>(),
      emotionTags: (fields[2] as List?)?.cast<String>(),
      userId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CravingLogEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.triggerTags)
      ..writeByte(2)
      ..write(obj.emotionTags)
      ..writeByte(3)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CravingLogEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CravingLogEntryImpl _$$CravingLogEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$CravingLogEntryImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      triggerTags: (json['triggerTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      emotionTags: (json['emotionTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$CravingLogEntryImplToJson(
        _$CravingLogEntryImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'triggerTags': instance.triggerTags,
      'emotionTags': instance.emotionTags,
      'userId': instance.userId,
    };
