import 'package:dyi_controller/core/models/remote_control.dart';

sealed class ConnectDeviceEvent {
  const ConnectDeviceEvent();

  factory ConnectDeviceEvent.startScanning() = StartScanning;
  factory ConnectDeviceEvent.cancelScanning() = CancelScanning;
  factory ConnectDeviceEvent.selectDevice(RemoteControl device) = SelectDevice;
  factory ConnectDeviceEvent.cancelPairing() = CancelPairing;
}

class StartScanning extends ConnectDeviceEvent {}
class CancelScanning extends ConnectDeviceEvent {}
class SelectDevice extends ConnectDeviceEvent {
  final RemoteControl device;
  SelectDevice(this.device);
}
class CancelPairing extends ConnectDeviceEvent {}
