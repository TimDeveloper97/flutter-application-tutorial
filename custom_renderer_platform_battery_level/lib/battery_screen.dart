import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BatteryScreenState();
  }
}

class _BatteryScreenState extends State<BatteryScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBattryLevel');
      batteryLevel = 'Battery level at $result %.';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Level'),
      ),
      body: Center(
        child: TextButton(
          child: Text(_batteryLevel),
          onPressed: () => _getBatteryLevel(),
        ),
      ),
    );
  }
}
