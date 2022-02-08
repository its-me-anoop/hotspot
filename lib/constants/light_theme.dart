import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.orange,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        centerTitle: false),
    dividerColor: Colors.grey,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        backgroundColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white));
