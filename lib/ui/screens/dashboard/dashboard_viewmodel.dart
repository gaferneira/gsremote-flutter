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

  DashboardViewModel(this._repository) : super(_initial) {
    init();
  }

  Future<void> init() async {
    var stream = await _repository.getDeviceStateConnection(true);
    var initialValue = await stream.first;
    state = state.copyWith(isDeviceConnected: initialValue);
    stream.listen((event) {
      state = state.copyWith(isDeviceConnected: event);
    });
  }

}
