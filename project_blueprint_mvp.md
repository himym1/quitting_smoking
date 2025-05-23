## 项目开发蓝图：焕新之旅 - Quit Journey (MVP)

**注意：** 本蓝图已根据用户反馈更新，加入了国际化 (i18n) 的考虑。在实际开发中，应首先分析项目中的现有代码，本蓝图作为后续开发和完善的指导。

### 1. 项目结构确认与细化

我们将基于技术文档中建议的 Clean Architecture 变种结构，并进行如下细化：

```mermaid
graph TD
    A[lib] --> B[main.dart]
    A --> C[app_widget.dart]
    A --> D[core]
    A --> E[data]
    A --> F[domain]
    A --> G[presentation]
    A --> H[generated]
    A --> L10N[l10n] %% Added for i18n
    L10N --> L10N1[app_en.arb]
    L10N --> L10N2[app_zh_CN.arb]


    D --> D1[config]
    D --> D2[constants]
    D2 --> D2_1[app_constants.dart]
    D2 --> D2_2[hive_constants.dart]
    D2 --> D2_3[asset_constants.dart]
    D --> D3[errors]
    D3 --> D3_1[failure.dart]
    D3 --> D3_2[exceptions.dart]
    D --> D4[router]
    D4 --> D4_1[app_router.dart]
    D --> D5[theme]
    D5 --> D5_1[app_theme.dart]
    D5 --> D5_2[app_colors.dart]
    D --> D6[utils]
    D6 --> D6_1[date_formatter.dart]
    D6 --> D6_2[calculation_helpers.dart]
    D --> D7[observers]
    D7 --> D7_1[riverpod_logger.dart]
    D --> D8[extensions]
    D --> D9[l10n_delegate] %% For AppLocalizations access if needed globally

    E --> E1[datasources]
    E1 --> E1_1[local]
    E1_1 --> E1_1_1[user_local_datasource.dart]
    E1_1 --> E1_1_2[app_local_datasource.dart]
    E1 --> E1_2[remote]
    E1_2 --> E1_2_1[auth_remote_datasource.dart]
    E1_2 --> E1_2_2[app_remote_datasource.dart]
    E --> E2[models]
    E2 --> E2_1[auth/]
    E2 --> E2_2[user/]
    E --> E3[repositories_impl]
    E3 --> E3_1[user_profile_repository_impl.dart]
    E3 --> E3_2[achievement_repository_impl.dart]

    F --> F1[entities]
    F1 --> F1_1[user_profile.dart]
    F1 --> F1_2[daily_check_in.dart]
    F1 --> F1_3[craving_log_entry.dart]
    F1 --> F1_4[achievement_definition.dart] %% Text fields need i18n
    F1 --> F1_5[unlocked_achievement.dart]
    F1 --> F1_6[health_benefit_milestone.dart] %% Text fields need i18n
    F --> F2[repositories]
    F2 --> F2_1[user_profile_repository.dart]
    F2 --> F2_2[achievement_repository.dart]
    F --> F3[usecases]
    F3 --> F3_1[auth/login_usecase.dart]
    F3 --> F3_2[home/get_dashboard_data_usecase.dart]

    G --> G0[shell]
    G0 --> G0_1[main_app_shell.dart]
    G --> G1[common_widgets]
    G1 --> G1_1[custom_card.dart]
    G1 --> G1_2[primary_button.dart] %% Text needs i18n
    G --> G2[features]
    G2 --> G2_Auth[auth]
    G2_Auth --> G2_Auth_Pages[pages]
    G2_Auth_Pages --> G2_Auth_Pages_1[splash_page.dart]
    G2_Auth_Pages --> G2_Auth_Pages_2[login_page.dart]
    G2_Auth_Pages --> G2_Auth_Pages_3[registration_page.dart]
    G2_Auth_Pages --> G2_Auth_Pages_4[onboarding_page.dart]
    G2_Auth --> G2_Auth_Widgets[widgets]
    G2_Auth_Widgets --> G2_Auth_Widgets_1[login_form.dart]
    G2_Auth --> G2_Auth_Providers[providers]
    G2_Auth_Providers --> G2_Auth_Providers_1[auth_notifier.dart]
    G2_Auth_Providers --> G2_Auth_Providers_2[onboarding_controller.dart]

    G2 --> G2_Home[home]
    G2_Home --> G2_Home_Pages[pages]
    G2_Home_Pages --> G2_Home_Pages_1[home_page.dart]
    G2_Home_Pages --> G2_Home_Pages_2[health_benefits_detail_page.dart]
    G2_Home --> G2_Home_Widgets[widgets]
    G2_Home --> G2_Home_Providers[providers]
    G2_Home_Providers --> G2_Home_Providers_1[home_dashboard_stats_provider.dart]

    G2 --> G2_Achievements[achievements]
    G2_Achievements --> G2_Ach_Pages[pages]
    G2_Ach_Pages --> G2_Ach_Pages_1[achievements_page.dart]
    G2_Achievements --> G2_Ach_Widgets[widgets]
    G2_Achievements --> G2_Ach_Providers[providers]
    G2_Ach_Providers --> G2_Ach_Providers_1[achievements_notifier.dart]

    G2 --> G2_Settings[settings]
    G2_Settings --> G2_Set_Pages[pages]
    G2_Set_Pages --> G2_Set_Pages_1[settings_page.dart]
    G2_Set_Pages --> G2_Set_Pages_2[edit_quit_info_page.dart]
    G2_Settings --> G2_Set_Widgets[widgets]
    G2_Settings --> G2_Set_Providers[providers]
    G2_Set_Providers --> G2_Set_Providers_1[theme_notifier.dart]

    A --> I[assets]
    I --> I1[fonts/]
    I --> I2[icons/]
    I --> I3[images/]
    I --> I4[lottie/]
    I --> I5[data/]
    I5 --> I5_1[health_benefits_en.json] %% Example for i18n data
    I5 --> I5_2[health_benefits_zh_CN.json]
```

**说明:**

*   **`lib/l10n/`**: 新增目录，用于存放 `.arb` 国际化资源文件 (e.g., `app_en.arb`, `app_zh_CN.arb`)。
*   **`lib/core/constants/`**: 细分为 `app_constants.dart` (通用常量), [`hive_constants.dart`](lib/core/constants/hive_constants.dart) (Hive Box 名称等), `asset_constants.dart` (资源路径)。
*   **`lib/core/l10n_delegate/`**: 可选，如果需要一个全局访问 `AppLocalizations` 的辅助类。
*   **`main.dart` / `app_widget.dart`**: 需要配置 `MaterialApp.router` 的 `localizationsDelegates` 和 `supportedLocales`。
*   **实体与通用组件中的文本**: 明确标注需要国际化处理。

### 2. MVP 核心功能模块与页面映射

```mermaid
graph TD
    M1[模块: 启动与认证 (Auth)] --> P1_1[启动页 (SplashScreen)]
    M1 --> P1_2[登录页 (LoginPage)]
    M1 --> P1_3[注册页 (RegistrationPage)]
    M1 --> P1_4[初始信息设置引导页 (OnboardingPage)]

    M2[模块: 首页 (Home)] --> P2_1[一级: 首页/主看板 (HomePage)]
    P2_1 --> P2_2[二级: 健康效益详情页 (HealthBenefitsDetailPage)]
    P2_1 --> P2_3[二级: 烟瘾应对策略选择页/弹窗 (CravingCopingStrategiesPage/Modal)]
    P2_3 --> P2_3_1[子模块: 深呼吸练习引导 (BreathingExerciseGuidePage/Modal)]
    P2_3 --> P2_3_2[子模块: (可选)极简小游戏 (MiniGamePage)]
    P2_1 --> P2_4[二级: 烟瘾记录模块/弹窗 (CravingLogPage/Modal)]

    M3[模块: 成就 (Achievements)] --> P3_1[一级: 成就墙/我的徽章页 (AchievementsPage)]
    P3_1 --> P3_2[交互元素: 成就解锁详情弹窗 (AchievementUnlockedModal)]

    M4[模块: 设置 (Settings)] --> P4_1[一级: 设置主页 (SettingsPage)]
    P4_1 --> P4_2[二级: 编辑戒烟信息页 (EditQuitInfoPage)]
    P4_1 --> P4_3[二级: 通知设置页 (NotificationSettingsPage)]
    P4_1 --> P4_4[二级: 意见反馈页 (FeedbackPage)]
    P4_1 --> P4_5[二级: 关于我们/版本信息页 (AboutUsPage)]

    M5[模块: 应用外壳 (AppShell)] --> P5_1[组件: 底部Tab导航栏 (MainAppShell)]
```

### 3. 核心数据实体 (Entities) 定义

所有实体都将使用 `freezed` 进行定义。需要本地持久化的实体将继承 `HiveObject`。**所有面向用户的文本字段都需要支持国际化。**

*   **`UserProfile`** ([`lib/domain/entities/user_profile.dart`](lib/domain/entities/user_profile.dart))
    *   **字段:**
        *   `userId`: String?
        *   `quitDateTime`: DateTime
        *   `dailyCigarettes`: int
        *   `packPrice`: double
        *   `smokingYears`: int?
        *   `quitReasonKey`: String (翻译键 for 戒烟宣言/理由)
        *   `isAnonymous`: bool (default: true)
        *   `onboardingCompleted`: bool (default: false)
    *   **`freezed`**: Yes
    *   **`HiveObject`**: Yes

*   **`DailyCheckIn`** ([`lib/domain/entities/daily_check_in.dart`](lib/domain/entities/daily_check_in.dart))
    *   **字段:**
        *   `id`: String (日期 `yyyy-MM-dd`)
        *   `date`: DateTime
        *   `timestamp`: DateTime
        *   `notesKey`: String? (翻译键 for 可选备注)
    *   **`freezed`**: Yes
    *   **`HiveObject`**: Yes

*   **`CravingLogEntry`** ([`lib/domain/entities/craving_log_entry.dart`](lib/domain/entities/craving_log_entry.dart))
    *   **字段:**
        *   `id`: String (UUID)
        *   `timestamp`: DateTime
        *   `triggerTagKeys`: List<String>? (翻译键列表 for 触发场景)
        *   `emotionTagKeys`: List<String>? (翻译键列表 for 情绪)
        *   `copingStrategyKey`: String? (翻译键 for 使用的应对策略)
        *   `intensity`: int?
    *   **`freezed`**: Yes
    *   **`HiveObject`**: Yes

*   **`AchievementDefinition`** ([`lib/domain/entities/achievement_definition.dart`](lib/domain/entities/achievement_definition.dart))
    *   **字段:**
        *   `id`: String
        *   `nameKey`: String (翻译键 for 成就名称)
        *   `descriptionKey`: String (翻译键 for 成就描述)
        *   `iconLockedAssetPath`: String
        *   `iconUnlockedAssetPath`: String
        *   `unlockCondition`: Map<String, dynamic>
        *   `storyKey`: String? (翻译键 for 鼓励文字)
    *   **`freezed`**: Yes
    *   **`HiveObject`**: No (预置数据，从支持多语言的JSON加载)
    *   **i18n JSON 示例 (`assets/data/achievement_definitions.json`):**
        ```json
        [
          {
            "id": "ach_7_days",
            "nameKey": "achievement_7_days_name",
            "descriptionKey": "achievement_7_days_desc",
            "iconLockedAssetPath": "assets/icons/ach_locked.svg",
            "iconUnlockedAssetPath": "assets/icons/ach_7_days_unlocked.svg",
            "unlockCondition": {"type": "consecutive_no_smoke_days", "value": 7},
            "storyKey": "achievement_7_days_story"
          }
        ]
        ```
        对应的 `.arb` 文件中应有 `achievement_7_days_name`, `achievement_7_days_desc` 等键。

*   **`UnlockedAchievement`** ([`lib/domain/entities/unlocked_achievement.dart`](lib/domain/entities/unlocked_achievement.dart))
    *   **字段:**
        *   `achievementId`: String
        *   `unlockDate`: DateTime
    *   **`freezed`**: Yes
    *   **`HiveObject`**: Yes

*   **`HealthBenefitMilestone`** ([`lib/domain/entities/health_benefit_milestone.dart`](lib/domain/entities/health_benefit_milestone.dart))
    *   **字段:**
        *   `id`: String
        *   `timeThreshold`: Duration
        *   `titleKey`: String (翻译键 for 里程碑标题)
        *   `descriptionKey`: String (翻译键 for 详细描述)
        *   `iconAssetPath`: String
        *   `sourceKey`: String? (翻译键 for 数据来源)
    *   **`freezed`**: Yes
    *   **`HiveObject`**: No (预置数据，从支持多语言的JSON加载)
    *   **i18n JSON 示例 (`assets/data/health_benefits.json`):**
        ```json
        [
          {
            "id": "hb_20_min",
            "timeThreshold": {"minutes": 20},
            "titleKey": "health_benefit_20_min_title",
            "descriptionKey": "health_benefit_20_min_desc",
            "iconAssetPath": "assets/icons/hb_heart.svg"
          }
        ]
        ```

### 4. 状态管理 (Riverpod) 初步规划

(Mermaid图与之前类似，此处省略以减少重复，核心是Provider提供的数据需要能处理国际化文本的获取)

**主要 Providers/Notifiers (国际化注意事项):**
*   当Provider暴露的是包含用户可见文本的实体列表 (如 `healthBenefitsProvider`, `achievementDefinitionsProvider`) 时，UI层在消费这些数据时，需要使用实体中的翻译键通过 `AppLocalizations.of(context)!` 来获取实际显示的字符串。
*   Notifiers内部如果生成用户可见的错误信息或提示，也应使用翻译键。

### 5. 路由管理 (GoRouter) 初步规划

(Mermaid图与之前类似，路由本身不受i18n直接影响，但页面标题等由页面自身处理i18n)

**主要路由配置 (`lib/core/router/app_router.dart`):**
*   配置与之前类似。页面标题等将由各个页面Widget在其 `build` 方法中使用 `AppLocalizations.of(context)!` 设置。

### 6. 分阶段开发顺序建议

```mermaid
gantt
    dateFormat  YYYY-MM-DD
    title MVP 开发阶段与顺序 (含i18n)

    section Foundation
    项目初始化与基础配置 :crit, S0, 2024-05-22, 4d
    认证流程 (Splash, Login, Register) :S1, after S0, 5d
    初始信息设置引导页 (Onboarding) :S2, after S1, 4d

    section Core Features
    主应用框架 (App Shell) & 首页核心数据 :S3, after S2, 4d
    首页: 每日打卡 & 健康效益 :S4, after S3, 5d
    首页: 烟瘾管理 (含应对策略, 记录) :S5, after S4, 5d
    成就模块 (墙, 解锁弹窗) :S6, after S5, 5d
    设置模块 (基础页面, 主题切换) :S7, after S6, 4d

    section Polish & Finalize
    通用功能 (通知雏形) & 完善 :S8, after S7, 5d
    测试 (Unit, Widget, Integration) :S9, during S4 S8, 10d
    UI/UX 整体打磨与文档 :S10, after S8, 3d
```

1.  **阶段 0: 项目初始化与基础配置** (4 days)
    *   Flutter项目创建, 依赖引入 (`flutter_localizations` 等), Linting, 核心目录结构。
    *   **配置国际化支持**: 设置 `MaterialApp` 的 `localizationsDelegates` 和 `supportedLocales` (e.g., `en`, `zh_CN`)。创建 `l10n/` 目录及初始 `.arb` 文件 (如 `app_en.arb`, `app_zh_CN.arb`)。配置 `flutter gen-l10n` 或类似工具生成 `AppLocalizations` 类。
    *   `main.dart`, `app_widget.dart`, `AppTheme` (雏形), `GoRouter` (Splash路由)。
    *   `Failure`类, `build_runner`配置。
2.  **阶段 1: 认证流程** (5 days)
    *   `UserProfile`实体 (含i18n考虑的字段如 `quitReasonKey`)。
    *   `AuthRepository`, `UserProfileRepository` (Hive)。
    *   `SplashScreen`, `LoginPage`, `RegistrationPage` UI与逻辑 (所有文本使用i18n字符串)。
    *   `authNotifierProvider`实现。
    *   相关路由与重定向。
3.  **阶段 2: 初始信息设置引导页 (Onboarding)** (4 days)
    *   完善 `UserProfile`。
    *   `OnboardingPage` UI与多步骤逻辑 (所有文本使用i18n字符串)。
    *   `onboardingControllerProvider`。
4.  **阶段 3: 主应用框架 (App Shell) 与首页模块核心** (4 days)
    *   `MainAppShell` (底部导航，Tab标题使用i18n)。
    *   `HomePage` 基础布局, 展示用户宣言 (通过 `quitReasonKey` 获取i18n文本), 戒烟时长, 节省金额/数量。
5.  **阶段 4: 首页模块 - 每日打卡与健康效益** (5 days)
    *   `DailyCheckIn`, `HealthBenefitMilestone` (含i18n文本键) 实体。预置多语言JSON数据。
    *   相关 Repositories。
    *   首页打卡区域UI与逻辑 (i18n文本)。
    *   首页健康效益快览UI, `HealthBenefitsDetailPage` (i18n文本)。
6.  **阶段 5: 首页模块 - 烟瘾管理** (5 days)
    *   `CravingLogEntry` (含i18n文本键) 实体。
    *   “我想吸烟”按钮 (i18n文本), 烟瘾应对策略选择页/弹窗 (i18n文本), 深呼吸引导, 烟瘾记录模块/弹窗 (i18n文本)。
7.  **阶段 6: 成就模块** (5 days)
    *   `AchievementDefinition`, `UnlockedAchievement` (含i18n文本键) 实体。预置多语言JSON数据。
    *   `AchievementsPage` UI (成就墙, i18n文本), 成就解锁弹窗/动画 (i18n文本)。
8.  **阶段 7: 设置模块** (4 days)
    *   `SettingsPage` UI (列表项i18n文本), `EditQuitInfoPage` (i18n文本)。
    *   `NotificationSettingsPage` (UI雏形, i18n文本), `FeedbackPage` (UI雏形, i18n文本), `AboutUsPage` (i18n文本)。
    *   `themeNotifierProvider` 实现主题切换。
9.  **阶段 8: 通用功能与完善** (5 days)
    *   本地通知: 消息内容需支持i18n。
    *   全局错误处理与用户提示 (i18n文本)。
10. **并行阶段: 测试与文档**
    *   测试需覆盖不同语言环境下的UI显示。

### 7. 通用组件识别

*   **`AppCard` / `CustomCardWidget`**
*   **`PrimaryButton`**: `text` 参数应为国际化后的字符串。
*   **`SecondaryButton` / `OutlinedButtonStyled`**: `text` 参数应为国际化后的字符串。
*   **`TextButtonWithIcon`**: `text` 参数应为国际化后的字符串。
*   **`CustomTextField` / `LabeledTextField`**: `labelText`, `hintText`, `errorText` 等应为国际化后的字符串。
*   **`StepIndicator`**
*   **`LoadingIndicator` / `FullScreenLoader`**
*   **`EmptyStateWidget`**: 内部提示文本应为国际化后的字符串。
*   **`SectionTitle`**: 文本应为国际化后的字符串。
*   **`IconTextRow` / `IconTextColumn`**: 文本应为国际化后的字符串。
*   **`BottomSheetWrapper` / `DialogWrapper`**: 标题等文本应为国际化后的字符串。
*   **`LottieAnimation`**

---