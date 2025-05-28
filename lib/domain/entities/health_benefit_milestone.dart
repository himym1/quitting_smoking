import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_benefit_milestone.freezed.dart';
part 'health_benefit_milestone.g.dart';

@freezed
class HealthBenefitMilestone with _$HealthBenefitMilestone {
  const HealthBenefitMilestone._();

  const factory HealthBenefitMilestone({
    required String id,
    required int timeThresholdInMinutes, // e.g., 20 (for 20 minutes), 480 (for 8 hours)
    required String titleKey, // Renamed from title
    required String descriptionKey, // Renamed from description
    String? iconName, // Name or path to an icon asset
  }) = _HealthBenefitMilestone;

  factory HealthBenefitMilestone.fromJson(Map<String, dynamic> json) =>
      _$HealthBenefitMilestoneFromJson(json);
}
