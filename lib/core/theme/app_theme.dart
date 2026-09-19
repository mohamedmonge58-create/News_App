import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.mainText,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.mainText,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.secondText,
      scaffoldBackgroundColor: Colors.black,

      useMaterial3: true,
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.secondText,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.secondText,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.secondText,
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.secondText,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.secondText,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
