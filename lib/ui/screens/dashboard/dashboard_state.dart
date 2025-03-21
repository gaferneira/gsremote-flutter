import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  factory DashboardState({
    required bool isDeviceConnected
  }) = _DashboardState;
  const DashboardState._();

  factory DashboardState.empty() => DashboardState(
    isDeviceConnected : false,
  );
}
