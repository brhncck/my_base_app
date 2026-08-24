import 'package:dio/dio.dart';
import 'package:my_base_app/core/api/interceptor/dio_request_logger_interceptor.dart';
import 'package:my_base_app/core/logging/app_logger.dart';

class DioResponseLoggerInterceptor extends Interceptor {
  DioResponseLoggerInterceptor({
    required AppLogger logger,
    this.logResponseBody = false,
    this.maxBodyChars = 2000,
  }) : _logger = logger;

  final AppLogger _logger;
  final bool logResponseBody;
  final int maxBodyChars;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final id = _requestId(response.requestOptions);
    final elapsed = _elapsedMilliseconds(response.requestOptions);

    _logger.debug(
      '${id != null ? "[$id] " : ""}'
      '${response.statusCode} ${response.requestOptions.method} '
      '${response.requestOptions.uri} (${elapsed}ms)',
      tag: 'DIO_RESPONSE',
    );

    if (logResponseBody && response.data != null) {
      _logger.debug('body: ${_truncate(response.data)}', tag: 'DIO_RESPONSE');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final id = _requestId(err.requestOptions);
    final elapsed = _elapsedMilliseconds(err.requestOptions);
    final status = err.response?.statusCode;

    _logger.error(
      '${id != null ? "[$id] " : ""}'
      '${status ?? "-"} ${err.requestOptions.method} '
      '${err.requestOptions.uri} (${elapsed}ms) '
      'type=${err.type}',
      tag: 'DIO_RESPONSE',
      error: err,
    );

    if (err.message != null) {
      _logger.debug('message: ${err.message}', tag: 'DIO_RESPONSE');
    }

    if (logResponseBody && err.response?.data != null) {
      _logger.debug(
        'errorBody: ${_truncate(err.response?.data)}',
        tag: 'DIO_RESPONSE',
      );
    }

    handler.next(err);
  }

  int? _requestId(RequestOptions options) {
    return options.extra[DioRequestLoggerInterceptor.requestIdKey] as int?;
  }

  int _elapsedMilliseconds(RequestOptions options) {
    final stopwatch =
        options.extra[DioRequestLoggerInterceptor.requestTimerKey]
            as Stopwatch?;
    if (stopwatch == null) return -1;
    stopwatch.stop();
    return stopwatch.elapsedMilliseconds;
  }

  String _truncate(Object? data) {
    final value = data.toString();
    if (value.length <= maxBodyChars) return value;
    return '${value.substring(0, maxBodyChars)}...(truncated)';
  }
}
