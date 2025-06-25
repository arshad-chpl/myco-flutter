import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/theme/text_theme.dart';

class AppTheme {
 static ColorScheme getColor(BuildContext context)=> Theme.of(context).colorScheme;
static TextTheme getTextStyle(BuildContext context) => Theme.of(context).textTheme;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    primaryColor: AppColors.primary,
    splashColor: AppColors.splashBg,
    dividerColor: AppColors.textfieldBorder,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundPrimary,
      elevation: 0,
      titleTextStyle: AppTextTheme.getTextTheme(
        context,
      ).titleLarge?.copyWith(color: AppColors.textPrimary),
    ),

    // Color theme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.backgroundPrimary,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      onError: AppColors.white,
    ),

    // text theme
    textTheme: AppTextTheme.getTextTheme(context),
  );

  // Optional: add this now for future dark mode use
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: AppColors.white,
          elevation: 0,
          titleTextStyle: AppTextTheme.getTextTheme(context).titleLarge?.copyWith(
            color: AppColors.white,
          ),
        ),
        colorScheme: ColorScheme.dark(
          primary: AppColors.black,
          secondary: AppColors.secondary,
          surface: Colors.grey[850]!,
          error: AppColors.error,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          onSurface: Colors.white70,
          onError: Colors.white,
        ),
        textTheme: AppTextTheme.getTextTheme(context).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      );
}
