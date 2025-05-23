import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Quit Journey'**
  String get appTitle;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Quit Journey'**
  String get onboardingTitle;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @achievementsTab.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievementsTab;

  /// No description provided for @settingsTab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTab;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'Quit addiction, refresh life, start with every breath.'**
  String get appSlogan;

  /// No description provided for @loadingYourFuture.
  ///
  /// In en, this message translates to:
  /// **'Loading your smoke-free future...'**
  String get loadingYourFuture;

  /// No description provided for @loginPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginPageTitle;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @loginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue your quit journey.'**
  String get loginToContinue;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// No description provided for @loginButtonText.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonText;

  /// No description provided for @forgotPasswordButtonText.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordButtonText;

  /// No description provided for @orText.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orText;

  /// No description provided for @navigateToRegisterPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get navigateToRegisterPrompt;

  /// No description provided for @navigateToRegisterLink.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get navigateToRegisterLink;

  /// No description provided for @invalidCredentialsError.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get invalidCredentialsError;

  /// No description provided for @loginFailedError.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailedError;

  /// No description provided for @fieldRequiredError.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get fieldRequiredError;

  /// No description provided for @invalidEmailFormatError.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format.'**
  String get invalidEmailFormatError;

  /// No description provided for @registrationPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registrationPageTitle;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get createYourAccount;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHint;

  /// No description provided for @registerButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get registerButtonText;

  /// No description provided for @navigateToLoginPrompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get navigateToLoginPrompt;

  /// No description provided for @navigateToLoginLink.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get navigateToLoginLink;

  /// No description provided for @passwordMismatchError.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwordMismatchError;

  /// No description provided for @emailAlreadyInUseError.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use.'**
  String get emailAlreadyInUseError;

  /// No description provided for @registrationFailedError.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationFailedError;

  /// No description provided for @termsAndConditionsCheckboxLabel.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the [Terms of Service] and [Privacy Policy].'**
  String get termsAndConditionsCheckboxLabel;

  /// No description provided for @onboardingPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Initial Setup'**
  String get onboardingPageTitle;

  /// No description provided for @nextButtonText.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButtonText;

  /// No description provided for @backButtonText.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButtonText;

  /// No description provided for @finishButtonText.
  ///
  /// In en, this message translates to:
  /// **'Finish & Start Journey'**
  String get finishButtonText;

  /// No description provided for @step1Title.
  ///
  /// In en, this message translates to:
  /// **'When do you want to quit?'**
  String get step1Title;

  /// No description provided for @step1Description.
  ///
  /// In en, this message translates to:
  /// **'Select a date and time to start your new journey.'**
  String get step1Description;

  /// No description provided for @selectDateButton.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDateButton;

  /// No description provided for @selectTimeButton.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTimeButton;

  /// No description provided for @step2Title.
  ///
  /// In en, this message translates to:
  /// **'How much do you usually smoke?'**
  String get step2Title;

  /// No description provided for @step2Description.
  ///
  /// In en, this message translates to:
  /// **'This helps us calculate your future health and financial benefits.'**
  String get step2Description;

  /// No description provided for @dailyCigarettesLabel.
  ///
  /// In en, this message translates to:
  /// **'Cigarettes per day'**
  String get dailyCigarettesLabel;

  /// No description provided for @step3Title.
  ///
  /// In en, this message translates to:
  /// **'Price per pack?'**
  String get step3Title;

  /// No description provided for @step3Description.
  ///
  /// In en, this message translates to:
  /// **'We\'ll help you track savings after quitting.'**
  String get step3Description;

  /// No description provided for @packPriceLabel.
  ///
  /// In en, this message translates to:
  /// **'Price per pack'**
  String get packPriceLabel;

  /// No description provided for @step4Title.
  ///
  /// In en, this message translates to:
  /// **'How long have you been smoking?'**
  String get step4Title;

  /// No description provided for @step4Description.
  ///
  /// In en, this message translates to:
  /// **'(Optional) This information helps us understand your situation better.'**
  String get step4Description;

  /// No description provided for @smokingYearsLabel.
  ///
  /// In en, this message translates to:
  /// **'Smoking years'**
  String get smokingYearsLabel;

  /// No description provided for @step5Title.
  ///
  /// In en, this message translates to:
  /// **'What motivates you to quit?'**
  String get step5Title;

  /// No description provided for @step5Description.
  ///
  /// In en, this message translates to:
  /// **'Write down your reasons. It can give you strength when you waver.'**
  String get step5Description;

  /// No description provided for @quitReasonHint.
  ///
  /// In en, this message translates to:
  /// **'My reasons for quitting are...'**
  String get quitReasonHint;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty.'**
  String get fieldCannotBeEmpty;

  /// No description provided for @pleaseSelectDateTime.
  ///
  /// In en, this message translates to:
  /// **'Please select a date and time.'**
  String get pleaseSelectDateTime;

  /// No description provided for @invalidNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number.'**
  String get invalidNumberError;

  /// No description provided for @numberMustBePositiveError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number greater than zero.'**
  String get numberMustBePositiveError;

  /// No description provided for @tooManyDecimalPlacesError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value with no more than two decimal places.'**
  String get tooManyDecimalPlacesError;

  /// No description provided for @numberCannotBeNegativeError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a non-negative number.'**
  String get numberCannotBeNegativeError;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get genericError;

  /// No description provided for @bottomNavHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomNavHome;

  /// No description provided for @bottomNavAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get bottomNavAchievements;

  /// No description provided for @bottomNavSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get bottomNavSettings;

  /// No description provided for @homePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homePageTitle;

  /// No description provided for @achievementsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'My Achievements'**
  String get achievementsPageTitle;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @homeProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'My Quit Progress'**
  String get homeProgressTitle;

  /// Real-time progress of quitting smoking
  ///
  /// In en, this message translates to:
  /// **'Smoke-free for {days}d {hours}h {minutes}m {seconds}s'**
  String homeProgressTime(String days, String hours, String minutes, String seconds);

  /// No description provided for @homeProgressMoneySaved.
  ///
  /// In en, this message translates to:
  /// **'Money Saved: ¥{amount}'**
  String homeProgressMoneySaved(String amount);

  /// No description provided for @homeProgressCigarettesNotSmoked.
  ///
  /// In en, this message translates to:
  /// **'Cigarettes Not Smoked: {count}'**
  String homeProgressCigarettesNotSmoked(String count);

  /// No description provided for @homeProgressLifeGained.
  ///
  /// In en, this message translates to:
  /// **'Estimated Life Gained: {days} days'**
  String homeProgressLifeGained(String days);

  /// No description provided for @homeHealthBenefitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Benefits Overview'**
  String get homeHealthBenefitsTitle;

  /// No description provided for @homeHealthBenefit1Title.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate & Blood Pressure'**
  String get homeHealthBenefit1Title;

  /// No description provided for @homeHealthBenefit1Desc.
  ///
  /// In en, this message translates to:
  /// **'Your heart rate and blood pressure have started to drop.'**
  String get homeHealthBenefit1Desc;

  /// No description provided for @homeHealthBenefit2Title.
  ///
  /// In en, this message translates to:
  /// **'Carbon Monoxide Level'**
  String get homeHealthBenefit2Title;

  /// No description provided for @homeHealthBenefit2Desc.
  ///
  /// In en, this message translates to:
  /// **'The carbon monoxide level in your blood has returned to normal.'**
  String get homeHealthBenefit2Desc;

  /// No description provided for @homeHealthBenefitsNothingToShow.
  ///
  /// In en, this message translates to:
  /// **'Keep going! Your health benefits will appear here soon.'**
  String get homeHealthBenefitsNothingToShow;

  /// No description provided for @healthBenefitsDetailPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Benefits'**
  String get healthBenefitsDetailPageTitle;

  /// No description provided for @healthBenefitsDetailPlaceholderTitle.
  ///
  /// In en, this message translates to:
  /// **'More Details Coming Soon!'**
  String get healthBenefitsDetailPlaceholderTitle;

  /// No description provided for @healthBenefitsDetailPlaceholderDesc.
  ///
  /// In en, this message translates to:
  /// **'This page will show a timeline and detailed descriptions of all health benefits achieved and upcoming.'**
  String get healthBenefitsDetailPlaceholderDesc;

  /// No description provided for @healthBenefitTitle_20mins.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate Normalizes'**
  String get healthBenefitTitle_20mins;

  /// No description provided for @healthBenefitDesc_20mins.
  ///
  /// In en, this message translates to:
  /// **'After 20 minutes, your heart rate and blood pressure begin to drop back to normal levels.'**
  String get healthBenefitDesc_20mins;

  /// No description provided for @healthBenefitTitle_8hours.
  ///
  /// In en, this message translates to:
  /// **'Oxygen Levels Rise'**
  String get healthBenefitTitle_8hours;

  /// No description provided for @healthBenefitDesc_8hours.
  ///
  /// In en, this message translates to:
  /// **'After 8 hours, the carbon monoxide level in your blood drops by half, and oxygen levels return to normal.'**
  String get healthBenefitDesc_8hours;

  /// No description provided for @healthBenefitTitle_24hours.
  ///
  /// In en, this message translates to:
  /// **'Heart Attack Risk Drops'**
  String get healthBenefitTitle_24hours;

  /// No description provided for @healthBenefitDesc_24hours.
  ///
  /// In en, this message translates to:
  /// **'After 24 hours, your risk of having a heart attack begins to decrease.'**
  String get healthBenefitDesc_24hours;

  /// No description provided for @healthBenefitTitle_48hours.
  ///
  /// In en, this message translates to:
  /// **'Nerve Endings Regrow'**
  String get healthBenefitTitle_48hours;

  /// No description provided for @healthBenefitDesc_48hours.
  ///
  /// In en, this message translates to:
  /// **'After 48 hours, nerve endings start to regrow, and your sense of smell and taste begin to improve.'**
  String get healthBenefitDesc_48hours;

  /// No description provided for @healthBenefitTitle_2weeks.
  ///
  /// In en, this message translates to:
  /// **'Circulation Improves'**
  String get healthBenefitTitle_2weeks;

  /// No description provided for @healthBenefitDesc_2weeks.
  ///
  /// In en, this message translates to:
  /// **'Between 2 weeks and 3 months, your circulation improves and lung function increases.'**
  String get healthBenefitDesc_2weeks;

  /// No description provided for @healthBenefitTitle_1month.
  ///
  /// In en, this message translates to:
  /// **'Lungs Begin to Clear'**
  String get healthBenefitTitle_1month;

  /// No description provided for @healthBenefitDesc_1month.
  ///
  /// In en, this message translates to:
  /// **'After 1 to 9 months, coughing and shortness of breath decrease. Cilia (tiny hair-like structures) regain normal function in the lungs, increasing the ability to handle mucus, clean the lungs, and reduce infection.'**
  String get healthBenefitDesc_1month;

  /// No description provided for @homeQuitReasonTitle.
  ///
  /// In en, this message translates to:
  /// **'My Quit Declaration'**
  String get homeQuitReasonTitle;

  /// No description provided for @homeQuitReasonPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t written your quit declaration yet.'**
  String get homeQuitReasonPlaceholder;

  /// No description provided for @homeDailyCheckInTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Check-in'**
  String get homeDailyCheckInTitle;

  /// No description provided for @homeDailyCheckInPrompt.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today? Log your progress!'**
  String get homeDailyCheckInPrompt;

  /// No description provided for @homeDailyCheckInButton.
  ///
  /// In en, this message translates to:
  /// **'Check-in'**
  String get homeDailyCheckInButton;

  /// No description provided for @homeDailyCheckInConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Checked in successfully, great job!'**
  String get homeDailyCheckInConfirmation;

  /// No description provided for @homeDailyCheckInButtonCheckedIn.
  ///
  /// In en, this message translates to:
  /// **'Checked-in Today'**
  String get homeDailyCheckInButtonCheckedIn;

  /// No description provided for @homeDailyCheckInSuccessToast.
  ///
  /// In en, this message translates to:
  /// **'Check-in successful, awesome!'**
  String get homeDailyCheckInSuccessToast;

  /// No description provided for @homeDailyCheckInButtonError.
  ///
  /// In en, this message translates to:
  /// **'Retry Check-in'**
  String get homeDailyCheckInButtonError;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred.'**
  String get errorUnknown;

  /// No description provided for @homeEmergencyButton.
  ///
  /// In en, this message translates to:
  /// **'I Want to Smoke'**
  String get homeEmergencyButton;

  /// No description provided for @cravingCopingStrategiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Craving Management'**
  String get cravingCopingStrategiesTitle;

  /// No description provided for @cravingCopingStrategiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a strategy to help you get through this moment:'**
  String get cravingCopingStrategiesSubtitle;

  /// No description provided for @cravingStrategyBreathingTitle.
  ///
  /// In en, this message translates to:
  /// **'Deep Breathing Exercise'**
  String get cravingStrategyBreathingTitle;

  /// No description provided for @cravingStrategyBreathingDesc.
  ///
  /// In en, this message translates to:
  /// **'Take a moment to focus on your breath and reduce stress.'**
  String get cravingStrategyBreathingDesc;

  /// No description provided for @cravingStrategyWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Drink Water'**
  String get cravingStrategyWaterTitle;

  /// No description provided for @cravingStrategyWaterDesc.
  ///
  /// In en, this message translates to:
  /// **'Hydrating can help reduce cravings and keep your hands busy.'**
  String get cravingStrategyWaterDesc;

  /// No description provided for @cravingStrategyDistractionTitle.
  ///
  /// In en, this message translates to:
  /// **'Distraction Techniques'**
  String get cravingStrategyDistractionTitle;

  /// No description provided for @cravingStrategyDistractionDesc.
  ///
  /// In en, this message translates to:
  /// **'Simple activities to keep your mind off smoking.'**
  String get cravingStrategyDistractionDesc;

  /// No description provided for @cravingStrategyDistractionTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Try these distraction tips:'**
  String get cravingStrategyDistractionTipsTitle;

  /// No description provided for @cravingStrategyDistractionTip1Title.
  ///
  /// In en, this message translates to:
  /// **'Listen to Music'**
  String get cravingStrategyDistractionTip1Title;

  /// No description provided for @cravingStrategyDistractionTip1Desc.
  ///
  /// In en, this message translates to:
  /// **'Put on your favorite song or playlist and focus on the lyrics or melody.'**
  String get cravingStrategyDistractionTip1Desc;

  /// No description provided for @cravingStrategyDistractionTip2Title.
  ///
  /// In en, this message translates to:
  /// **'Take a Walk'**
  String get cravingStrategyDistractionTip2Title;

  /// No description provided for @cravingStrategyDistractionTip2Desc.
  ///
  /// In en, this message translates to:
  /// **'Even a short 5-minute walk can help reduce cravings significantly.'**
  String get cravingStrategyDistractionTip2Desc;

  /// No description provided for @cravingStrategyDistractionTip3Title.
  ///
  /// In en, this message translates to:
  /// **'Call a Friend'**
  String get cravingStrategyDistractionTip3Title;

  /// No description provided for @cravingStrategyDistractionTip3Desc.
  ///
  /// In en, this message translates to:
  /// **'Reach out to someone supportive who can help take your mind off smoking.'**
  String get cravingStrategyDistractionTip3Desc;

  /// No description provided for @cravingStrategyCompleted.
  ///
  /// In en, this message translates to:
  /// **'Great job! You\'ve successfully completed this coping strategy.'**
  String get cravingStrategyCompleted;

  /// No description provided for @cravingLogButtonText.
  ///
  /// In en, this message translates to:
  /// **'Log This Craving'**
  String get cravingLogButtonText;

  /// No description provided for @breathingExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Deep Breathing Exercise'**
  String get breathingExerciseTitle;

  /// No description provided for @breathingExerciseInstruction.
  ///
  /// In en, this message translates to:
  /// **'Follow the circle\'s rhythm for a 1-minute guided breathing exercise.'**
  String get breathingExerciseInstruction;

  /// No description provided for @breathingPhaseInhale.
  ///
  /// In en, this message translates to:
  /// **'Inhale'**
  String get breathingPhaseInhale;

  /// No description provided for @breathingPhaseHold.
  ///
  /// In en, this message translates to:
  /// **'Hold'**
  String get breathingPhaseHold;

  /// No description provided for @breathingPhaseExhale.
  ///
  /// In en, this message translates to:
  /// **'Exhale'**
  String get breathingPhaseExhale;

  /// No description provided for @breathingExerciseTimeRemaining.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds remaining'**
  String breathingExerciseTimeRemaining(String seconds);

  /// No description provided for @breathingExerciseCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise Complete!'**
  String get breathingExerciseCompletedTitle;

  /// No description provided for @breathingExerciseCompleted.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get breathingExerciseCompleted;

  /// No description provided for @breathingExerciseCompletedDesc.
  ///
  /// In en, this message translates to:
  /// **'You\'ve successfully completed the breathing exercise. How do you feel now?'**
  String get breathingExerciseCompletedDesc;

  /// No description provided for @breathingExerciseFinishEarly.
  ///
  /// In en, this message translates to:
  /// **'Finish Early'**
  String get breathingExerciseFinishEarly;

  /// No description provided for @backToStrategiesButton.
  ///
  /// In en, this message translates to:
  /// **'Back to Strategies'**
  String get backToStrategiesButton;

  /// No description provided for @cravingLogTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Your Craving'**
  String get cravingLogTitle;

  /// No description provided for @cravingLogIntensityLabel.
  ///
  /// In en, this message translates to:
  /// **'How strong is your craving? (1-5)'**
  String get cravingLogIntensityLabel;

  /// No description provided for @cravingLogIntensityLow.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get cravingLogIntensityLow;

  /// No description provided for @cravingLogIntensityHigh.
  ///
  /// In en, this message translates to:
  /// **'Very Strong'**
  String get cravingLogIntensityHigh;

  /// No description provided for @cravingLogTriggerLabel.
  ///
  /// In en, this message translates to:
  /// **'What triggered this craving?'**
  String get cravingLogTriggerLabel;

  /// No description provided for @cravingLogTriggerStress.
  ///
  /// In en, this message translates to:
  /// **'Stress'**
  String get cravingLogTriggerStress;

  /// No description provided for @cravingLogTriggerBoredom.
  ///
  /// In en, this message translates to:
  /// **'Boredom'**
  String get cravingLogTriggerBoredom;

  /// No description provided for @cravingLogTriggerSocial.
  ///
  /// In en, this message translates to:
  /// **'Social Situation'**
  String get cravingLogTriggerSocial;

  /// No description provided for @cravingLogTriggerMeal.
  ///
  /// In en, this message translates to:
  /// **'After Meal'**
  String get cravingLogTriggerMeal;

  /// No description provided for @cravingLogTriggerAlcohol.
  ///
  /// In en, this message translates to:
  /// **'Alcohol'**
  String get cravingLogTriggerAlcohol;

  /// No description provided for @cravingLogTriggerCoffee.
  ///
  /// In en, this message translates to:
  /// **'Coffee/Tea'**
  String get cravingLogTriggerCoffee;

  /// No description provided for @cravingLogTriggerOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get cravingLogTriggerOther;

  /// No description provided for @cravingLogNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get cravingLogNotesLabel;

  /// No description provided for @cravingLogNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Write any additional thoughts or feelings...'**
  String get cravingLogNotesHint;

  /// No description provided for @cravingLogSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Craving log saved successfully!'**
  String get cravingLogSavedMessage;

  /// No description provided for @dialogCloseButton.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get dialogCloseButton;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;

  /// No description provided for @saveButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButtonLabel;

  /// No description provided for @achievementUnlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievement Unlocked!'**
  String get achievementUnlockedTitle;

  /// No description provided for @continueButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButtonLabel;

  /// No description provided for @achievement7DaysName.
  ///
  /// In en, this message translates to:
  /// **'First Week Free'**
  String get achievement7DaysName;

  /// No description provided for @achievement7DaysDesc.
  ///
  /// In en, this message translates to:
  /// **'Smoke-free for 7 consecutive days'**
  String get achievement7DaysDesc;

  /// No description provided for @achievement7DaysStory.
  ///
  /// In en, this message translates to:
  /// **'The first week is often the hardest part of quitting. You\'ve proven your commitment to yourself and your health. This is a major milestone!'**
  String get achievement7DaysStory;

  /// No description provided for @achievement30DaysName.
  ///
  /// In en, this message translates to:
  /// **'One Month Milestone'**
  String get achievement30DaysName;

  /// No description provided for @achievement30DaysDesc.
  ///
  /// In en, this message translates to:
  /// **'Smoke-free for 30 consecutive days'**
  String get achievement30DaysDesc;

  /// No description provided for @achievement30DaysStory.
  ///
  /// In en, this message translates to:
  /// **'One month smoke-free! Your lung function is improving, your circulation is better, and you\'re forming powerful new habits. Keep going!'**
  String get achievement30DaysStory;

  /// No description provided for @achievement100DaysName.
  ///
  /// In en, this message translates to:
  /// **'100 Days Club'**
  String get achievement100DaysName;

  /// No description provided for @achievement100DaysDesc.
  ///
  /// In en, this message translates to:
  /// **'Smoke-free for 100 days'**
  String get achievement100DaysDesc;

  /// No description provided for @achievement100DaysStory.
  ///
  /// In en, this message translates to:
  /// **'100 days without smoking is an incredible achievement. Your body has significantly recovered, and the smoke-free lifestyle is becoming your second nature.'**
  String get achievement100DaysStory;

  /// No description provided for @appSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettingsTitle;

  /// No description provided for @notificationsSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsSettingTitle;

  /// No description provided for @notificationsSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage quit reminders and achievement notifications'**
  String get notificationsSettingSubtitle;

  /// No description provided for @languageSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSettingTitle;

  /// No description provided for @languageSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change application language'**
  String get languageSettingSubtitle;

  /// No description provided for @themeSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeSettingTitle;

  /// No description provided for @themeSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle light/dark theme'**
  String get themeSettingSubtitle;

  /// No description provided for @healthDataSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Data Settings'**
  String get healthDataSettingsTitle;

  /// No description provided for @smokingDataSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Smoking Data'**
  String get smokingDataSettingTitle;

  /// No description provided for @smokingDataSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update daily cigarettes and cigarette price'**
  String get smokingDataSettingSubtitle;

  /// No description provided for @quitDateSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Quit Date'**
  String get quitDateSettingTitle;

  /// No description provided for @quitDateSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change your quit start date'**
  String get quitDateSettingSubtitle;

  /// No description provided for @resetDataSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Data'**
  String get resetDataSettingTitle;

  /// No description provided for @resetDataSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reset all quit progress data'**
  String get resetDataSettingSubtitle;

  /// No description provided for @aboutAndSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'About & Support'**
  String get aboutAndSupportTitle;

  /// No description provided for @aboutAppSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutAppSettingTitle;

  /// No description provided for @aboutAppSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View app information and legal notices'**
  String get aboutAppSettingSubtitle;

  /// No description provided for @helpAndSupportSettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpAndSupportSettingTitle;

  /// No description provided for @helpAndSupportSettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get help and contact support'**
  String get helpAndSupportSettingSubtitle;

  /// No description provided for @privacyPolicySettingTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicySettingTitle;

  /// No description provided for @privacyPolicySettingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View our privacy policy'**
  String get privacyPolicySettingSubtitle;

  /// No description provided for @logoutButtonText.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButtonText;

  /// No description provided for @notificationTypesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Types'**
  String get notificationTypesTitle;

  /// No description provided for @achievementNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Achievement Notifications'**
  String get achievementNotificationsTitle;

  /// No description provided for @achievementNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when you unlock new achievements'**
  String get achievementNotificationsSubtitle;

  /// No description provided for @healthMilestoneNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Health Milestone Notifications'**
  String get healthMilestoneNotificationsTitle;

  /// No description provided for @healthMilestoneNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when you reach health improvement milestones'**
  String get healthMilestoneNotificationsSubtitle;

  /// No description provided for @dailyCheckInNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Check-in Reminders'**
  String get dailyCheckInNotificationsTitle;

  /// No description provided for @dailyCheckInNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get daily reminders to check in'**
  String get dailyCheckInNotificationsSubtitle;

  /// No description provided for @encouragementNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Encouragement Messages'**
  String get encouragementNotificationsTitle;

  /// No description provided for @encouragementNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive periodic encouragement messages'**
  String get encouragementNotificationsSubtitle;

  /// No description provided for @notificationTimeSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder Time Settings'**
  String get notificationTimeSettingsTitle;

  /// No description provided for @checkInReminderTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Check-in Reminder Time'**
  String get checkInReminderTimeTitle;

  /// No description provided for @doNotDisturbTitle.
  ///
  /// In en, this message translates to:
  /// **'Do Not Disturb Period'**
  String get doNotDisturbTitle;

  /// No description provided for @doNotDisturbSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Do Not Disturb Settings'**
  String get doNotDisturbSettingsTitle;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'CN': return AppLocalizationsZhCn();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
