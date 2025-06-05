/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 吸烟记录数据映射器 (SmokingRecordMapper)
 * 功能：
 * 1. 在Domain实体和API模型之间进行数据转换
 * 2. 处理字段名差异和数据格式转换
 * 3. 提供双向映射方法
 * 4. 确保数据一致性
 */

import 'package:quitting_smoking/domain/entities/smoking_record.dart';
import 'package:quitting_smoking/data/models/smoking_record_models.dart';

/// 吸烟记录数据映射器
///
/// 负责Flutter实体和API模型之间的数据转换
class SmokingRecordMapper {
  // ==================== Entity -> API Model ====================

  /// 将SmokingRecord实体转换为CreateSmokingRecordRequest模型
  ///
  /// 用于创建吸烟记录的API请求
  static CreateSmokingRecordRequestModel entityToCreateRequest(
    SmokingRecord entity,
  ) {
    return CreateSmokingRecordRequestModel(
      timestamp: entity.timestamp,
      cigarettesSmoked: entity.cigarettesSmoked,
      triggerTags: entity.triggerTags,
      notes: entity.notes,
      location: null, // 本地实体没有location字段
    );
  }

  /// 将查询参数转换为SmokingRecordHistoryRequest模型
  static SmokingRecordHistoryRequestModel createHistoryRequest({
    DateTime? startDate,
    DateTime? endDate,
    List<String>? triggerTags,
    int page = 1,
    int limit = 20,
    String sortBy = 'timestamp',
    String sortOrder = 'desc',
  }) {
    return SmokingRecordHistoryRequestModel(
      startDate: startDate,
      endDate: endDate,
      triggerTags: triggerTags,
      page: page,
      limit: limit,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  // ==================== API Model -> Entity ====================

  /// 将SmokingRecordResponse模型转换为SmokingRecord实体
  ///
  /// 处理API响应到本地实体的转换
  static SmokingRecord responseToEntity(SmokingRecordResponseModel response) {
    return SmokingRecord(
      timestamp: response.timestamp,
      cigarettesSmoked: response.cigarettesSmoked,
      triggerTags: response.triggerTags,
      notes: response.notes,
      // 本地实体没有location字段，忽略API返回的位置信息
    );
  }

  /// 将SmokingRecordResponse列表转换为SmokingRecord实体列表
  static List<SmokingRecord> responseListToEntityList(
    List<SmokingRecordResponseModel> responses,
  ) {
    return responses.map((response) => responseToEntity(response)).toList();
  }

  // ==================== 统计数据转换 ====================

  /// 将SmokingRecordStatsResponse转换为Map格式
  ///
  /// 用于在UI中显示统计信息
  static Map<String, dynamic> statsResponseToMap(
    SmokingRecordStatsResponseModel stats,
  ) {
    return {
      'totalRecords': stats.totalRecords,
      'totalCigarettes': stats.totalCigarettes,
      'monthlyRecords': stats.monthlyRecords,
      'monthlyCigarettes': stats.monthlyCigarettes,
      'weeklyRecords': stats.weeklyRecords,
      'weeklyCigarettes': stats.weeklyCigarettes,
      'averageDailyCigarettes': stats.averageDailyCigarettes,
      'commonTriggers': stats.commonTriggers,
      'lastSmokingTime': stats.lastSmokingTime,
      'calculatedAt': stats.calculatedAt,
    };
  }

  // ==================== 批量操作转换 ====================

  /// 将SmokingRecord实体列表转换为批量创建请求
  static List<CreateSmokingRecordRequestModel> entityListToCreateRequestList(
    List<SmokingRecord> entities,
  ) {
    return entities.map((entity) => entityToCreateRequest(entity)).toList();
  }

  // ==================== 趋势数据转换 ====================

  /// 将趋势API响应转换为本地趋势数据格式
  static List<Map<String, dynamic>> trendsResponseToList(
    List<Map<String, dynamic>> trendsData,
  ) {
    return trendsData
        .map(
          (item) => {
            'date':
                item['date'] != null
                    ? DateTime.parse(item['date'] as String)
                    : null,
            'count': item['count'] as int? ?? 0,
            'cigarettes': item['cigarettes'] as int? ?? 0,
          },
        )
        .toList();
  }

  /// 将热力图API响应转换为本地热力图数据格式
  static Map<DateTime, int> heatmapResponseToMap(
    Map<String, dynamic> heatmapData,
  ) {
    final result = <DateTime, int>{};

    if (heatmapData['data'] != null) {
      final data = heatmapData['data'] as Map<String, dynamic>;
      for (final entry in data.entries) {
        try {
          final date = DateTime.parse(entry.key);
          final count = entry.value as int? ?? 0;
          result[DateTime(date.year, date.month, date.day)] = count;
        } catch (e) {
          // 忽略无效日期
        }
      }
    }

    return result;
  }

  // ==================== 触发因素统计转换 ====================

  /// 将触发因素统计响应转换为本地格式
  static Map<String, int> triggerStatsResponseToMap(
    Map<String, int> triggerStats,
  ) {
    return Map<String, int>.from(triggerStats);
  }

  // ==================== 数据验证 ====================

  /// 验证SmokingRecord实体数据的有效性
  static bool validateEntity(SmokingRecord entity) {
    // 检查吸烟支数是否合理
    if (entity.cigarettesSmoked <= 0) return false;
    if (entity.cigarettesSmoked > 100) return false;

    // 检查时间是否合理（不能是未来时间）
    final now = DateTime.now();
    if (entity.timestamp.isAfter(now)) return false;

    return true;
  }

  /// 验证CreateSmokingRecordRequest数据的有效性
  static bool validateCreateRequest(CreateSmokingRecordRequestModel request) {
    // 检查吸烟支数是否合理
    if (request.cigarettesSmoked <= 0) return false;
    if (request.cigarettesSmoked > 100) return false;

    // 检查时间是否合理
    final now = DateTime.now();
    if (request.timestamp.isAfter(now)) return false;

    return true;
  }

  // ==================== 辅助方法 ====================

  /// 标准化时间戳（去除毫秒部分）
  static DateTime normalizeTimestamp(DateTime timestamp) {
    return DateTime(
      timestamp.year,
      timestamp.month,
      timestamp.day,
      timestamp.hour,
      timestamp.minute,
      timestamp.second,
    );
  }

  /// 检查两个时间戳是否为同一天
  static bool isSameDay(DateTime timestamp1, DateTime timestamp2) {
    return timestamp1.year == timestamp2.year &&
        timestamp1.month == timestamp2.month &&
        timestamp1.day == timestamp2.day;
  }

  /// 计算两个时间戳之间的小时差
  static int hoursBetween(DateTime startTime, DateTime endTime) {
    return endTime.difference(startTime).inHours;
  }

  /// 获取时间戳所在的日期（去除时间部分）
  static DateTime getDateFromTimestamp(DateTime timestamp) {
    return DateTime(timestamp.year, timestamp.month, timestamp.day);
  }

  /// 格式化触发因素列表为字符串
  static String formatTriggerTags(List<String>? triggerTags) {
    if (triggerTags == null || triggerTags.isEmpty) {
      return '无';
    }
    return triggerTags.join(', ');
  }

  /// 解析触发因素字符串为列表
  static List<String> parseTriggerTags(String? triggerTagsString) {
    if (triggerTagsString == null || triggerTagsString.trim().isEmpty) {
      return [];
    }
    return triggerTagsString
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();
  }
}
