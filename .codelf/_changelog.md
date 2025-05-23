# 变更日志模板 (请保持这个标题)

> 📝 请记录项目重大版本更改、功能添加和架构更改，便于团队成员了解最近的变更

## 功能更新: 添加烟瘾管理相关功能

**日期**: 2023-05-27

**分类**: Feature

**目的**: 增强首页功能，提供紧急烟瘾应对机制

**详细描述**:
1. 添加"我想吸烟"应急按钮功能，点击后导航至烟瘾应对策略页面
2. 实现烟瘾应对策略选择页面，包含三种主要应对策略：
   - 深呼吸练习：带有视觉引导的呼吸练习动画
   - 喝水提醒：简单的提醒用户喝水以分散注意力
   - 分散注意力技巧：提供多种分散注意力的具体方法
3. 实现深呼吸练习引导页面，使用动画引导用户完成定时的深呼吸练习
4. 添加烟瘾记录功能，让用户可以记录烟瘾强度、触发因素和相关笔记
5. 为所有新功能添加国际化支持(中英文)

**原因**: 烟瘾应对是戒烟过程中最关键的环节之一，这些功能帮助用户度过紧急烟瘾发作的时刻，提高戒烟成功率。

**影响范围**:
- 首页 UI 更新 (`lib/presentation/features/home/pages/home_page.dart`)
- 新增烟瘾应对策略页面 (`lib/presentation/features/home/pages/craving_coping_strategies_page.dart`)
- 新增深呼吸练习引导页面 (`lib/presentation/features/home/pages/breathing_exercise_guide_page.dart`)
- 新增烟瘾记录模态框 (`lib/presentation/features/home/pages/craving_log_modal.dart`)
- 路由配置更新 (`lib/core/router/app_router.dart`)
- 国际化文件更新 (`lib/l10n/app_en.arb` 和 `lib/l10n/app_zh.arb`)

**API 变更**: 无

**配置变更**: 无

**性能影响**: 无明显性能影响

## {datetime: YYYY-MM-DD HH:mm:ss}

### 1. {function simple description}

**Change Type**: {type: feature/fix/improvement/refactor/docs/test/build}

> **Purpose**: {function purpose}
> **Detailed Description**: {function detailed description}
> **Reason for Change**: {why this change is needed}
> **Impact Scope**: {other modules or functions that may be affected by this change}
> **API Changes**: {if there are API changes, detail the old and new APIs}
> **Configuration Changes**: {changes to environment variables, config files, etc.}
> **Performance Impact**: {impact of the change on system performance}

   ```
   root
   - pkg    // {type: add/del/refact/-} {The role of a folder}
    - utils // {type: add/del/refact} {The function of the file}
   - xxx    // {type: add/del/refact} {The function of the file}
   ```

### 2. {function simple description}

**Change Type**: {type: feature/fix/improvement/refactor/docs/test/build}

> **Purpose**: {function purpose}
> **Detailed Description**: {function detailed description}
> **Reason for Change**: {why this change is needed}
> **Impact Scope**: {other modules or functions that may be affected by this change}
> **API Changes**: {if there are API changes, detail the old and new APIs}
> **Configuration Changes**: {changes to environment variables, config files, etc.}
> **Performance Impact**: {impact of the change on system performance}

   ```
   root
   - pkg    // {type: add/del/refact/-} {The role of a folder}
    - utils // {type: add/del/refact} {The function of the file}
   - xxx    // {type: add/del/refact} {The function of the file}
   ```

...