import 'package:flutter_test/flutter_test.dart';
import 'package:my_base_app/constants/app_constants.dart';

import '../shared/integration_test_shared.dart';

Future<void> changeThemeAndReturnHomeScenario(WidgetTester tester) async {
  await tapByKey(tester, AppConstants.getStartedButtonKey);
  await completeOnboardingIfVisible(tester);
  await closePaywallIfVisible(tester);

  await tapByKey(tester, AppConstants.dashboardProfileTabKey);
  await waitForKey(tester, AppConstants.profilePageKey);

  await tapByKey(tester, AppConstants.profileThemeSwitchKey);
  await tester.pump(integrationTestPumpDuration);

  await tapByKey(tester, AppConstants.dashboardHomeTabKey);
  await waitForKey(tester, AppConstants.homePageKey);
}

Future<void> completeOnboardingIfVisible(WidgetTester tester) async {
  final continueButton = await findKey(
    tester,
    AppConstants.onboardingContinueButtonKey,
    timeout: const Duration(seconds: 2),
  );

  if (continueButton.evaluate().isEmpty) return;

  await tester.tap(continueButton);
  await tester.pump(integrationTestPumpDuration);
  await tapByKey(tester, AppConstants.onboardingContinueButtonKey);
}

Future<void> closePaywallIfVisible(WidgetTester tester) async {
  final closeButton = await findKey(
    tester,
    AppConstants.paywallCloseButtonKey,
    timeout: const Duration(seconds: 5),
  );

  if (closeButton.evaluate().isEmpty) return;

  await tester.tap(closeButton);
  await tester.pump(integrationTestPumpDuration);
}
