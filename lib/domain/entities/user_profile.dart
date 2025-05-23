import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: HiveConstants.userProfileTypeId)
class UserProfile extends HiveObject with _$UserProfile {
  UserProfile._(); // Private constructor for HiveObject extension is needed

  factory UserProfile({
    @HiveField(0) String? userId,
    @HiveField(1) DateTime? quitDateTime,
    @HiveField(2) int? dailyCigarettes,
    @HiveField(3) double? packPrice,
    @HiveField(4) int? smokingYears,
    @HiveField(5) String? quitReason,
    @HiveField(6) @Default(false) bool onboardingCompleted,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
