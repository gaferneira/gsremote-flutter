import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dashboard_viewmodel.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardViewModelProvider);

    return Scaffold(
      body: Center(
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    state.isDeviceConnected ? Icons.bluetooth_connected : Icons.bluetooth_disabled,
                    size: 80,
                    color: state.isDeviceConnected ? Colors.blue : Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    state.isDeviceConnected ? "Device Connected" : "Device Disconnected",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
        ),
    );
  }
}
