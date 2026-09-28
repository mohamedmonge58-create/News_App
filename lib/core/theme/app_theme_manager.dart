import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.mainText,
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.mainText,
      secondary: AppColors.secondText,
      surface: Colors.white,
      onSurface: Colors.black,
      onSurfaceVariant: Colors.black87,
      outline: Colors.black12,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.mainText,
      elevation: 0,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.mainText,
      displayColor: AppColors.mainText,
    ),
  );

  static ThemeData getDarkTheme() => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.primary,
    primaryColor: AppColors.secondText,
    cardColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondText,
      secondary: AppColors.mainText,
      surface: Colors.black,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.white70,
      outline: Colors.white24,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
