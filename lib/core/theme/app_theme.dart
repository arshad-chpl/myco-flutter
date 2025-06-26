import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/theme/text_theme.dart';
import 'package:myco_flutter/core/utils/util.dart';

class AppTheme {
  static ColorScheme getColor(BuildContext context) =>
      Theme.of(context).colorScheme;
  static TextTheme getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme;

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    primaryColor: AppColors.primary,
    splashColor: AppColors.splashBg,
    dividerColor: AppColors.textfieldBorder,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundPrimary,
      foregroundColor: AppColors.black,
      elevation: 0,
    ),

    // Color theme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary, //0xFF2F648E
      secondary: AppColors.secondary, //0xFF2FBBA4

      surface: AppColors.backgroundPrimary, //0xFFFAFAFF
      error: AppColors.error, //0xFFE53935
      onPrimary: AppColors.white, //0xFFFFFFFF
      onSecondary: AppColors.white, //0xFFFFFFFF
      onSurface: AppColors.textPrimary, //0xFF101828
      onSurfaceVariant: AppColors.textSecondary, //0xFF475467
      onError: AppColors.white, //0xFFFFFFFF
      outline: AppColors.textfieldBorder, //0xFF98A2B3
      outlineVariant: AppColors.textGrey200, //0xFFEAECF0
    ),
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
  );
}
