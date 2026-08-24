import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_base_app/core/api/client/base_api_client.dart';
import 'package:my_base_app/core/api/interceptor/dio_request_logger_interceptor.dart';
import 'package:my_base_app/core/api/interceptor/dio_response_logger_interceptor.dart';
import 'package:my_base_app/core/config/app_config.dart';
import 'package:my_base_app/core/config/app_settings/app_settings_bloc.dart';
import 'package:my_base_app/core/config/environment/env.dart';
import 'package:my_base_app/core/logging/app_logger.dart';
import 'package:my_base_app/core/logging/app_logger_impl.dart';
import 'package:my_base_app/core/storage/local_preferences_storage.dart';
import 'package:my_base_app/features/dashboard/bloc/dashboard_tab_bloc.dart';
import 'package:my_base_app/features/home/bloc/home_bloc.dart';
import 'package:my_base_app/features/home/data/repositories/home_repository.dart';
import 'package:my_base_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:my_base_app/features/home/data/services/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeAppDependencies(AppConfig config) async {
  final prefs = await SharedPreferences.getInstance();

  if (!getIt.isRegistered<AppConfig>()) {
    getIt.registerSingleton<AppConfig>(config);
  }

  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(prefs);
  }

  if (!getIt.isRegistered<AppLogger>()) {
    getIt.registerLazySingleton<AppLogger>(() => const AppLoggerImpl());
  }

  if (!getIt.isRegistered<LocalPreferencesStorage>()) {
    getIt.registerLazySingleton<LocalPreferencesStorage>(
      () => LocalPreferencesStorage(getIt<SharedPreferences>()),
    );
  }

  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() {
      final dio = Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          connectTimeout: Env.connectTimeout,
          receiveTimeout: Env.receiveTimeout,
          headers: Env.defaultHeaders,
        ),
      );

      if (config.enableApiRequestLogging) {
        dio.interceptors.add(
          DioRequestLoggerInterceptor(
            logger: getIt<AppLogger>(),
            logHeaders: config.logApiRequestHeaders,
            logRequestBody: config.logApiRequestBody,
          ),
        );
      }

      if (config.enableApiResponseLogging) {
        dio.interceptors.add(
          DioResponseLoggerInterceptor(
            logger: getIt<AppLogger>(),
            logResponseBody: config.logApiResponseBody,
          ),
        );
      }
      return dio;
    });
  }

  if (!getIt.isRegistered<BaseApiClient>()) {
    getIt.registerLazySingleton<BaseApiClient>(
      () => BaseApiClient(getIt<Dio>()),
    );
  }

  if (!getIt.isRegistered<HomeService>()) {
    getIt.registerLazySingleton<HomeService>(
      () => HomeService(getIt<BaseApiClient>()),
    );
  }

  if (!getIt.isRegistered<HomeRepository>()) {
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt<HomeService>()),
    );
  }

  if (!getIt.isRegistered<HomeBloc>()) {
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(repository: getIt<HomeRepository>()),
    );
  }

  if (!getIt.isRegistered<DashboardTabBloc>()) {
    getIt.registerFactory<DashboardTabBloc>(() => DashboardTabBloc());
  }

  if (!getIt.isRegistered<AppSettingsBloc>()) {
    getIt.registerFactory<AppSettingsBloc>(
      () => AppSettingsBloc(storage: getIt<LocalPreferencesStorage>()),
    );
  }
}
