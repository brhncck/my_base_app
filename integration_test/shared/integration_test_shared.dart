import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_base_app/app/app.dart';
import 'package:my_base_app/core/bloc/app_bloc_observer.dart';
import 'package:my_base_app/core/config/app_config.dart';
import 'package:my_base_app/core/config/app_dependencies.dart';
import 'package:my_base_app/core/logging/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Duration integrationTestPumpDuration = Duration(milliseconds: 300);

Future<void> pumpMyBaseApp() async {
  SharedPreferences.setMockInitialValues({});
  await getIt.reset();

  const config = AppConfig(
    flavor: Flavor.dev,
    appName: 'My Base App Dev',
    baseUrl: 'https://dummy-api-jtg6bessta-ey.a.run.app',
  );

  await initializeAppDependencies(config);
  Bloc.observer = AppBlocObserver(getIt<AppLogger>());
  runApp(const MyBaseApp());
}

Future<void> tapByKey(WidgetTester tester, String key) async {
  final finder = await waitForKey(tester, key);
  await tester.ensureVisible(finder);
  await tester.tap(finder);
  await tester.pump(integrationTestPumpDuration);
}

Future<Finder> waitForKey(
  WidgetTester tester,
  String key, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  final finder = await findKey(tester, key, timeout: timeout);
  expect(finder, findsOneWidget);
  return finder;
}

Future<Finder> findKey(
  WidgetTester tester,
  String key, {
  required Duration timeout,
}) async {
  final finder = find.byKey(Key(key));
  var elapsed = Duration.zero;

  while (finder.evaluate().isEmpty && elapsed < timeout) {
    await tester.pump(integrationTestPumpDuration);
    elapsed += integrationTestPumpDuration;
  }

  return finder;
}
