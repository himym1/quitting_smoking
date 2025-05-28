import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart'; // Added for GoRouter.of(context)
import 'package:quitting_smoking/core/router/app_router.dart';
import 'package:quitting_smoking/core/services/logger_service.dart'; // 引入日志服务
import 'package:quitting_smoking/l10n/app_localizations.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/onboarding_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/onboarding_step_quit_date.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/onboarding_step_daily_cigarettes.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/onboarding_step_pack_price.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/onboarding_step_smoking_years.dart';
import 'package:quitting_smoking/presentation/features/auth/widgets/onboarding_step_quit_reason.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  static const String routeName = '/onboarding';
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();
  final int _numPages = 5;

  @override
  void initState() {
    super.initState();
    // Listen to page changes from notifier to update PageView
    ref.listenManual<OnboardingState>(onboardingNotifierProvider, (
      previous,
      next,
    ) {
      if (previous?.currentPageIndex != next.currentPageIndex) {
        if (_pageController.hasClients &&
            _pageController.page?.round() != next.currentPageIndex) {
          _pageController.animateToPage(
            next.currentPageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(int currentPageIndex, AppLocalizations l10n) {
    return DotsIndicator(
      dotsCount: _numPages,
      position: currentPageIndex, // Changed from currentPageIndex.toDouble()
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  // Helper to check if current step's form (if any) is valid
  bool _isCurrentStepValid(int pageIndex) {
    // For simplicity, we assume steps with forms will manage their own validation
    // and the "Next" button is enabled.
    // A more robust solution would involve each step widget exposing a validation method
    // or the notifier holding validation status for each step.
    // For now, we'll rely on the individual form validation within each step widget.
    // The OnboardingNotifier's update methods are called after individual field validation.

    final state = ref.read(onboardingNotifierProvider);
    switch (pageIndex) {
      case 0: // Quit Date
        return state.quitDateTime != null;
      case 1: // Daily Cigarettes
        return state.dailyCigarettes != null && state.dailyCigarettes! > 0;
      case 2: // Pack Price
        return state.packPrice != null && state.packPrice! > 0;
      case 3: // Smoking Years (Optional, so always "valid" to proceed)
        return true;
      case 4: // Quit Reason
        return state.quitReason != null && state.quitReason!.trim().isNotEmpty;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onboardingState = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        authenticated: (userProfile) {
          if (userProfile.onboardingCompleted) {
            if (ModalRoute.of(context)?.settings.name ==
                OnboardingPage.routeName) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  GoRouter.of(context).goNamed(AppRoute.home.name);
                }
              });
            }
          }
        },
      ); // Missing closing parenthesis for whenOrNull
      // Missing closing bracket for if (next != null)
    });

    final List<Widget> onboardingSteps = [
      const OnboardingStepQuitDate(),
      const OnboardingStepDailyCigarettes(),
      const OnboardingStepPackPrice(),
      const OnboardingStepSmokingYears(),
      const OnboardingStepQuitReason(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.onboardingPageTitle),
        automaticallyImplyLeading:
            false, // No back button in app bar for onboarding
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _buildPageIndicator(
                onboardingState.currentPageIndex,
                l10n,
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  notifier.goToPage(page);
                },
                children: onboardingSteps,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (onboardingState.currentPageIndex > 0)
                    TextButton(
                      onPressed: () {
                        notifier.previousPage();
                      },
                      child: Text(l10n.backButtonText),
                    )
                  else
                    const SizedBox.shrink(), // Keep layout consistent

                  ElevatedButton(
                    onPressed:
                        onboardingState.isLoading ||
                                !_isCurrentStepValid(
                                  onboardingState.currentPageIndex,
                                )
                            ? null // Disable if loading or current step invalid
                            : () async {
                              if (onboardingState.currentPageIndex <
                                  _numPages - 1) {
                                notifier.nextPage();
                              } else {
                                // Last page - Finish
                                final success =
                                    await notifier.completeOnboarding();
                                if (success && mounted) {
                                  // Navigation is handled by listening to AuthNotifier
                                  logInfo(
                                    "引导完成，等待认证系统导航到主页",
                                    tag: 'OnboardingPage',
                                  );
                                } else if (!success && mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(l10n.genericError),
                                    ), // Add genericError to l10n
                                  );
                                }
                              }
                            },
                    child:
                        onboardingState.isLoading
                            ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : Text(
                              onboardingState.currentPageIndex < _numPages - 1
                                  ? l10n.nextButtonText
                                  : l10n.finishButtonText,
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
