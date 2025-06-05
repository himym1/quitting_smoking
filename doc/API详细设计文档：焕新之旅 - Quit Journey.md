# API 详细设计文档：焕新之旅 - Quit Journey

**版本：** 1.0  
**创建日期：** 2025-01-27  
**API版本：** v1  
**基础URL：** `https://api.quitjourney.com/api/v1`

## 一、API 概述

### 1.1 设计原则
- **RESTful 设计**: 遵循 REST 架构风格
- **资源导向**: 以资源为中心的 URL 设计
- **HTTP 语义**: 正确使用 HTTP 方法和状态码
- **版本控制**: URL 路径版本控制
- **统一响应**: 标准化的响应格式

### 1.2 通用请求头
```http
Authorization: Bearer <access_token>
Content-Type: application/json
Accept: application/json
X-Client-Version: 1.0.0
X-Device-ID: <unique_device_id>
X-Request-ID: <unique_request_id>
```

### 1.3 通用响应格式

#### 成功响应
```json
{
  "success": true,
  "data": {
    // 具体数据内容
  },
  "meta": {
    "timestamp": "2025-01-27T10:00:00Z",
    "requestId": "req_123456789",
    "version": "1.0"
  }
}
```

#### 分页响应
```json
{
  "success": true,
  "data": [
    // 数据数组
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "totalPages": 5,
    "hasNext": true,
    "hasPrev": false
  },
  "meta": {
    "timestamp": "2025-01-27T10:00:00Z",
    "requestId": "req_123456789"
  }
}
```

#### 错误响应
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "请求参数验证失败",
    "details": [
      {
        "field": "email",
        "code": "INVALID_FORMAT",
        "message": "邮箱格式不正确"
      }
    ]
  },
  "meta": {
    "timestamp": "2025-01-27T10:00:00Z",
    "requestId": "req_123456789"
  }
}
```

## 二、认证 API

### 2.1 用户注册

#### 请求
```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securePassword123",
  "name": "张三",
  "agreeToTerms": true
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123456",
      "email": "user@example.com",
      "name": "张三",
      "emailVerified": false,
      "createdAt": "2025-01-27T10:00:00Z"
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "refresh_token_here",
      "expiresIn": 900
    }
  }
}
```

#### 错误码
- `EMAIL_ALREADY_EXISTS`: 邮箱已存在
- `WEAK_PASSWORD`: 密码强度不足
- `TERMS_NOT_AGREED`: 未同意服务条款

### 2.2 用户登录

#### 请求
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securePassword123",
  "deviceInfo": {
    "deviceId": "device_123",
    "platform": "iOS",
    "version": "1.0.0"
  }
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "user_123456",
      "email": "user@example.com",
      "name": "张三",
      "profile": {
        "quitDate": "2025-01-01T00:00:00Z",
        "cigarettesPerDay": 20,
        "cigarettePrice": 15.00
      }
    },
    "tokens": {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "refreshToken": "refresh_token_here",
      "expiresIn": 900
    }
  }
}
```

### 2.3 刷新令牌

#### 请求
```http
POST /auth/refresh
Content-Type: application/json

{
  "refreshToken": "refresh_token_here"
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "accessToken": "new_access_token_here",
    "refreshToken": "new_refresh_token_here",
    "expiresIn": 900
  }
}
```

## 三、用户资料 API

### 3.1 获取用户资料

#### 请求
```http
GET /users/profile
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": {
    "id": "user_123456",
    "email": "user@example.com",
    "name": "张三",
    "avatar": "https://cdn.example.com/avatars/user_123456.jpg",
    "profile": {
      "quitDate": "2025-01-01T00:00:00Z",
      "quitReason": "为了健康",
      "cigarettesPerDay": 20,
      "cigarettePrice": 15.00,
      "currency": "CNY",
      "timezone": "Asia/Shanghai",
      "locale": "zh-CN"
    },
    "stats": {
      "totalDaysQuit": 27,
      "totalMoneySaved": 405.00,
      "totalCigarettesAvoided": 540,
      "longestStreak": 15
    },
    "createdAt": "2025-01-01T00:00:00Z",
    "updatedAt": "2025-01-27T10:00:00Z"
  }
}
```

### 3.2 更新用户资料

#### 请求
```http
PUT /users/profile
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "name": "张三丰",
  "profile": {
    "quitReason": "为了家人的健康",
    "cigarettesPerDay": 15,
    "cigarettePrice": 18.00
  }
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "id": "user_123456",
    "name": "张三丰",
    "profile": {
      "quitDate": "2025-01-01T00:00:00Z",
      "quitReason": "为了家人的健康",
      "cigarettesPerDay": 15,
      "cigarettePrice": 18.00,
      "currency": "CNY"
    },
    "updatedAt": "2025-01-27T10:30:00Z"
  }
}
```

## 四、每日打卡 API

### 4.1 获取打卡记录

#### 请求
```http
GET /checkins?startDate=2025-01-01&endDate=2025-01-31&page=1&limit=31
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": [
    {
      "id": "checkin_123",
      "date": "2025-01-27",
      "isCheckedIn": true,
      "checkinTime": "2025-01-27T08:30:00Z",
      "streak": 15,
      "createdAt": "2025-01-27T08:30:00Z"
    },
    {
      "id": "checkin_124",
      "date": "2025-01-26",
      "isCheckedIn": true,
      "checkinTime": "2025-01-26T09:15:00Z",
      "streak": 14,
      "createdAt": "2025-01-26T09:15:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 31,
    "total": 27,
    "totalPages": 1
  }
}
```

### 4.2 创建打卡记录

#### 请求
```http
POST /checkins
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "date": "2025-01-27",
  "checkinTime": "2025-01-27T08:30:00Z",
  "note": "今天感觉很好！"
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "id": "checkin_125",
    "date": "2025-01-27",
    "isCheckedIn": true,
    "checkinTime": "2025-01-27T08:30:00Z",
    "streak": 16,
    "note": "今天感觉很好！",
    "achievements": [
      {
        "id": "achievement_half_month",
        "name": "半月成就",
        "description": "连续戒烟15天",
        "unlockedAt": "2025-01-27T08:30:00Z"
      }
    ],
    "createdAt": "2025-01-27T08:30:00Z"
  }
}
```

### 4.3 获取打卡统计

#### 请求
```http
GET /checkins/stats?period=month&date=2025-01
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": {
    "period": "2025-01",
    "totalDays": 31,
    "checkedInDays": 27,
    "checkinRate": 0.87,
    "currentStreak": 15,
    "longestStreak": 20,
    "streakHistory": [
      {"date": "2025-01-01", "streak": 1},
      {"date": "2025-01-02", "streak": 2},
      // ...
    ],
    "weeklyStats": [
      {"week": 1, "checkedIn": 7, "total": 7},
      {"week": 2, "checkedIn": 6, "total": 7},
      // ...
    ]
  }
}
```

## 五、吸烟记录 API

### 5.1 获取吸烟记录

#### 请求
```http
GET /smoking-records?startDate=2025-01-01&endDate=2025-01-31&page=1&limit=20
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": [
    {
      "id": "record_123",
      "timestamp": "2025-01-15T14:30:00Z",
      "cigarettesSmoked": 2,
      "triggerTags": ["stress", "work"],
      "notes": "工作压力大",
      "location": {
        "name": "办公室",
        "coordinates": [116.4074, 39.9042]
      },
      "createdAt": "2025-01-15T14:35:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 5,
    "totalPages": 1
  }
}
```

### 5.2 创建吸烟记录

#### 请求
```http
POST /smoking-records
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "timestamp": "2025-01-27T15:30:00Z",
  "cigarettesSmoked": 1,
  "triggerTags": ["social", "break"],
  "notes": "和同事一起休息时",
  "location": {
    "name": "公司楼下",
    "coordinates": [116.4074, 39.9042]
  }
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "id": "record_126",
    "timestamp": "2025-01-27T15:30:00Z",
    "cigarettesSmoked": 1,
    "triggerTags": ["social", "break"],
    "notes": "和同事一起休息时",
    "location": {
      "name": "公司楼下",
      "coordinates": [116.4074, 39.9042]
    },
    "impact": {
      "streakBroken": true,
      "previousStreak": 15,
      "moneyCost": 15.00
    },
    "createdAt": "2025-01-27T15:30:00Z"
  }
}
```

### 5.3 获取吸烟统计

#### 请求
```http
GET /smoking-records/stats?period=month&date=2025-01
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": {
    "period": "2025-01",
    "totalRecords": 5,
    "totalCigarettes": 8,
    "totalCost": 120.00,
    "averagePerDay": 0.26,
    "commonTriggers": [
      {"tag": "stress", "count": 3},
      {"tag": "social", "count": 2},
      {"tag": "work", "count": 2}
    ],
    "dailyBreakdown": [
      {"date": "2025-01-05", "cigarettes": 2, "cost": 30.00},
      {"date": "2025-01-15", "cigarettes": 2, "cost": 30.00},
      // ...
    ],
    "trends": {
      "compared_to_previous_month": {
        "cigarettes": -12,
        "cost": -180.00,
        "improvement": 0.6
      }
    }
  }
}
```

## 六、数据同步 API

### 6.1 获取同步状态

#### 请求
```http
GET /sync/status
Authorization: Bearer <access_token>
```

#### 响应
```json
{
  "success": true,
  "data": {
    "lastSyncAt": "2025-01-27T09:00:00Z",
    "syncVersion": 1234567890,
    "deviceId": "device_123",
    "conflictsCount": 0,
    "pendingChanges": 0,
    "syncStatus": "up_to_date"
  }
}
```

### 6.2 上传本地数据

#### 请求
```http
POST /sync/upload
Authorization: Bearer <access_token>
Content-Type: application/json

{
  "deviceId": "device_123",
  "lastSyncVersion": 1234567880,
  "changes": [
    {
      "table": "daily_checkins",
      "operation": "INSERT",
      "data": {
        "localId": "local_123",
        "date": "2025-01-27",
        "isCheckedIn": true,
        "checkinTime": "2025-01-27T08:30:00Z"
      },
      "timestamp": "2025-01-27T08:30:00Z"
    }
  ]
}
```

#### 响应
```json
{
  "success": true,
  "data": {
    "syncVersion": 1234567891,
    "processedChanges": 1,
    "conflicts": [],
    "serverChanges": [
      {
        "table": "achievements",
        "operation": "INSERT",
        "data": {
          "id": "achievement_123",
          "key": "half_month",
          "unlockedAt": "2025-01-27T08:30:00Z"
        }
      }
    ]
  }
}
```

---

*文档创建时间：2025-01-27*  
*版本：1.0*  
*状态：详细设计完成*
