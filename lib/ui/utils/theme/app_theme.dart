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
    /// Titre
    displayLarge: TextStyle(fontSize: 32, fontFamily: 'Dela Gothic One', color: Colors.grey.shade900, letterSpacing: .64,),
    titleLarge: TextStyle(fontSize: 22, fontFamily: 'Dela Gothic One', color: Colors.grey.shade900, letterSpacing: .44,),
    titleMedium: TextStyle(fontSize: 16, fontFamily: 'Dela Gothic One', color: Colors.grey.shade900, letterSpacing: .32,),
    titleSmall: TextStyle(fontSize: 12, fontFamily: 'Dela Gothic One', color: Colors.grey.shade900, letterSpacing: .24,),

    /// Sous-titre
    labelLarge: TextStyle(fontSize: 18, fontFamily: 'Spline Sans Mono', color: Colors.grey.shade900),

    /// Texte
    bodyLarge: TextStyle(fontSize: 14, fontFamily: 'Spline Sans Mono', color: Colors.grey.shade900),
    bodyMedium: TextStyle(fontSize: 10, fontFamily: 'Spline Sans Mono', color: Colors.grey.shade900),
    bodySmall: TextStyle(fontSize: 8, fontFamily: 'Spline Sans Mono', color: Colors.grey.shade900),

    /// Bouton
    labelMedium: TextStyle(fontSize: 10, fontFamily: 'Dela Gothic One', color: Colors.grey.shade900, letterSpacing: .20,),
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
