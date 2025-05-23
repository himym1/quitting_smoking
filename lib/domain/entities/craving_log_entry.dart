import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'craving_log_entry.freezed.dart';
part 'craving_log_entry.g.dart';

@freezed
@HiveType(typeId: 2) // Unique typeId for Hive
class CravingLogEntry extends HiveObject with _$CravingLogEntry {
  CravingLogEntry._();

  factory CravingLogEntry({
    @HiveField(0) required DateTime timestamp,
    @HiveField(1) List<String>? triggerTags,
    @HiveField(2) List<String>? emotionTags,
    @HiveField(3) String? userId,
  }) = _CravingLogEntry;

  factory CravingLogEntry.fromJson(Map<String, dynamic> json) =>
      _$CravingLogEntryFromJson(json);
}
