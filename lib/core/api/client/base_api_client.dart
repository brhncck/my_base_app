import 'package:dio/dio.dart';
import 'package:my_base_app/core/api/model/api_response.dart';

class BaseApiClient {
  BaseApiClient(this._dio);

  final Dio _dio;

  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return ApiResponse.fail(error);
    } catch (error) {
      return ApiResponse.genericFail(error);
    }
  }

  Future<ApiResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return ApiResponse.fail(error);
    } catch (error) {
      return ApiResponse.genericFail(error);
    }
  }
}
