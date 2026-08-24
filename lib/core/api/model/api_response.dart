import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_base_app/core/api/model/api_error.dart';

class ApiResponse {
  const ApiResponse({this.dioResponse, this.data, required this.success, this.error});

  factory ApiResponse.fromResponse(Response<dynamic> response) {
    final statusCode = response.statusCode ?? 0;
    final isSuccess = statusCode == 0 || (statusCode >= 200 && statusCode < 300);

    return ApiResponse(dioResponse: response, data: jsonDecode(response.data), success: isSuccess);
  }

  factory ApiResponse.fail(DioException exception) {
    return ApiResponse(
      dioResponse: exception.response,
      data: jsonDecode(exception.response?.data),
      success: false,
      error: ApiError.fromDioException(exception),
    );
  }

  factory ApiResponse.genericFail(Object error) {
    return ApiResponse(success: false, error: ApiError.generic(error.toString()));
  }

  final Response<dynamic>? dioResponse;
  final Object? data;
  final bool success;
  final ApiError? error;
}
