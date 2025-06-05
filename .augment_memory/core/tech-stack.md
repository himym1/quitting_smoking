# Flutter/Dart 技术栈配置

## 核心技术

### Flutter SDK
- **版本要求**: 最新稳定版
- **Dart SDK**: ^3.7.0
- **包管理器**: pub (Flutter 内置)
- **项目类型**: 移动应用 (iOS/Android)

### 主要依赖

#### 核心框架
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

#### 状态管理
```yaml
  flutter_riverpod: ^2.5.1        # 状态管理框架
```

#### 路由管理
```yaml
  go_router: ^15.1.2              # 声明式路由
```

#### 本地存储
```yaml
  hive_flutter:                   # NoSQL 本地数据库
  path_provider:                  # 文件路径获取
```

#### UI 组件
```yaml
  cupertino_icons: ^1.0.8         # iOS 风格图标
  dots_indicator: ^3.0.0          # 页面指示器
  lottie: ^3.0.0                  # 动画支持
  flutter_svg: ^2.1.0             # SVG 图片支持
```

#### 功能性依赖
```yaml
  package_info_plus: ^8.3.0       # 应用信息获取
  url_launcher: ^6.3.1            # 外部链接打开
  intl: ^0.19.0                   # 国际化和日期格式化
  flutter_local_notifications: 19.2.1  # 本地通知
  timezone: ^0.10.1               # 时区处理
  flutter_timezone: ^4.1.1        # Flutter 时区支持
```

#### 代码生成
```yaml
  freezed_annotation: ^2.4.1      # 不可变类注解
  json_annotation: ^4.9.0         # JSON 序列化注解
```

### 开发依赖

#### 测试框架
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0          # 代码规范检查
```

#### 代码生成工具
```yaml
  build_runner: ^2.4.10          # 代码生成运行器
  freezed: ^2.5.2                # 不可变类生成
  json_serializable: ^6.8.0      # JSON 序列化生成
  hive_generator: ^2.0.1         # Hive 适配器生成
```

#### 应用配置
```yaml
  flutter_launcher_icons: ^0.13.1  # 应用图标生成
  flutter_native_splash: ^2.4.1    # 启动屏幕生成
```

## 开发工具

### 构建工具
- **flutter build**: 应用构建
- **flutter run**: 开发运行
- **flutter test**: 测试执行
- **flutter analyze**: 代码分析

### 代码生成
- **build_runner**: 自动代码生成
- **freezed**: 数据类生成
- **json_serializable**: JSON 序列化
- **hive_generator**: 数据库适配器

### 代码质量
- **flutter_lints**: 官方代码规范
- **dart analyze**: 静态代码分析
- **dart format**: 代码格式化

## 常用命令

### 项目管理
```bash
# 获取依赖
flutter pub get

# 清理项目
flutter clean

# 升级依赖
flutter pub upgrade

# 检查过期依赖
flutter pub outdated
```

### 开发调试
```bash
# 运行应用（调试模式）
flutter run

# 运行应用（发布模式）
flutter run --release

# 热重载
r (在运行时按 r 键)

# 热重启
R (在运行时按 R 键)
```

### 代码生成
```bash
# 运行代码生成
flutter packages pub run build_runner build

# 监听文件变化并自动生成
flutter packages pub run build_runner watch

# 强制重新生成
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 测试
```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/widget_test.dart

# 运行测试并生成覆盖率报告
flutter test --coverage
```

### 构建
```bash
# 构建 Android APK
flutter build apk

# 构建 Android App Bundle
flutter build appbundle

# 构建 iOS 应用
flutter build ios

# 构建发布版本
flutter build apk --release
```

### 分析和检查
```bash
# 代码分析
flutter analyze

# 代码格式化
dart format .

# 检查依赖
flutter pub deps
```

## 项目配置

### pubspec.yaml 关键配置
```yaml
name: quitting_smoking
description: "Quitting smoking"
version: 1.0.0+1

environment:
  sdk: ^3.7.0

flutter:
  uses-material-design: true
  generate: true                 # 启用国际化代码生成
  
  assets:
    - assets/data/
    - assets/lottie/
    - assets/images/
```

### 国际化配置 (l10n.yaml)
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
```

### 分析选项 (analysis_options.yaml)
```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
    avoid_print: true
```

## 平台特定配置

### Android 配置
- **最小 SDK**: API 21 (Android 5.0)
- **目标 SDK**: 最新稳定版
- **构建工具**: Gradle
- **语言**: Kotlin (推荐)

### iOS 配置
- **最小版本**: iOS 12.0
- **开发语言**: Swift (推荐)
- **构建工具**: Xcode

## 性能优化

### 构建优化
```bash
# 启用混淆（发布版本）
flutter build apk --obfuscate --split-debug-info=<directory>

# 分析包大小
flutter build apk --analyze-size
```

### 开发优化
- 使用 `const` 构造函数
- 合理使用 `ListView.builder`
- 避免不必要的 `setState` 调用
- 使用 `flutter_riverpod` 的细粒度更新

## 调试工具

### Flutter Inspector
- Widget 树查看
- 性能分析
- 内存使用监控

### 开发者工具
```bash
# 启动开发者工具
flutter pub global activate devtools
flutter pub global run devtools
```

### 日志调试
```dart
// 使用 debugPrint 而不是 print
debugPrint('Debug message');

// 条件日志
assert(() {
  debugPrint('Debug only message');
  return true;
}());
```

## 部署配置

### Android 发布
1. 生成签名密钥
2. 配置 `android/app/build.gradle`
3. 构建发布版本
4. 上传到 Google Play

### iOS 发布
1. 配置 Xcode 项目
2. 设置证书和配置文件
3. 构建归档
4. 上传到 App Store Connect

## 故障排除

### 常见问题
1. **依赖冲突**: 使用 `flutter pub deps` 检查
2. **代码生成失败**: 清理后重新生成
3. **平台特定问题**: 检查平台配置文件

### 清理命令
```bash
# 完全清理项目
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

---

*最后更新：2025-01-27*
*更新者：Augment Agent*
