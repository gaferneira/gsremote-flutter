
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '/ui/components/numeric_text_field.dart';

part 'generated/setting_item.freezed.dart';

@freezed
sealed class SettingItem with _$SettingItem {
  const factory SettingItem.navigationItem({
    required String title,
    String? subtitle,
    required VoidCallback onClick,
  }) = NavigationItem;

  const factory SettingItem.toggleItem({
    required String title,
    String? subtitle,
    required bool isChecked,
    required ValueChanged<bool> onToggle,
  }) = ToggleItem;

  const factory SettingItem.numericItem({
    required String title,
    required int value,
    @Default(null)
    String? metricUnit,
    @Default(null)
    int? min,
    @Default(null)
    int? max,
    required ValueChanged<int> onValueChanged,
  }) = NumericItem;

  const factory SettingItem.sliderItem({
    required String title,
    required int value,
    required int min,
    required int max,
    @Default(false)
    bool dynamicColor,
    required ValueChanged<int> onValueChanged,
  }) = SliderItem;
}

extension SettingItemWidget on SettingItem {

  Widget toWidget(BuildContext context) {
    var setting  = this;
    return switch (setting) {
      NavigationItem() => ListTile(
        title: Text(setting.title),
        subtitle:
        setting.subtitle != null ? Text(setting.subtitle!) : null,
        trailing: Icon(Icons.arrow_forward),
        onTap: setting.onClick,
      ),
      ToggleItem() => SwitchListTile(
        title: Text(setting.title),
        subtitle:
        setting.subtitle != null ? Text(setting.subtitle!) : null,
        value: setting.isChecked,
        onChanged: setting.onToggle,
      ),
      SliderItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(setting.title),
            subtitle: Text("Value: ${setting.value}"),
          ),
          Slider(
            value: setting.value.toDouble(),
            min: setting.min.toDouble(),
            max: setting.max.toDouble(),
            divisions: setting.max - setting.min,
            label: setting.value.toString(),
            activeColor: (setting.dynamicColor) ? _getSliderColor(setting.value, setting.min, setting.max) : null,
            onChanged: (double newValue) {
              setting.onValueChanged(newValue.toInt());
            },
          ),
        ],
      ),
      NumericItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Text(setting.title),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: NumericTextField(
              initialValue: setting.value,
              title: setting.title,
              metricUnit: setting.metricUnit,
              minValue: setting.min,
              maxValue: setting.max,
              onChanged: (value) {
                setting.onValueChanged(value);
              },
            ),
          ),
        ],
      )
    };
  }
}

Color _getSliderColor(int value, int min, int max) {
  double ratio = (value - min) / (max - min);
  return Color.lerp(Colors.yellow, Colors.red, ratio)!;

}


