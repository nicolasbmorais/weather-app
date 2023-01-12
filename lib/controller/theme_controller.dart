import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isDarkTheme = false;
  static ThemeController instance = ThemeController();

  ThemeController();

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
