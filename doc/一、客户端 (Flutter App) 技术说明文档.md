# 一、客户端 (Flutter App) 技术说明文档

**项目名称：** 焕新之旅 - Quit Journey (Flutter App)
**版本：** 1.0
**目标平台：** Android, iOS

## 1. 项目概述

本项目是“焕新之旅”戒烟辅助应用的移动客户端，使用 Flutter 框架开发，旨在为用户提供跨平台的、流畅的戒烟支持体验。主要功能包括戒烟计划设定、实时进度追踪、健康效益展示、烟瘾管理、每日打卡、成就激励等。

## 2. 技术选型

-   **开发语言：** Dart
-   **UI 框架：** Flutter SDK
    -   **[ADDED] UI组件策略：** 优先使用Flutter内置Material/Cupertino组件。对于《UX设计文档》中频繁提及的“卡片式设计”，将封装通用的自定义`CardWidget`以保证风格统一。微动效和交互反馈主要依赖Flutter内置动画API (`AnimatedWidget`, `ImplicitlyAnimatedWidget`, `Transition`等)，复杂动画（如成就解锁、特定引导）可使用`lottie`。
-   **状态管理：** Riverpod (首选，提供强大的依赖注入和状态管理能力)
-   **路由管理：** GoRouter
-   **网络请求：** Dio (封装Service层进行API调用)
-   **本地存储：**
    -   `shared_preferences`: 存储用户偏好设置（如主题、通知开关）、首次启动标记等简单键值对。
    -   **[MODIFIED] `Hive`:** 作为主要的本地数据库，用于存储用户戒烟档案 (`UserProfile`)、戒烟日记 (`CravingLogEntry`)、烟瘾记录、成就数据 (`UnlockedAchievement`)、每日打卡记录 (`DailyCheckIn`)、健康效益数据等结构化或半结构化数据。因其纯Dart实现、性能优秀且易于使用。实体类将继承 `HiveObject` 以便高效存储。
        -   **[ADDED] 主要 Hive Boxes 规划:**
            -   `userProfileBox`: 存储 `UserProfile` 对象。
            -   `checkInsBox`: 存储 `DailyCheckIn` 记录。
            -   `cravingLogsBox`: 存储 `CravingLogEntry` 列表。
            -   `unlockedAchievementsBox`: 存储 `UnlockedAchievement` 列表。
            -   `appSettingsBox` (或使用 `shared_preferences`): 存储应用级设置。
-   **数据模型与序列化：**
    -   使用 `freezed` 生成不可变数据类 (Entities/Models) 和 `copyWith` 等辅助方法。
    -   使用 `json_serializable` 配合 `freezed` 自动生成 `fromJson/toJson` 方法。
-   **依赖注入：**
    -   **[MODIFIED] 主要利用 Riverpod 的 Provider 机制进行依赖注入，通常已能满足大部分需求。** (`get_it` + `injectable` 作为深入理解依赖注入模式的备选知识，但项目中优先统一使用Riverpod)。
-   **本地通知：** `flutter_local_notifications` 用于实现每日打卡提醒、成就达成提醒等。
-   **图标与资源：** SVG图标 (使用 `flutter_svg`), Lottie动画 (使用 `lottie`)。 **[ADDED] 注意资源文件的优化，如图片压缩、合理使用Lottie以控制包大小。**
-   **测试：**
    -   **单元测试:** `test` 包 (测试Domain层、部分Data层逻辑，如Notifiers/UseCases、数据计算逻辑)。
    -   **Widget测试:** `flutter_test` 包 (测试UI组件的渲染和交互，特别是自定义的`CardWidget`等)。
    -   **集成测试:** `integration_test` 包 (测试关键用户流程，如注册-登录-打卡-查看成就)。
-   **代码规范与静态分析：** `flutter_lints` 或自定义lint规则 (如 `very_good_analysis`)。

## 3. 项目结构 (遵循Clean Architecture变种)

**[FIXED CODE BLOCK FORMATTING]**
```text
lib/
  main.dart                 # App入口及顶层配置 (如Riverpod ProviderScope)
  app_widget.dart           # MaterialApp/CupertinoApp 定义，主题，路由配置等
  core/                     # 核心工具、常量、主题、错误处理、通用扩展等
    config/                 # 环境配置 (dev, prod API URLs等)
    router/                 # GoRouter 配置
    theme/                  # 主题配置 (AppTheme, AppColors)
    utils/                  # 通用工具类 (日期格式化, 计算帮助类等)
    errors/                 # Failure类定义，异常处理
    constants/              # 应用常量 (如Hive Box名称, 预设成就ID)
  data/                     # 数据层
    datasources/
      local/                # local_datasource.dart (Hive/shared_preferences 操作接口与实现)
      remote/               # remote_datasource.dart (Dio API调用接口与实现)
    models/                 # API响应模型 (DTOs, freezed生成, 通常用于remote)
    repositories_impl/      # Repository 接口的具体实现
  domain/                   # 领域层 (纯Dart)
    entities/               # 业务实体 (freezed生成, 可能继承HiveObject)
      user_profile.dart
      daily_check_in.dart
      craving_log_entry.dart
      achievement.dart      # (包含 UnlockedAchievement 和 AchievementDefinition)
      health_benefit.dart
    repositories/           # Repository 接口定义
    usecases/               # 业务用例 (连接Presentation和Repository)
  presentation/             # UI表现层
    common_widgets/         # 通用自定义Widget (e.g., CustomCardWidget, LoadingIndicator)
    features/               # 按功能模块划分 (e.g., auth, home, achievements, settings)
      [feature_name]/
        pages/              # 页面级Widget (Screens)
        widgets/            # 页面内可复用的小组件
        providers/          # [MODIFIED] 该功能模块相关的 Riverpod Providers/Notifiers
  generated/                # 由build_runner生成的代码 (如freezed, json_serializable, GoRouter)
assets/                   # 图片、字体、Lottie文件、预置数据 (如health_benefits.json)
test/                     # 测试代码 (结构与lib/对应)

```
## 4. 关键实现点与核心功能模块技术详述

#### 4.1 用户认证流程
-   API调用封装在`AuthRepository`中。
-   使用 `flutter_secure_storage` 安全存储认证Token (JWT)。
-   通过全局AuthProvider (如 `authNotifierProvider` from Riverpod) 管理用户登录状态，控制页面访问权限。
-   **[ADDED] 匿名用户数据迁移：**
    -   当匿名用户选择注册/登录时，App检查本地`Hive`是否存在匿名数据（如`UserProfile`、`DailyCheckIn`等）。
    -   若存在，提示用户是否将本地数据同步至云端账户（API需支持此操作）。MVP简化策略：可提示用户选择“覆盖本地并使用云端数据”或“上传本地数据至云端”（若云端无数据）。

#### 4.2 数据同步
-   优先从本地数据库加载数据以提高启动速度和离线体验。
-   在合适的时机（如App启动、网络恢复、关键用户操作后）与后端API进行数据同步。
-   **[MODIFIED] MVP同步策略：**
    -   **匿名用户数据：** 纯本地存储 (`Hive`)。
    -   **注册/登录：** 数据以服务端为准。首次登录时，若本地存在匿名数据，按4.1中策略处理。
    -   **后续操作：** 优先更新服务端，成功后更新本地缓存。对于读取操作，优先本地，后台静默同步。

#### 4.3 后台任务（有限）
-   利用 `flutter_local_notifications` 实现定时的本地通知（如每日打卡提醒、健康里程碑达成）。
-   **[ADDED] 明确：`flutter_local_notifications` 本身不执行后台Dart代码，仅在预设时间触发系统通知。若需后台执行Dart代码，则需 `workmanager` 或 `flutter_background_service`，但MVP阶段尽量避免复杂后台任务。**

#### 4.4 错误处理
-   定义统一的`Failure`类 (如 `ServerFailure`, `CacheFailure`, `LocalDataFailure`) 表示业务错误。
-   在Repository层面捕获数据源抛出的异常，并转换为具体的`Failure`对象。
-   UI层 (或Provider/Notifier) 根据`Failure`类型展示友好的错误提示 (如SnackBar, Dialog) 或引导操作。

#### 4.5 状态持久化 (Riverpod Provider)
-   对于需要跨App重启保留的 Riverpod Provider 状态 (特别是 `StateNotifier`):
    -   在 `Notifier` 的构造函数中，尝试从本地存储 (如 `Hive` 或 `shared_preferences`) 读取并初始化 `state`。
    -   监听状态变化 (如在 `Notifier` 内部的 `set state` 方法或重写 `addListener`)，在状态更新时，将新状态异步写入本地存储。
    -   可以封装一个 `PersistentStateNotifier` 基类来简化此逻辑。
    -   `@Riverpod(keepAlive: true)` 仅使Provider在无监听时保持状态，应用重启后仍会丢失，需配合手动持久化。

#### 4.6 实时进度追踪 (首页/主看板)
-   **数据源与计算:**
    -   戒烟开始时间、每日吸烟量、每包价格从 `UserProfile` (Hive) 读取。
    -   **戒烟时长:** 使用 `StreamProvider` 结合 `Stream.periodic(Duration(seconds: 1), (computationCount) => DateTime.now().difference(quitDateTime))` 实时更新。
    -   **节省金额/少吸烟支数:** 根据戒烟时长和用户设置动态计算，可封装在 `UserProfileNotifier` 或领域层工具类中。
-   **状态管理:** `userProfileNotifierProvider` 暴露用户档案数据，`homeDashboardStatsProvider` (或类似名称) 组合并暴露计算后的进度数据给UI。
-   **UI呈现:** 使用 `Text` Widget，配合 `intl` 包进行数字和货币格式化。

#### 4.7 健康效益展示 (首页快览及详情页)
-   **数据模型 (`HealthBenefitMilestone` entity):** 包含 `timeThreshold` (Duration), `title`, `description`, `iconName`。数据可预置在 `assets/data/health_benefits.json`，应用启动时加载并存入只读的 `Hive` Box 或由 `Provider` 管理。
-   **逻辑实现:**
    -   **首页快览：** `homeDashboardNotifierProvider` 根据当前戒烟时长筛选1-2个“当前/即将达成”的里程碑。
    -   **详情页：** 使用 `ListView.builder` 展示，通过比较戒烟时长与 `timeThreshold` 动态更新各里程碑的达成状态（UI上可表现为颜色变化、图标点亮）。时间轴效果可通过自定义Widget实现。
-   **状态管理:** `healthBenefitsProvider` 负责加载和提供所有健康效益数据。

#### 4.8 烟瘾管理与应对
-   **“我想吸烟”按钮:** UI使用醒目颜色，点击后 `GoRouter` 导航至烟瘾应对策略选择页/弹窗。
-   **烟瘾应对策略选择页/弹窗:**
    -   **深呼吸练习引导：** 导航至新页面或显示模态。使用 `AnimationController` 和 `AnimatedBuilder` 实现圆形放大缩小等视觉引导。
    -   **其他策略：** 文本提示或简单交互。
-   **烟瘾记录模块 (`CravingLogEntry` entity):** 包含 `timestamp`, `triggerTags` (List<String>), `emotionTags` (List<String>)。使用 `Hive` 存储。UI为模态弹窗 (`showModalBottomSheet`) 包含表单。
-   **状态管理:** `cravingLogNotifierProvider` 负责添加、读取烟瘾记录。

#### 4.9 每日打卡
-   **数据模型 (`DailyCheckIn` entity):** 包含 `date` (DateTime, 精确到日), `isCheckedIn` (bool)。存储于 `Hive` (`checkInsBox`)。
-   **逻辑实现:** `dailyCheckInNotifierProvider` 检查当天是否已打卡，更新UI。打卡后记录到 `Hive`，并提供即时反馈 (Lottie动画或SnackBar)。

#### 4.10 成就与徽章
-   **数据模型:**
    -   `AchievementDefinition` (entity): `id`, `name`, `description`, `unlockCondition` (如 `{ "type": "consecutive_days", "value": 7 }`), `iconLocked`, `iconUnlocked`。(预置数据)
    -   `UnlockedAchievement` (entity): `achievementId`, `unlockDate`。(存储于 `Hive`)
-   **逻辑实现:**
    -   **解锁判断：** 在相关数据更新时（如打卡、戒烟时长变化）触发检查。此逻辑可封装在 `AchievementsService` 或 `achievementsNotifierProvider`。
    -   **成就墙：** `GridView` 或 `ListView` 展示。根据 `UnlockedAchievement` 数据动态显示徽章状态。
    -   **解锁弹窗/动画：** 满足条件时，全局Provider触发模态弹窗，使用 `lottie` 播放庆祝动画。
-   **状态管理:** `achievementsNotifierProvider` 管理成就定义、已解锁成就及解锁逻辑。

#### 4.11 深色模式与主题适配
-   在 `core/theme/` 中定义 `AppThemeData` 类，包含 `lightTheme` 和 `darkTheme` (`ThemeData` 对象)。
-   定义语义化颜色常量于 `AppColors` (如 `AppColors.primary`, `AppColors.successText`, `AppColors.cardBackground`)，并在主题中引用。
-   用户可在设置中切换主题或选择跟随系统。此偏好存储于 `shared_preferences`，并由 `themeNotifierProvider` (Riverpod) 管理和应用于 `MaterialApp`。

## 5. 构建与发布

-   使用Flutter CLI进行构建、打包。
-   **Android:** 生成APK/AAB，配置签名。
-   **iOS:** 使用Xcode进行Archive和发布，处理证书和配置文件。
-   **CI/CD:** **[MODIFIED] 强烈建议尽早搭建，例如使用 GitHub Actions (提供免费额度) 或 Codemagic，自动化执行代码检查 (`flutter analyze`)、测试 (`flutter test`)、构建 (`flutter build`) 和甚至发布到测试渠道 (如Firebase App Distribution) 的流程，能显著提升开发效率和代码质量。**