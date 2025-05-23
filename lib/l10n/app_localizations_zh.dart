// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '焕新之旅';

  @override
  String get helloWorld => '你好，世界！';

  @override
  String get onboardingTitle => '欢迎使用焕新之旅';

  @override
  String get homeTab => '首页';

  @override
  String get achievementsTab => '成就';

  @override
  String get settingsTab => '设置';

  @override
  String get appSlogan => '戒除成瘾，焕发生活，从每一次呼吸开始。';

  @override
  String get loadingYourFuture => '正在加载无烟的未来...';

  @override
  String get loginPageTitle => '登录';

  @override
  String get welcomeBack => '欢迎回来！';

  @override
  String get loginToContinue => '登录以继续您的焕新之旅。';

  @override
  String get emailLabel => '邮箱';

  @override
  String get emailHint => '请输入您的邮箱';

  @override
  String get passwordLabel => '密码';

  @override
  String get passwordHint => '请输入您的密码';

  @override
  String get loginButtonText => '登录';

  @override
  String get forgotPasswordButtonText => '忘记密码？';

  @override
  String get orText => '或';

  @override
  String get navigateToRegisterPrompt => '还没有账户？';

  @override
  String get navigateToRegisterLink => '注册';

  @override
  String get invalidCredentialsError => '邮箱或密码无效。';

  @override
  String get loginFailedError => '登录失败，请重试。';

  @override
  String get fieldRequiredError => '此字段不能为空。';

  @override
  String get invalidEmailFormatError => '邮箱格式无效。';

  @override
  String get registrationPageTitle => '创建账户';

  @override
  String get createYourAccount => '创建您的账户';

  @override
  String get confirmPasswordLabel => '确认密码';

  @override
  String get confirmPasswordHint => '再次输入您的密码';

  @override
  String get registerButtonText => '注册';

  @override
  String get navigateToLoginPrompt => '已有账户？';

  @override
  String get navigateToLoginLink => '登录';

  @override
  String get passwordMismatchError => '两次输入的密码不一致。';

  @override
  String get emailAlreadyInUseError => '此邮箱已被注册。';

  @override
  String get registrationFailedError => '注册失败，请重试。';

  @override
  String get termsAndConditionsCheckboxLabel => '我已阅读并同意[服务条款]和[隐私政策]。';

  @override
  String get onboardingPageTitle => '初始设置';

  @override
  String get nextButtonText => '下一步';

  @override
  String get backButtonText => '上一步';

  @override
  String get finishButtonText => '完成并开启焕新之旅';

  @override
  String get step1Title => '您想什么时候开始戒烟？';

  @override
  String get step1Description => '选择一个确切的日期和时间，作为您焕新之旅的起点。';

  @override
  String get selectDateButton => '选择日期';

  @override
  String get selectTimeButton => '选择时间';

  @override
  String get step2Title => '您通常每天吸多少支烟？';

  @override
  String get step2Description => '这将帮助我们计算您未来的健康和经济收益。';

  @override
  String get dailyCigarettesLabel => '每日吸烟量 (支)';

  @override
  String get step3Title => '您常买的香烟每包多少钱？';

  @override
  String get step3Description => '我们会帮您追踪戒烟后节省的开销。';

  @override
  String get packPriceLabel => '每包价格';

  @override
  String get step4Title => '您的烟龄有多久了？';

  @override
  String get step4Description => '(可选) 此信息有助于更全面了解您的情况。';

  @override
  String get smokingYearsLabel => '烟龄 (年)';

  @override
  String get step5Title => '是什么激励您戒烟？';

  @override
  String get step5Description => '写下您的戒烟宣言！当您动摇时，它可以给您力量。';

  @override
  String get quitReasonHint => '我的戒烟理由是...';

  @override
  String get fieldCannotBeEmpty => '此项不能为空。';

  @override
  String get pleaseSelectDateTime => '请选择日期和时间。';

  @override
  String get invalidNumberError => '请输入有效的数字。';

  @override
  String get numberMustBePositiveError => '请输入大于零的数字。';

  @override
  String get tooManyDecimalPlacesError => '请输入最多包含两位小数的值。';

  @override
  String get numberCannotBeNegativeError => '请输入非负数字。';

  @override
  String get genericError => '发生未知错误，请重试。';

  @override
  String get bottomNavHome => '首页';

  @override
  String get bottomNavAchievements => '成就';

  @override
  String get bottomNavSettings => '设置';

  @override
  String get homePageTitle => '首页';

  @override
  String get achievementsPageTitle => '我的成就';

  @override
  String get settingsPageTitle => '设置';

  @override
  String get homeProgressTitle => '我的戒烟进度';

  @override
  String homeProgressTime(String days, String hours, String minutes, String seconds) {
    return '已戒烟 $days天 $hours小时 $minutes分钟 $seconds秒';
  }

  @override
  String homeProgressMoneySaved(String amount) {
    return '已节省金额：¥$amount';
  }

  @override
  String homeProgressCigarettesNotSmoked(String count) {
    return '少吸烟支数：$count支';
  }

  @override
  String homeProgressLifeGained(String days) {
    return '预估延长寿命：$days天';
  }

  @override
  String get homeHealthBenefitsTitle => '健康效益快览';

  @override
  String get homeHealthBenefit1Title => '心率和血压';

  @override
  String get homeHealthBenefit1Desc => '心率和血压已开始下降。';

  @override
  String get homeHealthBenefit2Title => '一氧化碳水平';

  @override
  String get homeHealthBenefit2Desc => '血液中一氧化碳水平已恢复正常。';

  @override
  String get homeHealthBenefitsNothingToShow => '继续加油！您的健康效益将很快在此展示。';

  @override
  String get healthBenefitsDetailPageTitle => '健康效益详情';

  @override
  String get healthBenefitsDetailPlaceholderTitle => '更多详情即将推出！';

  @override
  String get healthBenefitsDetailPlaceholderDesc => '此页面将显示所有已达成和即将达成的健康效益的时间轴和详细说明。';

  @override
  String get healthBenefitTitle_20mins => '心率恢复正常';

  @override
  String get healthBenefitDesc_20mins => '20分钟后，您的心率和血压开始回落到正常水平。';

  @override
  String get healthBenefitTitle_8hours => '血氧水平回升';

  @override
  String get healthBenefitDesc_8hours => '8小时后，血液中的一氧化碳水平减半，血氧水平恢复正常。';

  @override
  String get healthBenefitTitle_24hours => '心脏病风险降低';

  @override
  String get healthBenefitDesc_24hours => '24小时后，您心脏病发作的风险开始降低。';

  @override
  String get healthBenefitTitle_48hours => '神经末梢再生';

  @override
  String get healthBenefitDesc_48hours => '48小时后，神经末梢开始再生，您的嗅觉和味觉开始改善。';

  @override
  String get healthBenefitTitle_2weeks => '血液循环改善';

  @override
  String get healthBenefitDesc_2weeks => '2周到3个月，您的血液循环改善，肺功能有所增强。';

  @override
  String get healthBenefitTitle_1month => '肺部开始清洁';

  @override
  String get healthBenefitDesc_1month => '1个月后，你的肺部毛细支气管开始修复，纤毛重新生长，肺部开始清除积累的黏液和细菌。';

  @override
  String get homeQuitReasonTitle => '我的戒烟宣言';

  @override
  String get homeQuitReasonPlaceholder => '您还没有填写戒烟宣言。';

  @override
  String get homeDailyCheckInTitle => '每日打卡';

  @override
  String get homeDailyCheckInPrompt => '今天感觉怎么样？记录您的坚持！';

  @override
  String get homeDailyCheckInButton => '打卡';

  @override
  String get homeDailyCheckInConfirmation => '打卡成功，太棒了！';

  @override
  String get homeDailyCheckInButtonCheckedIn => '今日已打卡';

  @override
  String get homeDailyCheckInSuccessToast => '打卡成功，太棒了！';

  @override
  String get homeDailyCheckInButtonError => '重试打卡';

  @override
  String get errorUnknown => '发生未知错误。';

  @override
  String get homeEmergencyButton => '我想吸烟';

  @override
  String get cravingCopingStrategiesTitle => '烟瘾管理';

  @override
  String get cravingCopingStrategiesSubtitle => '选择一种策略帮助您度过这一刻:';

  @override
  String get cravingStrategyBreathingTitle => '深呼吸练习';

  @override
  String get cravingStrategyBreathingDesc => '花点时间专注于呼吸，减轻压力。';

  @override
  String get cravingStrategyWaterTitle => '喝水';

  @override
  String get cravingStrategyWaterDesc => '补水可以帮助减轻烟瘾，并让您的手保持忙碌。';

  @override
  String get cravingStrategyDistractionTitle => '分散注意力技巧';

  @override
  String get cravingStrategyDistractionDesc => '简单的活动，让您的思维远离吸烟。';

  @override
  String get cravingStrategyDistractionTipsTitle => '尝试这些分散注意力的技巧:';

  @override
  String get cravingStrategyDistractionTip1Title => '听音乐';

  @override
  String get cravingStrategyDistractionTip1Desc => '播放您喜欢的歌曲或播放列表，专注于歌词或旋律。';

  @override
  String get cravingStrategyDistractionTip2Title => '散步';

  @override
  String get cravingStrategyDistractionTip2Desc => '即使是短短5分钟的散步也能显著减轻烟瘾。';

  @override
  String get cravingStrategyDistractionTip3Title => '打电话给朋友';

  @override
  String get cravingStrategyDistractionTip3Desc => '联系一位支持您的人，帮助您将注意力从吸烟转移开。';

  @override
  String get cravingStrategyCompleted => '做得好！您已成功完成这个应对策略。';

  @override
  String get cravingLogButtonText => '记录此次烟瘾';

  @override
  String get breathingExerciseTitle => '深呼吸练习';

  @override
  String get breathingExerciseInstruction => '跟随圆圈的节奏进行1分钟的引导呼吸练习。';

  @override
  String get breathingPhaseInhale => '吸气';

  @override
  String get breathingPhaseHold => '屏息';

  @override
  String get breathingPhaseExhale => '呼气';

  @override
  String breathingExerciseTimeRemaining(String seconds) {
    return '剩余 $seconds 秒';
  }

  @override
  String get breathingExerciseCompletedTitle => '练习完成！';

  @override
  String get breathingExerciseCompleted => '做得好！';

  @override
  String get breathingExerciseCompletedDesc => '您已成功完成呼吸练习。现在感觉如何？';

  @override
  String get breathingExerciseFinishEarly => '提前结束';

  @override
  String get backToStrategiesButton => '返回策略列表';

  @override
  String get cravingLogTitle => '记录您的烟瘾';

  @override
  String get cravingLogIntensityLabel => '您的烟瘾有多强烈？(1-5)';

  @override
  String get cravingLogIntensityLow => '轻微';

  @override
  String get cravingLogIntensityHigh => '非常强烈';

  @override
  String get cravingLogTriggerLabel => '是什么触发了这次烟瘾？';

  @override
  String get cravingLogTriggerStress => '压力';

  @override
  String get cravingLogTriggerBoredom => '无聊';

  @override
  String get cravingLogTriggerSocial => '社交场合';

  @override
  String get cravingLogTriggerMeal => '饭后';

  @override
  String get cravingLogTriggerAlcohol => '饮酒';

  @override
  String get cravingLogTriggerCoffee => '咖啡/茶';

  @override
  String get cravingLogTriggerOther => '其他';

  @override
  String get cravingLogNotesLabel => '额外备注';

  @override
  String get cravingLogNotesHint => '记录任何其他想法或感受...';

  @override
  String get cravingLogSavedMessage => '烟瘾记录保存成功！';

  @override
  String get dialogCloseButton => '关闭';

  @override
  String get cancelButtonLabel => '取消';

  @override
  String get saveButtonLabel => '保存';

  @override
  String get achievementUnlockedTitle => '成就解锁！';

  @override
  String get continueButtonLabel => '继续';

  @override
  String get achievement7DaysName => '第一周无烟';

  @override
  String get achievement7DaysDesc => '连续7天不吸烟';

  @override
  String get achievement7DaysStory => '第一周通常是戒烟最困难的时期。你已经证明了对自己和健康的承诺。这是一个重要的里程碑！';

  @override
  String get achievement30DaysName => '一个月里程碑';

  @override
  String get achievement30DaysDesc => '连续30天不吸烟';

  @override
  String get achievement30DaysStory => '一个月不吸烟！你的肺功能正在改善，血液循环更好，你正在形成强大的新习惯。继续加油！';

  @override
  String get achievement100DaysName => '百日俱乐部';

  @override
  String get achievement100DaysDesc => '连续100天不吸烟';

  @override
  String get achievement100DaysStory => '100天不吸烟是一项令人难以置信的成就。你的身体已经显著恢复，无烟的生活方式正在成为你的第二天性。';

  @override
  String get appSettingsTitle => '应用设置';

  @override
  String get notificationsSettingTitle => '通知设置';

  @override
  String get notificationsSettingSubtitle => '管理戒烟提醒和成就通知';

  @override
  String get languageSettingTitle => '语言设置';

  @override
  String get languageSettingSubtitle => '更改应用语言';

  @override
  String get themeSettingTitle => '主题设置';

  @override
  String get themeSettingSubtitle => '切换浅色/深色主题';

  @override
  String get healthDataSettingsTitle => '健康数据设置';

  @override
  String get smokingDataSettingTitle => '吸烟数据';

  @override
  String get smokingDataSettingSubtitle => '更新每日香烟量和香烟价格';

  @override
  String get quitDateSettingTitle => '戒烟日期';

  @override
  String get quitDateSettingSubtitle => '更改您的戒烟开始日期';

  @override
  String get resetDataSettingTitle => '重置数据';

  @override
  String get resetDataSettingSubtitle => '重置所有戒烟进度数据';

  @override
  String get aboutAndSupportTitle => '关于和支持';

  @override
  String get aboutAppSettingTitle => '关于应用';

  @override
  String get aboutAppSettingSubtitle => '版本信息和开发者';

  @override
  String get helpAndSupportSettingTitle => '帮助和支持';

  @override
  String get helpAndSupportSettingSubtitle => '获取帮助或报告问题';

  @override
  String get privacyPolicySettingTitle => '隐私政策';

  @override
  String get privacyPolicySettingSubtitle => '了解我们如何保护您的数据';

  @override
  String get logoutButtonText => '退出登录';

  @override
  String get notificationTypesTitle => '通知类型';

  @override
  String get achievementNotificationsTitle => '成就提醒';

  @override
  String get achievementNotificationsSubtitle => '当你解锁新成就时收到通知';

  @override
  String get healthMilestoneNotificationsTitle => '健康里程碑提醒';

  @override
  String get healthMilestoneNotificationsSubtitle => '当达到健康改善里程碑时收到通知';

  @override
  String get dailyCheckInNotificationsTitle => '每日打卡提醒';

  @override
  String get dailyCheckInNotificationsSubtitle => '每天定时收到打卡提醒';

  @override
  String get encouragementNotificationsTitle => '鼓励消息';

  @override
  String get encouragementNotificationsSubtitle => '定期收到鼓励信息';

  @override
  String get notificationTimeSettingsTitle => '提醒时间设置';

  @override
  String get checkInReminderTimeTitle => '打卡提醒时间';

  @override
  String get doNotDisturbTitle => '免打扰时段';

  @override
  String get doNotDisturbSettingsTitle => '免打扰时段设置';

  @override
  String get startTime => '开始时间';

  @override
  String get endTime => '结束时间';

  @override
  String get settingsSaved => '设置已保存';

  @override
  String get cancel => '取消';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn(): super('zh_CN');

  @override
  String get appTitle => '焕新之旅';

  @override
  String get helloWorld => '你好，世界！';

  @override
  String get onboardingTitle => '欢迎来到焕新之旅';

  @override
  String get homeTab => '首页';

  @override
  String get achievementsTab => '成就';

  @override
  String get settingsTab => '设置';

  @override
  String get appSlogan => '告别烟瘾，焕新生活，从每一次呼吸开始。';

  @override
  String get loadingYourFuture => '正在加载您的无烟未来...';

  @override
  String get loginPageTitle => '登录';

  @override
  String get welcomeBack => '欢迎回来！';

  @override
  String get loginToContinue => '登录以继续您的焕新之旅。';

  @override
  String get emailLabel => '邮箱';

  @override
  String get emailHint => '请输入您的邮箱';

  @override
  String get passwordLabel => '密码';

  @override
  String get passwordHint => '请输入您的密码';

  @override
  String get loginButtonText => '登录';

  @override
  String get forgotPasswordButtonText => '忘记密码？';

  @override
  String get orText => '或';

  @override
  String get navigateToRegisterPrompt => '还没有账户？';

  @override
  String get navigateToRegisterLink => '注册';

  @override
  String get invalidCredentialsError => '邮箱或密码无效。';

  @override
  String get loginFailedError => '登录失败，请重试。';

  @override
  String get fieldRequiredError => '此字段不能为空。';

  @override
  String get invalidEmailFormatError => '邮箱格式无效。';

  @override
  String get registrationPageTitle => '创建账户';

  @override
  String get createYourAccount => '创建您的账户';

  @override
  String get confirmPasswordLabel => '确认密码';

  @override
  String get confirmPasswordHint => '再次输入您的密码';

  @override
  String get registerButtonText => '注册';

  @override
  String get navigateToLoginPrompt => '已有账户？';

  @override
  String get navigateToLoginLink => '登录';

  @override
  String get passwordMismatchError => '两次输入的密码不一致。';

  @override
  String get emailAlreadyInUseError => '此邮箱已被注册。';

  @override
  String get registrationFailedError => '注册失败，请重试。';

  @override
  String get termsAndConditionsCheckboxLabel => '我已阅读并同意[服务条款]和[隐私政策]。';

  @override
  String get onboardingPageTitle => '初始设置';

  @override
  String get nextButtonText => '下一步';

  @override
  String get backButtonText => '上一步';

  @override
  String get finishButtonText => '完成并开启焕新之旅';

  @override
  String get step1Title => '您想什么时候开始戒烟？';

  @override
  String get step1Description => '选择一个确切的日期和时间，作为您焕新之旅的起点。';

  @override
  String get selectDateButton => '选择日期';

  @override
  String get selectTimeButton => '选择时间';

  @override
  String get step2Title => '您通常每天吸多少支烟？';

  @override
  String get step2Description => '这将帮助我们计算您未来的健康和经济收益。';

  @override
  String get dailyCigarettesLabel => '每日吸烟量 (支)';

  @override
  String get step3Title => '您常买的香烟每包多少钱？';

  @override
  String get step3Description => '我们会帮您追踪戒烟后节省的开销。';

  @override
  String get packPriceLabel => '每包价格';

  @override
  String get step4Title => '您的烟龄有多久了？';

  @override
  String get step4Description => '(可选) 此信息有助于更全面了解您的情况。';

  @override
  String get smokingYearsLabel => '烟龄 (年)';

  @override
  String get step5Title => '是什么激励您戒烟？';

  @override
  String get step5Description => '写下您的戒烟宣言！当您动摇时，它可以给您力量。';

  @override
  String get quitReasonHint => '我的戒烟理由是...';

  @override
  String get fieldCannotBeEmpty => '此项不能为空。';

  @override
  String get pleaseSelectDateTime => '请选择日期和时间。';

  @override
  String get invalidNumberError => '请输入有效的数字。';

  @override
  String get numberMustBePositiveError => '请输入大于零的数字。';

  @override
  String get tooManyDecimalPlacesError => '请输入最多包含两位小数的值。';

  @override
  String get numberCannotBeNegativeError => '请输入非负数字。';

  @override
  String get genericError => '发生未知错误，请重试。';

  @override
  String get bottomNavHome => '首页';

  @override
  String get bottomNavAchievements => '成就';

  @override
  String get bottomNavSettings => '设置';

  @override
  String get homePageTitle => '首页';

  @override
  String get achievementsPageTitle => '我的成就';

  @override
  String get settingsPageTitle => '设置';

  @override
  String get homeProgressTitle => '我的戒烟进度';

  @override
  String homeProgressTime(String days, String hours, String minutes, String seconds) {
    return '已戒烟 $days天 $hours小时 $minutes分钟 $seconds秒';
  }

  @override
  String homeProgressMoneySaved(String amount) {
    return '已节省金额：¥$amount';
  }

  @override
  String homeProgressCigarettesNotSmoked(String count) {
    return '少吸烟支数：$count支';
  }

  @override
  String homeProgressLifeGained(String days) {
    return '预估延长寿命：$days天';
  }

  @override
  String get homeHealthBenefitsTitle => '健康效益快览';

  @override
  String get homeHealthBenefit1Title => '心率和血压';

  @override
  String get homeHealthBenefit1Desc => '心率和血压已开始下降。';

  @override
  String get homeHealthBenefit2Title => '一氧化碳水平';

  @override
  String get homeHealthBenefit2Desc => '血液中一氧化碳水平已恢复正常。';

  @override
  String get homeHealthBenefitsNothingToShow => '继续加油！您的健康效益将很快在此展示。';

  @override
  String get healthBenefitsDetailPageTitle => '健康效益详情';

  @override
  String get healthBenefitsDetailPlaceholderTitle => '更多详情即将推出！';

  @override
  String get healthBenefitsDetailPlaceholderDesc => '此页面将显示所有已达成和即将达成的健康效益的时间轴和详细说明。';

  @override
  String get healthBenefitTitle_20mins => '心率恢复正常';

  @override
  String get healthBenefitDesc_20mins => '20分钟后，您的心率和血压开始回落到正常水平。';

  @override
  String get healthBenefitTitle_8hours => '血氧水平回升';

  @override
  String get healthBenefitDesc_8hours => '8小时后，血液中的一氧化碳水平减半，血氧水平恢复正常。';

  @override
  String get healthBenefitTitle_24hours => '心脏病风险降低';

  @override
  String get healthBenefitDesc_24hours => '24小时后，您心脏病发作的风险开始降低。';

  @override
  String get healthBenefitTitle_48hours => '神经末梢再生';

  @override
  String get healthBenefitDesc_48hours => '48小时后，神经末梢开始再生，您的嗅觉和味觉开始改善。';

  @override
  String get healthBenefitTitle_2weeks => '血液循环改善';

  @override
  String get healthBenefitDesc_2weeks => '2周到3个月，您的血液循环改善，肺功能有所增强。';

  @override
  String get healthBenefitTitle_1month => '肺部开始清洁';

  @override
  String get healthBenefitDesc_1month => '1个月后，你的肺部毛细支气管开始修复，纤毛重新生长，肺部开始清除积累的黏液和细菌。';

  @override
  String get homeQuitReasonTitle => '我的戒烟宣言';

  @override
  String get homeQuitReasonPlaceholder => '您还没有填写戒烟宣言。';

  @override
  String get homeDailyCheckInTitle => '每日打卡';

  @override
  String get homeDailyCheckInPrompt => '今天感觉怎么样？记录您的坚持！';

  @override
  String get homeDailyCheckInButton => '打卡';

  @override
  String get homeDailyCheckInConfirmation => '打卡成功，太棒了！';

  @override
  String get homeDailyCheckInButtonCheckedIn => '今日已打卡';

  @override
  String get homeDailyCheckInSuccessToast => '打卡成功，太棒了！';

  @override
  String get homeDailyCheckInButtonError => '重试打卡';

  @override
  String get errorUnknown => '发生未知错误。';

  @override
  String get homeEmergencyButton => '我想吸烟';

  @override
  String get cravingCopingStrategiesTitle => '烟瘾管理';

  @override
  String get cravingCopingStrategiesSubtitle => '选择一种策略帮助您度过这一刻:';

  @override
  String get cravingStrategyBreathingTitle => '深呼吸练习';

  @override
  String get cravingStrategyBreathingDesc => '花点时间专注于呼吸，减轻压力。';

  @override
  String get cravingStrategyWaterTitle => '喝水';

  @override
  String get cravingStrategyWaterDesc => '补水可以帮助减轻烟瘾，并让您的手保持忙碌。';

  @override
  String get cravingStrategyDistractionTitle => '分散注意力技巧';

  @override
  String get cravingStrategyDistractionDesc => '简单的活动，让您的思维远离吸烟。';

  @override
  String get cravingStrategyDistractionTipsTitle => '尝试这些分散注意力的技巧:';

  @override
  String get cravingStrategyDistractionTip1Title => '听音乐';

  @override
  String get cravingStrategyDistractionTip1Desc => '播放您喜欢的歌曲或播放列表，专注于歌词或旋律。';

  @override
  String get cravingStrategyDistractionTip2Title => '散步';

  @override
  String get cravingStrategyDistractionTip2Desc => '即使是短短5分钟的散步也能显著减轻烟瘾。';

  @override
  String get cravingStrategyDistractionTip3Title => '打电话给朋友';

  @override
  String get cravingStrategyDistractionTip3Desc => '联系一位支持您的人，帮助您将注意力从吸烟转移开。';

  @override
  String get cravingStrategyCompleted => '做得好！您已成功完成这个应对策略。';

  @override
  String get cravingLogButtonText => '记录此次烟瘾';

  @override
  String get breathingExerciseTitle => '深呼吸练习';

  @override
  String get breathingExerciseInstruction => '跟随圆圈的节奏进行1分钟的引导呼吸练习。';

  @override
  String get breathingPhaseInhale => '吸气';

  @override
  String get breathingPhaseHold => '屏息';

  @override
  String get breathingPhaseExhale => '呼气';

  @override
  String breathingExerciseTimeRemaining(String seconds) {
    return '剩余 $seconds 秒';
  }

  @override
  String get breathingExerciseCompletedTitle => '练习完成！';

  @override
  String get breathingExerciseCompleted => '做得好！';

  @override
  String get breathingExerciseCompletedDesc => '您已成功完成呼吸练习。现在感觉如何？';

  @override
  String get breathingExerciseFinishEarly => '提前结束';

  @override
  String get backToStrategiesButton => '返回策略列表';

  @override
  String get cravingLogTitle => '记录您的烟瘾';

  @override
  String get cravingLogIntensityLabel => '您的烟瘾有多强烈？(1-5)';

  @override
  String get cravingLogIntensityLow => '轻微';

  @override
  String get cravingLogIntensityHigh => '非常强烈';

  @override
  String get cravingLogTriggerLabel => '是什么触发了这次烟瘾？';

  @override
  String get cravingLogTriggerStress => '压力';

  @override
  String get cravingLogTriggerBoredom => '无聊';

  @override
  String get cravingLogTriggerSocial => '社交场合';

  @override
  String get cravingLogTriggerMeal => '饭后';

  @override
  String get cravingLogTriggerAlcohol => '饮酒';

  @override
  String get cravingLogTriggerCoffee => '咖啡/茶';

  @override
  String get cravingLogTriggerOther => '其他';

  @override
  String get cravingLogNotesLabel => '额外备注';

  @override
  String get cravingLogNotesHint => '记录任何其他想法或感受...';

  @override
  String get cravingLogSavedMessage => '烟瘾记录保存成功！';

  @override
  String get dialogCloseButton => '关闭';

  @override
  String get cancelButtonLabel => '取消';

  @override
  String get saveButtonLabel => '保存';

  @override
  String get achievementUnlockedTitle => '成就解锁！';

  @override
  String get continueButtonLabel => '继续';

  @override
  String get achievement7DaysName => '第一周无烟';

  @override
  String get achievement7DaysDesc => '连续7天不吸烟';

  @override
  String get achievement7DaysStory => '第一周通常是戒烟最困难的时期。你已经证明了对自己和健康的承诺。这是一个重要的里程碑！';

  @override
  String get achievement30DaysName => '一个月里程碑';

  @override
  String get achievement30DaysDesc => '连续30天不吸烟';

  @override
  String get achievement30DaysStory => '一个月不吸烟！你的肺功能正在改善，血液循环更好，你正在形成强大的新习惯。继续加油！';

  @override
  String get achievement100DaysName => '百日俱乐部';

  @override
  String get achievement100DaysDesc => '连续100天不吸烟';

  @override
  String get achievement100DaysStory => '100天不吸烟是一项令人难以置信的成就。你的身体已经显著恢复，无烟的生活方式正在成为你的第二天性。';

  @override
  String get appSettingsTitle => '应用设置';

  @override
  String get notificationsSettingTitle => '通知设置';

  @override
  String get notificationsSettingSubtitle => '管理戒烟提醒和成就通知';

  @override
  String get languageSettingTitle => '语言设置';

  @override
  String get languageSettingSubtitle => '更改应用语言';

  @override
  String get themeSettingTitle => '主题设置';

  @override
  String get themeSettingSubtitle => '切换浅色/深色主题';

  @override
  String get healthDataSettingsTitle => '健康数据设置';

  @override
  String get smokingDataSettingTitle => '吸烟数据';

  @override
  String get smokingDataSettingSubtitle => '更新每日香烟量和香烟价格';

  @override
  String get quitDateSettingTitle => '戒烟日期';

  @override
  String get quitDateSettingSubtitle => '更改您的戒烟开始日期';

  @override
  String get resetDataSettingTitle => '重置数据';

  @override
  String get resetDataSettingSubtitle => '重置所有戒烟进度数据';

  @override
  String get aboutAndSupportTitle => '关于与支持';

  @override
  String get aboutAppSettingTitle => '关于应用';

  @override
  String get aboutAppSettingSubtitle => '查看应用信息和法律声明';

  @override
  String get helpAndSupportSettingTitle => '帮助与支持';

  @override
  String get helpAndSupportSettingSubtitle => '获取帮助和联系客服';

  @override
  String get privacyPolicySettingTitle => '隐私政策';

  @override
  String get privacyPolicySettingSubtitle => '查看我们的隐私政策';

  @override
  String get logoutButtonText => '退出登录';

  @override
  String get notificationTypesTitle => '通知类型';

  @override
  String get achievementNotificationsTitle => '成就通知';

  @override
  String get achievementNotificationsSubtitle => '当您解锁新成就时获得通知';

  @override
  String get healthMilestoneNotificationsTitle => '健康里程碑通知';

  @override
  String get healthMilestoneNotificationsSubtitle => '当您达到健康改善里程碑时获得通知';

  @override
  String get dailyCheckInNotificationsTitle => '每日打卡提醒';

  @override
  String get dailyCheckInNotificationsSubtitle => '获取每日打卡提醒';

  @override
  String get encouragementNotificationsTitle => '鼓励消息';

  @override
  String get encouragementNotificationsSubtitle => '接收定期鼓励消息';

  @override
  String get notificationTimeSettingsTitle => '提醒时间设置';

  @override
  String get checkInReminderTimeTitle => '打卡提醒时间';

  @override
  String get doNotDisturbTitle => '勿扰模式';

  @override
  String get doNotDisturbSettingsTitle => '勿扰时段设置';

  @override
  String get startTime => '开始时间';

  @override
  String get endTime => '结束时间';

  @override
  String get settingsSaved => '设置已保存';

  @override
  String get cancel => '取消';
}
