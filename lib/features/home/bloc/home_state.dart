import 'package:my_base_app/core/bloc/base/base_bloc_error.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_state.dart';
import 'package:my_base_app/core/bloc/base/page_state.dart';
import 'package:my_base_app/features/home/data/models/category_model.dart';
import 'package:my_base_app/features/home/data/models/question_response_model.dart';

class HomeState extends BaseState {
  const HomeState({
    super.type = PageState.initial,
    super.error,
    this.questionsState = PageState.initial,
    this.categoriesState = PageState.initial,
    this.questions = const [],
    this.categories = const [],
  });

  final PageState questionsState;
  final PageState categoriesState;

  final List<QuestionResponseModel> questions;
  final List<CategoryModel> categories;

  @override
  HomeState copyWith({
    PageState? type,
    BaseBlocError? error,
    PageState? questionsState,
    PageState? categoriesState,
    List<QuestionResponseModel>? questions,
    List<CategoryModel>? categories,
  }) {
    return HomeState(
      type: type ?? this.type,
      error: error ?? this.error,
      questionsState: questionsState ?? this.questionsState,
      categoriesState: categoriesState ?? this.categoriesState,
      questions: questions ?? this.questions,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    questionsState,
    categoriesState,
    questions,
    categories,
  ];
}
