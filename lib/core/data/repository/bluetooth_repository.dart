import 'dart:async';

import 'package:dyi_controller/core/models/remote_control.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


abstract interface class BluetoothRepository {

  Stream<List<RemoteControl>> get scanResultsStream;
  Stream<BluetoothConnectionState> get deviceStatusStream;
  Future<void>  startScan();
  Future<void> stopScan();
  void dispose();
  Future<bool> pairDevice(RemoteControl device);

}
