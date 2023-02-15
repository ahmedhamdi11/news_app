import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(
        color: Colors.deepOrange,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
    ),
    dividerColor: Colors.grey[800],
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black, unselectedItemColor: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.deepOrange,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}
