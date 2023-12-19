import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart';
import 'package:doggo_dec_19/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Check if this is flagged as a continuous integration test run
  // - If so then we will expect mocked external services with known responses
  //   - Currently expecting mock services:
  //   - TheDogApi: [MockDogApiDec19] docker image available on localhost:3019
  const bool ciRun = bool.fromEnvironment('CI', defaultValue: false);

  group('Run app', () {
    testWidgets('and evalute initial state as well as a set of state changes',
        (widgetTester) async {
      // Set up dependencies and access to environment resources if needed

      // Run app
      app.main();
      await widgetTester.pumpAndSettle();

      // Perform tests
      // ---------------------------------------------------------------------------------------------------
      // | Evaluate initial state - All expected elements displayed
      // ---------------------------------------------------------------------------------------------------
      // Scaffold/Appbar
      expect(find.widgetWithText(AppBar, "Dog app! ~ For dogs and humans!"),
          findsOneWidget);

      // Request Button
      expect(
          find.widgetWithText(
              ElevatedButton, "Display list of dog breeds, please!"),
          findsOneWidget);

      // ---------------------------------------------------------------------------------------------------
      // | Evaluate state change - on - get dog list button pressed
      // ---------------------------------------------------------------------------------------------------
      // 'Not Implemented' snackbar is not displayed before the request button is ever pressed
      expect(
          find.widgetWithText(SnackBar,
              "This feature is not implemented yet. It will be up and running as soon as possible. Bear with us until then. (Or doggo with us! Any animal with us is fine for sure!)"),
          findsNothing);

      // Tap the request button
      await widgetTester.tap(find.widgetWithText(
          ElevatedButton, "Display list of dog breeds, please!"));
      await widgetTester.pumpAndSettle();

      // 'Not Implemented' snackbar is displayed after request button is pressed
      expect(
          find.widgetWithText(SnackBar,
              "This feature is not implemented yet. It will be up and running as soon as possible. Bear with us until then. (Or doggo with us! Any animal with us is fine for sure!)"),
          findsOneWidget);
    });
  });
}
