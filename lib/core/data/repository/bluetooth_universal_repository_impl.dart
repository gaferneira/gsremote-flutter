import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';

import '../datastore/device_info_store.dart';
import '/core/models/remote_control.dart';

import 'bluetooth_repository.dart';

import 'package:universal_ble/universal_ble.dart';

class BluetoothUniversalRepositoryImpl implements BluetoothRepository {
  DeviceInfoStore deviceInfoStore;

  BluetoothUniversalRepositoryImpl(this.deviceInfoStore);

  // StreamControllers to manage streams
  StreamController<List<RemoteControl>>? _scanResultsController;
  StreamController<bool>? _deviceStateController;
  List<RemoteControl> _scanResults = [];

  @override
  Future<Stream<List<RemoteControl>>> startScan() async {

    AvailabilityState state = await UniversalBle.getBluetoothAvailabilityState();
    if (state == AvailabilityState.poweredOff) {
      //Throw error or something
    }

    _scanResultsController = StreamController<List<RemoteControl>>.broadcast();

    _scanResults = [];
    UniversalBle.onScanResult = (bleDevice) {
      RemoteControl device = RemoteControl(id: bleDevice.deviceId, name: bleDevice.name ?? "");
      if (_scanResults.indexWhere((device) => device.id == bleDevice.deviceId) == -1) {
        _scanResults.add(device);
        _scanResultsController?.add(_scanResults);
      }

    };

    UniversalBle.startScan(
        scanFilter: ScanFilter(
            withServices: ['ABF0']
        )
    );

    return _scanResultsController!.stream;
  }

  @override
  Future<void> stopScan() async {
    await UniversalBle.stopScan();
  }

  @override
  void dispose() {
    _scanResultsController?.close();
    _deviceStateController?.close();
  }

  @override
  Future<bool> pairDevice(RemoteControl device) async {
    try {
      await UniversalBle.connect(device.id);
      await deviceInfoStore.saveDeviceId(device.id);
      return true;
    } catch (e) {
      print('Pairing failed: $e');
      return false;
    }
  }

  @override
  Future<Stream<bool>> getDeviceStateConnection(bool connectToDevice) async {
    _deviceStateController?.close();
    _deviceStateController = StreamController<bool>.broadcast();

    String? deviceId = await deviceInfoStore.getDeviceId();
    if (deviceId == null) {
      return _deviceStateController!.stream;
    }

    _getDeviceStateConnection(deviceId, connectToDevice);

    return _deviceStateController!.stream;
  }

  void _getDeviceStateConnection(String deviceId, bool connectToDevice) async {
    BleConnectionState connectionState = await UniversalBle.getConnectionState(deviceId);
    var isConnected = connectionState == BleConnectionState.connected;
    _deviceStateController?.add(isConnected);
    UniversalBle.onConnectionChange = (String connectedDeviceId, bool isConnected, String? error) {
      if (deviceId == connectedDeviceId) {
        _deviceStateController?.add(isConnected);
      }
    };
    if (connectionState == BleConnectionState.disconnected && connectToDevice) {
      await UniversalBle.connect(deviceId);
    }
  }

  @override
  Future<void> disconnectDevice() async {
    String? deviceId = await deviceInfoStore.getDeviceId();
    if (deviceId != null) {
      await UniversalBle.disconnect(deviceId);
    }
  }

  @override
  Future<bool> isDeviceSetup() async {
    return (await deviceInfoStore.getDeviceId()) != null;
  }

  @override
  Future<bool> sendCommand(String hexValue) async {
    try {
      String? deviceId = await deviceInfoStore.getDeviceId();
      if (deviceId == null) return false;

      await UniversalBle.discoverServices(deviceId);

      await UniversalBle.writeValue(
          deviceId,
          'ABF0',
          'ABF1',
          hexToBytes(hexValue),
          BleOutputProperty.withoutResponse
      );
      return true;

    } catch (e) {
      print('Error sending command: $e');
    }
    return false;
  }

  Uint8List hexToBytes(String hex) {
    List<int> bytes = [];
    for (int i = 0; i < hex.length; i += 2) {
      bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
    }
    return Uint8List.fromList(bytes);
  }

  @override
  Future<void> forgetDevice() async {
    String deviceId = await deviceInfoStore.getDeviceId() ?? "";
    await UniversalBle.disconnect(deviceId);
    deviceInfoStore.removeDeviceId();
    _deviceStateController?.close();
    _deviceStateController = null;
  }

}

