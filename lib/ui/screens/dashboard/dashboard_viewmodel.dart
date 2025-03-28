import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/repository/bluetooth_repository.dart';
import '../../../dependencies.dart';
import 'dashboard_state.dart';

final dashboardViewModelProvider = StateNotifierProvider<DashboardViewModel, DashboardState>((ref) {
  final bluetoothRepository = ref.read(bluetoothRepositoryProvider);
  return DashboardViewModel(bluetoothRepository);
});

class DashboardViewModel extends StateNotifier<DashboardState>{
  final BluetoothRepository _repository;

  static final _initial = DashboardState.empty();

  StreamSubscription<bool>? deviceStateSubscription;

  DashboardViewModel(this._repository) : super(_initial) {
    init();
  }

  Future<void> init() async {
    connect();
  }

  void connect() async {
    deviceStateSubscription?.cancel();
    var deviceStateStream = await _repository.getDeviceStateConnection(true);
    var initialValue = await deviceStateStream.first;
    state = state.copyWith(isDeviceConnected: initialValue);
    deviceStateSubscription = deviceStateStream.listen((event) {
      state = state.copyWith(isDeviceConnected: event);
    });
  }

  void disconnect() async {
    state = state.copyWith(isDeviceConnected: false);
    await _repository.disconnectDevice();
  }

  Future<void> forgetDevice() async {
    deviceStateSubscription?.cancel();
    deviceStateSubscription = null;
    state = state.copyWith(isDeviceConnected: false);
    await _repository.forgetDevice();
  }

}
