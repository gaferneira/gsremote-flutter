// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../remote_control.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteControl {

 String get id; String get name;
/// Create a copy of RemoteControl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteControlCopyWith<RemoteControl> get copyWith => _$RemoteControlCopyWithImpl<RemoteControl>(this as RemoteControl, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteControl&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RemoteControl(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $RemoteControlCopyWith<$Res>  {
  factory $RemoteControlCopyWith(RemoteControl value, $Res Function(RemoteControl) _then) = _$RemoteControlCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$RemoteControlCopyWithImpl<$Res>
    implements $RemoteControlCopyWith<$Res> {
  _$RemoteControlCopyWithImpl(this._self, this._then);

  final RemoteControl _self;
  final $Res Function(RemoteControl) _then;

/// Create a copy of RemoteControl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _RemoteControl implements RemoteControl {
   _RemoteControl({required this.id, required this.name});
  

@override final  String id;
@override final  String name;

/// Create a copy of RemoteControl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteControlCopyWith<_RemoteControl> get copyWith => __$RemoteControlCopyWithImpl<_RemoteControl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteControl&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'RemoteControl(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RemoteControlCopyWith<$Res> implements $RemoteControlCopyWith<$Res> {
  factory _$RemoteControlCopyWith(_RemoteControl value, $Res Function(_RemoteControl) _then) = __$RemoteControlCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$RemoteControlCopyWithImpl<$Res>
    implements _$RemoteControlCopyWith<$Res> {
  __$RemoteControlCopyWithImpl(this._self, this._then);

  final _RemoteControl _self;
  final $Res Function(_RemoteControl) _then;

/// Create a copy of RemoteControl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_RemoteControl(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
