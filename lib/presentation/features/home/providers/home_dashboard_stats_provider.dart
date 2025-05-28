import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/user_profile.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_notifier.dart';
import 'package:quitting_smoking/presentation/features/auth/providers/auth_state.dart';

final homeDashboardStatsProvider =
    StateNotifierProvider<HomeDashboardStatsNotifier, HomeDashboardStatsState>((
      ref,
    ) {
      final authState = ref.watch(authNotifierProvider);
      UserProfile? userProfile;
      authState.whenOrNull(authenticated: (up) => userProfile = up);
      return HomeDashboardStatsNotifier(userProfile, ref);
    });

class HomeDashboardStatsState {
  final Duration quitDuration;
  final double moneySaved;
  final int cigarettesNotSmoked;
  final String formattedQuitDuration;
  // final int estimatedLifeGainedDays; // Optional

  HomeDashboardStatsState({
    required this.quitDuration,
    required this.moneySaved,
    required this.cigarettesNotSmoked,
    required this.formattedQuitDuration,
    // required this.estimatedLifeGainedDays,
  });

  HomeDashboardStatsState.initial()
    : quitDuration = Duration.zero,
      moneySaved = 0.0,
      cigarettesNotSmoked = 0,
      formattedQuitDuration = "0d 0h 0m 0s";
  // estimatedLifeGainedDays = 0;

  HomeDashboardStatsState copyWith({
    Duration? quitDuration,
    double? moneySaved,
    int? cigarettesNotSmoked,
    String? formattedQuitDuration,
    // int? estimatedLifeGainedDays,
  }) {
    return HomeDashboardStatsState(
      quitDuration: quitDuration ?? this.quitDuration,
      moneySaved: moneySaved ?? this.moneySaved,
      cigarettesNotSmoked: cigarettesNotSmoked ?? this.cigarettesNotSmoked,
      formattedQuitDuration:
          formattedQuitDuration ?? this.formattedQuitDuration,
      // estimatedLifeGainedDays: estimatedLifeGainedDays ?? this.estimatedLifeGainedDays,
    );
  }
}

class HomeDashboardStatsNotifier
    extends StateNotifier<HomeDashboardStatsState> {
  UserProfile? _userProfile;
  final Ref _ref;
  Timer? _timer;

  HomeDashboardStatsNotifier(this._userProfile, this._ref)
    : super(HomeDashboardStatsState.initial()) {
    _initialize();
    // Listen to auth changes to update userProfile
    _ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.whenOrNull(
        authenticated: (up) {
          _userProfile = up;
          _initialize();
        },
        unauthenticated: (_) => _handleUnauthenticated(),
        initial:
            () =>
                _handleUnauthenticated(), // Also handle initial as unauthenticated for stats
      );
    });
  }

  void _handleUnauthenticated() {
    _userProfile = null;
    _timer?.cancel();
    state = HomeDashboardStatsState.initial();
  }

  void _initialize() {
    _timer?.cancel(); // Cancel any existing timer
    if (_userProfile != null && _userProfile!.quitDateTime != null) {
      _updateStats();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _updateStats();
      });
    } else {
      state = HomeDashboardStatsState.initial();
    }
  }

  void _updateStats() {
    if (_userProfile == null || _userProfile!.quitDateTime == null) {
      state = HomeDashboardStatsState.initial();
      return;
    }

    final now = DateTime.now();
    final quitDateTime = _userProfile!.quitDateTime;
    if (quitDateTime == null) {
      state = HomeDashboardStatsState.initial();
      return;
    }
    final duration = now.difference(quitDateTime);

    if (duration.isNegative) {
      state = HomeDashboardStatsState.initial();
      return;
    }

    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    final formattedDuration = "${days}d ${hours}h ${minutes}m ${seconds}s";

    double moneySaved = 0.0;
    int cigarettesNotSmoked = 0;
    const int defaultCigarettesPerPack = 20; // Default value if not set

    final dailyCigarettes = _userProfile!.dailyCigarettes;
    final packPrice = _userProfile!.packPrice;

    if (dailyCigarettes != null &&
        dailyCigarettes > 0 &&
        packPrice != null &&
        packPrice > 0) {
      // UserProfile does not have cigarettesPerPack, using default
      final pricePerCigarette = packPrice / defaultCigarettesPerPack;

      final totalSecondsQuit = duration.inSeconds;
      final totalDaysQuitDecimal = totalSecondsQuit / (24 * 60 * 60);

      cigarettesNotSmoked = (totalDaysQuitDecimal * dailyCigarettes).floor();
      moneySaved = cigarettesNotSmoked * pricePerCigarette;
    }

    // Placeholder for estimatedLifeGainedDays calculation if needed
    // final int estimatedLifeGainedDays = (cigarettesNotSmoked * 11 / (24 * 60)).floor(); // Example: 11 minutes per cigarette

    state = state.copyWith(
      quitDuration: duration,
      moneySaved: moneySaved,
      cigarettesNotSmoked: cigarettesNotSmoked,
      formattedQuitDuration: formattedDuration,
      // estimatedLifeGainedDays: estimatedLifeGainedDays,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
