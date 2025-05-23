import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_definition.freezed.dart';
part 'achievement_definition.g.dart';

@freezed
class AchievementDefinition with _$AchievementDefinition {
  const AchievementDefinition._(); // Private constructor for freezed

  const factory AchievementDefinition({
    required String id,
    required String name,
    required String description,
    required Map<String, dynamic>
    unlockCondition, // e.g., {"type": "consecutive_days", "value": 7}
    required String iconLockedAssetPath,
    required String iconUnlockedAssetPath,
    // Localization keys
    required String nameKey,
    required String descriptionKey,
    String? storyKey,
  }) = _AchievementDefinition;

  factory AchievementDefinition.fromJson(Map<String, dynamic> json) =>
      _$AchievementDefinitionFromJson(json);
}
