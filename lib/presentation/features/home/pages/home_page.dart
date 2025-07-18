/// 焕新之旅 - 戒烟辅助应用
///
/// 首页/主看板 (HomePage)
/// 功能：
/// 1. 实时显示戒烟进度统计（时长、金钱、香烟数量）
/// 2. 展示健康效益快览卡片
/// 3. 显示用户戒烟宣言/理由
/// 4. 提供每日打卡功能
/// 5. 展示月度吸烟日历
/// 6. 提供"我想吸烟"应急按钮
///
/// 页面结构：
/// - AppBar: 应用标题
/// - 滚动内容区域：
///   * 实时进度追踪卡片
///   * 健康效益预览卡片
///   * 戒烟宣言展示
///   * 每日打卡区域
///   * 月度吸烟记录日历
/// - 悬浮按钮：应急求助按钮
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // 数字格式化
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/home/providers/daily_check_in_notifier.dart';
import 'package:quitting_smoking/presentation/features/home/providers/health_benefits_provider.dart';
import 'package:quitting_smoking/presentation/features/home/providers/home_dashboard_stats_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/presentation/widgets/monthly_smoking_calendar.dart';
import 'package:quitting_smoking/presentation/features/home/pages/calendar_detail_page.dart';
import 'package:quitting_smoking/presentation/providers/calendar_month_provider.dart';
import 'package:quitting_smoking/core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart'; // 国际化支持

/// 首页组件
///
/// 应用的主要功能页面，展示戒烟进度和相关功能入口
/// 使用 ConsumerStatefulWidget 以便管理滚动控制器
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 平滑的月份切换方法
  void _changeMonthWithScrollPosition(VoidCallback changeMonth) {
    // 直接执行月份切换，AnimatedSwitcher会处理平滑过渡
    changeMonth();
  }

  @override
  Widget build(BuildContext context) {
    // 获取本地化文本
    final localizations = AppLocalizations.of(context);

    // 监听首页统计数据状态
    final statsState = ref.watch(homeDashboardStatsProvider);

    // 监听用户认证状态
    final authState = ref.watch(authNotifierProvider);

    // 提取用户档案信息
    UserProfile? userProfile;
    authState.whenOrNull(authenticated: (up) => userProfile = up);

    return Scaffold(
      /// 应用栏配置
      /// 显示应用标题，禁用返回按钮（因为这是Tab页面）
      appBar: AppBar(
        title: Text(
          localizations.appTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false, // 不显示返回箭头
        elevation: 0, // 无阴影，与内容融合
      ),

      /// 主体内容区域
      /// 使用 ListView 实现垂直滚动布局
      body: ListView(
        key: const PageStorageKey<String>('home_page_scroll'),
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: [
          // ==================== 核心功能区域 ====================

          /// 1. 实时进度追踪区域
          /// 显示戒烟时长、节省金额、少吸烟支数等核心指标
          _buildProgressTrackingSection(context, localizations, statsState),
          const SizedBox(height: 16),

          /// 2. 健康效益概览区域
          /// 显示当前阶段的健康恢复里程碑
          _buildHealthBenefitsSection(context, localizations, ref),
          const SizedBox(height: 16),

          /// 3. 戒烟宣言/理由展示区域
          /// 显示用户在初始设置中填写的戒烟动机
          _buildQuitReasonSection(
            context,
            localizations,
            userProfile?.quitReason,
          ),
          const SizedBox(height: 16),

          /// 4. 每日打卡区域
          /// 提供每日坚持戒烟的确认功能
          _buildDailyCheckInSection(context, localizations, ref),
          const SizedBox(height: 16),

          /// 5. 月度吸烟日历
          /// 可视化展示每月的吸烟记录情况
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey(ref.watch(calendarMonthProvider).toString()),
              child: _buildMonthlySmokingCalendar(context, ref, localizations),
            ),
          ),
          const SizedBox(height: 32), // 为悬浮按钮留出额外空间
        ],
      ),

      /// 悬浮操作按钮配置
      /// 位置：屏幕底部居中悬浮
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      /// "我想吸烟"应急按钮
      /// 醒目的红色按钮，提供即时的烟瘾应对支持
      floatingActionButton: _buildEmergencyButton(context, localizations),
    );
  }

  /// 构建实时进度追踪区域
  ///
  /// 显示戒烟核心统计数据：
  /// - 戒烟时长（天/时/分/秒）
  /// - 节省金额（格式化货币显示）
  /// - 少吸烟支数
  /// - 预估延长寿命
  Widget _buildProgressTrackingSection(
    BuildContext context,
    AppLocalizations localizations,
    HomeDashboardStatsState stats,
  ) {
    // 计算戒烟时长的各个单位
    final d = stats.quitDuration.inDays; // 天数
    final h = stats.quitDuration.inHours % 24; // 小时（除去完整天数）
    final m = stats.quitDuration.inMinutes % 60; // 分钟（除去完整小时）
    final s = stats.quitDuration.inSeconds % 60; // 秒数（除去完整分钟）

    // 格式化节省金额为中文货币格式
    final moneySavedFormatted = NumberFormat.currency(
      locale: 'zh_CN',
      symbol: '¥',
      decimalDigits: 0, // 不显示小数位
    ).format(stats.moneySaved);

    return Card(
      elevation: 3, // 卡片阴影
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 区域标题行
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  localizations.homeProgressTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 戒烟时长显示（居中适中字体）
            Center(
              child: Text(
                localizations.homeProgressTime(
                  d.toString(),
                  h.toString(),
                  m.toString(),
                  s.toString(),
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 14),

            // 统计数据行式布局
            // 包含：节省金额、少吸烟支数、延长寿命
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 节省金额列
                Column(
                  children: [
                    Icon(Icons.savings, color: Colors.green[700], size: 22),
                    const SizedBox(height: 4),
                    Text(
                      moneySavedFormatted,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    Text(
                      localizations.progressSavedMoney,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),

                // 少吸烟支数列
                Column(
                  children: [
                    Icon(Icons.smoke_free, color: Colors.blue[700], size: 22),
                    const SizedBox(height: 4),
                    Text(
                      stats.cigarettesNotSmoked.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Text(
                      localizations.progressCigarettesNotSmoked,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),

                // 延长寿命列（基于简单估算：每支烟减少11分钟寿命）
                Column(
                  children: [
                    Icon(Icons.favorite, color: Colors.red[700], size: 22),
                    const SizedBox(height: 4),
                    Text(
                      ((stats.cigarettesNotSmoked * 11) / (24 * 60))
                          .toStringAsFixed(1), // 转换为天数，保留1位小数
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                    Text(
                      localizations.progressLifeExtended,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建健康效益概览区域
  ///
  /// 显示当前戒烟阶段对应的健康恢复里程碑
  /// 支持点击跳转到详情页查看完整时间轴
  Widget _buildHealthBenefitsSection(
    BuildContext context,
    AppLocalizations localizations,
    WidgetRef ref,
  ) {
    final healthBenefitsState = ref.watch(healthBenefitsNotifierProvider);
    final healthBenefitsNotifier = ref.read(
      healthBenefitsNotifierProvider.notifier,
    );

    // Helper to get localized string
    String getLocalizedString(String key) {
      // This is a simplified way. A more robust solution might involve a map or a switch.
      // For now, direct mapping based on known keys.
      // Consider a helper function in AppLocalizations if this becomes complex.
      switch (key) {
        case "healthBenefitTitle_20mins":
          return localizations.healthBenefitTitle_20mins;
        case "healthBenefitDesc_20mins":
          return localizations.healthBenefitDesc_20mins;
        case "healthBenefitTitle_8hours":
          return localizations.healthBenefitTitle_8hours;
        case "healthBenefitDesc_8hours":
          return localizations.healthBenefitDesc_8hours;
        case "healthBenefitTitle_24hours":
          return localizations.healthBenefitTitle_24hours;
        case "healthBenefitDesc_24hours":
          return localizations.healthBenefitDesc_24hours;
        case "healthBenefitTitle_48hours":
          return localizations.healthBenefitTitle_48hours;
        case "healthBenefitDesc_48hours":
          return localizations.healthBenefitDesc_48hours;
        case "healthBenefitTitle_2weeks":
          return localizations.healthBenefitTitle_2weeks;
        case "healthBenefitDesc_2weeks":
          return localizations.healthBenefitDesc_2weeks;
        case "healthBenefitTitle_1month":
          return localizations.healthBenefitTitle_1month;
        case "healthBenefitDesc_1month":
          return localizations.healthBenefitDesc_1month;
        default:
          return key; // Fallback to key if no match
      }
    }

    IconData getIconData(String? iconName) {
      switch (iconName) {
        case 'favorite_border':
          return Icons.favorite_border;
        case 'bloodtype':
          return Icons.bloodtype;
        case 'local_hospital': // Changed from lung_cancer to a more generic one
          return Icons.local_hospital;
        case 'self_improvement':
          return Icons.self_improvement;
        case 'directions_walk':
          return Icons.directions_walk;
        case 'healing':
          return Icons.healing;
        default:
          return Icons.help_outline; // Default icon
      }
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.health_and_safety,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  localizations.homeHealthBenefitsTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (healthBenefitsState.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (healthBenefitsState.errorMessage != null)
              Center(
                child: Text(
                  healthBenefitsState.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              )
            else if (healthBenefitsNotifier.getDisplayBenefits().isEmpty)
              Center(
                child: Text(localizations.homeHealthBenefitsNothingToShow),
              ) // Add this localization key
            else
              ...healthBenefitsNotifier.getDisplayBenefits().map((benefit) {
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.1),
                      child: Icon(
                        getIconData(benefit.iconName),
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      getLocalizedString(benefit.titleKey),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      getLocalizedString(benefit.descriptionKey),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.5),
                    ),
                    onTap: () {
                      // 使用 push 替代 go，以保留 ShellRoute 在导航栈中
                      context.push('/health-benefits-detail/${benefit.id}');
                    },
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildQuitReasonSection(
    BuildContext context,
    AppLocalizations localizations,
    String? quitReason,
  ) {
    final displayReason =
        quitReason != null && quitReason.isNotEmpty
            ? quitReason
            : localizations.homeQuitReasonPlaceholder;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.psychology,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  localizations.homeQuitReasonTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                displayReason,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyCheckInSection(
    BuildContext context,
    AppLocalizations localizations,
    WidgetRef ref,
  ) {
    final dailyCheckInState = ref.watch(dailyCheckInNotifierProvider);
    final dailyCheckInNotifier = ref.read(
      dailyCheckInNotifierProvider.notifier,
    );

    // Listen to the stream for real-time updates
    ref.listen<DailyCheckInState>(dailyCheckInNotifierProvider, (
      previous,
      next,
    ) {
      if (next.status == DailyCheckInStatus.error &&
          next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    Widget buttonChild;
    VoidCallback? onPressed;
    String statusText;

    switch (dailyCheckInState.status) {
      case DailyCheckInStatus.initial:
        buttonChild = const CircularProgressIndicator(color: Colors.white);
        onPressed = null;
        statusText = localizations.checkingTodayStatus;
        break;
      case DailyCheckInStatus.checkedIn:
        if (dailyCheckInState.isAutoCheckedIn) {
          statusText = localizations.autoCheckInSuccess;
          buttonChild = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                localizations.alreadyAutoCheckedIn,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          );
        } else {
          statusText = localizations.manualCheckInSuccess;
          buttonChild = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                localizations.homeDailyCheckInButtonCheckedIn,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          );
        }
        onPressed = null; // 已经打卡
        break;
      case DailyCheckInStatus.notCheckedIn:
        statusText = localizations.cannotCheckInSmoking;
        buttonChild = Text(localizations.todayAlreadySmoked);
        onPressed = null; // 不能打卡，因为有吸烟记录
        break;
      case DailyCheckInStatus.error:
        statusText =
            "❌ ${dailyCheckInState.errorMessage ?? localizations.statusCheckFailed}";
        buttonChild = Text(localizations.recheckStatus);
        onPressed = () {
          // 重新检查状态
          dailyCheckInNotifier.onSmokingRecorded();
        };
        break;
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  localizations.dailyCheckInStatus,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    dailyCheckInState.status == DailyCheckInStatus.checkedIn
                        ? AppColors.successGreen.withValues(alpha: 0.1)
                        : dailyCheckInState.status ==
                            DailyCheckInStatus.notCheckedIn
                        ? AppColors.warningRed.withValues(alpha: 0.1)
                        : AppColors.textMediumGray.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localizations.autoCheckInRule,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            if (dailyCheckInState.status == DailyCheckInStatus.notCheckedIn &&
                onPressed != null) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: buttonChild,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlySmokingCalendar(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations localizations,
  ) {
    final selectedMonth = ref.watch(calendarMonthProvider);
    final monthNotifier = ref.read(calendarMonthProvider.notifier);
    final smokingCountsAsyncValue = ref.watch(
      selectedMonthSmokingCountsProvider,
    );
    final checkInDaysAsyncValue = ref.watch(selectedMonthCheckInDaysProvider);

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题和月份选择器
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).primaryColor,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    localizations.monthlyCalendar,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 月份选择器
                Flexible(
                  child: _buildMonthSelector(
                    context,
                    monthNotifier,
                    selectedMonth,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 日历内容
            smokingCountsAsyncValue.when(
              data: (smokingCounts) {
                return checkInDaysAsyncValue.when(
                  data: (checkInDays) {
                    return MonthlySmokingCalendar(
                      currentMonth: selectedMonth,
                      smokingCounts: smokingCounts,
                      checkInDays: checkInDays,
                      onDateTap: (date) {
                        // 导航到日历详情页面
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    CalendarDetailPage(selectedDate: date),
                          ),
                        );
                      },
                    );
                  },
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error:
                      (error, stackTrace) => Center(
                        child: Text(
                          '加载打卡数据失败：$error',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, stackTrace) => Center(
                    child: Text(
                      localizations.loadingCalendarError(error.toString()),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建月份选择器
  Widget _buildMonthSelector(
    BuildContext context,
    CalendarMonthNotifier monthNotifier,
    DateTime selectedMonth,
  ) {
    return SizedBox(
      width: 120, // 固定宽度避免溢出
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 上一个月按钮
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              onPressed:
                  monthNotifier.canGoToPreviousMonth()
                      ? () => _changeMonthWithScrollPosition(
                        () => monthNotifier.previousMonth(),
                      )
                      : null,
              icon: const Icon(Icons.chevron_left),
              iconSize: 16,
              padding: EdgeInsets.zero,
            ),
          ),

          // 月份显示
          Expanded(
            child: GestureDetector(
              onTap:
                  () => _showMonthPicker(context, monthNotifier, selectedMonth),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  monthNotifier.getMonthDisplayText(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),

          // 下一个月按钮
          SizedBox(
            width: 24,
            height: 24,
            child: IconButton(
              onPressed:
                  monthNotifier.canGoToNextMonth
                      ? () => _changeMonthWithScrollPosition(
                        () => monthNotifier.nextMonth(),
                      )
                      : null,
              icon: const Icon(Icons.chevron_right),
              iconSize: 16,
              padding: EdgeInsets.zero,
            ),
          ),

          // 回到当前月份按钮
          if (!monthNotifier.isCurrentMonth)
            SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                onPressed:
                    () => _changeMonthWithScrollPosition(
                      () => monthNotifier.resetToCurrentMonth(),
                    ),
                icon: const Icon(Icons.today),
                iconSize: 14,
                padding: EdgeInsets.zero,
                tooltip: '回到当前月份',
              ),
            ),
        ],
      ),
    );
  }

  /// 显示月份选择器对话框
  void _showMonthPicker(
    BuildContext context,
    CalendarMonthNotifier monthNotifier,
    DateTime selectedMonth,
  ) {
    showDatePicker(
      context: context,
      initialDate: selectedMonth,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    ).then((pickedDate) {
      if (pickedDate != null) {
        _changeMonthWithScrollPosition(
          () => monthNotifier.setMonth(pickedDate),
        );
      }
    });
  }

  Widget _buildEmergencyButton(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // 导航到烟瘾应对策略页面
          context.go('/craving-coping-strategies');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
          foregroundColor: Theme.of(context).colorScheme.onError,
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
        ),
        child: Text(
          localizations.homeEmergencyButton,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onError,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
