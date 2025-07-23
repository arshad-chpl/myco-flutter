import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

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

    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundPrimary,
      foregroundColor: AppColors.black,
      elevation: 0,
    ),

    // Color theme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary, //0xFF2F648E
      secondary: AppColors.secondary, //0xFF2FBBA4
      surface: AppColors.backgroundPrimary, //0xFFFAFAFF
      surfaceContainer: AppColors.lightTeal, //0xFFEEF7FD
      surfaceContainerHigh: AppColors.containerHigh,
      surfaceBright: AppColors.white, //0xFFFFFFFF
      error: AppColors.error, //0xFFE53935
      onPrimary: AppColors.white, //0xFFFFFFFF
      onSecondary: AppColors.white, //0xFFFFFFFF
      onSurface: AppColors.textPrimary, //0xFF101828

      onSurfaceVariant: AppColors.textSecondary, //0xFF475467
      onError: AppColors.white, //0xFFFFFFFF
      outline: AppColors.textfieldBorder, //0xFF98A2B3
      tertiary: AppColors.myCoCyan, //0xFF08A4BB
      onSecondaryContainer: AppColors.containerGrey, //0xFFF9FAFB
      outlineVariant: AppColors.textGrey200, // 0xFFEAECF0
      primaryContainer: AppColors.lightPurple, //0xFFF4F3FF
      onTertiary: AppColors.darksecondary, //0xFF2FBBA4
      onTertiaryContainer: AppColors.spanishYellow,
      inversePrimary: AppColors.primaryLight//0xFF2F648E

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
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary, //0xFF2F648E
      secondary: AppColors.secondary, //0xFF2FBBA4

      surface: AppColors.darkbackgroundPrimary, //0xFFFAFAFF
      surfaceContainer: AppColors.lightTeal, //0xFFEEF7FD
      surfaceContainerHigh: AppColors.containerHigh,
      surfaceBright: AppColors.black,
      error: AppColors.error, //0xFFE53935
      onPrimary: AppColors.white, //0xFFFFFFFF
      onSecondary: AppColors.white, //0xFFFFFFFF
      onSurface: AppColors.darktextPrimary, //0xFF101828
      onSurfaceVariant: AppColors.darktextSecondary, //0xFF475467
      onError: AppColors.white, //0xFFFFFFFF
      outline: AppColors.darktextfieldBorder, //0xFF98A2B3
      outlineVariant: AppColors.textGrey200, //0xFFEAECF0
    ),
  );
}
