import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.teal,
  backgroundColor: Colors.amber,
  canvasColor: Colors.teal,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      foregroundColor: Colors.white,
      centerTitle: false),
  dividerColor: Colors.grey,
);
