import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../../models/remote_control.dart';
import 'bluetooth_repository.dart';

class MockBluetoothRepository implements BluetoothRepository {

  final StreamController<List<RemoteControl>> _scanResultsController =
  StreamController<List<RemoteControl>>.broadcast();

  final StreamController<BluetoothConnectionState> _deviceStateController =
  StreamController<BluetoothConnectionState>.broadcast();

  @override
  Stream<List<RemoteControl>> get scanResultsStream => _scanResultsController.stream;

  @override
  Stream<BluetoothConnectionState> get deviceStatusStream => _deviceStateController.stream;

  @override
  Future<void> startScan() async {

    await Future.delayed(Duration(seconds: 2));

    final fakeDevices = [
          RemoteControl(id: "1234", name: "GS remote 999999"),
          RemoteControl(id: "1234", name: "GS remote 1212122"),
    ];

    _scanResultsController.add(fakeDevices);
  }

  @override
  Future<void> stopScan() async {
    // Do nothing, since this is a mock
  }

  @override
  void dispose() {
    _scanResultsController.close();
  }

  @override
  Future<bool> pairDevice(RemoteControl device) async {
    await Future.delayed(const Duration(seconds: 2));
    _deviceStateController.add(
      BluetoothConnectionState.connected
    );
    return true;
  }

}
