# 最佳实践指南

## Flutter/Dart 开发最佳实践

### 1. 代码组织和结构

#### 文件命名规范
```
- 文件名使用 snake_case: user_profile_screen.dart
- 类名使用 PascalCase: UserProfileScreen
- 变量和方法使用 camelCase: userName, getUserData()
- 常量使用 SCREAMING_SNAKE_CASE: MAX_RETRY_COUNT
```

#### 目录结构规范
```
lib/
├── core/                    # 核心功能
│   ├── constants/          # 常量定义
│   ├── utils/              # 工具类
│   ├── extensions/         # 扩展方法
│   └── theme/              # 主题配置
├── data/                   # 数据层
│   ├── models/             # 数据模型
│   ├── repositories/       # 仓库实现
│   └── datasources/        # 数据源
├── domain/                 # 业务逻辑层
│   ├── entities/           # 业务实体
│   ├── repositories/       # 仓库接口
│   └── usecases/           # 用例
├── presentation/           # 表现层
│   ├── screens/            # 页面
│   ├── widgets/            # 组件
│   └── providers/          # 状态管理
└── l10n/                   # 国际化
```

### 2. 状态管理最佳实践

#### Riverpod Provider 设计原则
```dart
// ✅ 好的做法：单一职责
final userNameProvider = StateProvider<String>((ref) => '');
final userAgeProvider = StateProvider<int>((ref) => 0);

// ❌ 避免：过于复杂的状态
final userComplexStateProvider = StateProvider<Map<String, dynamic>>((ref) => {});

// ✅ 好的做法：使用 StateNotifier 处理复杂状态
final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.read(repositoryProvider));
});
```

#### 异步操作处理
```dart
// ✅ 好的做法：使用 FutureProvider
final userDataProvider = FutureProvider<UserData>((ref) async {
  final repository = ref.read(userRepositoryProvider);
  return repository.getUserData();
});

// ✅ 好的做法：错误处理
final safeUserDataProvider = FutureProvider<UserData>((ref) async {
  try {
    final repository = ref.read(userRepositoryProvider);
    return await repository.getUserData();
  } catch (e) {
    // 记录错误并返回默认值
    debugPrint('Error loading user data: $e');
    return UserData.empty();
  }
});
```

### 3. UI 开发最佳实践

#### 组件设计原则
```dart
// ✅ 好的做法：可复用组件
class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  
  const CustomCard({
    Key? key,
    required this.child,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
```

#### 响应式设计
```dart
// ✅ 好的做法：使用 MediaQuery 和 LayoutBuilder
class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileLayout();
        } else {
          return TabletLayout();
        }
      },
    );
  }
}
```

#### 主题和样式
```dart
// ✅ 好的做法：使用主题系统
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
      ),
    );
  }
}

// ✅ 好的做法：使用主题中的颜色
Container(
  color: Theme.of(context).primaryColor,
  child: Text(
    'Hello',
    style: Theme.of(context).textTheme.headlineLarge,
  ),
)
```

### 4. 数据管理最佳实践

#### Hive 数据模型
```dart
// ✅ 好的做法：使用 HiveType 注解
@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  DateTime quitDate;
  
  UserData({
    required this.id,
    required this.name,
    required this.quitDate,
  });
}
```

#### Repository 模式实现
```dart
// ✅ 好的做法：抽象接口
abstract class UserRepository {
  Future<UserData?> getUser(String id);
  Future<void> saveUser(UserData user);
  Future<void> deleteUser(String id);
  Stream<List<UserData>> watchUsers();
}

// ✅ 好的做法：具体实现
class HiveUserRepository implements UserRepository {
  final Box<UserData> _box;
  
  HiveUserRepository(this._box);
  
  @override
  Future<UserData?> getUser(String id) async {
    return _box.get(id);
  }
  
  @override
  Future<void> saveUser(UserData user) async {
    await _box.put(user.id, user);
  }
}
```

### 5. 性能优化最佳实践

#### Widget 优化
```dart
// ✅ 好的做法：使用 const 构造函数
const Text('Static text');

// ✅ 好的做法：提取静态 Widget
class _StaticHeader extends StatelessWidget {
  const _StaticHeader();
  
  @override
  Widget build(BuildContext context) {
    return const Text('Header');
  }
}

// ✅ 好的做法：使用 ListView.builder 处理长列表
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```

#### 内存管理
```dart
// ✅ 好的做法：及时释放资源
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late StreamSubscription _subscription;
  late Timer _timer;
  
  @override
  void initState() {
    super.initState();
    _subscription = stream.listen((data) {
      // 处理数据
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // 定时任务
    });
  }
  
  @override
  void dispose() {
    _subscription.cancel();
    _timer.cancel();
    super.dispose();
  }
}
```

### 6. 错误处理最佳实践

#### 全局错误处理
```dart
// ✅ 好的做法：设置全局错误处理
void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // 记录错误到日志系统
    logError(details.exception, details.stack);
  };
  
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    // 处理异步错误
    logError(error, stackTrace);
  });
}
```

#### 用户友好的错误显示
```dart
// ✅ 好的做法：优雅的错误处理
class ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  
  const ErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('重试'),
            ),
          ],
        ],
      ),
    );
  }
}
```

### 7. 测试最佳实践

#### 单元测试
```dart
// ✅ 好的做法：测试业务逻辑
void main() {
  group('QuitTimeCalculator', () {
    test('should calculate correct quit duration', () {
      final quitDate = DateTime(2025, 1, 1);
      final currentDate = DateTime(2025, 1, 8);
      
      final duration = QuitTimeCalculator.calculateQuitDuration(
        quitDate, 
        currentDate: currentDate,
      );
      
      expect(duration.inDays, 7);
    });
  });
}
```

#### Widget 测试
```dart
// ✅ 好的做法：测试 UI 组件
void main() {
  testWidgets('CustomButton shows loading state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CustomButton(
          text: 'Test',
          isLoading: true,
          onPressed: () {},
        ),
      ),
    );
    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Test'), findsNothing);
  });
}
```

### 8. 安全最佳实践

#### 数据加密
```dart
// ✅ 好的做法：敏感数据加密
class SecureStorage {
  static const _key = 'user_sensitive_data';
  
  static Future<void> storeSensitiveData(String data) async {
    final encryptedData = await encrypt(data);
    await Hive.box('secure').put(_key, encryptedData);
  }
  
  static Future<String?> getSensitiveData() async {
    final encryptedData = Hive.box('secure').get(_key);
    if (encryptedData != null) {
      return await decrypt(encryptedData);
    }
    return null;
  }
}
```

#### 权限管理
```dart
// ✅ 好的做法：权限检查
class PermissionHelper {
  static Future<bool> requestNotificationPermission() async {
    final permission = Permission.notification;
    
    if (await permission.isGranted) {
      return true;
    }
    
    final result = await permission.request();
    return result == PermissionStatus.granted;
  }
}
```

### 9. 国际化最佳实践

#### ARB 文件组织
```json
// app_en.arb
{
  "appTitle": "Quit Smoking",
  "welcomeMessage": "Welcome to your quit journey!",
  "quitDaysCount": "You have been smoke-free for {days} days",
  "@quitDaysCount": {
    "placeholders": {
      "days": {
        "type": "int"
      }
    }
  }
}
```

#### 使用本地化文本
```dart
// ✅ 好的做法：使用生成的本地化类
Text(AppLocalizations.of(context)!.appTitle)

// ✅ 好的做法：带参数的本地化
Text(AppLocalizations.of(context)!.quitDaysCount(7))
```

### 10. 代码质量最佳实践

#### 代码注释
```dart
/// 计算戒烟时长的工具类
/// 
/// 提供各种时间计算和格式化功能，用于显示用户的戒烟进度
class QuitTimeCalculator {
  /// 计算从戒烟开始到现在的时长
  /// 
  /// [quitDate] 戒烟开始日期
  /// [currentDate] 当前日期，默认为系统当前时间
  /// 
  /// 返回戒烟时长的 [Duration] 对象
  static Duration calculateQuitDuration(
    DateTime quitDate, {
    DateTime? currentDate,
  }) {
    final now = currentDate ?? DateTime.now();
    return now.difference(quitDate);
  }
}
```

#### 代码审查检查清单
```
□ 代码符合项目编码规范
□ 没有硬编码的字符串（使用国际化）
□ 错误处理完整
□ 性能考虑（避免不必要的重建）
□ 测试覆盖关键功能
□ 文档和注释完整
□ 安全考虑（敏感数据处理）
□ 可访问性支持
```

---

*最后更新：2025-01-27*
*更新者：Augment Agent*
