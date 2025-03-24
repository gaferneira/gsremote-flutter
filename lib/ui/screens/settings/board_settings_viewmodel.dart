import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/repository/bluetooth_repository.dart';
import '../../../dependencies.dart';
import 'board_settings_state.dart';

final boardSettingsViewModelProvider = StateNotifierProvider<BoardSettingsViewModel, BoardSettingsState>((ref) {
  final bluetoothRepository = ref.read(bluetoothRepositoryProvider);
  return BoardSettingsViewModel(bluetoothRepository);
});

class BoardSettingsViewModel extends StateNotifier<BoardSettingsState>{
  final BluetoothRepository _repository;

  static final _initial = BoardSettingsState.empty();

  BoardSettingsViewModel(this._repository) : super(_initial);

  Future<bool> applyChanges() async {
    return _repository.sendCommand(0x500);
  }
}
