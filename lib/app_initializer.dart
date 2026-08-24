import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_base_app/app/app.dart';
import 'package:my_base_app/core/bloc/app_bloc_observer.dart';
import 'package:my_base_app/core/config/app_config.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/logging/app_logger.dart';
import 'package:my_base_app/core/logging/app_logger_impl.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initApp({required AppConfig config}) async {
    return runZonedGuarded<Future<void>>(
          () async {
            WidgetsFlutterBinding.ensureInitialized();
            await initializeAppDependencies(config);

            final logger = getIt<AppLogger>();
            _registerGlobalErrorHandlers(logger);

            Bloc.observer = AppBlocObserver(logger);
            runApp(const MyBaseApp());
          },
          (error, stackTrace) {
            _logUnhandledError(error, stackTrace);
          },
        ) ??
        Future<void>.value();
  }

  static void _registerGlobalErrorHandlers(AppLogger logger) {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      logger.error(
        'Unhandled Flutter framework error',
        tag: 'APP_ERROR',
        error: details.exception,
        stackTrace: details.stack,
      );
    };

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      logger.error(
        'Unhandled platform error',
        tag: 'APP_ERROR',
        error: error,
        stackTrace: stackTrace,
      );
      return true;
    };
  }

  static void _logUnhandledError(Object error, StackTrace stackTrace) {
    final logger = getIt.isRegistered<AppLogger>()
        ? getIt<AppLogger>()
        : const AppLoggerImpl();

    logger.error(
      'Unhandled zone error',
      tag: 'APP_ERROR',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
