import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs d'accent
  static const Color tealGreen = Color(0xFF16B576);
  static const Color mustardYellow = Color(0xFFFCB446);
  static const Color pinkRose = Color(0xFFFA78E0);
  static const Color blueViolet = Color(0xFF7C6AF5);
  static const Color skyBlue = Color(0xFF69B6FF);
}

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: AppTheme.tealGreen,
    onPrimary: Colors.white,
    background: Colors.grey.shade50,
    onBackground: Colors.grey.shade900,
    surfaceVariant: Colors.grey.shade400,
  ),
    textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade900),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey.shade900),
    titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade900),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.grey.shade900),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade900),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: AppTheme.skyBlue,
    onPrimary: Colors.grey.shade900,
    background: Colors.grey.shade900,
    onBackground: Colors.grey.shade100,
    surfaceVariant: Colors.grey.shade700,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey.shade100),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey.shade100),
    titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade100),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.grey.shade100),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade100),
  ),
);
