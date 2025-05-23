import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'unlocked_achievement.freezed.dart';
part 'unlocked_achievement.g.dart';

@freezed
@HiveType(typeId: 3) // Update to match the adapter
class UnlockedAchievement with _$UnlockedAchievement {
  const UnlockedAchievement._(); // Private constructor for freezed

  @HiveField(0)
  factory UnlockedAchievement({
    @HiveField(0) required String achievementId,
    @HiveField(1) required DateTime unlockDate,
  }) = _UnlockedAchievement;

  factory UnlockedAchievement.fromJson(Map<String, dynamic> json) =>
      _$UnlockedAchievementFromJson(json);
}
