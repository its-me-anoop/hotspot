import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.blueGrey[900],
  canvasColor: Colors.black,
  cardColor: Colors.black,
  primarySwatch: Colors.teal,
  cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(color: Colors.white))),
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
);
