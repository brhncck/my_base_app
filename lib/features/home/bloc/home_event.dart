import 'package:my_base_app/core/bloc/base/base_bloc_event.dart';

abstract class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class GetCategoriesEvent extends HomeEvent {
  const GetCategoriesEvent();
}

class GetQuestionsEvent extends HomeEvent {
  const GetQuestionsEvent();
}

class RefreshHomeEvent extends HomeEvent {
  const RefreshHomeEvent();
}
