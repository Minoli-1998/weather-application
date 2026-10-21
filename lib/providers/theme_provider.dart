import 'package:flutter/material.dart';
import 'package:weather_application/services/theme_persistance.dart';
import 'package:weather_application/utils/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    _loadTheme();
  }

  ThemeData _themeData = ThemesModeData().lightMode;

  final ThemePersistance _themePersistance = ThemePersistance();

  // getter
  ThemeData get getThemeData => _themeData;

  // setter
  set setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  // load theme
  Future<void> _loadTheme() async {
    bool isDark = await _themePersistance.loadTheme();
    setThemeData = isDark
        ? ThemesModeData().darkMode
        : ThemesModeData().lightMode;
  }

  // toggle theme
  Future<void> toggleTheme(bool isDark) async {
    setThemeData = isDark
        ? ThemesModeData().darkMode
        : ThemesModeData().lightMode;

    // store in shared preferences
    await _themePersistance.storeTheme(isDark);

    notifyListeners();
  }
}
