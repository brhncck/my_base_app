import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'scenarios/theme_flow_scenario.dart';
import 'shared/integration_test_shared.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('changes theme and returns to home page', (tester) async {
    await pumpMyBaseApp();
    await changeThemeAndReturnHomeScenario(tester);
  });
}
