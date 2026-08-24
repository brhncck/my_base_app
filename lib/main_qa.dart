import 'package:my_base_app/app_initializer.dart';
import 'package:my_base_app/core/config/app_config.dart';

Future<void> main() async {
  const qaConfig = AppConfig(
    flavor: Flavor.qa,
    appName: 'My Base App QA',
    baseUrl: 'https://dummy-api-jtg6bessta-ey.a.run.app',
    enableApiRequestLogging: true,
    enableApiResponseLogging: true,
    logApiRequestBody: true,
    logApiResponseBody: true,
  );
  await AppInitializer.initApp(config: qaConfig);
}
