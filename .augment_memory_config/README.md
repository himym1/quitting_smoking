# Augment Agent 2.0 配置系统

## 🚀 一键部署

在任何项目中，只需要运行一个简单命令：

```bash
# 在Augment Agent中说：
"执行 augment_init 命令初始化项目"
```

系统将自动：
- ✅ 检测项目技术栈（支持9种主流技术栈）
- ✅ 创建完整的记忆系统（`.augment_memory/` 目录）
- ✅ 配置开发工具链和最佳实践
- ✅ 建立项目上下文和AI辅助工作流

## 📁 配置文件说明

### 配置目录（用户部署）
```
.augment_memory_config/          # 配置文件目录（仅2个文件）
├── augment_master_config.md    # 主配置文件（包含所有16章节）
└── README.md                   # 本文件（快速开始指南）
```

### 运行时记忆（系统生成）
```
.augment_memory/                 # 运行时记忆系统（自动创建）
├── core/                       # 长期记忆（架构、模式、决策等）
├── task-logs/                  # 短期记忆（任务执行日志）
├── activeContext.md            # 工作记忆（当前任务上下文）
├── memory-index.md             # 记忆索引和元数据
└── session-history.md          # 会话历史记录
```

## 🔧 核心命令

### augment_init - 一键初始化
```bash
"执行 augment_init 命令初始化项目"
```
- 自动检测技术栈（JavaScript/Python/Rust/Java/Go/C#/PHP/Ruby/C++）
- 创建完整的记忆系统
- 配置项目特定的开发工具链

### augment_reload - 记忆重载
```bash
"执行 augment_reload 命令重新加载项目记忆"
```
- 重新加载所有记忆层
- 验证记忆一致性
- 重建项目上下文

### augment_import_windsurf - Windsurf导入
```bash
"执行 augment_import_windsurf 命令导入Windsurf配置"
```
- 无缝导入现有Windsurf配置
- 智能格式转换和适配
- 保留历史任务日志

### augment_force_reset - 强制重置
```bash
"执行 augment_force_reset 命令重置所有配置"
```
- 安全的强制重置功能
- 自动备份重要文件
- 三级确认机制

## 🛠️ 支持的技术栈

| 技术栈                       | 检测文件                                 | 自动配置                              |
|---------------------------|--------------------------------------|-----------------------------------|
| **JavaScript/TypeScript** | `package.json`                       | React/Vue/Angular + npm/yarn/pnpm |
| **Python**                | `requirements.txt`, `pyproject.toml` | Django/Flask/FastAPI + pip/poetry |
| **Rust**                  | `Cargo.toml`                         | Cargo + rustfmt + clippy          |
| **Java**                  | `pom.xml`, `build.gradle`            | Spring Boot + Maven/Gradle        |
| **Go**                    | `go.mod`                             | Go modules + go fmt + go test     |
| **C#/.NET**               | `*.csproj`, `*.sln`                  | .NET Core + dotnet CLI            |
| **PHP**                   | `composer.json`                      | Laravel/Symfony + Composer        |
| **Ruby**                  | `Gemfile`                            | Rails + Bundler + RSpec           |
| **C/C++**                 | `CMakeLists.txt`, `Makefile`         | CMake/Make + GCC/Clang            |

## ⚙️ 核心特性

### 🧠 三层记忆系统
- **工作记忆**：当前任务和即时目标
- **短期记忆**：最近任务的详细记录
- **长期记忆**：架构设计和重要决策

### 🔄 四阶段自我批评循环
1. **创建者阶段**：生成初始解决方案
2. **批评者阶段**：识别问题和改进点
3. **辩护者阶段**：系统性解决问题
4. **评判者阶段**：质量评估和学习记录

### 📊 23分制评分系统
- **优秀**：21-23分 (≥90%)
- **充分**：18-20分 (≥78%)
- **最低标准**：18分 (≥78%)
- **不可接受**：<18分 (<78%)

## 📋 快速使用流程

### 新项目
```bash
# 1. 创建项目
mkdir my-project && cd my-project

# 2. 初始化Augment Agent
"执行 augment_init 命令初始化项目"

# 3. 开始AI辅助开发
"帮我创建项目的基础架构"
```

### 现有项目
```bash
# 1. 进入项目目录
cd existing-project

# 2. 一键集成
"执行 augment_init 命令初始化项目"

# 3. 开始使用
"分析当前项目并提供优化建议"
```

### 从Windsurf迁移
```bash
# 1. 进入Windsurf项目
cd windsurf-project

# 2. 导入配置
"执行 augment_import_windsurf 命令导入Windsurf配置"

# 3. 验证迁移
"执行 augment_reload 命令重新加载项目记忆"
```

## 🔍 故障排除

### 常见问题

#### 初始化失败
```bash
# 检查权限和目录
ls -la
pwd

# 重新尝试
"执行 augment_init 命令初始化项目"
```

#### 记忆系统不一致
```bash
# 重新加载记忆
"执行 augment_reload 命令重新加载项目记忆"

# 如果仍有问题，强制重置
"执行 augment_force_reset 命令重置所有配置"
```

#### 技术栈检测失败
- 确认项目配置文件存在（如 package.json, requirements.txt 等）
- 检查文件格式是否正确
- 手动指定技术栈类型

## 📚 详细文档

完整的配置和使用指南请查看：
- **[主配置文件](augment_master_config.md)**：包含所有16章节的详细配置
- **第1-5章**：核心系统（规则、记忆、评分、循环、工作流）
- **第6-8章**：技术栈支持（支持列表、检测机制、特定配置）
- **第9-12章**：命令系统（init、reload、import、reset）
- **第13-16章**：使用指南（快速开始、部署、故障排除、最佳实践）

## 🎯 版本对比

| 特性 | v1.0 (旧版本) | v2.0 (当前版本) |
|------|---------------|-----------------|
| 配置文件数量 | 8个分散文件 | 2个文件（1个主配置） |
| 部署复杂度 | 复杂 | 极简（一键部署） |
| Windsurf兼容 | 无 | 完全兼容 |
| 用户体验 | 学习曲线陡峭 | 直观易用 |

## 📞 获取帮助

1. **查看主配置文件**：详细的使用指南和故障排除
2. **检查系统状态**：验证目录结构和文件完整性
3. **重新加载记忆**：解决大部分一致性问题
4. **强制重置**：最后的解决方案（会备份重要文件）

---

**🎉 开始您的AI辅助开发之旅！**

立即执行 `"执行 augment_init 命令初始化项目"` 来体验Augment Agent 2.0的强大功能！
