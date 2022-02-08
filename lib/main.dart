import 'package:flutter/material.dart';
import 'package:hotspot/constants/dark_theme.dart';
import 'package:hotspot/constants/light_theme.dart';
import 'package:hotspot/logic/counter_logic.dart';
import 'package:hotspot/logic/make_a_prayer.dart';
import 'package:hotspot/logic/page_selection_logic.dart';
import 'package:hotspot/logic/prayer_request_form_launch.dart';
import 'package:hotspot/logic/thank_you_form_launch.dart';
import 'package:hotspot/logic/theme_logic.dart';
import 'package:hotspot/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => PageSelection()),
        ChangeNotifierProvider(create: (_) => MakeAPrayer()),
        ChangeNotifierProvider(create: (_) => PrayerRequestFormLaunch()),
        ChangeNotifierProvider(create: (_) => ThankYouFormLaunch()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, ThemeProvider themeData, child) {
        return MaterialApp(
          theme: (themeData.theme) ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        );
      },
    );
  }
}
