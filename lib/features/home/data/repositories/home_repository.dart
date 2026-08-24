import 'package:my_base_app/core/api/model/api_response.dart';

abstract class HomeRepository {
  Future<ApiResponse> getQuestions();

  Future<ApiResponse> getCategories();
}
