import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sim_plugin_platform_interface.dart';

/// An implementation of [SimPluginPlatform] that uses method channels.
class MethodChannelSimPlugin extends SimPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sim_plugin');

  @override
  Future<bool> simSupportedIsOK() async {
    final version = await methodChannel.invokeMethod<bool>('simSupportedIsOK');
    return version ?? false;
  }

  @override
  Future<String> getCurrentCarrierName() async {
    final version =
        await methodChannel.invokeMethod<String>('getCurrentCarrierName');
    return version ?? '';
  }
}
