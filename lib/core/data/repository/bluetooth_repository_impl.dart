import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../datastore/device_info_store.dart';
import '/core/models/remote_control.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {

  DeviceInfoStore deviceInfoStore;

  BluetoothRepositoryImpl(this.deviceInfoStore) {
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color:true);

    if (!kIsWeb && Platform.isAndroid) {
      FlutterBluePlus.turnOn();
    }
  }

  // StreamController to manage the stream of devices
  StreamController<List<RemoteControl>>? _scanResultsController;

  // StreamController to manage the state of the device
  StreamController<bool>? _deviceStateController;

  @override
  Future<Stream<List<RemoteControl>>> startScan() async {

    _scanResultsController = StreamController<List<RemoteControl>>.broadcast();
    // Start scanning for devices
    FlutterBluePlus.startScan(
        withServices: [
          Guid("ABF0")
        ],
        timeout: Duration(seconds: 5)
    );

    // Listen for scan results and update the controller
    var subscription = FlutterBluePlus.scanResults.listen((scanResults) {
      _scanResultsController?.add(scanResults.map((item) =>
          RemoteControl(id: item.device.remoteId.str, name: item.device.platformName)
      ).toList());
    });

    FlutterBluePlus.cancelWhenScanComplete(subscription);

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
      await device.connect(autoConnect: true, mtu: null);
      await device.connectionState.where((val) => val == BluetoothConnectionState.connected).first;
      await deviceInfoStore.saveDeviceId(device.remoteId.toString());
      return true;
      } catch (e) {
      return false;
    }
  }

  @override
  Future<Stream<bool>> getDeviceStateConnection(bool connectToDevice) async {
    _deviceStateController = StreamController<bool>.broadcast();

    String deviceId = await deviceInfoStore.getDeviceId() ?? "";
    var device = BluetoothDevice.fromId(deviceId);
    device.connectionState.listen((BluetoothConnectionState state) {
      _deviceStateController?.add(state == BluetoothConnectionState.connected);
      if (state == BluetoothConnectionState.connected) {
        if (!kIsWeb && Platform.isAndroid) {
          device.requestMtu(517);
        }
      }
    });

    if (device.isDisconnected && connectToDevice) {
      await device.connect(autoConnect: true, mtu: null);
    }

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

  @override
  Future<bool> sendCommand(int commandValue) async {
    try {

      String deviceId = await deviceInfoStore.getDeviceId() ?? "";
      var device = BluetoothDevice.fromId(deviceId);

      List<int> command = [
        (commandValue & 0xFF),        // Low byte
        ((commandValue >> 8) & 0xFF), // High byte
      ];

      List<BluetoothService> services = await device.discoverServices();

      // Iterate through the services and find the characteristic you're interested in
      var characteristic = services.where((s) => s.uuid.toString() == 'abf0')
          .firstOrNull
          ?.characteristics.where((c) => c.characteristicUuid.str == 'abf1')
          .firstOrNull;

      if (characteristic != null) {
        characteristic.write(command);
        return true;
      }

    } catch (e) {
      print('Error sending command: $e');
    }
    return false;
  }
}
