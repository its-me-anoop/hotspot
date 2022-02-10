import 'package:flutter/material.dart';
import 'package:hotspot/logic/page_selection_logic.dart';
import 'package:hotspot/views/prayer_request_view.dart';
import 'package:hotspot/views/profile_view.dart';
import 'package:hotspot/views/saint_view.dart';
import 'package:hotspot/views/settings_page.dart';
import 'package:hotspot/views/thanks_giving_view.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageScreens(),
    );
  }
}

class HomePageScreens extends StatelessWidget {
  const HomePageScreens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageSelection>(
      builder: (context, PageSelection currentPage, child) {
        switch (currentPage.currentPage) {
          // case 1:
          //   return const SaintView();
          case 1:
            return const ThanksGivingView();
          case 2:
            return const ProfileView();
          case 3:
            return const SettingsPage();
          default:
            return const PrayerRequestView();
        }
      },
    );
  }
}
