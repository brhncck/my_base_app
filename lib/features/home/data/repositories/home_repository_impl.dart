import 'package:my_base_app/core/api/model/api_response.dart';
import 'package:my_base_app/features/home/data/repositories/home_repository.dart';
import 'package:my_base_app/features/home/data/services/home_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._homeService);

  final HomeService _homeService;

  @override
  Future<ApiResponse> getQuestions() {
    return _homeService.getQuestions();
  }

  @override
  Future<ApiResponse> getCategories() {
    return _homeService.getCategories();
  }
}
