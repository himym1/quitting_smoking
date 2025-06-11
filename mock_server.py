#!/usr/bin/env python3
"""
简单的模拟API服务器
用于测试Flutter前端功能
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import uuid
from datetime import datetime, timedelta
import urllib.parse

class MockAPIHandler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        """处理CORS预检请求"""
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Client-Version, X-Platform')
        self.end_headers()

    def do_POST(self):
        """处理POST请求"""
        self.send_cors_headers()
        
        if self.path == '/api/v1/auth/register':
            self.handle_register()
        elif self.path == '/api/v1/auth/login':
            self.handle_login()
        elif self.path == '/api/v1/checkins':
            self.handle_create_checkin()
        elif self.path == '/api/v1/smoking-records':
            self.handle_create_smoking_record()
        else:
            self.send_error(404, "Not Found")

    def do_GET(self):
        """处理GET请求"""
        self.send_cors_headers()
        
        if self.path == '/api/v1/users/profile':
            self.handle_get_profile()
        elif self.path.startswith('/api/v1/checkins'):
            self.handle_get_checkins()
        elif self.path.startswith('/api/v1/smoking-records'):
            self.handle_get_smoking_records()
        elif self.path.startswith('/api/v1/achievements'):
            self.handle_get_achievements()
        else:
            self.send_error(404, "Not Found")

    def send_cors_headers(self):
        """发送CORS头"""
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Client-Version, X-Platform')

    def send_json_response(self, data, status_code=200):
        """发送JSON响应"""
        self.send_response(status_code)
        self.send_header('Content-Type', 'application/json')
        self.send_cors_headers()
        self.end_headers()
        self.wfile.write(json.dumps(data, ensure_ascii=False).encode('utf-8'))

    def handle_register(self):
        """处理用户注册"""
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        data = json.loads(post_data.decode('utf-8'))
        
        # 模拟注册成功
        response = {
            "success": True,
            "message": "注册成功",
            "data": {
                "user": {
                    "id": str(uuid.uuid4()),
                    "email": data.get("email"),
                    "name": data.get("name", "用户"),
                    "createdAt": datetime.now().isoformat()
                },
                "tokens": {
                    "accessToken": "mock_access_token_" + str(uuid.uuid4()),
                    "refreshToken": "mock_refresh_token_" + str(uuid.uuid4()),
                    "expiresIn": 3600
                }
            }
        }
        self.send_json_response(response)

    def handle_login(self):
        """处理用户登录"""
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        data = json.loads(post_data.decode('utf-8'))
        
        # 模拟登录成功
        response = {
            "success": True,
            "message": "登录成功",
            "data": {
                "user": {
                    "id": str(uuid.uuid4()),
                    "email": data.get("email"),
                    "name": "测试用户",
                    "createdAt": datetime.now().isoformat()
                },
                "tokens": {
                    "accessToken": "mock_access_token_" + str(uuid.uuid4()),
                    "refreshToken": "mock_refresh_token_" + str(uuid.uuid4()),
                    "expiresIn": 3600
                }
            }
        }
        self.send_json_response(response)

    def handle_get_profile(self):
        """获取用户资料"""
        response = {
            "success": True,
            "data": {
                "id": str(uuid.uuid4()),
                "email": "test@example.com",
                "name": "测试用户",
                "quitDate": (datetime.now() - timedelta(days=30)).isoformat(),
                "dailyCigarettes": 20,
                "packPrice": 15.0,
                "createdAt": datetime.now().isoformat()
            }
        }
        self.send_json_response(response)

    def handle_create_checkin(self):
        """创建打卡记录"""
        response = {
            "success": True,
            "message": "打卡成功",
            "data": {
                "id": str(uuid.uuid4()),
                "date": datetime.now().date().isoformat(),
                "checkinTime": datetime.now().isoformat(),
                "consecutiveDays": 30,
                "createdAt": datetime.now().isoformat()
            }
        }
        self.send_json_response(response)

    def handle_get_checkins(self):
        """获取打卡记录"""
        # 生成模拟的打卡记录
        checkins = []
        for i in range(30):
            date = datetime.now() - timedelta(days=i)
            checkins.append({
                "id": str(uuid.uuid4()),
                "date": date.date().isoformat(),
                "checkinTime": date.isoformat(),
                "consecutiveDays": 30 - i,
                "createdAt": date.isoformat()
            })
        
        response = {
            "success": True,
            "data": checkins
        }
        self.send_json_response(response)

    def handle_get_achievements(self):
        """获取成就列表"""
        achievements = [
            {
                "id": str(uuid.uuid4()),
                "name": "第一天",
                "description": "成功戒烟第一天",
                "icon": "🎯",
                "unlocked": True,
                "unlockedAt": datetime.now().isoformat()
            },
            {
                "id": str(uuid.uuid4()),
                "name": "一周坚持",
                "description": "成功戒烟一周",
                "icon": "🏆",
                "unlocked": True,
                "unlockedAt": (datetime.now() - timedelta(days=7)).isoformat()
            },
            {
                "id": str(uuid.uuid4()),
                "name": "一个月成就",
                "description": "成功戒烟一个月",
                "icon": "🌟",
                "unlocked": False,
                "unlockedAt": None
            }
        ]
        
        response = {
            "success": True,
            "data": achievements
        }
        self.send_json_response(response)

    def handle_create_smoking_record(self):
        """创建吸烟记录"""
        response = {
            "success": True,
            "message": "记录已保存",
            "data": {
                "id": str(uuid.uuid4()),
                "timestamp": datetime.now().isoformat(),
                "cigarettesSmoked": 1,
                "triggerTags": ["压力"],
                "notes": "测试记录",
                "createdAt": datetime.now().isoformat()
            }
        }
        self.send_json_response(response)

    def handle_get_smoking_records(self):
        """获取吸烟记录"""
        records = []
        for i in range(5):
            date = datetime.now() - timedelta(days=i*2)
            records.append({
                "id": str(uuid.uuid4()),
                "timestamp": date.isoformat(),
                "cigarettesSmoked": 1,
                "triggerTags": ["压力", "社交"],
                "notes": f"记录 {i+1}",
                "createdAt": date.isoformat()
            })
        
        response = {
            "success": True,
            "data": records
        }
        self.send_json_response(response)

def run_server(port=8081):
    """启动模拟服务器"""
    server_address = ('0.0.0.0', port)  # 监听所有网络接口
    httpd = HTTPServer(server_address, MockAPIHandler)
    print(f"🚀 模拟API服务器启动在 http://0.0.0.0:{port}")
    print(f"📱 Android设备可以通过 http://10.0.2.2:{port} 访问")
    print("🌐 本地浏览器可以通过 http://localhost:{port} 访问")
    print("⏹️  按 Ctrl+C 停止服务器")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n🛑 服务器已停止")
        httpd.server_close()

if __name__ == '__main__':
    run_server()
