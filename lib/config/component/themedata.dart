import 'package:flutter/material.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFd4f0fc),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: Color(0xFF07313E),
              fontSize: 28,
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Color(0xFF07313E),
              fontSize: 14),
      ));
}
