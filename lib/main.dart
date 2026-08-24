import 'package:my_base_app/app_initializer.dart';
import 'package:my_base_app/core/config/app_config.dart';

Future<void> main() async {
  const prodConfig = AppConfig(
    flavor: Flavor.prod,
    appName: 'My Base App',
    baseUrl: 'https://dummy-api-jtg6bessta-ey.a.run.app',
  );
  await AppInitializer.initApp(config: prodConfig);
}
