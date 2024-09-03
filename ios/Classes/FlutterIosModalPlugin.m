// File: ios/Classes/FlutterIosModalPlugin.m
#import "FlutterIosModalPlugin.h"
#if __has_include(<flutter_ios_modal/flutter_ios_modal-Swift.h>)
#import <flutter_ios_modal/flutter_ios_modal-Swift.h>
#else
#import "flutter_ios_modal-Swift.h"
#endif

@implementation FlutterIosModalPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterIosModalPlugin registerWithRegistrar:registrar];
}
@end