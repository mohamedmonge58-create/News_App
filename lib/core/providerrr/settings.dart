import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  Locale currentLocale = const Locale('en');

  static const String _localeKey = 'selected_language';

  Settings() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLang = prefs.getString(_localeKey);
      if (savedLang == 'ar') {
        currentLocale = const Locale('ar');
      } else {
        currentLocale = const Locale('en');
      }
      notifyListeners();
    } catch (_) {
      // Fallback to default en if SharedPreferences fails
    }
  }

  Future<void> changeLocale(Locale locale) async {
    if (locale.languageCode != 'en' && locale.languageCode != 'ar') return;
    currentLocale = locale;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
    } catch (_) {}
  }

  void changeThemeMode(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    notifyListeners();
  }
}
