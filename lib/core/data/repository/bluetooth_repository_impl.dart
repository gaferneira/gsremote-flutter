import 'dart:async';

import '/core/models/remote_control.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {

  // StreamController to manage the stream of devices
  final StreamController<List<RemoteControl>> _scanResultsController =
  StreamController<List<RemoteControl>>.broadcast();

  // StreamController to manage the state of the device
  final StreamController<BluetoothConnectionState> _deviceStateController =
  StreamController<BluetoothConnectionState>.broadcast();

  @override
  Stream<List<RemoteControl>> get scanResultsStream => _scanResultsController.stream;

  @override
  Stream<BluetoothConnectionState> get deviceStatusStream => _deviceStateController.stream;

  @override
  Future<void> startScan() async {
    // Start scanning for devices
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 5));

    // Listen for scan results and update the controller
    FlutterBluePlus.scanResults.listen((scanResults) {
      _scanResultsController.add(scanResults.map((item) =>
          RemoteControl(id: item.device.remoteId.str, name: item.device.platformName)
      ).toList());
    });
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  @override
  void dispose() {
    _scanResultsController.close();
  }

  @override
  Future<bool> pairDevice(RemoteControl deviceId) async {
    try {
      var device = FlutterBluePlus.connectedDevices.firstWhere((device) => device.remoteId.str == deviceId.id);
      device.connectionState.listen((BluetoothConnectionState state) {
        _deviceStateController.add(state);
      });
      await device.connect(autoConnect: true);
      return true;
      } catch (e) {
      return false;
    }
  }

}
