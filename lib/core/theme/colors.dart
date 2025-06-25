import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2F648E);
  static const Color primary_1 = Color(0xFF2FBBA4);
  static const Color primary_2 = Color(0xFF08A4BB);
  static const Color secondary = Color(0xFFf5f5f5);
  static const Color black = Color(0xFF2E2E2E);
  static const Color error = Color(0xFFE53935);
  static const Color splashBg = Color(0xFFFBFBFB);
  static const Color gray5 = Color(0xFFF2F2F2);
  static const Color gray10 = Color(0xFFE6E6E6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bgWhite = Color(0xFFFAFAFF);
  static const Color blueLightShade = Color(
    0xFFeef1f9,
  ); // use in take order expansion tile
  static const Color myCoCyan = Color(0xFF08A4BB);
  static const Color lightTeal = Color(0xFFEEF7FD);
  static const Color red = Color(0xFFC44141);
  static const Color borderColor = Color(0xFF98A2B3);
  static const LinearGradient welcomeGradient = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Color(0xFF2F648E), // Light Sky Blue
            Color(0xFFFFFFFF),
            // Light Blue
          ],
        );
}
