import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/core/bloc/base/base_bloc.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_error.dart';
import 'package:my_base_app/core/bloc/base/page_state.dart';
import 'package:my_base_app/features/home/bloc/home_event.dart';
import 'package:my_base_app/features/home/bloc/home_state.dart';
import 'package:my_base_app/features/home/data/models/category_response_model.dart';
import 'package:my_base_app/features/home/data/models/question_response_model.dart';
import 'package:my_base_app/features/home/data/repositories/home_repository.dart';

class HomeBloc extends BaseBloc<HomeState> {
  HomeBloc({required HomeRepository repository, super.logger})
    : _repository = repository,
      super(initialState: const HomeState()) {
    onBaseEvent<GetCategoriesEvent>(_onGetCategories);
    onBaseEvent<GetQuestionsEvent>(_onGetQuestions);
    onBaseEvent<RefreshHomeEvent>(_onRefreshHome);
  }

  final HomeRepository _repository;

  Future<void> _onGetQuestions(
    GetQuestionsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        type: PageState.loading,
        questionsState: PageState.loading,
      ),
    );

    final response = await _repository.getQuestions();

    if (!response.success) {
      emit(
        state.copyWith(
          type: PageState.failed,
          questionsState: PageState.failed,
          error: BaseBlocError(
            message: response.error?.message ?? 'Questions request failed.',
            errorCode: response.error?.code ?? '',
            showErrorWidget: true,
          ),
        ),
      );
      return;
    }

    final questions = QuestionResponseModel.fromJsonList(response.data);

    final sortedQuestions = [...questions]
      ..sort((a, b) => a.order.compareTo(b.order));

    emit(
      state.copyWith(
        type: PageState.success,
        questionsState: PageState.success,
        questions: sortedQuestions,
      ),
    );
  }

  Future<void> _onGetCategories(
    GetCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        type: PageState.loading,
        categoriesState: PageState.loading,
      ),
    );

    final response = await _repository.getCategories();

    if (!response.success) {
      emit(
        state.copyWith(
          type: PageState.failed,
          categoriesState: PageState.failed,
          error: BaseBlocError(
            message: response.error?.message ?? 'Categories request failed.',
            errorCode: response.error?.code ?? '',
            showErrorWidget: true,
          ),
        ),
      );
      return;
    }

    final categoryResponse = CategoryResponseModel.fromResponseJson(
      response.data,
    );

    final sortedCategories = [...categoryResponse.data]
      ..sort((a, b) => a.rank.compareTo(b.rank));

    emit(
      state.copyWith(
        type: PageState.success,
        categoriesState: PageState.success,
        categories: sortedCategories,
      ),
    );
  }

  Future<void> _onRefreshHome(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        type: PageState.loading,
        questionsState: PageState.loading,
        categoriesState: PageState.loading,
      ),
    );

    final responses = await Future.wait([
      _repository.getQuestions(),
      _repository.getCategories(),
    ]);
    final questionsResponse = responses.first;
    final categoriesResponse = responses.last;

    var nextState = state;

    if (!questionsResponse.success) {
      nextState = nextState.copyWith(
        type: PageState.failed,
        questionsState: PageState.failed,
        error: BaseBlocError(
          message:
              questionsResponse.error?.message ?? 'Questions request failed.',
          errorCode: questionsResponse.error?.code ?? '',
          showErrorWidget: true,
        ),
      );
    } else {
      final questions = QuestionResponseModel.fromJsonList(
        questionsResponse.data,
      );
      final sortedQuestions = [...questions]
        ..sort((a, b) => a.order.compareTo(b.order));

      nextState = nextState.copyWith(
        type: PageState.success,
        questionsState: PageState.success,
        questions: sortedQuestions,
      );
    }

    if (!categoriesResponse.success) {
      nextState = nextState.copyWith(
        type: PageState.failed,
        categoriesState: PageState.failed,
        error: BaseBlocError(
          message:
              categoriesResponse.error?.message ?? 'Categories request failed.',
          errorCode: categoriesResponse.error?.code ?? '',
          showErrorWidget: true,
        ),
      );
    } else {
      final categoryResponse = CategoryResponseModel.fromResponseJson(
        categoriesResponse.data,
      );
      final sortedCategories = [...categoryResponse.data]
        ..sort((a, b) => a.rank.compareTo(b.rank));

      nextState = nextState.copyWith(
        type: nextState.isFailed ? PageState.failed : PageState.success,
        categoriesState: PageState.success,
        categories: sortedCategories,
      );
    }

    emit(nextState);
  }
}
