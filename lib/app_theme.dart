import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const background = Color(0xFF202020);
  static const white = Colors.white;
  static const gray = Color(0xFF707070);

  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
        type: BottomNavigationBarType.fixed,
       selectedItemColor: white,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white
      ),
        titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: white
        ),
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: white
        ),
        headlineLarge
            : TextStyle(
              fontWeight: FontWeight.w700,
              color: primary,
              fontSize: 24
          ),
          headlineMedium: TextStyle(
              fontWeight: FontWeight.w700,
              color: primary,
              fontSize: 20
          )
      ),
  );
}