import 'package:flutter/material.dart';
import 'package:hotspot/logic/theme_logic.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ThemeSettings(),
          Divider(),
          DeveloperInfo(),
        ],
      ),
    );
  }
}

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.standard,
      title: Text(
        "Developer",
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutterly Ltd",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "anoop@flutterly.co.uk",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Theme Settings",
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text("Dark Theme"),
            trailing: Consumer<ThemeProvider>(
                builder: (context, ThemeProvider myTheme, child) {
              return Switch(
                  value: myTheme.theme,
                  onChanged: (value) {
                    context.read<ThemeProvider>().changeTheme();
                  });
            }),
          ),
        ],
      ),
    );
  }
}
