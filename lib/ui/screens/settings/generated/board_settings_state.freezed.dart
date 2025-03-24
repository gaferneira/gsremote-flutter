// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../board_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoardSettingsState {

 bool get isDeviceConnected;
/// Create a copy of BoardSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardSettingsStateCopyWith<BoardSettingsState> get copyWith => _$BoardSettingsStateCopyWithImpl<BoardSettingsState>(this as BoardSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardSettingsState&&(identical(other.isDeviceConnected, isDeviceConnected) || other.isDeviceConnected == isDeviceConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isDeviceConnected);

@override
String toString() {
  return 'BoardSettingsState(isDeviceConnected: $isDeviceConnected)';
}


}

/// @nodoc
abstract mixin class $BoardSettingsStateCopyWith<$Res>  {
  factory $BoardSettingsStateCopyWith(BoardSettingsState value, $Res Function(BoardSettingsState) _then) = _$BoardSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool isDeviceConnected
});




}
/// @nodoc
class _$BoardSettingsStateCopyWithImpl<$Res>
    implements $BoardSettingsStateCopyWith<$Res> {
  _$BoardSettingsStateCopyWithImpl(this._self, this._then);

  final BoardSettingsState _self;
  final $Res Function(BoardSettingsState) _then;

/// Create a copy of BoardSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDeviceConnected = null,}) {
  return _then(_self.copyWith(
isDeviceConnected: null == isDeviceConnected ? _self.isDeviceConnected : isDeviceConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _BoardSettingsState extends BoardSettingsState {
   _BoardSettingsState({required this.isDeviceConnected}): super._();
  

@override final  bool isDeviceConnected;

/// Create a copy of BoardSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardSettingsStateCopyWith<_BoardSettingsState> get copyWith => __$BoardSettingsStateCopyWithImpl<_BoardSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardSettingsState&&(identical(other.isDeviceConnected, isDeviceConnected) || other.isDeviceConnected == isDeviceConnected));
}


@override
int get hashCode => Object.hash(runtimeType,isDeviceConnected);

@override
String toString() {
  return 'BoardSettingsState(isDeviceConnected: $isDeviceConnected)';
}


}

/// @nodoc
abstract mixin class _$BoardSettingsStateCopyWith<$Res> implements $BoardSettingsStateCopyWith<$Res> {
  factory _$BoardSettingsStateCopyWith(_BoardSettingsState value, $Res Function(_BoardSettingsState) _then) = __$BoardSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isDeviceConnected
});




}
/// @nodoc
class __$BoardSettingsStateCopyWithImpl<$Res>
    implements _$BoardSettingsStateCopyWith<$Res> {
  __$BoardSettingsStateCopyWithImpl(this._self, this._then);

  final _BoardSettingsState _self;
  final $Res Function(_BoardSettingsState) _then;

/// Create a copy of BoardSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDeviceConnected = null,}) {
  return _then(_BoardSettingsState(
isDeviceConnected: null == isDeviceConnected ? _self.isDeviceConnected : isDeviceConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
