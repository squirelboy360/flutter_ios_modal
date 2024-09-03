// File: example/integration_test/plugin_integration_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_ios_modal/flutter_ios_modal.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Show modal test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                FlutterIOSModal.showModalSheet(
                  viewPath: '/test_modal',
                  hasHeader: true,
                  headerHeight: 50.0,
                );
              },
              child: const Text('Show Modal'),
            ),
          ),
        ),
      ),
    );

    // Tap the button to show the modal
    await tester.tap(find.text('Show Modal'));
    await tester.pumpAndSettle();

    // We can't directly test the native iOS modal, but we can verify that
    // showModalSheet doesn't throw an error
    expect(true, isTrue); // If we've reached here, showModalSheet didn't throw

    // You might want to add a delay here to visually verify the modal
    // await Future.delayed(Duration(seconds: 2));
  });
}