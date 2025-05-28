/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 用户档案实体 (UserProfile)
 * 功能：
 * 1. 存储用户的戒烟基础信息
 * 2. 支持Hive本地数据库持久化
 * 3. 支持JSON序列化/反序列化
 * 4. 使用Freezed生成不可变数据类
 * 5. 作为戒烟进度计算的核心数据源
 */

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:quitting_smoking/core/constants/hive_constants.dart';

// 代码生成文件导入
part 'user_profile.freezed.dart'; // Freezed 生成的代码
part 'user_profile.g.dart'; // JsonSerializable 生成的代码

/// 用户档案实体类
///
/// 存储用户的戒烟相关基础信息，包括：
/// - 戒烟开始时间
/// - 每日吸烟量
/// - 香烟价格信息
/// - 戒烟理由等
///
/// 特性：
/// - 使用 Freezed 生成不可变数据类
/// - 支持 Hive 本地数据库存储
/// - 支持 JSON 序列化，便于未来API集成
/// - 继承 HiveObject，支持本地持久化
@freezed
@HiveType(typeId: HiveConstants.userProfileTypeId)
class UserProfile extends HiveObject with _$UserProfile {
  /// 私有构造函数
  /// HiveObject 扩展需要这个私有构造函数
  UserProfile._();

  /// 工厂构造函数
  ///
  /// 创建用户档案实例，所有字段都是可选的
  /// 支持逐步完善用户信息
  factory UserProfile({
    /// 用户ID (可选)
    /// 用于未来的用户账户系统集成
    @HiveField(0) String? userId,

    /// 戒烟开始日期和时间
    /// 用于计算戒烟时长、节省金额等核心指标
    @HiveField(1) DateTime? quitDateTime,

    /// 每日吸烟量 (支/天)
    /// 用于计算少吸烟支数和健康效益
    @HiveField(2) int? dailyCigarettes,

    /// 每包香烟价格 (元)
    /// 用于计算节省的金额
    @HiveField(3) double? packPrice,

    /// 吸烟年数 (可选)
    /// 用于健康效益的个性化展示
    @HiveField(4) int? smokingYears,

    /// 戒烟理由/宣言
    /// 用户的戒烟动机，在关键时刻提供激励
    @HiveField(5) String? quitReason,

    /// 是否完成了初始引导流程
    /// 控制用户首次使用的引导体验
    @HiveField(6) @Default(false) bool onboardingCompleted,
  }) = _UserProfile;

  /// 从JSON创建UserProfile实例
  /// 用于API数据反序列化和数据迁移
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
