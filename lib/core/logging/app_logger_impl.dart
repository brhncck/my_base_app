import 'package:flutter/foundation.dart';
import 'package:my_base_app/core/logging/app_logger.dart';

class AppLoggerImpl extends AppLogger {
  const AppLoggerImpl();

  @override
  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final tagText = tag == null ? '' : '[$tag] ';
    debugPrint('${_levelText(level)} $tagText$message');

    if (error != null) {
      debugPrint('${_levelText(LogLevel.error)} $tagText$error');
    }

    if (stackTrace != null) {
      debugPrint('$stackTrace');
    }
  }

  String _levelText(LogLevel level) {
    return switch (level) {
      LogLevel.debug => '[DEBUG]',
      LogLevel.info => '[INFO]',
      LogLevel.warning => '[WARNING]',
      LogLevel.error => '[ERROR]',
    };
  }
}
