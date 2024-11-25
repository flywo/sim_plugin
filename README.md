# 简介

获取sim卡是否插入和获取当前运营商使用。

# 示例

```
final _simPlugin = SimPlugin();
final simSupportedIsOK = await _simPlugin.simSupportedIsOK();
final currentCarrierName = await _simPlugin.getCurrentCarrierName();
```

# 注意

- 由于使用的获取sim卡信息的iOS原生库只支持真机，所以一旦你集成了该库，就无法在模拟器上运行。