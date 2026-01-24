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
    scaffoldBackgroundColor: background,
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: background.withValues(alpha: 0.7),
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white.withValues(alpha: 0.6),
      ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.circular(10),
  ),
    ),
    appBarTheme: AppBarTheme(
     backgroundColor: background,
      centerTitle: true,
      foregroundColor: primary,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primary
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
        type: BottomNavigationBarType.fixed,
       selectedItemColor: white,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      headlineLarge:TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: white,
      ),
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

    )
  );
}