// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppRoute {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRoute);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRoute()';
}


}

/// @nodoc
class $AppRouteCopyWith<$Res>  {
$AppRouteCopyWith(AppRoute _, $Res Function(AppRoute) __);
}


/// @nodoc


class ConnectDevice implements AppRoute {
  const ConnectDevice();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectDevice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRoute.connectDevice()';
}


}




/// @nodoc


class Home implements AppRoute {
  const Home(this.id);
  

 final  String id;

/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeCopyWith<Home> get copyWith => _$HomeCopyWithImpl<Home>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Home&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AppRoute.home(id: $id)';
}


}

/// @nodoc
abstract mixin class $HomeCopyWith<$Res> implements $AppRouteCopyWith<$Res> {
  factory $HomeCopyWith(Home value, $Res Function(Home) _then) = _$HomeCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$HomeCopyWithImpl<$Res>
    implements $HomeCopyWith<$Res> {
  _$HomeCopyWithImpl(this._self, this._then);

  final Home _self;
  final $Res Function(Home) _then;

/// Create a copy of AppRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(Home(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
