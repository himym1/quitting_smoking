/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 网络层Provider配置 (NetworkProviders)
 * 功能：
 * 1. 配置网络层的依赖注入
 * 2. 管理HTTP客户端和API服务
 * 3. 提供令牌存储和认证服务
 * 4. 支持网络状态监听
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:quitting_smoking/core/network/dio_client.dart';
import 'package:quitting_smoking/core/services/token_storage_service.dart';
import 'package:quitting_smoking/data/datasources/remote/auth_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/auth_remote_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/remote/user_profile_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/user_profile_remote_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/remote/daily_check_in_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/daily_check_in_remote_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/remote/smoking_record_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/smoking_record_remote_datasource_impl.dart';
import 'package:quitting_smoking/data/datasources/remote/achievement_remote_datasource.dart';
import 'package:quitting_smoking/data/datasources/remote/achievement_remote_datasource_impl.dart';

// ==================== 网络基础设施 Providers ====================

/// Dio HTTP客户端 Provider
///
/// 提供配置好的HTTP客户端实例
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

/// 网络连接状态 Provider
///
/// 监听设备的网络连接状态
final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  return Connectivity().onConnectivityChanged;
});

/// 网络连接状态检查 Provider
///
/// 检查当前是否有网络连接
final isConnectedProvider = Provider<bool>((ref) {
  final connectivityState = ref.watch(connectivityProvider);

  return connectivityState.when(
    data: (connectivity) => connectivity != ConnectivityResult.none,
    loading: () => true, // 加载时假设有网络
    error: (_, __) => false, // 错误时假设无网络
  );
});

// ==================== 认证相关 Providers ====================

/// 令牌存储服务 Provider
///
/// 提供JWT令牌的安全存储服务
final tokenStorageServiceProvider = Provider<TokenStorageService>((ref) {
  return TokenStorageService();
});

/// 当前访问令牌 Provider
///
/// 获取当前存储的访问令牌
final currentAccessTokenProvider = FutureProvider<String?>((ref) async {
  return await TokenStorageService.getAccessToken();
});

/// 当前用户ID Provider
///
/// 获取当前登录用户的ID
final currentUserIdProvider = FutureProvider<String?>((ref) async {
  return await TokenStorageService.getUserId();
});

/// 令牌有效性检查 Provider
///
/// 检查当前令牌是否有效
final isTokenValidProvider = FutureProvider<bool>((ref) async {
  return await TokenStorageService.hasValidAuth();
});

/// 令牌即将过期检查 Provider
///
/// 检查令牌是否即将过期（需要刷新）
final isTokenExpiringSoonProvider = FutureProvider<bool>((ref) async {
  return await TokenStorageService.isAccessTokenExpiringSoon();
});

// ==================== API数据源 Providers ====================

/// 认证远程数据源 Provider
///
/// 提供认证相关的API调用服务
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthRemoteDataSourceImpl(dioClient);
});

/// 用户资料远程数据源 Provider
///
/// 提供用户资料相关的API调用服务
final userProfileRemoteDataSourceProvider =
    Provider<UserProfileRemoteDataSource>((ref) {
      final dioClient = ref.watch(dioClientProvider);
      return UserProfileRemoteDataSourceImpl(dioClient);
    });

/// 每日打卡远程数据源 Provider
///
/// 提供打卡相关的API调用服务
final dailyCheckInRemoteDataSourceProvider =
    Provider<DailyCheckInRemoteDataSource>((ref) {
      final dioClient = ref.watch(dioClientProvider);
      return DailyCheckInRemoteDataSourceImpl(dioClient);
    });

/// 吸烟记录远程数据源 Provider
///
/// 提供吸烟记录相关的API调用服务
final smokingRecordRemoteDataSourceProvider =
    Provider<SmokingRecordRemoteDataSource>((ref) {
      final dioClient = ref.watch(dioClientProvider);
      return SmokingRecordRemoteDataSourceImpl(dioClient);
    });

/// 成就系统远程数据源 Provider
///
/// 提供成就相关的API调用服务
final achievementRemoteDataSourceProvider =
    Provider<AchievementRemoteDataSource>((ref) {
      final dioClient = ref.watch(dioClientProvider);
      return AchievementRemoteDataSourceImpl(dioClient);
    });

// ==================== 网络状态管理 ====================

/// 网络状态通知器
///
/// 管理网络连接状态和相关逻辑
class NetworkStateNotifier extends StateNotifier<NetworkState> {
  final Ref ref;

  NetworkStateNotifier(this.ref) : super(const NetworkState.unknown()) {
    _init();
  }

  void _init() {
    // 监听网络连接状态变化
    ref.listen(connectivityProvider, (previous, next) {
      next.when(
        data: (connectivity) {
          switch (connectivity) {
            case ConnectivityResult.wifi:
              state = const NetworkState.connected(NetworkType.wifi);
              break;
            case ConnectivityResult.mobile:
              state = const NetworkState.connected(NetworkType.mobile);
              break;
            case ConnectivityResult.ethernet:
              state = const NetworkState.connected(NetworkType.ethernet);
              break;
            case ConnectivityResult.none:
              state = const NetworkState.disconnected();
              break;
            default:
              state = const NetworkState.unknown();
          }
        },
        loading: () => state = const NetworkState.unknown(),
        error: (error, stackTrace) => state = const NetworkState.disconnected(),
      );
    });
  }

  /// 手动检查网络连接
  Future<void> checkConnectivity() async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      switch (connectivity) {
        case ConnectivityResult.wifi:
          state = const NetworkState.connected(NetworkType.wifi);
          break;
        case ConnectivityResult.mobile:
          state = const NetworkState.connected(NetworkType.mobile);
          break;
        case ConnectivityResult.ethernet:
          state = const NetworkState.connected(NetworkType.ethernet);
          break;
        case ConnectivityResult.none:
          state = const NetworkState.disconnected();
          break;
        default:
          state = const NetworkState.unknown();
      }
    } catch (e) {
      state = const NetworkState.disconnected();
    }
  }
}

/// 网络状态 Provider
final networkStateProvider =
    StateNotifierProvider<NetworkStateNotifier, NetworkState>((ref) {
      return NetworkStateNotifier(ref);
    });

// ==================== 网络状态数据模型 ====================

/// 网络状态
sealed class NetworkState {
  const NetworkState();

  const factory NetworkState.connected(NetworkType type) = NetworkConnected;
  const factory NetworkState.disconnected() = NetworkDisconnected;
  const factory NetworkState.unknown() = NetworkUnknown;
}

/// 网络已连接状态
class NetworkConnected extends NetworkState {
  final NetworkType type;
  const NetworkConnected(this.type);
}

/// 网络断开状态
class NetworkDisconnected extends NetworkState {
  const NetworkDisconnected();
}

/// 网络状态未知
class NetworkUnknown extends NetworkState {
  const NetworkUnknown();
}

/// 网络类型
enum NetworkType { wifi, mobile, ethernet }

// ==================== 网络状态扩展方法 ====================

extension NetworkStateExtension on NetworkState {
  /// 是否已连接
  bool get isConnected => this is NetworkConnected;

  /// 是否断开连接
  bool get isDisconnected => this is NetworkDisconnected;

  /// 是否为WiFi连接
  bool get isWifi =>
      this is NetworkConnected &&
      (this as NetworkConnected).type == NetworkType.wifi;

  /// 是否为移动网络
  bool get isMobile =>
      this is NetworkConnected &&
      (this as NetworkConnected).type == NetworkType.mobile;

  /// 获取网络类型描述
  String get description {
    return switch (this) {
      NetworkConnected(type: final type) => switch (type) {
        NetworkType.wifi => 'WiFi已连接',
        NetworkType.mobile => '移动网络已连接',
        NetworkType.ethernet => '以太网已连接',
      },
      NetworkDisconnected() => '网络未连接',
      NetworkUnknown() => '网络状态未知',
    };
  }
}
