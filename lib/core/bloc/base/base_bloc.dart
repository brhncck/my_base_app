import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_error.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_event.dart';
import 'package:my_base_app/core/bloc/base/base_bloc_state.dart';
import 'package:my_base_app/core/bloc/base/page_state.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/logging/app_logger.dart';

abstract class BaseBloc<S extends BaseState> extends Bloc<BaseEvent, S> {
  BaseBloc({required S initialState, AppLogger? logger})
    : _logger = logger ?? getIt<AppLogger>(),
      super(initialState) {
    on<ResetError>(_handleResetError);
  }

  final AppLogger _logger;

  void onBaseEvent<E extends BaseEvent>(
    EventHandler<E, S> handler, {
    EventTransformer<E>? transformer,
  }) {
    on<E>((event, emit) async {
      try {
        await handler(event, emit);
      } catch (error, stackTrace) {
        _logger.error(
          'Unhandled error in $runtimeType while handling ${event.runtimeType}',
          tag: 'BASE_BLOC',
          error: error,
          stackTrace: stackTrace,
        );

        emit(
          state.copyWith(
                type: PageState.failed,
                error: BaseBlocError(
                  message: error.toString(),
                  errorCode: '',
                  showErrorWidget: true,
                ),
              )
              as S,
        );
      }
    }, transformer: transformer);
  }

  void Function(BaseEvent) get emitEvent => add;

  FutureOr<void> _handleResetError(ResetError event, Emitter<S> emit) async {
    final isHandled = await onResetError(event, emit);
    if (isHandled) return;

    emit(
      state.copyWith(
            type: PageState.initial,
            error: const BaseBlocError(
              message: '',
              errorCode: '',
              showErrorWidget: false,
            ),
          )
          as S,
    );
  }

  @protected
  FutureOr<bool> onResetError(ResetError event, Emitter<S> emit) {
    return false;
  }
}
