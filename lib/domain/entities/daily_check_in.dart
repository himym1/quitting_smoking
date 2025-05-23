import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'daily_check_in.freezed.dart';
part 'daily_check_in.g.dart';

@freezed
@HiveType(typeId: 1) // Unique typeId for Hive
class DailyCheckIn extends HiveObject with _$DailyCheckIn {
  DailyCheckIn._();

  factory DailyCheckIn({
    @HiveField(0) required DateTime date,
    @HiveField(1) required bool isCheckedIn,
    @HiveField(2) String? userId,
  }) = _DailyCheckIn;

  factory DailyCheckIn.fromJson(Map<String, dynamic> json) =>
      _$DailyCheckInFromJson(json);
}
