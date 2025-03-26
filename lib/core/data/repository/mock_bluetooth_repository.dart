import 'dart:async';
import '../../models/remote_control.dart';
import 'bluetooth_repository.dart';

class MockBluetoothRepository implements BluetoothRepository {

  final StreamController<List<RemoteControl>> _scanResultsController =
  StreamController<List<RemoteControl>>.broadcast();

  final StreamController<bool> _deviceStateController =
  StreamController<bool>.broadcast();

  @override
  Future<Stream<List<RemoteControl>>> startScan() async {
    _addFakeDevice();
    return _scanResultsController.stream;
  }

  void _addFakeDevice() async {
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
    _deviceStateController.add(true);
    return true;
  }

  @override
  Future<Stream<bool>> getDeviceStateConnection(bool connectToDevice) async{
    if (connectToDevice) {
      _connectDevice();
    }
    return _deviceStateController.stream;
  }

  void _connectDevice() async {
    await Future.delayed(Duration(seconds: 2));

    _deviceStateController.add(true);
  }
  @override
  Future<void> disconnectDevice() async {

  }

  @override
  Future<bool> isDeviceSetup() async {
    return false;
  }

  @override
  Future<bool> sendCommand(int commandValue) async {
    return true;
  }

}
