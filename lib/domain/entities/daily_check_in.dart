/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 每日打卡实体 (DailyCheckIn)
 * 功能：
 * 1. 记录用户每日的戒烟打卡状态
 * 2. 支持Hive本地数据库持久化
 * 3. 为连续戒烟天数统计提供数据基础
 * 4. 支持成就系统的解锁条件判断
 * 5. 提供戒烟坚持度的量化指标
 */

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// 代码生成文件导入
part 'daily_check_in.freezed.dart'; // Freezed 生成的代码
part 'daily_check_in.g.dart'; // JsonSerializable 生成的代码

/// 每日打卡实体类
///
/// 记录用户每天的戒烟打卡情况，用于：
/// - 统计连续戒烟天数
/// - 成就系统的解锁判断
/// - 用户戒烟坚持度分析
/// - 提供正向激励反馈
///
/// 特性：
/// - 使用 Freezed 生成不可变数据类
/// - 支持 Hive 本地数据库存储
/// - 按日期精确记录打卡状态
/// - 支持未来的用户系统扩展
@freezed
@HiveType(typeId: 1) // Hive数据类型ID，必须唯一
class DailyCheckIn extends HiveObject with _$DailyCheckIn {
  /// 私有构造函数
  /// HiveObject 扩展需要这个私有构造函数
  DailyCheckIn._();

  /// 工厂构造函数
  ///
  /// 创建每日打卡记录实例
  factory DailyCheckIn({
    /// 打卡日期
    /// 精确到日，用于唯一标识某一天的打卡记录
    /// 通常使用 DateTime(year, month, day) 格式，忽略时分秒
    @HiveField(0) required DateTime date,

    /// 是否已打卡
    /// true: 当日已完成打卡
    /// false: 当日未打卡或打卡失败
    @HiveField(1) required bool isCheckedIn,

    /// 用户ID (可选)
    /// 用于未来的多用户支持和数据同步
    @HiveField(2) String? userId,
  }) = _DailyCheckIn;

  /// 从JSON创建DailyCheckIn实例
  /// 用于API数据反序列化和数据迁移
  factory DailyCheckIn.fromJson(Map<String, dynamic> json) =>
      _$DailyCheckInFromJson(json);
}
