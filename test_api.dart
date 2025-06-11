import 'dart:convert';
import 'dart:io';

/// 测试Flutter应用与后端API的兼容性
void main() async {
  print('🔍 开始测试API兼容性...\n');
  
  final client = HttpClient();
  
  try {
    // 测试1: 注册接口
    await testRegisterApi(client);
    
    // 测试2: 登录接口
    await testLoginApi(client);
    
    // 测试3: 健康检查
    await testHealthApi(client);
    
  } finally {
    client.close();
  }
}

Future<void> testRegisterApi(HttpClient client) async {
  print('📝 测试注册接口...');
  
  try {
    final request = await client.postUrl(Uri.parse('http://localhost:8080/api/v1/auth/register'));
    request.headers.set('Content-Type', 'application/json');
    
    // 使用Flutter模型的字段结构
    final body = jsonEncode({
      'username': 'fluttertest',
      'email': 'flutter@test.com',
      'password': 'password123',
      'nickname': 'Flutter测试用户'
    });
    
    request.write(body);
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    
    print('状态码: ${response.statusCode}');
    print('响应: $responseBody');
    
    if (response.statusCode != 200) {
      print('❌ 注册接口测试失败');
      
      // 尝试添加缺失的字段
      print('\n🔧 尝试添加agreeToTerms字段...');
      final request2 = await client.postUrl(Uri.parse('http://localhost:8080/api/v1/auth/register'));
      request2.headers.set('Content-Type', 'application/json');
      
      final body2 = jsonEncode({
        'username': 'fluttertest2',
        'email': 'flutter2@test.com',
        'password': 'password123',
        'nickname': 'Flutter测试用户2',
        'agreeToTerms': true
      });
      
      request2.write(body2);
      final response2 = await request2.close();
      final responseBody2 = await response2.transform(utf8.decoder).join();
      
      print('状态码: ${response2.statusCode}');
      print('响应: $responseBody2');
      
      if (response2.statusCode == 200) {
        print('✅ 添加agreeToTerms字段后注册成功');
      }
    } else {
      print('✅ 注册接口测试成功');
    }
    
  } catch (e) {
    print('❌ 注册接口测试异常: $e');
  }
  
  print('');
}

Future<void> testLoginApi(HttpClient client) async {
  print('🔐 测试登录接口...');
  
  try {
    final request = await client.postUrl(Uri.parse('http://localhost:8080/api/v1/auth/login'));
    request.headers.set('Content-Type', 'application/json');
    
    final body = jsonEncode({
      'username': 'testuser',
      'password': 'password123'
    });
    
    request.write(body);
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    
    print('状态码: ${response.statusCode}');
    print('响应: $responseBody');
    
    if (response.statusCode == 200) {
      print('✅ 登录接口测试成功');
    } else {
      print('❌ 登录接口测试失败');
    }
    
  } catch (e) {
    print('❌ 登录接口测试异常: $e');
  }
  
  print('');
}

Future<void> testHealthApi(HttpClient client) async {
  print('🏥 测试健康检查接口...');
  
  try {
    final request = await client.getUrl(Uri.parse('http://localhost:8080/api/v1/actuator/health'));
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    
    print('状态码: ${response.statusCode}');
    print('响应: $responseBody');
    
    if (response.statusCode == 200) {
      print('✅ 健康检查接口正常');
    } else {
      print('⚠️ 健康检查接口返回非200状态码');
    }
    
  } catch (e) {
    print('❌ 健康检查接口测试异常: $e');
  }
}
