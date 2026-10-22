
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static const String _localeKey = 'selected_language';

  Locale currentLocale = const Locale('en');
  ThemeMode currentThemeMode = ThemeMode.light;

  Settings() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLang = prefs.getString(_localeKey);

      currentLocale = savedLang == 'ar'
          ? const Locale('ar')
          : const Locale('en');

      notifyListeners();
    } catch (_) {
      // Keep English as the default language.
    }
  }

  Future<void> changeLocale(Locale locale) async {
    if (locale.languageCode != 'en' &&
        locale.languageCode != 'ar') {
      return;
    }

    currentLocale = Locale(locale.languageCode);
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
    } catch (_) {
      // The language changes for this session even if saving fails.
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    notifyListeners();
  }
}
