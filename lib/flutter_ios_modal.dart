// File: lib/flutter_ios_modal.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FlutterIOSModal {
  static const MethodChannel _channel = MethodChannel('flutter_ios_modal');

  static Future<void> showModalSheet({
    required String viewPath,
    bool hasHeader = false,
    double headerHeight = 0.0,
  }) async {
    try {
      final Map<String, dynamic> arguments = {
        'viewPath': viewPath,
        'hasHeader': hasHeader,
        'headerHeight': headerHeight,
      };
      await _channel.invokeMethod('showModalSheet', arguments);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to show modal sheet: '${e.message}'.");
      }
    }
  }
}