import 'package:hive_flutter/hive_flutter.dart';
import 'package:quitting_smoking/domain/entities/unlocked_achievement.dart';

class UnlockedAchievementAdapter extends TypeAdapter<UnlockedAchievement> {
  @override
  final int typeId = 3;

  @override
  UnlockedAchievement read(BinaryReader reader) {
    final achievementId = reader.read() as String;
    final unlockDate = reader.read() as DateTime;

    return UnlockedAchievement(
      achievementId: achievementId,
      unlockDate: unlockDate,
    );
  }

  @override
  void write(BinaryWriter writer, UnlockedAchievement obj) {
    writer.write(obj.achievementId);
    writer.write(obj.unlockDate);
  }
}
