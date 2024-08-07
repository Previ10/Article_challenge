import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode themeMode) {
    if (_themeMode != themeMode) {
      _themeMode = themeMode;
      notifyListeners();
    }
  }
}
