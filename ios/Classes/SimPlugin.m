#import "SimPlugin.h"
#import <ATAuthSDK/TXCommonUtils.h>

@implementation SimPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"sim_plugin"
            binaryMessenger:[registrar messenger]];
  SimPlugin* instance = [[SimPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"simSupportedIsOK" isEqualToString:call.method]) {
    BOOL isSimOk = [TXCommonUtils simSupportedIsOK];
    result(@(isSimOk));
  } else if ([@"getCurrentCarrierName" isEqualToString:call.method]) {
    result([TXCommonUtils getCurrentCarrierName]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
