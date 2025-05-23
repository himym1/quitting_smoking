import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart'; // For number formatting
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/home/providers/daily_check_in_notifier.dart';
import 'package:quitting_smoking/presentation/features/home/providers/health_benefits_provider.dart';
import 'package:quitting_smoking/domain/entities/health_benefit_milestone.dart';
import 'package:quitting_smoking/presentation/features/home/providers/home_dashboard_stats_provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart'; // For navigation

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final statsState = ref.watch(homeDashboardStatsProvider);
    final authState = ref.watch(authNotifierProvider);

    UserProfile? userProfile;
    authState.whenOrNull(authenticated: (up) => userProfile = up);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        automaticallyImplyLeading: false, // No back arrow
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: [
          // 1. Real-time Progress Tracking Area
          _buildProgressTrackingSection(context, localizations, statsState),
          const SizedBox(height: 16),

          // 2. Health Benefits Overview Area
          _buildHealthBenefitsSection(context, localizations, ref),
          const SizedBox(height: 16),

          // 3. My Quit Reason/Declaration Area
          _buildQuitReasonSection(
            context,
            localizations,
            userProfile?.quitReason,
          ),
          const SizedBox(height: 16),

          // 4. Daily Check-in Area
          _buildDailyCheckInSection(context, localizations, ref),
          const SizedBox(height: 32), // Extra space before the emergency button
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildEmergencyButton(context, localizations),
    );
  }

  Widget _buildProgressTrackingSection(
    BuildContext context,
    AppLocalizations localizations,
    HomeDashboardStatsState stats,
  ) {
    final d = stats.quitDuration.inDays;
    final h = stats.quitDuration.inHours % 24;
    final m = stats.quitDuration.inMinutes % 60;
    final s = stats.quitDuration.inSeconds % 60;

    final moneySavedFormatted = NumberFormat.currency(
      locale: 'zh_CN',
      symbol: '¥',
      decimalDigits: 0,
    ).format(stats.moneySaved);

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
            Center(
              child: Text(
                localizations.homeProgressTime(
                  d.toString(),
                  h.toString(),
                  m.toString(),
                  s.toString(),
                ),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 14),
            // 将统计信息做成行式布局
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                      '已节省',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
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
                      '少吸支数',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.favorite, color: Colors.red[700], size: 22),
                    const SizedBox(height: 4),
                    Text(
                      ((stats.cigarettesNotSmoked * 11) / (24 * 60))
                          .toStringAsFixed(1),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                    Text(
                      '延长寿命(天)',
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
                      ).primaryColor.withOpacity(0.1),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                    onTap: () {
                      context.go('/health-benefits-detail/${benefit.id}');
                    },
                  ),
                );
              }).toList(),
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
                  ).colorScheme.onSurface.withOpacity(0.8),
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

    switch (dailyCheckInState.status) {
      case DailyCheckInStatus.initial:
        buttonChild = const CircularProgressIndicator(color: Colors.white);
        onPressed = null;
        break;
      case DailyCheckInStatus.checkedIn:
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
        onPressed = null; // Already checked in
        break;
      case DailyCheckInStatus.notCheckedIn:
        buttonChild = Text(localizations.homeDailyCheckInButton);
        onPressed = () async {
          final success = await dailyCheckInNotifier.performCheckIn();
          if (success && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localizations.homeDailyCheckInSuccessToast),
              ),
            );
          }
        };
        break;
      case DailyCheckInStatus.error:
        buttonChild = Text(localizations.homeDailyCheckInButtonError);
        onPressed = () {
          // Optionally allow retry or show more info
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                dailyCheckInState.errorMessage ?? localizations.errorUnknown,
              ),
            ),
          );
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
                  localizations.homeDailyCheckInTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(localizations.homeDailyCheckInPrompt),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 44), // Full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor:
                    dailyCheckInState.status == DailyCheckInStatus.checkedIn
                        ? Colors.green
                        : (dailyCheckInState.status == DailyCheckInStatus.error
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).primaryColor),
                foregroundColor: Colors.white,
              ),
              child: buttonChild,
            ),
          ],
        ),
      ),
    );
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
