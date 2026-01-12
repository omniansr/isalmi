import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const background = Color(0xFF202020);
  static const white = Colors.white;
  static const gray = Color(0xFF707070);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: background,
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontWeight: FontWeight.w700,
        color: primary,
        fontSize: 20
      ),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w700,
            color: primary,
            fontSize: 16
    )
    ),
  );
}