// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_benefit_milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthBenefitMilestoneImpl _$$HealthBenefitMilestoneImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthBenefitMilestoneImpl(
      id: json['id'] as String,
      timeThresholdInMinutes: (json['timeThresholdInMinutes'] as num).toInt(),
      titleKey: json['titleKey'] as String,
      descriptionKey: json['descriptionKey'] as String,
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$$HealthBenefitMilestoneImplToJson(
        _$HealthBenefitMilestoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeThresholdInMinutes': instance.timeThresholdInMinutes,
      'titleKey': instance.titleKey,
      'descriptionKey': instance.descriptionKey,
      'iconName': instance.iconName,
    };
