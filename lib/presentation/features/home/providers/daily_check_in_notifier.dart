import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/domain/repositories/daily_check_in_repository.dart';
import 'package:quitting_smoking/main.dart';

enum DailyCheckInStatus { initial, checkedIn, notCheckedIn, error }

class DailyCheckInState {
  final DailyCheckInStatus status;
  final String? errorMessage;

  DailyCheckInState({required this.status, this.errorMessage});

  DailyCheckInState.initial()
    : status = DailyCheckInStatus.initial,
      errorMessage = null;
  DailyCheckInState.checkedIn()
    : status = DailyCheckInStatus.checkedIn,
      errorMessage = null;
  DailyCheckInState.notCheckedIn()
    : status = DailyCheckInStatus.notCheckedIn,
      errorMessage = null;
  DailyCheckInState.error(this.errorMessage)
    : status = DailyCheckInStatus.error;
}

class DailyCheckInNotifier extends StateNotifier<DailyCheckInState> {
  final DailyCheckInRepository _repository;

  DailyCheckInNotifier(this._repository) : super(DailyCheckInState.initial()) {
    _checkTodayStatus();
  }

  Future<void> _checkTodayStatus() async {
    try {
      final today = DateTime.now();
      final checkIn = await _repository.getCheckInForDate(today);
      if (checkIn != null && checkIn.isCheckedIn) {
        state = DailyCheckInState.checkedIn();
      } else {
        state = DailyCheckInState.notCheckedIn();
      }
    } catch (e) {
      state = DailyCheckInState.error(
        "Failed to check today's status: ${e.toString()}",
      );
    }
  }

  Future<bool> performCheckIn() async {
    try {
      final today = DateTime.now();
      final newCheckIn = DailyCheckIn(date: today, isCheckedIn: true);
      await _repository.addCheckIn(newCheckIn);
      state = DailyCheckInState.checkedIn();
      return true;
    } catch (e) {
      state = DailyCheckInState.error(
        "Failed to perform check-in: ${e.toString()}",
      );
      return false;
    }
  }

  // Stream to listen for changes in today's check-in status
  Stream<DailyCheckInState> get todayCheckInStatusStream {
    final today = DateTime.now();
    return _repository
        .watchCheckInForDate(today)
        .map((checkIn) {
          if (checkIn != null && checkIn.isCheckedIn) {
            return DailyCheckInState.checkedIn();
          } else {
            return DailyCheckInState.notCheckedIn();
          }
        })
        .handleError((e) {
          return DailyCheckInState.error(
            "Failed to watch today's status: ${e.toString()}",
          );
        });
  }
}

final dailyCheckInNotifierProvider = StateNotifierProvider<
  DailyCheckInNotifier,
  DailyCheckInState
>((ref) {
  // This assumes dailyCheckInRepositoryProvider is correctly set up to provide an instance of DailyCheckInRepository
  // You might need to adjust this based on your actual provider setup in main.dart or a similar central providers file.
  // For example, if dailyCheckInRepositoryProvider is defined in main.dart:
  // final dailyCheckInRepository = ref.watch(dailyCheckInRepositoryProvider);
  // return DailyCheckInNotifier(dailyCheckInRepository);

  // Placeholder until dailyCheckInRepositoryProvider is confirmed:
  // This will likely cause a runtime error if not replaced with the actual provider.
  // Ensure dailyCheckInRepositoryProvider is accessible here.
  final dailyCheckInRepository = ref.watch(dailyCheckInRepositoryProvider);
  return DailyCheckInNotifier(dailyCheckInRepository);
});
