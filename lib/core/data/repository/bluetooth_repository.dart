import 'dart:async';

import '/core/models/remote_control.dart';

abstract interface class BluetoothRepository {

  Future<bool> isDeviceSetup();
  Future<Stream<List<RemoteControl>>> startScan();
  Future<void> stopScan();
  void dispose();
  Future<bool> pairDevice(RemoteControl device);
  Future<Stream<bool>> getDeviceStateConnection(bool connectToDevice);
  Future<bool> sendCommand(String hexValue);
  Future<void> disconnectDevice();
  Future<void> forgetDevice();

}
