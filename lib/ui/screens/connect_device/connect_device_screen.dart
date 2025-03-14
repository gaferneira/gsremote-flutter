import 'package:dyi_controller/core/models/app_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_router.dart';

class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({super.key});

  Future<void> _connectAndSaveDevice(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    const deviceId = "12345-ABCDE"; // Simulating device connection
    await prefs.setString('deviceId', deviceId);

    // Navigate to HomeScreen with the deviceId
    context.go(AppRoute.home(deviceId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connect Device")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _connectAndSaveDevice(context),
          child: const Text("Connect to a Device"),
        ),
      ),
    );
  }
}
