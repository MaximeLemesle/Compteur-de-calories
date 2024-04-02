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
  colorScheme: const ColorScheme.light(
      primary: AppTheme.tealGreen,
      onPrimary: Colors.white,
      secondary: Color(0xFF9DA0AF),
      background: Colors.white,
      onBackground: Color(0xFF0D0D0D),
      surfaceVariant: Color(0xFFF6F7FB),
      outline: Color(0xFFD5D6DD),
      outlineVariant: Color(0xFF9C9FAE)),
  textTheme: TextTheme(
    /// Titre
    displayLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade900,
      letterSpacing: .64,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade900,
      letterSpacing: .44,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade900,
      letterSpacing: .32,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade900,
      letterSpacing: .24,
    ),

    /// Sous-titre
    headlineLarge: TextStyle(
      fontSize: 18,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
    ),

    /// Texte
    bodyLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
    ),
    bodyMedium: TextStyle(
      fontSize: 10,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
    ),
    bodySmall: TextStyle(
      fontSize: 8,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
    ),

    /// Texte gras
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 10,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade900,
      fontWeight: FontWeight.bold,
    ),

    /// Bouton
    labelSmall: const TextStyle(
      fontSize: 10,
      fontFamily: 'Dela Gothic One',
      color: Colors.white,
      letterSpacing: .20,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppTheme.tealGreen,
    onPrimary: Color(0xFF0D0D0D),
    secondary: Color(0xFFF6F7FB),
    background: Color(0xFF0D0D0D),
    onBackground: Colors.white,
    surfaceVariant: Color(0xFF242628),
    outline: Color(0xFF9C9FAE),
    outlineVariant: Color(0xFFD5D6DD),
  ),
  textTheme: TextTheme(
    /// Titre
    displayLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade100,
      letterSpacing: .64,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade100,
      letterSpacing: .44,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade100,
      letterSpacing: .32,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade100,
      letterSpacing: .24,
    ),

    /// Sous-titre
    headlineLarge: TextStyle(
      fontSize: 18,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
    ),

    /// Texte
    bodyLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
    ),
    bodyMedium: TextStyle(
      fontSize: 10,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
    ),
    bodySmall: TextStyle(
      fontSize: 8,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
    ),

    /// Texte gras
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      fontSize: 10,
      fontFamily: 'Spline Sans Mono',
      color: Colors.grey.shade100,
      fontWeight: FontWeight.bold,
    ),

    /// Bouton
    labelSmall: TextStyle(
      fontSize: 10,
      fontFamily: 'Dela Gothic One',
      color: Colors.grey.shade100,
      letterSpacing: .20,
    ),
  ),
);
