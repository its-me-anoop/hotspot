import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: false),
    dividerColor: Colors.grey[100],
    scaffoldBackgroundColor: Colors.grey[900],
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white));
