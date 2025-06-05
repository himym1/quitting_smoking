/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 认证远程数据源 (AuthRemoteDataSource)
 * 功能：
 * 1. 定义认证相关的API接口
 * 2. 处理用户注册、登录、令牌刷新等操作
 * 3. 与Spring Boot后端API通信
 * 4. 提供统一的认证数据访问接口
 */

import 'package:quitting_smoking/data/models/api_response_model.dart';
import 'package:quitting_smoking/data/models/auth_models.dart';

/// 认证远程数据源接口
/// 
/// 定义所有认证相关的API操作
abstract class AuthRemoteDataSource {
  
  /// 用户注册
  /// 
  /// [request] 注册请求数据
  /// 返回包含用户信息和令牌的认证响应
  Future<ApiResponseModel<AuthResponseModel>> register(
    RegisterRequestModel request,
  );
  
  /// 用户登录
  /// 
  /// [request] 登录请求数据
  /// 返回包含用户信息和令牌的认证响应
  Future<ApiResponseModel<AuthResponseModel>> login(
    LoginRequestModel request,
  );
  
  /// 刷新访问令牌
  /// 
  /// [request] 刷新令牌请求数据
  /// 返回新的令牌信息
  Future<ApiResponseModel<TokenInfoModel>> refreshToken(
    RefreshTokenRequestModel request,
  );
  
  /// 用户登出
  /// 
  /// [token] 访问令牌
  /// 返回登出结果
  Future<ApiResponseModel<String>> logout(String token);
  
  /// 忘记密码
  /// 
  /// [request] 忘记密码请求数据
  /// 返回操作结果
  Future<ApiResponseModel<String>> forgotPassword(
    ForgotPasswordRequestModel request,
  );
  
  /// 重置密码
  /// 
  /// [request] 重置密码请求数据
  /// 返回操作结果
  Future<ApiResponseModel<String>> resetPassword(
    ResetPasswordRequestModel request,
  );
  
  /// 验证邮箱
  /// 
  /// [token] 验证令牌
  /// 返回验证结果
  Future<ApiResponseModel<String>> verifyEmail(String token);
}
