import 'dart:async';


import '../datastore/device_info_store.dart';
import '/core/models/remote_control.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {

  DeviceInfoStore deviceInfoStore;

  BluetoothRepositoryImpl(this.deviceInfoStore);

  // StreamController to manage the stream of devices
  StreamController<List<RemoteControl>>? _scanResultsController;

  // StreamController to manage the state of the device
  StreamController<bool>? _deviceStateController;

  @override
  Future<Stream<List<RemoteControl>>> startScan() async {

    _scanResultsController = StreamController<List<RemoteControl>>.broadcast();
    // Start scanning for devices
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 5));

    // Listen for scan results and update the controller
    FlutterBluePlus.scanResults.listen((scanResults) {
      _scanResultsController?.add(scanResults.map((item) =>
          RemoteControl(id: item.device.remoteId.str, name: item.device.platformName)
      ).toList());
    });

    return _scanResultsController!.stream;
  }

  @override
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  @override
  void dispose() {
    _scanResultsController?.close();
    _scanResultsController = null;
  }

  @override
  Future<bool> pairDevice(RemoteControl deviceId) async {
    try {
      var device = BluetoothDevice.fromId(deviceId.id);
      await device.connect(autoConnect: true);
      await device.connectionState.where((val) => val == BluetoothConnectionState.connected).first;
      await deviceInfoStore.saveDeviceId(device.remoteId.toString());
      return true;
      } catch (e) {
      return false;
    }
  }

  @override
  Future<Stream<bool>> getDeviceStateConnection() async {
    _deviceStateController = StreamController<bool>.broadcast();

    String deviceId = await deviceInfoStore.getDeviceId() ?? "";
    var device = BluetoothDevice.fromId(deviceId);
    device.connectionState.listen((BluetoothConnectionState state) {
      _deviceStateController?.add(state == BluetoothConnectionState.connected);
    });
    await device.connect(autoConnect: true);

    return _deviceStateController!.stream;
  }

  @override
  Future<void> disconnectDevice() async {
    String deviceId = await deviceInfoStore.getDeviceId() ?? "";
    var device = BluetoothDevice.fromId(deviceId);
    await device.disconnect();
    deviceInfoStore.removeDeviceId();
  }

  @override
  Future<bool> isDeviceSetup() async {
    return (await deviceInfoStore.getDeviceId()) != null;
  }
}
