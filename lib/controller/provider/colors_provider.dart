import 'package:flutter/material.dart';
import 'package:megawatt/utils/colors.dart';

class ColorsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ColorScheme _themeData = AppColors.lightScheme;

  ThemeMode get themeMode => _themeMode;
  ColorScheme get colorScheme => _themeData;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    _themeData =
        (mode == ThemeMode.dark) ? AppColors.darkScheme : AppColors.lightScheme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }
}
