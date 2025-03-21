// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../setting_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingItem {

 String get title;
/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingItemCopyWith<SettingItem> get copyWith => _$SettingItemCopyWithImpl<SettingItem>(this as SettingItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingItem&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'SettingItem(title: $title)';
}


}

/// @nodoc
abstract mixin class $SettingItemCopyWith<$Res>  {
  factory $SettingItemCopyWith(SettingItem value, $Res Function(SettingItem) _then) = _$SettingItemCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$SettingItemCopyWithImpl<$Res>
    implements $SettingItemCopyWith<$Res> {
  _$SettingItemCopyWithImpl(this._self, this._then);

  final SettingItem _self;
  final $Res Function(SettingItem) _then;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class NavigationItem implements SettingItem {
  const NavigationItem({required this.title, this.subtitle, required this.onClick});
  

@override final  String title;
 final  String? subtitle;
 final  VoidCallback onClick;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationItemCopyWith<NavigationItem> get copyWith => _$NavigationItemCopyWithImpl<NavigationItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationItem&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.onClick, onClick) || other.onClick == onClick));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,onClick);

@override
String toString() {
  return 'SettingItem.navigationItem(title: $title, subtitle: $subtitle, onClick: $onClick)';
}


}

/// @nodoc
abstract mixin class $NavigationItemCopyWith<$Res> implements $SettingItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(NavigationItem value, $Res Function(NavigationItem) _then) = _$NavigationItemCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, VoidCallback onClick
});




}
/// @nodoc
class _$NavigationItemCopyWithImpl<$Res>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._self, this._then);

  final NavigationItem _self;
  final $Res Function(NavigationItem) _then;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? onClick = null,}) {
  return _then(NavigationItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,onClick: null == onClick ? _self.onClick : onClick // ignore: cast_nullable_to_non_nullable
as VoidCallback,
  ));
}


}

/// @nodoc


class ToggleItem implements SettingItem {
  const ToggleItem({required this.title, this.subtitle, required this.isChecked, required this.onToggle});
  

@override final  String title;
 final  String? subtitle;
 final  bool isChecked;
 final  ValueChanged<bool> onToggle;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleItemCopyWith<ToggleItem> get copyWith => _$ToggleItemCopyWithImpl<ToggleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleItem&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&(identical(other.onToggle, onToggle) || other.onToggle == onToggle));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,isChecked,onToggle);

@override
String toString() {
  return 'SettingItem.toggleItem(title: $title, subtitle: $subtitle, isChecked: $isChecked, onToggle: $onToggle)';
}


}

/// @nodoc
abstract mixin class $ToggleItemCopyWith<$Res> implements $SettingItemCopyWith<$Res> {
  factory $ToggleItemCopyWith(ToggleItem value, $Res Function(ToggleItem) _then) = _$ToggleItemCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, bool isChecked, ValueChanged<bool> onToggle
});




}
/// @nodoc
class _$ToggleItemCopyWithImpl<$Res>
    implements $ToggleItemCopyWith<$Res> {
  _$ToggleItemCopyWithImpl(this._self, this._then);

  final ToggleItem _self;
  final $Res Function(ToggleItem) _then;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? isChecked = null,Object? onToggle = null,}) {
  return _then(ToggleItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,onToggle: null == onToggle ? _self.onToggle : onToggle // ignore: cast_nullable_to_non_nullable
as ValueChanged<bool>,
  ));
}


}

/// @nodoc


class NumericItem implements SettingItem {
  const NumericItem({required this.title, required this.value, this.metricUnit = null, this.min = null, this.max = null, required this.onValueChanged});
  

@override final  String title;
 final  int value;
@JsonKey() final  String? metricUnit;
@JsonKey() final  int? min;
@JsonKey() final  int? max;
 final  ValueChanged<int> onValueChanged;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumericItemCopyWith<NumericItem> get copyWith => _$NumericItemCopyWithImpl<NumericItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumericItem&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.metricUnit, metricUnit) || other.metricUnit == metricUnit)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.onValueChanged, onValueChanged) || other.onValueChanged == onValueChanged));
}


@override
int get hashCode => Object.hash(runtimeType,title,value,metricUnit,min,max,onValueChanged);

@override
String toString() {
  return 'SettingItem.numericItem(title: $title, value: $value, metricUnit: $metricUnit, min: $min, max: $max, onValueChanged: $onValueChanged)';
}


}

/// @nodoc
abstract mixin class $NumericItemCopyWith<$Res> implements $SettingItemCopyWith<$Res> {
  factory $NumericItemCopyWith(NumericItem value, $Res Function(NumericItem) _then) = _$NumericItemCopyWithImpl;
@override @useResult
$Res call({
 String title, int value, String? metricUnit, int? min, int? max, ValueChanged<int> onValueChanged
});




}
/// @nodoc
class _$NumericItemCopyWithImpl<$Res>
    implements $NumericItemCopyWith<$Res> {
  _$NumericItemCopyWithImpl(this._self, this._then);

  final NumericItem _self;
  final $Res Function(NumericItem) _then;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? value = null,Object? metricUnit = freezed,Object? min = freezed,Object? max = freezed,Object? onValueChanged = null,}) {
  return _then(NumericItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,metricUnit: freezed == metricUnit ? _self.metricUnit : metricUnit // ignore: cast_nullable_to_non_nullable
as String?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,onValueChanged: null == onValueChanged ? _self.onValueChanged : onValueChanged // ignore: cast_nullable_to_non_nullable
as ValueChanged<int>,
  ));
}


}

/// @nodoc


class SliderItem implements SettingItem {
  const SliderItem({required this.title, required this.value, required this.min, required this.max, this.dynamicColor = false, required this.onValueChanged});
  

@override final  String title;
 final  int value;
 final  int min;
 final  int max;
@JsonKey() final  bool dynamicColor;
 final  ValueChanged<int> onValueChanged;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderItemCopyWith<SliderItem> get copyWith => _$SliderItemCopyWithImpl<SliderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderItem&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.dynamicColor, dynamicColor) || other.dynamicColor == dynamicColor)&&(identical(other.onValueChanged, onValueChanged) || other.onValueChanged == onValueChanged));
}


@override
int get hashCode => Object.hash(runtimeType,title,value,min,max,dynamicColor,onValueChanged);

@override
String toString() {
  return 'SettingItem.sliderItem(title: $title, value: $value, min: $min, max: $max, dynamicColor: $dynamicColor, onValueChanged: $onValueChanged)';
}


}

/// @nodoc
abstract mixin class $SliderItemCopyWith<$Res> implements $SettingItemCopyWith<$Res> {
  factory $SliderItemCopyWith(SliderItem value, $Res Function(SliderItem) _then) = _$SliderItemCopyWithImpl;
@override @useResult
$Res call({
 String title, int value, int min, int max, bool dynamicColor, ValueChanged<int> onValueChanged
});




}
/// @nodoc
class _$SliderItemCopyWithImpl<$Res>
    implements $SliderItemCopyWith<$Res> {
  _$SliderItemCopyWithImpl(this._self, this._then);

  final SliderItem _self;
  final $Res Function(SliderItem) _then;

/// Create a copy of SettingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? value = null,Object? min = null,Object? max = null,Object? dynamicColor = null,Object? onValueChanged = null,}) {
  return _then(SliderItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,dynamicColor: null == dynamicColor ? _self.dynamicColor : dynamicColor // ignore: cast_nullable_to_non_nullable
as bool,onValueChanged: null == onValueChanged ? _self.onValueChanged : onValueChanged // ignore: cast_nullable_to_non_nullable
as ValueChanged<int>,
  ));
}


}

// dart format on
