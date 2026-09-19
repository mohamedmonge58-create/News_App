import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {

  ThemeMode currentThemeMode = ThemeMode.light;
  void changeThemeMode( ThemeMode themeMode) {


    currentThemeMode = themeMode;
    notifyListeners();


  }


}