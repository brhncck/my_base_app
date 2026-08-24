import 'package:dio/dio.dart';

class ApiError {
  const ApiError({this.code, this.message});

  final String? code;
  final String? message;

  factory ApiError.fromDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final responseData = exception.response?.data;
    final message =
        _messageFromResponse(responseData) ?? _messageFromType(exception);

    return ApiError(code: statusCode?.toString(), message: message);
  }

  factory ApiError.generic(String? message) {
    return ApiError(message: message ?? 'Unknown error');
  }

  static String? _messageFromResponse(Object? data) {
    if (data is Map) {
      final errorMessage = data['errorMessage'] ?? data['message'];
      if (errorMessage != null) return errorMessage.toString();
    }

    if (data is String && data.isNotEmpty) return data;
    return null;
  }

  static String _messageFromType(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => 'Timeout',
      DioExceptionType.badResponse => _messageFromStatusCode(
        exception.response?.statusCode,
      ),
      DioExceptionType.cancel => 'Request cancelled',
      DioExceptionType.connectionError => 'Connection error',
      DioExceptionType.badCertificate => 'Bad certificate',
      DioExceptionType.unknown => 'Unknown error',
    };
  }

  static String _messageFromStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => 'Bad request',
      401 => 'Unauthorized',
      403 => 'Forbidden',
      404 => 'Not found',
      500 => 'Server error',
      503 => 'Service unavailable',
      _ => 'Error',
    };
  }
}
