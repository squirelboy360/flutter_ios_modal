// File: test/flutter_ios_modal_test.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_modal/flutter_ios_modal.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  const MethodChannel channel = MethodChannel('flutter_ios_modal');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async => null
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('showModalSheet', () async {
    // Mock the method channel call
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        expect(methodCall.method, 'showModalSheet');
        expect(methodCall.arguments, {
          'viewPath': '/test_modal',
          'hasHeader': true,
          'headerHeight': 50.0,
        });
        return null;
      }
    );

    // Call the method and expect no exceptions
    expect(() async {
      await FlutterIOSModal.showModalSheet(
        viewPath: '/test_modal',
        hasHeader: true,
        headerHeight: 50.0,
      );
    }, returnsNormally);
  });
}