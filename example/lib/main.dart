import 'package:flutter/material.dart';
import 'package:sim_plugin/sim_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _simSupportedIsOK = false;
  String _currentCarrierName = '';
  final _simPlugin = SimPlugin();

  @override
  void initState() {
    super.initState();
    getSimInfo();
  }

  getSimInfo() async {
    final simSupportedIsOK = await _simPlugin.simSupportedIsOK();
    final currentCarrierName = await _simPlugin.getCurrentCarrierName();
    setState(() {
      _simSupportedIsOK = simSupportedIsOK;
      _currentCarrierName = currentCarrierName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sim Plugin Example'),
        ),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Text("sim卡是否插入：$_simSupportedIsOK"),
              Text("当前运营商：$_currentCarrierName"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
