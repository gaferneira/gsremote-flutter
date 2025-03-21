import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/models/app_route.dart';
import '/ui/app_router.dart';
import '/ui/screens/settings/setting_item.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var settings = [
      SettingItem.navigationItem(
        title: "Customise board",
        subtitle: "Change parameters",
        onClick: () {
          context.push(AppRoute.boardSettings());
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView.builder(
        itemCount: settings.length,
        itemBuilder: (context, index) {
          return settings[index].toWidget(context);
        },
      ),
    );
  }
}
