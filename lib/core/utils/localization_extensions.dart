import 'package:quitting_smoking/l10n/app_localizations.dart';

/// Extension to get a localized string by key or return null if not found
extension AppLocalizationsExt on AppLocalizations {
  String? getString(String key) {
    try {
      // This is a simplified approach. In a real app, you would have a more robust
      // way to access localized strings by key, such as a map or reflection.
      return switch (key) {
        // Achievement names
        'achievement1DayName' => achievement1DayName,
        'achievement7DaysName' => achievement7DaysName,
        'achievement1WeekName' => achievement1WeekName,
        'achievement30DaysName' => achievement30DaysName,
        'achievement1MonthName' => achievement1MonthName,
        'achievement100DaysName' => achievement100DaysName,
        'achievement1YearName' => achievement1YearName,
        'achievementMoneySavedName' => achievementMoneySavedName,
        'achievementResistCravingName' => achievementResistCravingName,
        'achievement_save_100_name' => achievementSave100Name,
        'achievement_save_1000_name' => achievementSave1000Name,
        'achievement_save_10000_name' => achievementSave10000Name,

        // Achievement descriptions
        'achievement1DayDesc' => achievement1DayDesc,
        'achievement7DaysDesc' => achievement7DaysDesc,
        'achievement1WeekDesc' => achievement1WeekDesc,
        'achievement30DaysDesc' => achievement30DaysDesc,
        'achievement1MonthDesc' => achievement1MonthDesc,
        'achievement100DaysDesc' => achievement100DaysDesc,
        'achievement1YearDesc' => achievement1YearDesc,
        'achievementMoneySavedDesc' => achievementMoneySavedDesc,
        'achievementResistCravingDesc' => achievementResistCravingDesc,
        'achievement_save_100_desc' => achievementSave100Desc,
        'achievement_save_1000_desc' => achievementSave1000Desc,
        'achievement_save_10000_desc' => achievementSave10000Desc,

        // Achievement stories
        'achievement1DayStory' => achievement1DayStory,
        'achievement7DaysStory' => achievement7DaysStory,
        'achievement1WeekStory' => achievement1WeekStory,
        'achievement30DaysStory' => achievement30DaysStory,
        'achievement1MonthStory' => achievement1MonthStory,
        'achievement100DaysStory' => achievement100DaysStory,
        'achievement1YearStory' => achievement1YearStory,
        'achievementMoneySavedStory' => achievementMoneySavedStory,
        'achievementResistCravingStory' => achievementResistCravingStory,
        'achievement_save_100_story' => achievementSave100Story,
        'achievement_save_1000_story' => achievementSave1000Story,
        'achievement_save_10000_story' => achievementSave10000Story,

        // Add more mappings as needed
        _ => null,
      };
    } catch (e) {
      return null;
    }
  }
}
