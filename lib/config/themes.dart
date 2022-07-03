import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(centerTitle: true),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 16,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      elevation: 16,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 16,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      elevation: 16,
    ),
  );
}
