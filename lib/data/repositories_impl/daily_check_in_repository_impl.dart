import 'package:quitting_smoking/data/datasources/local/daily_check_in_local_datasource.dart';
import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/domain/repositories/daily_check_in_repository.dart';

class DailyCheckInRepositoryImpl implements DailyCheckInRepository {
  final DailyCheckInLocalDataSource localDataSource;

  DailyCheckInRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addCheckIn(DailyCheckIn checkIn) {
    return localDataSource.addCheckIn(checkIn);
  }

  @override
  Future<DailyCheckIn?> getCheckInForDate(DateTime date) {
    return localDataSource.getCheckInForDate(date);
  }

  @override
  Future<List<DailyCheckIn>> getAllCheckIns() {
    return localDataSource.getAllCheckIns();
  }

  @override
  Stream<List<DailyCheckIn>> watchAllCheckIns() {
    return localDataSource.watchAllCheckIns();
  }

  @override
  Stream<DailyCheckIn?> watchCheckInForDate(DateTime date) {
    return localDataSource.watchCheckInForDate(date);
  }
}
