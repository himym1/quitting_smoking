/**
 * 焕新之旅 - 戒烟辅助应用
 * 
 * 日志记录服务 (LoggerService)
 * 功能：
 * 1. 替代 print() 语句的专业日志记录
 * 2. 支持不同日志级别（调试/信息/警告/错误）
 * 3. 可配置的日志输出控制
 * 4. 格式化日志输出，包含时间戳和调用位置
 * 5. 支持生产环境的日志过滤
 */

import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

// ==================== 日志级别枚举 ====================

/// 日志级别枚举
///
/// 定义日志的重要性等级，用于过滤和控制输出
enum LogLevel {
  /// 调试信息 - 仅在开发期间显示
  debug(0, 'DEBUG', '🐛'),

  /// 一般信息 - 正常的程序执行信息
  info(1, 'INFO', 'ℹ️'),

  /// 警告信息 - 潜在问题，但不影响程序运行
  warning(2, 'WARN', '⚠️'),

  /// 错误信息 - 发生错误，可能影响功能
  error(3, 'ERROR', '❌'),

  /// 严重错误 - 导致程序崩溃或功能失效
  fatal(4, 'FATAL', '💀');

  const LogLevel(this.value, this.name, this.emoji);

  /// 数值等级，用于比较
  final int value;

  /// 级别名称
  final String name;

  /// 表情符号，用于视觉区分
  final String emoji;
}

// ==================== 日志记录器 ====================

/// 应用日志记录器
///
/// 提供统一的日志记录接口，替代散布在代码中的 print() 语句
/// 支持条件日志、格式化输出、不同级别的日志过滤
class Logger {
  /// 单例实例
  static final Logger _instance = Logger._internal();

  /// 获取单例实例
  factory Logger() => _instance;

  /// 私有构造函数
  Logger._internal();

  /// 最小日志级别
  /// 只有大于等于此级别的日志才会被输出
  static LogLevel _minLevel = kDebugMode ? LogLevel.debug : LogLevel.info;

  /// 是否启用日志输出
  /// 可在生产环境中完全禁用日志
  static bool _enabled = true;

  // ==================== 配置方法 ====================

  /// 设置最小日志级别
  ///
  /// [level] 最小输出级别
  /// 例如：设置为 LogLevel.warning 后，只会输出警告和错误信息
  static void setMinLevel(LogLevel level) {
    _minLevel = level;
  }

  /// 启用或禁用日志输出
  ///
  /// [enabled] 是否启用日志
  static void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  // ==================== 日志输出方法 ====================

  /// 输出调试日志
  ///
  /// [message] 日志消息
  /// [tag] 标签，通常是类名或功能模块名
  /// [error] 可选的错误对象
  /// [stackTrace] 可选的堆栈跟踪
  static void debug(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.debug,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 输出信息日志
  ///
  /// [message] 日志消息
  /// [tag] 标签，通常是类名或功能模块名
  /// [error] 可选的错误对象
  /// [stackTrace] 可选的堆栈跟踪
  static void info(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.info,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 输出警告日志
  ///
  /// [message] 日志消息
  /// [tag] 标签，通常是类名或功能模块名
  /// [error] 可选的错误对象
  /// [stackTrace] 可选的堆栈跟踪
  static void warning(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.warning,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 输出错误日志
  ///
  /// [message] 日志消息
  /// [tag] 标签，通常是类名或功能模块名
  /// [error] 可选的错误对象
  /// [stackTrace] 可选的堆栈跟踪
  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.error,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// 输出严重错误日志
  ///
  /// [message] 日志消息
  /// [tag] 标签，通常是类名或功能模块名
  /// [error] 可选的错误对象
  /// [stackTrace] 可选的堆栈跟踪
  static void fatal(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log(
      LogLevel.fatal,
      message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  // ==================== 内部实现 ====================

  /// 核心日志记录方法
  ///
  /// 处理日志级别过滤、格式化和输出
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    // 检查是否启用日志输出
    if (!_enabled) return;

    // 检查日志级别过滤
    if (level.value < _minLevel.value) return;

    // 构建日志消息
    final timestamp = DateTime.now().toIso8601String();
    final tagPrefix = tag != null ? '[$tag] ' : '';
    final logMessage =
        '${level.emoji} ${level.name} | $timestamp | $tagPrefix$message';

    // 根据级别选择输出方式
    if (level.value >= LogLevel.error.value) {
      // 错误级别使用 developer.log，支持错误对象和堆栈跟踪
      developer.log(
        logMessage,
        time: DateTime.now(),
        level: _getDeveloperLogLevel(level),
        name: 'QuitSmoking',
        error: error,
        stackTrace: stackTrace,
      );
    } else {
      // 一般日志使用 debugPrint，在 release 模式下会被优化掉
      if (kDebugMode) {
        debugPrint(logMessage);
      }
    }

    // 如果有错误对象，额外输出错误信息
    if (error != null) {
      final errorMessage = '${level.emoji} Error Details: $error';
      if (kDebugMode) {
        debugPrint(errorMessage);
      }
    }

    // 如果有堆栈跟踪，额外输出堆栈信息（仅在调试模式下）
    if (stackTrace != null && kDebugMode) {
      final stackMessage = '${level.emoji} Stack Trace:\n$stackTrace';
      debugPrint(stackMessage);
    }
  }

  /// 将自定义日志级别转换为 developer.log 的级别
  static int _getDeveloperLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500; // 调试
      case LogLevel.info:
        return 800; // 信息
      case LogLevel.warning:
        return 900; // 警告
      case LogLevel.error:
        return 1000; // 错误
      case LogLevel.fatal:
        return 1200; // 严重错误
    }
  }
}

// ==================== 便捷的全局方法 ====================

/// 全局调试日志方法
/// 简化日志调用，避免每次都写 Logger.debug
void logDebug(String message, {String? tag}) {
  Logger.debug(message, tag: tag);
}

/// 全局信息日志方法
void logInfo(String message, {String? tag}) {
  Logger.info(message, tag: tag);
}

/// 全局警告日志方法
void logWarning(String message, {String? tag}) {
  Logger.warning(message, tag: tag);
}

/// 全局错误日志方法
void logError(
  String message, {
  String? tag,
  Object? error,
  StackTrace? stackTrace,
}) {
  Logger.error(message, tag: tag, error: error, stackTrace: stackTrace);
}

/// 全局严重错误日志方法
void logFatal(
  String message, {
  String? tag,
  Object? error,
  StackTrace? stackTrace,
}) {
  Logger.fatal(message, tag: tag, error: error, stackTrace: stackTrace);
}
