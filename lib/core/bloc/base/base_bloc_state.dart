import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_error.dart';
import 'package:my_base_app/core/bloc/base/page_state.dart';

@immutable
abstract class BaseState extends Equatable {
  const BaseState({required this.type, this.error});

  final PageState type;
  final BaseBlocError? error;

  bool get isFailed => type == PageState.failed;
  bool get isNotFailed => !isFailed;
  bool get isLoading => type == PageState.loading;
  bool get isNotLoading => !isLoading;
  bool get isSuccess => type == PageState.success;
  bool get isNotSuccess => !isSuccess;
  bool get isInitial => type == PageState.initial;

  BaseState copyWith({PageState? type, BaseBlocError? error});

  @override
  List<Object?> get props => [type, error];
}
