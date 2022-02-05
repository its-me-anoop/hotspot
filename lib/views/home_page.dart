import 'package:flutter/material.dart';
import 'package:hotspot/logic/page_selection_logic.dart';
import 'package:hotspot/views/bottom_nav.dart';
import 'package:hotspot/views/prayer_request_view.dart';
import 'package:hotspot/views/saint_view.dart';
import 'package:hotspot/views/settings_page.dart';
import 'package:hotspot/views/thanks_giving_view.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotspot"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()));
                },
                child: const Icon(Icons.settings_outlined)),
          )
        ],
      ),
      body: const HomePageScreens(),
      bottomNavigationBar: const BottomNav(),
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
          case 1:
            return const SaintView();
          case 2:
            return const ThanksGivingView();
          default:
            return const PrayerRequestView();
        }
      },
    );
  }
}
