import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String deviceId;

  const HomeScreen({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(child: Text("Connected to device: $deviceId")),
    );
  }
}
