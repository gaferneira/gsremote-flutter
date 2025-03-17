import 'package:dyi_controller/core/models/app_route.dart';
import 'package:dyi_controller/core/models/remote_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_router.dart';
import 'connect_device_states.dart';
import 'connect_device_viewmodel.dart';
import 'connect_device_events.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectDeviceScreen extends ConsumerWidget {
  const ConnectDeviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(connectDeviceViewModelProvider.notifier);
    final state = ref.watch(connectDeviceViewModelProvider);

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFF299DFF)],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(child: _buildView(context, viewModel, state)),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildView(
    BuildContext context,
    ConnectDeviceViewModel viewModel,
    ConnectDeviceState state,
  ) {
    switch (state) {
      case Idle():
        return _buildInitialState(context, viewModel);
      case Scanning():
        return _buildScanningState(viewModel);
      case DeviceSelection():
        return _buildDeviceSelectionState(viewModel, state.devices);
      case Connecting():
        return _buildConnectingState(viewModel, state.device);
      case Connected():
        return _buildConnectedState(context, viewModel, state.device);
    }
  }

  Widget _buildInitialState(
    BuildContext context,
    ConnectDeviceViewModel viewModel,
  ) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/vectors/icon_bluetooth.svg',
          height: 80,
          width: 80,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        const SizedBox(height: 32),
        Text(
          'Turn on your Bluetooth connection settings and make sure your GS controller is in pairing mode and close to your phone.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          onPressed: () {
            viewModel.event(StartScanning());
          },
          child: const Text(
            'Pair Device',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScanningState(ConnectDeviceViewModel viewModel) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/vectors/icon_bluetooth.svg',
          height: 80,
          width: 80,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        const SizedBox(height: 24),
        const Text(
          'Searching for IoT Device...',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          onPressed: () {
            viewModel.event(CancelScanning());
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceSelectionState(
    ConnectDeviceViewModel viewModel,
    List<RemoteControl> devices,
  ) {
    return Column(
      children: [
        const Text(
          'Select your GS remote',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];
              return ListTile(
                title: Text(device.name),
                onTap: () => viewModel.event(SelectDevice(device)),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          onPressed: () {
            viewModel.event(CancelScanning());
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConnectingState(
    ConnectDeviceViewModel viewModel,
     RemoteControl device,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 40),
        Text("Connecting to ${device.name}..."),
      ],
    );
  }

  Widget _buildConnectedState(
    BuildContext context,
    ConnectDeviceViewModel viewModel,
    RemoteControl device,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Connected to ${device.name}"),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            context.go(AppRoute.home(device.id));
          },
          child: Text("Continue"),
        ),
      ],
    );
  }
}
