import 'package:flutter/material.dart';

class PrayerRequestFormLaunch with ChangeNotifier {
  bool isOpen = false;

  bool get prayerRequestFormStatus => isOpen;

  void openPrayerRequest() {
    isOpen = true;
    notifyListeners();
  }

  void closePrayerRequest() {
    isOpen = false;
    notifyListeners();
  }
}
