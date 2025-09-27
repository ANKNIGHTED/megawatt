import 'package:flutter/material.dart';

// This file defines a custom color scheme with purple and orange tones for your mobile app.

class AppColors {
  // Primary colors
  static const Color primaryPurple = Color(0xFF673AB7);
  static const Color primaryOrange = Color(0xFFFF9800);

  // Accent colors
  static const Color accentPurple = Color(0xFF9575CD);
  static const Color accentOrange = Color(0xFFFFB74D);

  // Background colors
  static const Color backgroundLight = Color(0xFFffdcc5);
  static const Color backgroundDark = Color(0xFF210027);

  // Text colors
  static const Color textLight = Color(0xFFE8EAF6);
  static const Color textDark = Color(0xFF212121);
  static const Color textMuted = Color(0xFF616161);

  // A color swatch for light theme
  static const ColorScheme lightScheme = ColorScheme(
    primary: primaryPurple,
    primaryContainer: accentPurple,
    secondary: primaryOrange,
    secondaryContainer: accentOrange,
    surface: backgroundLight,

    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: textDark,

    onError: Colors.white,
    brightness: Brightness.light,
  );

  // A color swatch for dark theme
  static const ColorScheme darkScheme = ColorScheme(
    primary: primaryPurple,
    primaryContainer: accentPurple,
    secondary: primaryOrange,
    secondaryContainer: accentOrange,
    surface: backgroundDark,

    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: textLight,

    onError: Colors.white,
    brightness: Brightness.dark,
  );
}
