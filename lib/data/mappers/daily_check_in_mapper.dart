/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 每日打卡数据映射器 (DailyCheckInMapper)
 * 功能：
 * 1. 在Domain实体和API模型之间进行数据转换
 * 2. 处理字段名差异和数据格式转换
 * 3. 提供双向映射方法
 * 4. 确保数据一致性
 */

import 'package:quitting_smoking/domain/entities/daily_check_in.dart';
import 'package:quitting_smoking/data/models/daily_check_in_models.dart';

/// 每日打卡数据映射器
///
/// 负责Flutter实体和API模型之间的数据转换
class DailyCheckInMapper {
  // ==================== Entity -> API Model ====================

  /// 将DailyCheckIn实体转换为CreateCheckInRequest模型
  ///
  /// 用于创建打卡记录的API请求
  static CreateCheckInRequestModel entityToCreateRequest(DailyCheckIn entity) {
    return CreateCheckInRequestModel(
      date: entity.date,
      checkinTime: DateTime.now(), // 本地实体没有checkinTime字段，使用当前时间
      note: null, // 本地实体没有note字段
    );
  }

  /// 将DailyCheckIn实体转换为CheckInHistoryRequest模型
  ///
  /// 用于查询打卡历史的API请求
  static CheckInHistoryRequestModel entityToHistoryRequest({
    DateTime? startDate,
    DateTime? endDate,
    int page = 1,
    int limit = 20,
    String sortBy = 'date',
    String sortOrder = 'desc',
  }) {
    return CheckInHistoryRequestModel(
      startDate: startDate,
      endDate: endDate,
      page: page,
      limit: limit,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  // ==================== API Model -> Entity ====================

  /// 将CheckInResponse模型转换为DailyCheckIn实体
  ///
  /// 处理API响应到本地实体的转换
  static DailyCheckIn responseToEntity(CheckInResponseModel response) {
    return DailyCheckIn(
      date: response.date,
      isCheckedIn: true, // API返回的都是已打卡记录
    );
  }

  /// 将CheckInResponse列表转换为DailyCheckIn实体列表
  static List<DailyCheckIn> responseListToEntityList(
    List<CheckInResponseModel> responses,
  ) {
    return responses.map((response) => responseToEntity(response)).toList();
  }

  // ==================== 统计数据转换 ====================

  /// 将CheckInStatsResponse转换为Map格式
  ///
  /// 用于在UI中显示统计信息
  static Map<String, dynamic> statsResponseToMap(
    CheckInStatsResponseModel stats,
  ) {
    return {
      'totalCheckIns': stats.totalCheckIns,
      'currentStreak': stats.currentStreak,
      'longestStreak': stats.longestStreak,
      'monthlyCheckIns': stats.monthlyCheckIns,
      'weeklyCheckIns': stats.weeklyCheckIns,
      'successRate': stats.successRate,
      'lastCheckInDate': stats.lastCheckInDate,
      'calculatedAt': stats.calculatedAt,
    };
  }

  // ==================== 批量操作转换 ====================

  /// 将DailyCheckIn实体列表转换为批量创建请求
  static List<CreateCheckInRequestModel> entityListToCreateRequestList(
    List<DailyCheckIn> entities,
  ) {
    return entities.map((entity) => entityToCreateRequest(entity)).toList();
  }

  // ==================== 日历数据转换 ====================

  /// 将日历API响应转换为本地日历数据格式
  ///
  /// 处理日历视图所需的数据结构
  static Map<DateTime, bool> calendarResponseToMap(
    Map<String, dynamic> calendarData,
  ) {
    final result = <DateTime, bool>{};

    if (calendarData['checkInDates'] != null) {
      final checkInDates = calendarData['checkInDates'] as List;
      for (final dateStr in checkInDates) {
        try {
          final date = DateTime.parse(dateStr as String);
          result[DateTime(date.year, date.month, date.day)] = true;
        } catch (e) {
          // 忽略无效日期
        }
      }
    }

    return result;
  }

  // ==================== 数据验证 ====================

  /// 验证DailyCheckIn实体数据的有效性
  static bool validateEntity(DailyCheckIn entity) {
    // 检查日期是否合理（不能是未来日期）
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkInDate = DateTime(
      entity.date.year,
      entity.date.month,
      entity.date.day,
    );

    if (checkInDate.isAfter(today)) return false;

    return true;
  }

  /// 验证CreateCheckInRequest数据的有效性
  static bool validateCreateRequest(CreateCheckInRequestModel request) {
    // 检查日期是否合理
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final requestDate = DateTime(
      request.date.year,
      request.date.month,
      request.date.day,
    );

    if (requestDate.isAfter(today)) return false;

    return true;
  }

  // ==================== 辅助方法 ====================

  /// 标准化日期（去除时间部分）
  static DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// 检查两个日期是否为同一天
  static bool isSameDay(DateTime date1, DateTime date2) {
    return normalizeDate(date1) == normalizeDate(date2);
  }

  /// 计算两个日期之间的天数差
  static int daysBetween(DateTime startDate, DateTime endDate) {
    final start = normalizeDate(startDate);
    final end = normalizeDate(endDate);
    return end.difference(start).inDays;
  }
}
