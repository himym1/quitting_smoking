# 实现模式和最佳实践

## Flutter/Dart 开发模式

### 1. 状态管理模式

#### Riverpod Provider 模式
```dart
// 推荐的 Provider 定义模式
final userDataProvider = StateNotifierProvider<UserDataNotifier, UserData>((ref) {
  return UserDataNotifier(ref.read(repositoryProvider));
});

// StateNotifier 实现模式
class UserDataNotifier extends StateNotifier<UserData> {
  final Repository _repository;
  
  UserDataNotifier(this._repository) : super(UserData.initial());
  
  Future<void> updateData(UserData data) async {
    state = state.copyWith(isLoading: true);
    try {
      await _repository.saveUserData(data);
      state = data.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
```

#### 异步状态处理模式
```dart
// AsyncValue 使用模式
final dataProvider = FutureProvider<Data>((ref) async {
  final repository = ref.read(repositoryProvider);
  return repository.fetchData();
});

// UI 中的异步状态处理
Consumer(
  builder: (context, ref, child) {
    final asyncData = ref.watch(dataProvider);
    return asyncData.when(
      data: (data) => DataWidget(data: data),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => ErrorWidget(error: error),
    );
  },
)
```

### 2. 数据模型模式

#### Freezed 数据类模式
```dart
@freezed
class UserData with _$UserData {
  const factory UserData({
    required String id,
    required String name,
    required DateTime quitDate,
    @Default(false) bool isLoading,
    String? error,
  }) = _UserData;
  
  factory UserData.fromJson(Map<String, dynamic> json) => 
      _$UserDataFromJson(json);
}
```

#### Repository 模式
```dart
abstract class UserRepository {
  Future<UserData> getUserData();
  Future<void> saveUserData(UserData data);
  Stream<UserData> watchUserData();
}

class HiveUserRepository implements UserRepository {
  final Box<UserData> _box;
  
  HiveUserRepository(this._box);
  
  @override
  Future<UserData> getUserData() async {
    return _box.get('user') ?? UserData.initial();
  }
  
  @override
  Future<void> saveUserData(UserData data) async {
    await _box.put('user', data);
  }
}
```

### 3. UI 组件模式

#### 可复用组件模式
```dart
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading 
        ? const CircularProgressIndicator()
        : Text(text),
    );
  }
}
```

#### 响应式布局模式
```dart
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  
  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else if (constraints.maxWidth < 1200) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
```

### 4. 路由管理模式

#### GoRouter 配置模式
```dart
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});
```

### 5. 错误处理模式

#### 全局错误处理
```dart
class ErrorHandler {
  static void handleError(Object error, StackTrace stackTrace) {
    // 记录错误
    debugPrint('Error: $error');
    debugPrint('StackTrace: $stackTrace');
    
    // 发送错误报告（如果需要）
    // CrashReporting.recordError(error, stackTrace);
  }
}

// 在 main.dart 中设置
void main() {
  FlutterError.onError = (details) {
    ErrorHandler.handleError(details.exception, details.stack!);
  };
  
  runApp(const MyApp());
}
```

## 戒烟应用特定模式

### 1. 时间计算模式

#### 戒烟时长计算
```dart
class QuitTimeCalculator {
  static Duration calculateQuitDuration(DateTime quitDate) {
    return DateTime.now().difference(quitDate);
  }
  
  static String formatQuitDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    
    return '$days 天 $hours 小时 $minutes 分钟';
  }
}
```

### 2. 健康指标模式

#### 健康恢复时间线
```dart
class HealthMilestone {
  final Duration timeAfterQuitting;
  final String title;
  final String description;
  final bool isAchieved;
  
  const HealthMilestone({
    required this.timeAfterQuitting,
    required this.title,
    required this.description,
    required this.isAchieved,
  });
}

class HealthTimelineProvider extends StateNotifier<List<HealthMilestone>> {
  HealthTimelineProvider() : super(_initialMilestones);
  
  void updateMilestones(DateTime quitDate) {
    final quitDuration = DateTime.now().difference(quitDate);
    
    state = state.map((milestone) {
      return milestone.copyWith(
        isAchieved: quitDuration >= milestone.timeAfterQuitting,
      );
    }).toList();
  }
}
```

### 3. 通知管理模式

#### 本地通知调度
```dart
class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications = 
      FlutterLocalNotificationsPlugin();
  
  static Future<void> scheduleMotivationalNotification() async {
    await _notifications.zonedSchedule(
      0,
      '坚持戒烟',
      '你已经戒烟 X 天了，继续加油！',
      _nextInstanceOfTime(8, 0), // 每天早上8点
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'motivation',
          '激励通知',
          channelDescription: '每日激励消息',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
```

## 性能优化模式

### 1. 内存管理模式

#### 资源释放模式
```dart
class ResourceManager extends ChangeNotifier {
  Timer? _timer;
  StreamSubscription? _subscription;
  
  @override
  void dispose() {
    _timer?.cancel();
    _subscription?.cancel();
    super.dispose();
  }
}
```

### 2. 懒加载模式

#### 页面懒加载
```dart
class LazyLoadingPage extends StatefulWidget {
  @override
  _LazyLoadingPageState createState() => _LazyLoadingPageState();
}

class _LazyLoadingPageState extends State<LazyLoadingPage> {
  Widget? _content;
  
  @override
  void initState() {
    super.initState();
    _loadContent();
  }
  
  Future<void> _loadContent() async {
    // 异步加载内容
    final content = await loadHeavyContent();
    if (mounted) {
      setState(() {
        _content = content;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return _content ?? const CircularProgressIndicator();
  }
}
```

## 测试模式

### 1. 单元测试模式

#### Provider 测试
```dart
void main() {
  group('UserDataNotifier', () {
    late ProviderContainer container;
    late MockRepository mockRepository;
    
    setUp(() {
      mockRepository = MockRepository();
      container = ProviderContainer(
        overrides: [
          repositoryProvider.overrideWithValue(mockRepository),
        ],
      );
    });
    
    tearDown(() {
      container.dispose();
    });
    
    test('should update user data', () async {
      final notifier = container.read(userDataProvider.notifier);
      final userData = UserData(id: '1', name: 'Test');
      
      await notifier.updateData(userData);
      
      expect(container.read(userDataProvider), userData);
    });
  });
}
```

### 2. Widget 测试模式

#### 组件测试
```dart
void main() {
  testWidgets('CustomButton shows loading indicator', (tester) async {
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

---

*最后更新：2025-01-27*
*更新者：Augment Agent*
