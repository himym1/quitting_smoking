// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_check_in_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCheckInRequestModelImpl _$$CreateCheckInRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCheckInRequestModelImpl(
      date: DateTime.parse(json['date'] as String),
      checkinTime: json['checkinTime'] == null
          ? null
          : DateTime.parse(json['checkinTime'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateCheckInRequestModelImplToJson(
        _$CreateCheckInRequestModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'checkinTime': instance.checkinTime?.toIso8601String(),
      'note': instance.note,
    };

_$CheckInResponseModelImpl _$$CheckInResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInResponseModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      checkinTime: DateTime.parse(json['checkinTime'] as String),
      note: json['note'] as String?,
      consecutiveDays: (json['consecutiveDays'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CheckInResponseModelImplToJson(
        _$CheckInResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'checkinTime': instance.checkinTime.toIso8601String(),
      'note': instance.note,
      'consecutiveDays': instance.consecutiveDays,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$CheckInStatsResponseModelImpl _$$CheckInStatsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInStatsResponseModelImpl(
      totalCheckIns: (json['totalCheckIns'] as num).toInt(),
      currentStreak: (json['currentStreak'] as num).toInt(),
      longestStreak: (json['longestStreak'] as num).toInt(),
      monthlyCheckIns: (json['monthlyCheckIns'] as num).toInt(),
      weeklyCheckIns: (json['weeklyCheckIns'] as num).toInt(),
      successRate: (json['successRate'] as num).toDouble(),
      lastCheckInDate: json['lastCheckInDate'] == null
          ? null
          : DateTime.parse(json['lastCheckInDate'] as String),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
    );

Map<String, dynamic> _$$CheckInStatsResponseModelImplToJson(
        _$CheckInStatsResponseModelImpl instance) =>
    <String, dynamic>{
      'totalCheckIns': instance.totalCheckIns,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'monthlyCheckIns': instance.monthlyCheckIns,
      'weeklyCheckIns': instance.weeklyCheckIns,
      'successRate': instance.successRate,
      'lastCheckInDate': instance.lastCheckInDate?.toIso8601String(),
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };

_$CheckInHistoryRequestModelImpl _$$CheckInHistoryRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInHistoryRequestModelImpl(
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 20,
      sortBy: json['sortBy'] as String? ?? 'date',
      sortOrder: json['sortOrder'] as String? ?? 'desc',
    );

Map<String, dynamic> _$$CheckInHistoryRequestModelImplToJson(
        _$CheckInHistoryRequestModelImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'page': instance.page,
      'limit': instance.limit,
      'sortBy': instance.sortBy,
      'sortOrder': instance.sortOrder,
    };
