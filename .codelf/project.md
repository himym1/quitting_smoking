## 焕新之旅 - Quit Journey (Flutter App)

> 一款帮助用户成功戒烟的移动应用，通过提供科学的戒烟方法、实时的进度追踪、积极的心理支持和个性化的激励机制，帮助用户重获健康生活。

> 本项目旨在为用户提供一款用户友好、功能实用、体验积极的戒烟辅助工具，充分利用数字化和个性化手段，提供区别于传统戒烟方式的独特支持。

> 项目处于早期开发阶段，当前正在按照MVP规划进行功能实现。

> 单人开发项目

> Flutter(Dart)，Clean Architecture，国际化支持(中英文)，Riverpod状态管理


## Dependencies (依赖项)

* flutter_riverpod (^2.5.1): 提供强大的状态管理和依赖注入功能
* freezed_annotation (^2.4.1): 用于生成不可变数据类和相关辅助方法
* json_annotation (^4.9.0): 用于JSON序列化和反序列化
* hive_flutter: 本地数据库存储，用于持久化用户数据和设置
* path_provider: 提供应用程序路径，供Hive等存储使用
* go_router (^15.1.2): 路由管理
* dots_indicator (^3.0.0): 用于创建页面指示器，在引导流程中使用
* flutter_localizations: 国际化支持
* build_runner (^2.4.10): 代码生成工具
* freezed (^2.5.2): 不可变数据类生成器
* json_serializable (^6.8.0): JSON序列化代码生成器
* hive_generator (^2.0.1): Hive适配器代码生成器


## Development Environment

> 项目开发环境：
> - Flutter SDK: 3.7.0或更高版本
> - Dart SDK: 3.7.0或更高版本
> - Android Studio/VSCode: 用于Flutter开发
> - 支持平台: Android, iOS


## Structure (项目结构)

```
lib/
├── app_widget.dart       // 主应用Widget，定义MaterialApp.router并配置路由、主题和国际化
├── core/                 // 核心工具、常量、主题、错误处理、通用扩展等
│   ├── config/           // 环境配置 (dev, prod API URLs等)
│   ├── constants/        // 应用常量 (如Hive Box名称，预设成就ID)
│   ├── errors/           // Failure类定义，异常处理
│   ├── router/           // GoRouter 配置
│   ├── theme/            // 主题配置 (AppTheme, AppColors)
│   └── utils/            // 通用工具类 (日期格式化, 计算帮助类等)
├── data/                 // 数据层
│   ├── datasources/      // 数据源接口和实现
│   │   ├── local/        // 本地数据源 (Hive, SharedPreferences)
│   │   └── remote/       // 远程数据源 (API调用)
│   ├── models/           // API响应模型 (DTOs)
│   └── repositories_impl/  // Repository 接口的具体实现
├── domain/               // 领域层
│   ├── entities/         // 业务实体 (UserProfile, DailyCheckIn, CravingLogEntry等)
│   ├── repositories/     // Repository 接口定义
│   └── usecases/         // 业务用例
├── l10n/                 // 国际化资源
│   ├── app_en.arb        // 英文翻译资源
│   ├── app_localizations.dart  // 自动生成的本地化代码
│   ├── app_localizations_en.dart  // 英文本地化代码
│   ├── app_localizations_zh.dart  // 中文本地化代码
│   ├── app_zh.arb        // 中文翻译资源
│   └── app_zh_CN.arb     // 中文(简体)翻译资源
├── main.dart             // 应用程序入口，初始化Hive和ProviderScope
└── presentation/         // 表现层
    ├── common_widgets/   // 通用自定义Widget (CustomCard, PrimaryButton等)
    ├── features/         // 按功能模块划分
    │   ├── auth/         // 认证模块 (登录、注册、引导页)
    │   ├── achievements/ // 成就模块
    │   ├── home/         // 首页模块
    │   └── settings/     // 设置模块
    └── shell/           // 应用程序外壳 (底部导航栏等)
```

## 重要文件和目录说明

### 根目录核心文件
- **main.dart**: 应用程序入口点，初始化Hive数据库，注册适配器，并启动应用程序。设置了Riverpod的Provider，包括DailyCheckIn和HealthBenefit相关的数据源和仓库。
- **app_widget.dart**: 定义应用程序的整体结构，包括路由配置、主题设置和国际化支持。

### 核心目录
- **core/**: 包含应用程序的核心配置和工具类
  - **router/**: 使用GoRouter管理应用程序的导航和路由
  - **theme/**: 定义应用程序的主题和样式
  - **constants/**: 存储应用程序常量，如Hive box名称和其他固定值
  
### 数据层
- **data/datasources/local/**: 包含与本地数据存储相关的实现，使用Hive进行数据持久化
- **data/repositories_impl/**: 实现domain层定义的仓库接口，连接数据源和业务逻辑

### 领域层
- **domain/entities/**: 定义业务实体，如UserProfile, DailyCheckIn, CravingLogEntry等
- **domain/repositories/**: 定义数据操作的抽象接口
- **domain/usecases/**: 包含应用程序的业务逻辑

### 表现层
- **presentation/features/**: 按功能模块组织UI组件
  - **auth/**: 认证相关页面，包括登录、注册和初始设置引导
  - **home/**: 首页/主看板，显示戒烟进度和健康效益
  - **achievements/**: 成就系统，显示用户已解锁和未解锁的成就
  - **settings/**: 设置页面，允许用户修改应用程序配置

### 国际化
- **l10n/**: 包含应用程序的国际化资源和自动生成的本地化代码，支持英文和中文

## 开发状态与优先任务

目前项目正在根据MVP规划进行开发，已完成部分基础架构搭建，包括：
- 项目目录结构设置
- 国际化支持配置
- Hive数据库初始化
- 部分数据源和仓库实现

接下来的优先开发任务包括：
1. 完成认证流程 (登录、注册、初始信息设置)
2. 实现首页核心功能 (戒烟进度追踪、健康效益展示)
3. 开发烟瘾管理模块
4. 实现成就系统
5. 完善设置页面

所有功能开发将遵循 project_blueprint_mvp.md 中定义的规划进行。
```
