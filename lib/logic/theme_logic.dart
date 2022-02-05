import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool darkTheme = false;

  bool get theme => darkTheme;

  void changeTheme() {
    darkTheme = (darkTheme) ? false : true;
    notifyListeners();
  }
}
