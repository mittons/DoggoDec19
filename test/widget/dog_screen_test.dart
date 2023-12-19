import 'package:doggo_dec_19/screens/dog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('When Dog Screen', () {
    testWidgets('is in initial state the expected UI elements are displayed',
        (widgetTester) async {
      // Initialize dependencies and required environment resources required by the code being tested

      // Run instance of code (class/widget) if required
      await widgetTester.pumpWidget(MaterialApp(home: DogScreen()));
      await widgetTester.pumpAndSettle();

      // Perform tests
      // ---------------------------------------------------------------------------------------------------
      // | Scaffold/Appbar is correctly displayed
      // ---------------------------------------------------------------------------------------------------
      expect(find.widgetWithText(AppBar, "Dog app! ~ For dogs and humans!"),
          findsOneWidget);

      // ---------------------------------------------------------------------------------------------------
      // | "Display list of dogs" Request Button is correctly displayed
      // ---------------------------------------------------------------------------------------------------
      expect(
          find.widgetWithText(
              ElevatedButton, "Display list of dog breeds, please!"),
          findsOneWidget);
    });

    testWidgets(
        'get dog breeds button is pressed - "not implemented" snackbar is shown',
        (widgetTester) async {
      // Initialize dependencies and required environment resources required by the code being tested

      // Run instance of code (class/widget) if required
      await widgetTester.pumpWidget(MaterialApp(home: DogScreen()));
      await widgetTester.pumpAndSettle();

      // Perform tests
      // ---------------------------------------------------------------------------------------------------
      // | "Not implemented yet" Snackbar is not displayed before request button is ever pressed
      // ---------------------------------------------------------------------------------------------------
      expect(
          find.widgetWithText(SnackBar,
              "This feature is not implemented yet. It will be up and running as soon as possible. Bear with us until then. (Or doggo with us! Any animal with us is fine for sure!)"),
          findsNothing);

      // Click request button
      await widgetTester.tap(find.widgetWithText(
          ElevatedButton, "Display list of dog breeds, please!"));
      await widgetTester.pumpAndSettle();

      // ---------------------------------------------------------------------------------------------------
      // | "Not implemented yet" Snackbar is displayed after button is pressed
      // ---------------------------------------------------------------------------------------------------
      expect(
          find.widgetWithText(SnackBar,
              "This feature is not implemented yet. It will be up and running as soon as possible. Bear with us until then. (Or doggo with us! Any animal with us is fine for sure!)"),
          findsOneWidget);
    });
  });
}
