import 'package:my_base_app/core/api/client/base_api_client.dart';
import 'package:my_base_app/core/api/model/api_response.dart';

class HomeService {
  HomeService(this._apiClient);

  static const _questionsPath = '/getQuestions';
  static const _categoriesPath = '/getCategories';

  final BaseApiClient _apiClient;

  Future<ApiResponse> getQuestions() {
    return _apiClient.get(_questionsPath);
  }

  Future<ApiResponse> getCategories() {
    return _apiClient.get(_categoriesPath);
  }
}
