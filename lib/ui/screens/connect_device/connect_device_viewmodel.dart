import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/remote_control.dart';
import '/core/data/repository/bluetooth_repository.dart';
import '/dependencies.dart';
import 'connect_device_events.dart';
import 'connect_device_states.dart';

final connectDeviceViewModelProvider = StateNotifierProvider<ConnectDeviceViewModel, ConnectDeviceState>((ref) {
  final bluetoothRepository = ref.read(bluetoothRepositoryProvider);
  return ConnectDeviceViewModel(bluetoothRepository);
});

class ConnectDeviceViewModel extends StateNotifier<ConnectDeviceState> {
  final BluetoothRepository _bluetoothRepository;

  var devicesResult = <String>[];

  ConnectDeviceViewModel(this._bluetoothRepository) : super(const ConnectDeviceState.idle());

  void event(ConnectDeviceEvent event) {
    switch (event)  {
      case StartScanning(): _startScanning();
      case CancelScanning(): _cancelScanning();
      case SelectDevice(): _selectDevice(event.device);
      case CancelPairing(): _cancelPairing();
    }
  }

  void _startScanning() async {
    state = const ConnectDeviceState.scanning();
    _bluetoothRepository.startScan();

    _bluetoothRepository.scanResultsStream.listen((scanResults) {
      if (scanResults.isNotEmpty) {
        state = ConnectDeviceState.deviceSelection(scanResults);
      }
    });
  }

  void _cancelScanning() {
    _bluetoothRepository.stopScan();
    state = const ConnectDeviceState.idle();
  }

  void _selectDevice(RemoteControl device) {
    state = ConnectDeviceState.connecting(device);
    _bluetoothRepository.pairDevice(device);
    _bluetoothRepository.deviceStatusStream.listen((deviceState) {
      if (deviceState == BluetoothConnectionState.connected) {
        state = ConnectDeviceState.connected(device);
      }
    });
  }

  void _cancelPairing() {
    state = const ConnectDeviceState.idle();
  }
}
