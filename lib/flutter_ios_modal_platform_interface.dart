import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ios_modal_method_channel.dart';

abstract class FlutterIosModalPlatform extends PlatformInterface {
  /// Constructs a FlutterIosModalPlatform.
  FlutterIosModalPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIosModalPlatform _instance = MethodChannelFlutterIosModal();

  /// The default instance of [FlutterIosModalPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIosModal].
  static FlutterIosModalPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIosModalPlatform] when
  /// they register themselves.
  static set instance(FlutterIosModalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
