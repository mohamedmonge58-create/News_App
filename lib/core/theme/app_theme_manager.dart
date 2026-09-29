import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppThemeManager {
  static ThemeData getLightTheme() => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.mainText,
    colorScheme: ColorScheme.light(
      primary: AppColors.mainText,
      secondary: AppColors.secondText,
      surface: Colors.white,
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
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondText,
      secondary: AppColors.mainText,
      surface: AppColors.primary,
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