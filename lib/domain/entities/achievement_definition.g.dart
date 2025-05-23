// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementDefinitionImpl _$$AchievementDefinitionImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementDefinitionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      unlockCondition: json['unlockCondition'] as Map<String, dynamic>,
      iconLockedAssetPath: json['iconLockedAssetPath'] as String,
      iconUnlockedAssetPath: json['iconUnlockedAssetPath'] as String,
      nameKey: json['nameKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      storyKey: json['storyKey'] as String?,
    );

Map<String, dynamic> _$$AchievementDefinitionImplToJson(
        _$AchievementDefinitionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unlockCondition': instance.unlockCondition,
      'iconLockedAssetPath': instance.iconLockedAssetPath,
      'iconUnlockedAssetPath': instance.iconUnlockedAssetPath,
      'nameKey': instance.nameKey,
      'descriptionKey': instance.descriptionKey,
      'storyKey': instance.storyKey,
    };
