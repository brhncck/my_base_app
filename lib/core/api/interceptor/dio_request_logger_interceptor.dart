import 'package:dio/dio.dart';
import 'package:my_base_app/core/logging/app_logger.dart';

class DioRequestLoggerInterceptor extends Interceptor {
  DioRequestLoggerInterceptor({
    required AppLogger logger,
    this.logHeaders = false,
    this.logRequestBody = false,
    this.maxBodyChars = 2000,
  }) : _logger = logger;

  static const requestIdKey = 'dio_log_id';
  static const requestTimerKey = 'dio_log_timer';

  final AppLogger _logger;
  final bool logHeaders;
  final bool logRequestBody;
  final int maxBodyChars;

  int _counter = 0;

  int _nextId() => ++_counter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final id = _nextId();
    options.extra[requestIdKey] = id;
    options.extra[requestTimerKey] = Stopwatch()..start();

    _logger.debug('[$id] ${options.method} ${options.uri}', tag: 'DIO_REQUEST');

    if (options.queryParameters.isNotEmpty) {
      _logger.debug('query: ${options.queryParameters}', tag: 'DIO_REQUEST');
    }

    if (logHeaders && options.headers.isNotEmpty) {
      _logger.debug('headers: ${options.headers}', tag: 'DIO_REQUEST');
    }

    if (logRequestBody && options.data != null) {
      _logger.debug('body: ${_truncate(options.data)}', tag: 'DIO_REQUEST');
    }

    handler.next(options);
  }

  String _truncate(Object? data) {
    final value = data.toString();
    if (value.length <= maxBodyChars) return value;
    return '${value.substring(0, maxBodyChars)}...(truncated)';
  }
}
