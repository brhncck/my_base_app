enum LogLevel { debug, info, warning, error }

abstract class AppLogger {
  const AppLogger();

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  });

  void debug(String message, {String? tag}) {
    log(message, level: LogLevel.debug, tag: tag);
  }

  void info(String message, {String? tag}) {
    log(message, level: LogLevel.info, tag: tag);
  }

  void warning(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      message,
      level: LogLevel.warning,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      message,
      level: LogLevel.error,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
