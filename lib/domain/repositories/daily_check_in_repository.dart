import '../entities/daily_check_in.dart';

abstract class DailyCheckInRepository {
  Future<void> addCheckIn(DailyCheckIn checkIn);

  Future<DailyCheckIn?> getCheckInForDate(DateTime date);

  Future<List<DailyCheckIn>> getAllCheckIns();

  Stream<List<DailyCheckIn>> watchAllCheckIns();

  Stream<DailyCheckIn?> watchCheckInForDate(DateTime date);
}
