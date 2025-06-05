// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smoking_record_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSmokingRecordRequestModelImpl
    _$$CreateSmokingRecordRequestModelImplFromJson(Map<String, dynamic> json) =>
        _$CreateSmokingRecordRequestModelImpl(
          timestamp: DateTime.parse(json['timestamp'] as String),
          cigarettesSmoked: (json['cigarettesSmoked'] as num?)?.toInt() ?? 1,
          triggerTags: (json['triggerTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          notes: json['notes'] as String?,
          location: json['location'] == null
              ? null
              : LocationInfoModel.fromJson(
                  json['location'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateSmokingRecordRequestModelImplToJson(
        _$CreateSmokingRecordRequestModelImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'cigarettesSmoked': instance.cigarettesSmoked,
      'triggerTags': instance.triggerTags,
      'notes': instance.notes,
      'location': instance.location,
    };

_$LocationInfoModelImpl _$$LocationInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationInfoModelImpl(
      name: json['name'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$LocationInfoModelImplToJson(
        _$LocationInfoModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coordinates': instance.coordinates,
    };

_$SmokingRecordResponseModelImpl _$$SmokingRecordResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SmokingRecordResponseModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      cigarettesSmoked: (json['cigarettesSmoked'] as num).toInt(),
      triggerTags: (json['triggerTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      location: json['location'] == null
          ? null
          : LocationInfoModel.fromJson(
              json['location'] as Map<String, dynamic>),
      impact: json['impact'] == null
          ? null
          : SmokingImpactModel.fromJson(json['impact'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SmokingRecordResponseModelImplToJson(
        _$SmokingRecordResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'timestamp': instance.timestamp.toIso8601String(),
      'cigarettesSmoked': instance.cigarettesSmoked,
      'triggerTags': instance.triggerTags,
      'notes': instance.notes,
      'location': instance.location,
      'impact': instance.impact,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$SmokingImpactModelImpl _$$SmokingImpactModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SmokingImpactModelImpl(
      streakBroken: json['streakBroken'] as bool,
      previousStreak: (json['previousStreak'] as num?)?.toInt(),
      affectedAchievements: (json['affectedAchievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SmokingImpactModelImplToJson(
        _$SmokingImpactModelImpl instance) =>
    <String, dynamic>{
      'streakBroken': instance.streakBroken,
      'previousStreak': instance.previousStreak,
      'affectedAchievements': instance.affectedAchievements,
      'description': instance.description,
    };

_$SmokingRecordStatsResponseModelImpl
    _$$SmokingRecordStatsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$SmokingRecordStatsResponseModelImpl(
          totalRecords: (json['totalRecords'] as num).toInt(),
          totalCigarettes: (json['totalCigarettes'] as num).toInt(),
          monthlyRecords: (json['monthlyRecords'] as num).toInt(),
          monthlyCigarettes: (json['monthlyCigarettes'] as num).toInt(),
          weeklyRecords: (json['weeklyRecords'] as num).toInt(),
          weeklyCigarettes: (json['weeklyCigarettes'] as num).toInt(),
          averageDailyCigarettes:
              (json['averageDailyCigarettes'] as num).toDouble(),
          commonTriggers: (json['commonTriggers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          lastSmokingTime: json['lastSmokingTime'] == null
              ? null
              : DateTime.parse(json['lastSmokingTime'] as String),
          calculatedAt: DateTime.parse(json['calculatedAt'] as String),
        );

Map<String, dynamic> _$$SmokingRecordStatsResponseModelImplToJson(
        _$SmokingRecordStatsResponseModelImpl instance) =>
    <String, dynamic>{
      'totalRecords': instance.totalRecords,
      'totalCigarettes': instance.totalCigarettes,
      'monthlyRecords': instance.monthlyRecords,
      'monthlyCigarettes': instance.monthlyCigarettes,
      'weeklyRecords': instance.weeklyRecords,
      'weeklyCigarettes': instance.weeklyCigarettes,
      'averageDailyCigarettes': instance.averageDailyCigarettes,
      'commonTriggers': instance.commonTriggers,
      'lastSmokingTime': instance.lastSmokingTime?.toIso8601String(),
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };

_$SmokingRecordHistoryRequestModelImpl
    _$$SmokingRecordHistoryRequestModelImplFromJson(
            Map<String, dynamic> json) =>
        _$SmokingRecordHistoryRequestModelImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          endDate: json['endDate'] == null
              ? null
              : DateTime.parse(json['endDate'] as String),
          triggerTags: (json['triggerTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          page: (json['page'] as num?)?.toInt() ?? 1,
          limit: (json['limit'] as num?)?.toInt() ?? 20,
          sortBy: json['sortBy'] as String? ?? 'timestamp',
          sortOrder: json['sortOrder'] as String? ?? 'desc',
        );

Map<String, dynamic> _$$SmokingRecordHistoryRequestModelImplToJson(
        _$SmokingRecordHistoryRequestModelImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'triggerTags': instance.triggerTags,
      'page': instance.page,
      'limit': instance.limit,
      'sortBy': instance.sortBy,
      'sortOrder': instance.sortOrder,
    };
