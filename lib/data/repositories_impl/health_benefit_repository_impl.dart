import 'package:flutter/material.dart'; // For Locale
import 'package:quitting_smoking/data/datasources/local/health_benefit_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'package:quitting_smoking/domain/repositories/health_benefit_repository.dart';

class HealthBenefitRepositoryImpl implements HealthBenefitRepository {
  final HealthBenefitLocalDataSource localDataSource;

  HealthBenefitRepositoryImpl({required this.localDataSource});

  @override
  Future<List<HealthBenefitMilestone>> getAllHealthBenefits(Locale locale) {
    return localDataSource.getAllHealthBenefits(locale);
  }
}
