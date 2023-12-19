import 'package:doggo_dec_19/models/dog_service/dog_breed.dart';
import 'package:doggo_dec_19/screens/dog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/mock_dog_service.dart';

void main() {
  group('When Dog Screen', () {
    testWidgets('is in initial state the expected UI elements are displayed',
        (widgetTester) async {
      // Initialize dependencies and required environment resources required by the code being tested
      MockDogService mockDogService = MockDogService();

      // Run instance of code (class/widget) if required
      await widgetTester
          .pumpWidget(MaterialApp(home: DogScreen(dogService: mockDogService)));
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
        'get dog breeds button is pressed - then list of dog breeds is displayed',
        (widgetTester) async {
      // Initialize dependencies and required environment resources required by the code being tested
      MockDogService mockDogService = MockDogService();

      // Run instance of code (class/widget) if required
      await widgetTester
          .pumpWidget(MaterialApp(home: DogScreen(dogService: mockDogService)));
      await widgetTester.pumpAndSettle();

      // Perform tests
      // ===================================================================================================
      // | "List dog breeds" button press
      // ===================================================================================================
      // Prepare for testing
      // - Get our own copy of the data that defines the expected state change
      //   in reaction the request button being pressed for the first time
      List<DogBreed> mockBreeds = (await mockDogService.getBreeds()).data!;

      // ---------------------------------------------------------------------------------------------------
      // | List of dog breeds is not displayed before request button is ever pressed
      // ---------------------------------------------------------------------------------------------------
      for (DogBreed mockBreed in mockBreeds) {
        expect(find.widgetWithText(ListTile, mockBreed.name), findsNothing);
      }

      // Click request button
      await widgetTester.tap(find.widgetWithText(
          ElevatedButton, "Display list of dog breeds, please!"));
      await widgetTester.pumpAndSettle();

      // ---------------------------------------------------------------------------------------------------
      // | List of dog breeds is displayed after the request button is pressed
      // ---------------------------------------------------------------------------------------------------
      for (DogBreed mockBreed in mockBreeds) {
        expect(find.widgetWithText(ListTile, mockBreed.name), findsOneWidget);
      }
    });
  });
}
