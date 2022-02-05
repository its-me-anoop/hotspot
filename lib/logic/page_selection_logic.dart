import 'package:flutter/material.dart';

class PageSelection with ChangeNotifier {
  int pageIndex = 0;

  int get currentPage => pageIndex;

  void changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
