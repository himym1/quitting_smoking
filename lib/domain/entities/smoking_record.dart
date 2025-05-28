import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'smoking_record.freezed.dart';
part 'smoking_record.g.dart';

@freezed
@HiveType(typeId: 4) // 新的 typeId
class SmokingRecord extends HiveObject with _$SmokingRecord {
  SmokingRecord._();

  factory SmokingRecord({
    @HiveField(0) required DateTime timestamp,
    @HiveField(1) required int cigarettesSmoked, // 抽了多少支
    @HiveField(2) List<String>? triggerTags, // 触发因素
    @HiveField(3) String? notes, // 备注
    @HiveField(4) String? userId,
  }) = _SmokingRecord;

  factory SmokingRecord.fromJson(Map<String, dynamic> json) =>
      _$SmokingRecordFromJson(json);
}
