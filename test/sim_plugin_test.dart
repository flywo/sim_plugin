import 'package:flutter_test/flutter_test.dart';
import 'package:sim_plugin/sim_plugin.dart';
import 'package:sim_plugin/sim_plugin_platform_interface.dart';
import 'package:sim_plugin/sim_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSimPluginPlatform
    with MockPlatformInterfaceMixin
    implements SimPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SimPluginPlatform initialPlatform = SimPluginPlatform.instance;

  test('$MethodChannelSimPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSimPlugin>());
  });

  test('getPlatformVersion', () async {
    SimPlugin simPlugin = SimPlugin();
    MockSimPluginPlatform fakePlatform = MockSimPluginPlatform();
    SimPluginPlatform.instance = fakePlatform;

    expect(await simPlugin.getPlatformVersion(), '42');
  });
}
