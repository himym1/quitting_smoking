// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Quit Journey';

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get onboardingTitle => 'Welcome to Quit Journey';

  @override
  String get homeTab => 'Home';

  @override
  String get achievementsTab => 'Achievements';

  @override
  String get settingsTab => 'Settings';

  @override
  String get appSlogan => 'Quit addiction, refresh life, start with every breath.';

  @override
  String get loadingYourFuture => 'Loading your smoke-free future...';

  @override
  String get loginPageTitle => 'Login';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get loginToContinue => 'Login to continue your quit journey.';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get loginButtonText => 'Login';

  @override
  String get forgotPasswordButtonText => 'Forgot Password?';

  @override
  String get orText => 'OR';

  @override
  String get navigateToRegisterPrompt => 'Don\'t have an account?';

  @override
  String get navigateToRegisterLink => 'Sign Up';

  @override
  String get invalidCredentialsError => 'Invalid email or password.';

  @override
  String get loginFailedError => 'Login failed. Please try again.';

  @override
  String get fieldRequiredError => 'This field is required.';

  @override
  String get invalidEmailFormatError => 'Invalid email format.';

  @override
  String get registrationPageTitle => 'Create Account';

  @override
  String get createYourAccount => 'Create Your Account';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get registerButtonText => 'Sign Up';

  @override
  String get navigateToLoginPrompt => 'Already have an account?';

  @override
  String get navigateToLoginLink => 'Login';

  @override
  String get passwordMismatchError => 'Passwords do not match.';

  @override
  String get emailAlreadyInUseError => 'This email is already in use.';

  @override
  String get registrationFailedError => 'Registration failed. Please try again.';

  @override
  String get termsAndConditionsCheckboxLabel => 'I have read and agree to the [Terms of Service] and [Privacy Policy].';

  @override
  String get onboardingPageTitle => 'Initial Setup';

  @override
  String get nextButtonText => 'Next';

  @override
  String get backButtonText => 'Back';

  @override
  String get finishButtonText => 'Finish & Start Journey';

  @override
  String get step1Title => 'When do you want to quit?';

  @override
  String get step1Description => 'Select a date and time to start your new journey.';

  @override
  String get selectDateButton => 'Select Date';

  @override
  String get selectTimeButton => 'Select Time';

  @override
  String get step2Title => 'How much do you usually smoke?';

  @override
  String get step2Description => 'This helps us calculate your future health and financial benefits.';

  @override
  String get dailyCigarettesLabel => 'Cigarettes per day';

  @override
  String get step3Title => 'Price per pack?';

  @override
  String get step3Description => 'We\'ll help you track savings after quitting.';

  @override
  String get packPriceLabel => 'Price per pack';

  @override
  String get step4Title => 'How long have you been smoking?';

  @override
  String get step4Description => '(Optional) This information helps us understand your situation better.';

  @override
  String get smokingYearsLabel => 'Smoking years';

  @override
  String get step5Title => 'What motivates you to quit?';

  @override
  String get step5Description => 'Write down your reasons. It can give you strength when you waver.';

  @override
  String get quitReasonHint => 'My reasons for quitting are...';

  @override
  String get fieldCannotBeEmpty => 'This field cannot be empty.';

  @override
  String get pleaseSelectDateTime => 'Please select a date and time.';

  @override
  String get invalidNumberError => 'Please enter a valid number.';

  @override
  String get numberMustBePositiveError => 'Please enter a number greater than zero.';

  @override
  String get tooManyDecimalPlacesError => 'Please enter a value with no more than two decimal places.';

  @override
  String get numberCannotBeNegativeError => 'Please enter a non-negative number.';

  @override
  String get genericError => 'An unexpected error occurred. Please try again.';

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavAchievements => 'Achievements';

  @override
  String get bottomNavSettings => 'Settings';

  @override
  String get homePageTitle => 'Home';

  @override
  String get achievementsPageTitle => 'My Achievements';

  @override
  String get settingsPageTitle => 'Settings';

  @override
  String get homeProgressTitle => 'My Quit Progress';

  @override
  String homeProgressTime(String days, String hours, String minutes, String seconds) {
    return 'Smoke-free for ${days}d ${hours}h ${minutes}m ${seconds}s';
  }

  @override
  String homeProgressMoneySaved(String amount) {
    return 'Money Saved: ¥$amount';
  }

  @override
  String homeProgressCigarettesNotSmoked(String count) {
    return 'Cigarettes Not Smoked: $count';
  }

  @override
  String homeProgressLifeGained(String days) {
    return 'Estimated Life Gained: $days days';
  }

  @override
  String get homeHealthBenefitsTitle => 'Health Benefits Overview';

  @override
  String get homeHealthBenefit1Title => 'Heart Rate & Blood Pressure';

  @override
  String get homeHealthBenefit1Desc => 'Your heart rate and blood pressure have started to drop.';

  @override
  String get homeHealthBenefit2Title => 'Carbon Monoxide Level';

  @override
  String get homeHealthBenefit2Desc => 'The carbon monoxide level in your blood has returned to normal.';

  @override
  String get homeHealthBenefitsNothingToShow => 'Keep going! Your health benefits will appear here soon.';

  @override
  String get healthBenefitsDetailPageTitle => 'Health Benefits';

  @override
  String get healthBenefitsDetailPlaceholderTitle => 'More Details Coming Soon!';

  @override
  String get healthBenefitsDetailPlaceholderDesc => 'This page will show a timeline and detailed descriptions of all health benefits achieved and upcoming.';

  @override
  String get healthBenefitTitle_20mins => 'Heart Rate Normalizes';

  @override
  String get healthBenefitDesc_20mins => 'After 20 minutes, your heart rate and blood pressure begin to drop back to normal levels.';

  @override
  String get healthBenefitTitle_8hours => 'Oxygen Levels Rise';

  @override
  String get healthBenefitDesc_8hours => 'After 8 hours, the carbon monoxide level in your blood drops by half, and oxygen levels return to normal.';

  @override
  String get healthBenefitTitle_24hours => 'Heart Attack Risk Drops';

  @override
  String get healthBenefitDesc_24hours => 'After 24 hours, your risk of having a heart attack begins to decrease.';

  @override
  String get healthBenefitTitle_48hours => 'Nerve Endings Regrow';

  @override
  String get healthBenefitDesc_48hours => 'After 48 hours, nerve endings start to regrow, and your sense of smell and taste begin to improve.';

  @override
  String get healthBenefitTitle_2weeks => 'Circulation Improves';

  @override
  String get healthBenefitDesc_2weeks => 'Between 2 weeks and 3 months, your circulation improves and lung function increases.';

  @override
  String get healthBenefitTitle_1month => 'Lungs Begin to Clear';

  @override
  String get healthBenefitDesc_1month => 'After 1 to 9 months, coughing and shortness of breath decrease. Cilia (tiny hair-like structures) regain normal function in the lungs, increasing the ability to handle mucus, clean the lungs, and reduce infection.';

  @override
  String get homeQuitReasonTitle => 'My Quit Declaration';

  @override
  String get homeQuitReasonPlaceholder => 'You haven\'t written your quit declaration yet.';

  @override
  String get homeDailyCheckInTitle => 'Daily Check-in';

  @override
  String get homeDailyCheckInPrompt => 'How are you feeling today? Log your progress!';

  @override
  String get homeDailyCheckInButton => 'Check-in';

  @override
  String get homeDailyCheckInConfirmation => 'Checked in successfully, great job!';

  @override
  String get homeDailyCheckInButtonCheckedIn => 'Checked-in Today';

  @override
  String get homeDailyCheckInSuccessToast => 'Check-in successful, awesome!';

  @override
  String get homeDailyCheckInButtonError => 'Retry Check-in';

  @override
  String get errorUnknown => 'An unknown error occurred.';

  @override
  String get homeEmergencyButton => 'I Want to Smoke';

  @override
  String get cravingCopingStrategiesTitle => 'Craving Management';

  @override
  String get cravingCopingStrategiesSubtitle => 'Choose a strategy to help you get through this moment:';

  @override
  String get cravingStrategyBreathingTitle => 'Deep Breathing Exercise';

  @override
  String get cravingStrategyBreathingDesc => 'Take a moment to focus on your breath and reduce stress.';

  @override
  String get cravingStrategyWaterTitle => 'Drink Water';

  @override
  String get cravingStrategyWaterDesc => 'Hydrating can help reduce cravings and keep your hands busy.';

  @override
  String get cravingStrategyDistractionTitle => 'Distraction Techniques';

  @override
  String get cravingStrategyDistractionDesc => 'Simple activities to keep your mind off smoking.';

  @override
  String get cravingStrategyDistractionTipsTitle => 'Try these distraction tips:';

  @override
  String get cravingStrategyDistractionTip1Title => 'Listen to Music';

  @override
  String get cravingStrategyDistractionTip1Desc => 'Put on your favorite song or playlist and focus on the lyrics or melody.';

  @override
  String get cravingStrategyDistractionTip2Title => 'Take a Walk';

  @override
  String get cravingStrategyDistractionTip2Desc => 'Even a short 5-minute walk can help reduce cravings significantly.';

  @override
  String get cravingStrategyDistractionTip3Title => 'Call a Friend';

  @override
  String get cravingStrategyDistractionTip3Desc => 'Reach out to someone supportive who can help take your mind off smoking.';

  @override
  String get cravingStrategyCompleted => 'Great job! You\'ve successfully completed this coping strategy.';

  @override
  String get cravingLogButtonText => 'Log This Craving';

  @override
  String get breathingExerciseTitle => 'Deep Breathing Exercise';

  @override
  String get breathingExerciseInstruction => 'Follow the circle\'s rhythm for a 1-minute guided breathing exercise.';

  @override
  String get breathingPhaseInhale => 'Inhale';

  @override
  String get breathingPhaseHold => 'Hold';

  @override
  String get breathingPhaseExhale => 'Exhale';

  @override
  String breathingExerciseTimeRemaining(String seconds) {
    return '$seconds seconds remaining';
  }

  @override
  String get breathingExerciseCompletedTitle => 'Exercise Complete!';

  @override
  String get breathingExerciseCompleted => 'Well done!';

  @override
  String get breathingExerciseCompletedDesc => 'You\'ve successfully completed the breathing exercise. How do you feel now?';

  @override
  String get breathingExerciseFinishEarly => 'Finish Early';

  @override
  String get backToStrategiesButton => 'Back to Strategies';

  @override
  String get cravingLogTitle => 'Log Your Craving';

  @override
  String get cravingLogIntensityLabel => 'How strong is your craving? (1-5)';

  @override
  String get cravingLogIntensityLow => 'Mild';

  @override
  String get cravingLogIntensityHigh => 'Very Strong';

  @override
  String get cravingLogTriggerLabel => 'What triggered this craving?';

  @override
  String get cravingLogTriggerStress => 'Stress';

  @override
  String get cravingLogTriggerBoredom => 'Boredom';

  @override
  String get cravingLogTriggerSocial => 'Social Situation';

  @override
  String get cravingLogTriggerMeal => 'After Meal';

  @override
  String get cravingLogTriggerAlcohol => 'Alcohol';

  @override
  String get cravingLogTriggerCoffee => 'Coffee/Tea';

  @override
  String get cravingLogTriggerOther => 'Other';

  @override
  String get cravingLogNotesLabel => 'Additional Notes';

  @override
  String get cravingLogNotesHint => 'Write any additional thoughts or feelings...';

  @override
  String get cravingLogSavedMessage => 'Craving log saved successfully!';

  @override
  String get dialogCloseButton => 'Close';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get saveButtonLabel => 'Save';

  @override
  String get achievementUnlockedTitle => 'Achievement Unlocked!';

  @override
  String get continueButtonLabel => 'Continue';

  @override
  String get achievement7DaysName => 'First Week Free';

  @override
  String get achievement7DaysDesc => 'Smoke-free for 7 consecutive days';

  @override
  String get achievement7DaysStory => 'The first week is often the hardest part of quitting. You\'ve proven your commitment to yourself and your health. This is a major milestone!';

  @override
  String get achievement30DaysName => 'One Month Milestone';

  @override
  String get achievement30DaysDesc => 'Smoke-free for 30 consecutive days';

  @override
  String get achievement30DaysStory => 'One month smoke-free! Your lung function is improving, your circulation is better, and you\'re forming powerful new habits. Keep going!';

  @override
  String get achievement100DaysName => '100 Days Club';

  @override
  String get achievement100DaysDesc => 'Smoke-free for 100 days';

  @override
  String get achievement100DaysStory => '100 days without smoking is an incredible achievement. Your body has significantly recovered, and the smoke-free lifestyle is becoming your second nature.';

  @override
  String get appSettingsTitle => 'App Settings';

  @override
  String get notificationsSettingTitle => 'Notifications';

  @override
  String get notificationsSettingSubtitle => 'Manage quit reminders and achievement notifications';

  @override
  String get languageSettingTitle => 'Language';

  @override
  String get languageSettingSubtitle => 'Change application language';

  @override
  String get themeSettingTitle => 'Theme';

  @override
  String get themeSettingSubtitle => 'Toggle light/dark theme';

  @override
  String get healthDataSettingsTitle => 'Health Data Settings';

  @override
  String get smokingDataSettingTitle => 'Smoking Data';

  @override
  String get smokingDataSettingSubtitle => 'Update daily cigarettes and cigarette price';

  @override
  String get quitDateSettingTitle => 'Quit Date';

  @override
  String get quitDateSettingSubtitle => 'Change your quit start date';

  @override
  String get resetDataSettingTitle => 'Reset Data';

  @override
  String get resetDataSettingSubtitle => 'Reset all quit progress data';

  @override
  String get aboutAndSupportTitle => 'About & Support';

  @override
  String get aboutAppSettingTitle => 'About';

  @override
  String get aboutAppSettingSubtitle => 'View app information and legal notices';

  @override
  String get helpAndSupportSettingTitle => 'Help & Support';

  @override
  String get helpAndSupportSettingSubtitle => 'Get help and contact support';

  @override
  String get privacyPolicySettingTitle => 'Privacy Policy';

  @override
  String get privacyPolicySettingSubtitle => 'View our privacy policy';

  @override
  String get logoutButtonText => 'Logout';

  @override
  String get notificationTypesTitle => 'Notification Types';

  @override
  String get achievementNotificationsTitle => 'Achievement Notifications';

  @override
  String get achievementNotificationsSubtitle => 'Get notified when you unlock new achievements';

  @override
  String get healthMilestoneNotificationsTitle => 'Health Milestone Notifications';

  @override
  String get healthMilestoneNotificationsSubtitle => 'Get notified when you reach health improvement milestones';

  @override
  String get dailyCheckInNotificationsTitle => 'Daily Check-in Reminders';

  @override
  String get dailyCheckInNotificationsSubtitle => 'Get daily reminders to check in';

  @override
  String get encouragementNotificationsTitle => 'Encouragement Messages';

  @override
  String get encouragementNotificationsSubtitle => 'Receive periodic encouragement messages';

  @override
  String get notificationTimeSettingsTitle => 'Reminder Time Settings';

  @override
  String get checkInReminderTimeTitle => 'Check-in Reminder Time';

  @override
  String get doNotDisturbTitle => 'Do Not Disturb Period';

  @override
  String get doNotDisturbSettingsTitle => 'Do Not Disturb Settings';

  @override
  String get startTime => 'Start Time';

  @override
  String get endTime => 'End Time';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String get cancel => 'Cancel';
}
