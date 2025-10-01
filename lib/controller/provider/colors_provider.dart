import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';

class ColorsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeData == AppColors.darkScheme;

  ColorScheme _themeData = AppColors.lightScheme;
  ColorScheme get colorScheme => _themeData;

  set themeMode(ThemeMode mode) {
    _themeMode != mode;

    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppColors.lightScheme) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }
}
