import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.deepOrange,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white, elevation: 0.0),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}
