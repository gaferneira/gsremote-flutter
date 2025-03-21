import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/app_route.freezed.dart';

@freezed
sealed class AppRoute with _$AppRoute {
  const factory AppRoute.connectDevice() = ConnectDevice;
  const factory AppRoute.home() = Home;
  //const factory AppRoute.screenWithParam(String param) = Screen;
}
