import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/remote_control.freezed.dart';

@freezed
abstract class RemoteControl with _$RemoteControl {
  factory RemoteControl({
    required String id,
    required String name,
  }) = _RemoteControl;
}
