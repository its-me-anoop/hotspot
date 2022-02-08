import 'package:flutter/material.dart';

class ThankYouFormLaunch with ChangeNotifier {
  bool isOpen = false;

  bool get thankYouFormStatus => isOpen;

  void openThankYouForm() {
    isOpen = true;
    notifyListeners();
  }

  void closeThankYouForm() {
    isOpen = false;
    notifyListeners();
  }
}
