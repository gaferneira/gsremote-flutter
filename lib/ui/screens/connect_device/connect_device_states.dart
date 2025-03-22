import '/core/utils/result.dart';

import '/core/models/remote_control.dart';

sealed class ConnectDeviceState {
  const ConnectDeviceState();

  const factory ConnectDeviceState.idle() = Idle;
  const factory ConnectDeviceState.scanning() = Scanning;
  const factory ConnectDeviceState.deviceSelection(List<RemoteControl> devices) = DeviceSelection;
  const factory ConnectDeviceState.connecting(RemoteControl device) = Connecting;
  const factory ConnectDeviceState.connected(Result<RemoteControl> result) = Connected;
}

class Idle extends ConnectDeviceState {
  const Idle();
}

class Scanning extends ConnectDeviceState {
  const Scanning();
}

class DeviceSelection extends ConnectDeviceState {
  final List<RemoteControl> devices;

  const DeviceSelection(this.devices);
}

class Connecting extends ConnectDeviceState {
  final RemoteControl device;

  const Connecting(this.device);
}

class Connected extends ConnectDeviceState {
  final Result<RemoteControl> result;

  const Connected(this.result);
}
