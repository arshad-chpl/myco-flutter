import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Inter',
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      bodyMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'Inter',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white70,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
