import 'package:flutter/material.dart'; // For Locale
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';

abstract class HealthBenefitLocalDataSource {
  Future<List<HealthBenefitMilestone>> getAllHealthBenefits(Locale locale);
}
