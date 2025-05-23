import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/home/providers/health_benefits_provider.dart';
import 'package:quitting_smoking/presentation/common_widgets/loading_indicator.dart';

class HealthBenefitsDetailPage extends ConsumerWidget {
  final String milestoneId;

  const HealthBenefitsDetailPage({super.key, required this.milestoneId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final healthBenefits = ref.watch(healthBenefitsNotifierProvider);
    final healthBenefitsNotifier = ref.read(
      healthBenefitsNotifierProvider.notifier,
    );

    // 尝试查找当前里程碑
    final allBenefits = [
      ...healthBenefits.achievedBenefits,
      ...healthBenefits.upcomingBenefits,
    ];
    final currentMilestone = allBenefits.firstWhere(
      (milestone) => milestone.id == milestoneId,
      orElse:
          () => const HealthBenefitMilestone(
            id: '',
            timeThresholdInMinutes: 0,
            titleKey: '',
            descriptionKey: '',
          ),
    );

    // 判断是否是空的里程碑（未找到）
    final bool isMilestoneFound = currentMilestone.id.isNotEmpty;

    // 获取里程碑的本地化字符串
    String getLocalizedString(String key) {
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

    // 获取里程碑对应的图标
    IconData getIconData(String? iconName) {
      switch (iconName) {
        case 'favorite_border':
          return Icons.favorite_border;
        case 'bloodtype':
          return Icons.bloodtype;
        case 'local_hospital':
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

    // 判断里程碑是否已经达成
    final isAchieved = healthBenefits.achievedBenefits.any(
      (milestone) => milestone.id == milestoneId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.healthBenefitsDetailPageTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      body:
          healthBenefits.isLoading
              ? const Center(child: LoadingIndicator())
              : SafeArea(
                child:
                    !isMilestoneFound
                        ? _buildPlaceholder(context, localizations)
                        : SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 里程碑标题和状态
                              _buildMilestoneHeader(
                                context,
                                currentMilestone,
                                isAchieved,
                                getLocalizedString,
                                getIconData,
                              ),

                              const SizedBox(height: 24),

                              // 里程碑详细描述
                              _buildMilestoneDescription(
                                context,
                                currentMilestone,
                                getLocalizedString,
                              ),

                              const SizedBox(height: 24),

                              // 其他健康效益
                              _buildOtherBenefits(
                                context,
                                currentMilestone,
                                allBenefits,
                                getLocalizedString,
                                getIconData,
                              ),
                            ],
                          ),
                        ),
              ),
    );
  }

  Widget _buildPlaceholder(
    BuildContext context,
    AppLocalizations localizations,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              localizations.healthBenefitsDetailPlaceholderTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              localizations.healthBenefitsDetailPlaceholderDesc,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneHeader(
    BuildContext context,
    HealthBenefitMilestone milestone,
    bool isAchieved,
    String Function(String) getLocalizedString,
    IconData Function(String?) getIconData,
  ) {
    final theme = Theme.of(context);

    // 计算时间
    final Duration timeDuration = Duration(
      minutes: milestone.timeThresholdInMinutes,
    );

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // 里程碑图标
            CircleAvatar(
              radius: 32,
              backgroundColor:
                  isAchieved
                      ? Colors.green.withOpacity(0.2)
                      : theme.primaryColor.withOpacity(0.2),
              child: Icon(
                getIconData(milestone.iconName),
                size: 36,
                color: isAchieved ? Colors.green : theme.primaryColor,
              ),
            ),
            const SizedBox(width: 16),

            // 里程碑标题和状态
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getLocalizedString(milestone.titleKey),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isAchieved ? Icons.check_circle : Icons.timer,
                        size: 16,
                        color: isAchieved ? Colors.green : theme.primaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isAchieved
                            ? '已达成'
                            : '距离达成: ${_formatDuration(timeDuration)}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isAchieved ? Colors.green : theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneDescription(
    BuildContext context,
    HealthBenefitMilestone milestone,
    String Function(String) getLocalizedString,
  ) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '详细说明',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              getLocalizedString(milestone.descriptionKey),
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            // 科学解释说明（这里是模拟数据，实际项目中应该从资源文件获取）
            Text(
              '科学解释',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '当你停止吸烟后，你的身体立即开始恢复。吸烟会限制血管，让心脏更努力地工作。'
              '戒烟后，血压和心率开始恢复正常，身体开始清除有害物质，血液循环改善，'
              '各种身体机能逐步恢复到更健康的状态。',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherBenefits(
    BuildContext context,
    HealthBenefitMilestone currentMilestone,
    List<HealthBenefitMilestone> allBenefits,
    String Function(String) getLocalizedString,
    IconData Function(String?) getIconData,
  ) {
    final theme = Theme.of(context);

    // 过滤掉当前里程碑
    final otherBenefits =
        allBenefits
            .where((benefit) => benefit.id != currentMilestone.id)
            .take(3) // 最多显示3个其他效益
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '其他健康效益',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...otherBenefits.map(
          (benefit) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                child: Icon(
                  getIconData(benefit.iconName),
                  color: theme.primaryColor,
                ),
              ),
              title: Text(getLocalizedString(benefit.titleKey)),
              subtitle: Text(
                '${_formatDuration(Duration(minutes: benefit.timeThresholdInMinutes))}后',
                style: theme.textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // 导航到选中的效益详情
                if (context.canPop()) {
                  context.pop();
                }
                context.go('/health-benefits-detail/${benefit.id}');
              },
            ),
          ),
        ),
      ],
    );
  }

  // 格式化时间显示
  String _formatDuration(Duration duration) {
    if (duration.inHours >= 24) {
      final days = duration.inHours ~/ 24;
      return '$days天';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}小时';
    } else {
      return '${duration.inMinutes}分钟';
    }
  }
}
