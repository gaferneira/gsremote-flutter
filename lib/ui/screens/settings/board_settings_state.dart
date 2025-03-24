import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/board_settings_state.freezed.dart';

@freezed
abstract class BoardSettingsState with _$BoardSettingsState {
  factory BoardSettingsState({
    required bool isDeviceConnected
  }) = _BoardSettingsState;
  const BoardSettingsState._();

  factory BoardSettingsState.empty() => BoardSettingsState(
    isDeviceConnected : false,
  );
}
