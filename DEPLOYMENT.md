# 生产环境部署指南

## 🚀 快速部署

### 前置条件
- 服务器：199.68.217.152
- 操作系统：Linux (Ubuntu/CentOS)
- 内存：至少2GB
- 磁盘：至少10GB可用空间

### 1. 服务器环境准备

```bash
# 连接服务器
ssh root@199.68.217.152

# 更新系统
apt update && apt upgrade -y  # Ubuntu
# 或
yum update -y  # CentOS

# 安装Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 安装Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 启动Docker服务
systemctl start docker
systemctl enable docker

# 验证安装
docker --version
docker-compose --version
```

### 2. 代码部署

```bash
# 创建项目目录
mkdir -p /opt/quit-journey-backend
cd /opt/quit-journey-backend

# 方式1: 使用Git (推荐)
git clone <your-repository-url> .

# 方式2: 使用SCP上传
# 在本地执行:
# scp -r . root@199.68.217.152:/opt/quit-journey-backend/
```

### 3. 环境配置

```bash
# 复制环境变量模板
cp .env.example .env

# 编辑环境变量
nano .env
```

#### 🔐 重要：必须修改的安全配置

```bash
# 生成强JWT密钥
openssl rand -base64 64

# 生成安全的数据库密码
openssl rand -base64 32

# 生成Redis密码
openssl rand -base64 16
```

#### 📝 .env 配置示例

```env
# 数据库配置
DB_USERNAME=quitjourney_user
DB_PASSWORD=your_generated_secure_password_here
POSTGRES_DB=quitjourney
POSTGRES_USER=quitjourney_user
POSTGRES_PASSWORD=your_generated_secure_password_here

# Redis配置
REDIS_PASSWORD=your_redis_password_here

# JWT配置 (使用上面生成的密钥)
JWT_SECRET=your_generated_jwt_secret_here
JWT_EXPIRATION=900000
JWT_REFRESH_EXPIRATION=2592000000

# API文档 (生产环境建议关闭)
API_DOCS_ENABLED=false
SWAGGER_UI_ENABLED=false
```

### 4. 部署服务

```bash
# 使用部署脚本 (推荐)
./scripts/deploy.sh prod

# 或手动部署
docker-compose -f docker-compose.prod.yml up -d --build
```

### 5. 验证部署

```bash
# 检查服务状态
docker-compose -f docker-compose.prod.yml ps

# 检查健康状态
curl http://localhost:8080/api/v1/actuator/health

# 查看日志
docker-compose -f docker-compose.prod.yml logs -f api
```

## 🔧 高级配置

### SSL证书配置

#### 使用Let's Encrypt (推荐)

```bash
# 安装Certbot
apt install certbot  # Ubuntu
# 或
yum install certbot  # CentOS

# 获取证书 (替换your-domain.com)
certbot certonly --standalone -d your-domain.com

# 复制证书到项目目录
mkdir -p nginx/ssl
cp /etc/letsencrypt/live/your-domain.com/fullchain.pem nginx/ssl/cert.pem
cp /etc/letsencrypt/live/your-domain.com/privkey.pem nginx/ssl/key.pem

# 设置自动续期
echo "0 12 * * * /usr/bin/certbot renew --quiet" | crontab -
```

#### 使用自签名证书 (测试用)

```bash
mkdir -p nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx/ssl/key.pem \
    -out nginx/ssl/cert.pem \
    -subj "/C=CN/ST=State/L=City/O=Organization/CN=localhost"
```

### 域名配置

1. **DNS解析**：将域名A记录指向 199.68.217.152
2. **Nginx配置**：修改 `nginx/nginx.conf` 中的 `server_name`
3. **重启服务**：`docker-compose -f docker-compose.prod.yml restart nginx`

### 防火墙配置

```bash
# Ubuntu (ufw)
ufw allow 22    # SSH
ufw allow 80    # HTTP
ufw allow 443   # HTTPS
ufw enable

# CentOS (firewalld)
firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
```

## 📊 监控和维护

### 日志管理

```bash
# 查看应用日志
docker-compose -f docker-compose.prod.yml logs -f api

# 查看数据库日志
docker-compose -f docker-compose.prod.yml logs -f db

# 查看Nginx日志
docker-compose -f docker-compose.prod.yml logs -f nginx
```

### 数据备份

```bash
# 手动备份数据库
docker-compose -f docker-compose.prod.yml exec db pg_dump -U quitjourney_user quitjourney > backup_$(date +%Y%m%d_%H%M%S).sql

# 恢复数据库
docker-compose -f docker-compose.prod.yml exec -T db psql -U quitjourney_user quitjourney < backup_file.sql
```

### 性能监控

```bash
# 查看资源使用情况
docker stats

# 查看服务状态
docker-compose -f docker-compose.prod.yml ps

# 健康检查
curl http://localhost:8080/api/v1/actuator/health
```

## 🔄 更新部署

### 代码更新

```bash
# 拉取最新代码
git pull origin main

# 重新部署
./scripts/deploy.sh prod
```

### 数据库迁移

```bash
# 查看迁移状态
docker-compose -f docker-compose.prod.yml exec api ./gradlew flywayInfo

# 执行迁移
docker-compose -f docker-compose.prod.yml exec api ./gradlew flywayMigrate
```

## 🚨 故障排除

### 常见问题

#### 1. 服务启动失败
```bash
# 查看详细日志
docker-compose -f docker-compose.prod.yml logs api

# 检查配置文件
docker-compose -f docker-compose.prod.yml config
```

#### 2. 数据库连接失败
```bash
# 检查数据库状态
docker-compose -f docker-compose.prod.yml exec db pg_isready

# 检查网络连接
docker-compose -f docker-compose.prod.yml exec api ping db
```

#### 3. 内存不足
```bash
# 查看内存使用
free -h
docker stats

# 调整Docker资源限制
# 编辑 docker-compose.prod.yml 中的 deploy.resources 部分
```

### 紧急恢复

```bash
# 停止所有服务
docker-compose -f docker-compose.prod.yml down

# 清理容器和网络
docker system prune -f

# 重新启动
docker-compose -f docker-compose.prod.yml up -d --build
```

## 📞 支持

如果遇到问题，请检查：
1. 服务器资源是否充足
2. 网络连接是否正常
3. 配置文件是否正确
4. 日志中的错误信息

更多帮助请联系技术支持。
