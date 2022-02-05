import 'package:flutter/material.dart';
import 'package:hotspot/constants/current_user.dart';
import 'package:hotspot/sample/prayer_list.dart';

class MakeAPrayer with ChangeNotifier {
  bool prayed = false;

  bool get prayerMade => prayed;

  void makeAPrayer(int index) {
    prayed = true;
    prayers[index].prayed = true;
    prayers[index].whoPrayed.add(currentUser.uid);
    notifyListeners();
  }
}
