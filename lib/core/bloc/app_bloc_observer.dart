import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/core/logging/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(this._logger);

  final AppLogger _logger;

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.debug('${bloc.runtimeType} | $event', tag: 'BLOC_EVENT');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.debug(
      '${bloc.runtimeType} | ${change.currentState} -> ${change.nextState}',
      tag: 'BLOC_CHANGE',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.error(
      '${bloc.runtimeType}',
      tag: 'BLOC_ERROR',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
