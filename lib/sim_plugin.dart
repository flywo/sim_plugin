import 'sim_plugin_platform_interface.dart';

class SimPlugin {
  /// 检查SIM卡是否支持
  Future<bool> simSupportedIsOK() {
    return SimPluginPlatform.instance.simSupportedIsOK();
  }

  /// 获取当前运营商名称
  Future<String> getCurrentCarrierName() {
    return SimPluginPlatform.instance.getCurrentCarrierName();
  }
}
