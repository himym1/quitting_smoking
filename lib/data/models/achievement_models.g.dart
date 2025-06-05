// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementResponseModelImpl _$$AchievementResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementResponseModelImpl(
      id: json['id'] as String,
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      type: json['type'] as String,
      unlockConditions: json['unlockConditions'] as Map<String, dynamic>,
      rewards: json['rewards'] as Map<String, dynamic>?,
      isHidden: json['isHidden'] as bool? ?? false,
      level: (json['level'] as num?)?.toInt() ?? 1,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AchievementResponseModelImplToJson(
        _$AchievementResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'type': instance.type,
      'unlockConditions': instance.unlockConditions,
      'rewards': instance.rewards,
      'isHidden': instance.isHidden,
      'level': instance.level,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$UserAchievementResponseModelImpl _$$UserAchievementResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementResponseModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      achievement: AchievementResponseModel.fromJson(
          json['achievement'] as Map<String, dynamic>),
      unlockedAt: DateTime.parse(json['unlockedAt'] as String),
      progress: (json['progress'] as num).toDouble(),
      isUnlocked: json['isUnlocked'] as bool,
      unlockData: json['unlockData'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserAchievementResponseModelImplToJson(
        _$UserAchievementResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'achievement': instance.achievement,
      'unlockedAt': instance.unlockedAt.toIso8601String(),
      'progress': instance.progress,
      'isUnlocked': instance.isUnlocked,
      'unlockData': instance.unlockData,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$AchievementProgressResponseModelImpl
    _$$AchievementProgressResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$AchievementProgressResponseModelImpl(
          achievementId: json['achievementId'] as String,
          identifier: json['identifier'] as String,
          name: json['name'] as String,
          currentProgress: (json['currentProgress'] as num).toDouble(),
          targetProgress: (json['targetProgress'] as num).toDouble(),
          progressPercentage: (json['progressPercentage'] as num).toDouble(),
          isUnlocked: json['isUnlocked'] as bool,
          unlockedAt: json['unlockedAt'] == null
              ? null
              : DateTime.parse(json['unlockedAt'] as String),
          remainingProgress: (json['remainingProgress'] as num?)?.toDouble(),
          estimatedUnlockTime: json['estimatedUnlockTime'] == null
              ? null
              : DateTime.parse(json['estimatedUnlockTime'] as String),
        );

Map<String, dynamic> _$$AchievementProgressResponseModelImplToJson(
        _$AchievementProgressResponseModelImpl instance) =>
    <String, dynamic>{
      'achievementId': instance.achievementId,
      'identifier': instance.identifier,
      'name': instance.name,
      'currentProgress': instance.currentProgress,
      'targetProgress': instance.targetProgress,
      'progressPercentage': instance.progressPercentage,
      'isUnlocked': instance.isUnlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'remainingProgress': instance.remainingProgress,
      'estimatedUnlockTime': instance.estimatedUnlockTime?.toIso8601String(),
    };

_$AchievementStatsResponseModelImpl
    _$$AchievementStatsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$AchievementStatsResponseModelImpl(
          totalAchievements: (json['totalAchievements'] as num).toInt(),
          unlockedAchievements: (json['unlockedAchievements'] as num).toInt(),
          unlockRate: (json['unlockRate'] as num).toDouble(),
          recentUnlocks: (json['recentUnlocks'] as List<dynamic>?)
              ?.map((e) => UserAchievementResponseModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          nearUnlocks: (json['nearUnlocks'] as List<dynamic>?)
              ?.map((e) => AchievementProgressResponseModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          achievementsByType:
              (json['achievementsByType'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ),
          calculatedAt: DateTime.parse(json['calculatedAt'] as String),
        );

Map<String, dynamic> _$$AchievementStatsResponseModelImplToJson(
        _$AchievementStatsResponseModelImpl instance) =>
    <String, dynamic>{
      'totalAchievements': instance.totalAchievements,
      'unlockedAchievements': instance.unlockedAchievements,
      'unlockRate': instance.unlockRate,
      'recentUnlocks': instance.recentUnlocks,
      'nearUnlocks': instance.nearUnlocks,
      'achievementsByType': instance.achievementsByType,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };

_$UnlockAchievementRequestModelImpl
    _$$UnlockAchievementRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$UnlockAchievementRequestModelImpl(
          achievementIdentifier: json['achievementIdentifier'] as String,
          unlockData: json['unlockData'] as Map<String, dynamic>?,
          reason: json['reason'] as String?,
        );

Map<String, dynamic> _$$UnlockAchievementRequestModelImplToJson(
        _$UnlockAchievementRequestModelImpl instance) =>
    <String, dynamic>{
      'achievementIdentifier': instance.achievementIdentifier,
      'unlockData': instance.unlockData,
      'reason': instance.reason,
    };

_$AchievementQueryRequestModelImpl _$$AchievementQueryRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementQueryRequestModelImpl(
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      includeHidden: json['includeHidden'] as bool? ?? false,
      unlockedOnly: json['unlockedOnly'] as bool?,
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 50,
      sortBy: json['sortBy'] as String? ?? 'createdAt',
      sortOrder: json['sortOrder'] as String? ?? 'asc',
    );

Map<String, dynamic> _$$AchievementQueryRequestModelImplToJson(
        _$AchievementQueryRequestModelImpl instance) =>
    <String, dynamic>{
      'types': instance.types,
      'includeHidden': instance.includeHidden,
      'unlockedOnly': instance.unlockedOnly,
      'page': instance.page,
      'limit': instance.limit,
      'sortBy': instance.sortBy,
      'sortOrder': instance.sortOrder,
    };
