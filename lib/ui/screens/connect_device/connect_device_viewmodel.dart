import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/failure.dart';
import '/core/models/remote_control.dart';
import '/core/utils/result.dart';
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
    var stream = await _bluetoothRepository.startScan();
    stream.listen((scanResults) {
      if (scanResults.isNotEmpty) {
        state = ConnectDeviceState.deviceSelection(scanResults);
      }
    });
  }

  void _cancelScanning() {
    _bluetoothRepository.stopScan();
    state = const ConnectDeviceState.idle();
  }

  void _selectDevice(RemoteControl device) async {
    state = ConnectDeviceState.connecting(device);
    try {
      var response = await _bluetoothRepository.pairDevice(device);
      if (response) {
        state = ConnectDeviceState.connected(Success(device));
      } else {
        state = ConnectDeviceState.connected(Error(ApplicationException("Error pairing device", null)));
      }
    } on Exception catch (e) {
      state = ConnectDeviceState.connected(e.toResultError());
    }
  }

  void _cancelPairing() {
    state = const ConnectDeviceState.idle();
  }
}
