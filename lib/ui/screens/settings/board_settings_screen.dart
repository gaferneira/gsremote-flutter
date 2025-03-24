import '/ui/screens/settings/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board_settings_viewmodel.dart';

class BoardSettingsScreen extends ConsumerStatefulWidget {
  const BoardSettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BoardSettingsScreenState();
  }
}

class _BoardSettingsScreenState extends ConsumerState<BoardSettingsScreen> {

  bool invertThrottle = false;
  int wheelPulleySize = 16;
  int motorPulleySize = 14;
  int wheelSize = 90;
  int motorPolePairs = 7;
  int power = 80;
  int acceleration = 80;
  int braking = 50;

  @override
  Widget build(BuildContext context) {

    final viewModel = ref.read(boardSettingsViewModelProvider.notifier);

    var settings = [
      SettingItem.toggleItem(
        title: "Invert Throttle",
        isChecked: invertThrottle,
        onToggle: (newValue) {
          setState(() {
            invertThrottle = newValue;
          });
        },
      ),
      SettingItem.numericItem(
        title: "Wheel Pulley Size",
        value: wheelPulleySize,
        min: 12,
        max: 40,
        metricUnit: "mm",
        onValueChanged: (newValue) {
          setState(() {
            wheelPulleySize = newValue;
          });
        },
      ),
      SettingItem.numericItem(
        title: "Motor Pulley Size",
        value: motorPulleySize,
        min: 10,
        max: 25,
        metricUnit: "mm",
        onValueChanged: (newValue) {
          setState(() {
            motorPulleySize = newValue;
          });
        },
      ),
      SettingItem.numericItem(
        title: "Wheel Size",
        value: wheelSize,
        min: 70,
        max: 120,
        metricUnit: "mm",
        onValueChanged: (newValue) {
          setState(() {
            wheelSize = newValue;
          });
        },
      ),
      SettingItem.numericItem(
        title: "Motor Pole Pairs",
        value: motorPolePairs,
        min: 4,
        max: 14,
        metricUnit: "pairs",
        onValueChanged: (newValue) {
          setState(() {
            motorPolePairs = newValue;
          });
        },
      ),
      SettingItem.sliderItem(
        title: "Power",
        value: power,
        min: 30,
        max: 100,
        dynamicColor: true,
        onValueChanged: (newValue) {
          setState(() {
            power = newValue;
          });
        },
      ),
      SettingItem.sliderItem(
        title: "Acceleration",
        value: acceleration,
        dynamicColor: true,
        min: 30,
        max: 100,
        onValueChanged: (newValue) {
          setState(() {
            acceleration = newValue;
          });
        },
      ),
      SettingItem.sliderItem(
        title: "Braking",
        value: braking,
        dynamicColor: true,
        min: 30,
        max: 100,
        onValueChanged: (newValue) {
          setState(() {
            braking = newValue;
          });
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Customise Board")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context, index) {
                return settings[index].toWidget(context);
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle apply changes action
                    viewModel.applyChanges();
                    //ScaffoldMessenger.of(context).showSnackBar(
                    //  SnackBar(content: Text("Changes Applied")),
                    //);
                  },
                  child: Text("Apply Changes"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
