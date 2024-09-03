import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ios_modal_platform_interface.dart';

/// An implementation of [FlutterIosModalPlatform] that uses method channels.
class MethodChannelFlutterIosModal extends FlutterIosModalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_ios_modal');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
