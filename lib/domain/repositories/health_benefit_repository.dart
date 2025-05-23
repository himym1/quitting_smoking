import 'package:flutter/material.dart'; // For Locale
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';

abstract class HealthBenefitRepository {
  Future<List<HealthBenefitMilestone>> getAllHealthBenefits(Locale locale);
  // Potentially add methods to get specific benefits or based on quit duration
}
