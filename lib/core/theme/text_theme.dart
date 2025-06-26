import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';

class AppTextTheme {
static TextTheme getTextTheme(BuildContext context) => TextTheme(
      displayLarge: _gilroyStyle(FontWeight.w700,32* getResponsiveText(context)),
      displayMedium: _gilroyStyle(FontWeight.w600, 28* getResponsiveText(context)),
      displaySmall: _gilroyStyle(FontWeight.w500, 24* getResponsiveText(context)),

      headlineLarge: _gilroyStyle(FontWeight.w700, 22* getResponsiveText(context)),
      headlineMedium: _gilroyStyle(FontWeight.w600, 20* getResponsiveText(context)),
      headlineSmall: _gilroyStyle(FontWeight.w500, 18* getResponsiveText(context)),

      titleLarge: _gilroyStyle(FontWeight.w600, 18* getResponsiveText(context)),
      titleMedium: _gilroyStyle(FontWeight.w500, 16* getResponsiveText(context)),
      titleSmall: _gilroyStyle(FontWeight.w400, 14* getResponsiveText(context)),

      bodyLarge: _gilroyStyle(FontWeight.w400, 16* getResponsiveText(context)),
      bodyMedium: _gilroyStyle(FontWeight.w400, 14* getResponsiveText(context)),
      bodySmall: _gilroyStyle(FontWeight.w300, 12* getResponsiveText(context)),

      labelLarge: _gilroyStyle(FontWeight.w500, 14* getResponsiveText(context)),
      labelMedium: _gilroyStyle(FontWeight.w400, 12* getResponsiveText(context)),
      labelSmall: _gilroyStyle(FontWeight.w300, 10* getResponsiveText(context)),
    );



  static TextStyle _gilroyStyle(FontWeight weight, double size) {
    return TextStyle(
      fontFamily: Util.getFontFamily(weight),
      fontSize: size,
    );
  }
}