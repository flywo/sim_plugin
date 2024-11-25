# 简介

获取sim卡是否插入和获取当前运营商使用。

# 示例

```
final _simPlugin = SimPlugin();
final simSupportedIsOK = await _simPlugin.simSupportedIsOK();
final currentCarrierName = await _simPlugin.getCurrentCarrierName();
```
