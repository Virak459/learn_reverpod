import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning_reverpod/main.dart';

void main() {
  testWidgets('Click button to load and show CLIENT_URL', (
    WidgetTester tester,
  ) async {
    // Load .env
    await dotenv.load(fileName: '.env');

    // Run the app
    await tester.pumpWidget(MyApp());

    // Find and tap the button
    final buttonFinder = find.byKey(const Key('loadButton'));
    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump(); // allow rebuild

    // Assert that the env value is displayed
    expect(find.text('Client URL: http://127.0.0.1:8000/api'), findsOneWidget);
  });
}
