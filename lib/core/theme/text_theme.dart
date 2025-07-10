import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';

class AppTextTheme {
  static TextTheme getTextTheme(BuildContext context) => TextTheme(
    displayLarge: _gilroyStyle(
      FontWeight.w700,
      32 * Responsive.getResponsiveText(context),
    ),
    displayMedium: _gilroyStyle(
      FontWeight.w600,
      28 * Responsive.getResponsiveText(context),
    ),
    displaySmall: _gilroyStyle(
      FontWeight.w500,
      24 * Responsive.getResponsiveText(context),
    ),

    headlineLarge: _gilroyStyle(
      FontWeight.w700,
      22 * Responsive.getResponsiveText(context),
    ),
    headlineMedium: _gilroyStyle(
      FontWeight.w600,
      20 * Responsive.getResponsiveText(context),
    ),
    headlineSmall: _gilroyStyle(
      FontWeight.w500,
      18 * Responsive.getResponsiveText(context),
    ),

    titleLarge: _gilroyStyle(
      FontWeight.w700,
      18 * Responsive.getResponsiveText(context),
    ),
    titleMedium: _gilroyStyle(
      FontWeight.w600,
      16 * Responsive.getResponsiveText(context),
    ),
    titleSmall: _gilroyStyle(
      FontWeight.w500,
      14 * Responsive.getResponsiveText(context),
    ),

    bodyLarge: _gilroyStyle(
      FontWeight.w700,
      16 * Responsive.getResponsiveText(context),
    ),
    bodyMedium: _gilroyStyle(
      FontWeight.w600,
      14 * Responsive.getResponsiveText(context),
    ),
    bodySmall: _gilroyStyle(
      FontWeight.w500,
      12 * Responsive.getResponsiveText(context),
    ),

    labelLarge: _gilroyStyle(
      FontWeight.w700,
      14 * Responsive.getResponsiveText(context),
    ),
    labelMedium: _gilroyStyle(
      FontWeight.w600,
      12 * Responsive.getResponsiveText(context),
    ),
    labelSmall: _gilroyStyle(
      FontWeight.w500,
      10 * Responsive.getResponsiveText(context),
    ),
  );

  static TextStyle _gilroyStyle(FontWeight weight, double size) {
    return TextStyle(fontFamily: Util.getFontFamily(weight), fontSize: size);
  }
}
