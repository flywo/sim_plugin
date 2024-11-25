import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sim_plugin_method_channel.dart';

abstract class SimPluginPlatform extends PlatformInterface {
  /// Constructs a SimPluginPlatform.
  SimPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimPluginPlatform _instance = MethodChannelSimPlugin();

  /// The default instance of [SimPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimPlugin].
  static SimPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimPluginPlatform] when
  /// they register themselves.
  static set instance(SimPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> simSupportedIsOK() {
    throw UnimplementedError('simSupportedIsOK() has not been implemented.');
  }

  Future<String> getCurrentCarrierName() {
    throw UnimplementedError(
        'getCurrentCarrierName() has not been implemented.');
  }
}
