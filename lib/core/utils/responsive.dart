import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;
  static late bool isTablet;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
    isTablet = _screenWidth >= 600; // basic tablet breakpoint
  }

  static double screenWidth() => _screenWidth;
  static double screenHeight() => _screenHeight;

  static double scaleHeight(double height) {
    // Scales based on height but limits wild differences
    return (_screenHeight / 812) * height;
  }

  static double scaleWidth(double width) {
    // Based on width (e.g., iPhone 11 base: 375)
    return (_screenWidth / 375) * width;
  }

  static double scaleText(double size) {
    // Text scaling with clamping for mobile/tablet
    double factor = _screenWidth / 375;
    factor = factor.clamp(0.85, 1.2);
    return size * factor;
  }

  static double responsivePadding() {
    return isTablet ? 24 : 16;
  }
}

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

double getResponsive(context) {
  print(
    '${MediaQuery.of(context).size.width} , ${MediaQuery.of(context).size.height}',
  );
  return MediaQuery.of(context).size.height * 0.001;
}

double getResponsiveOnWidth(context) {
  return MediaQuery.of(context).size.width * 0.001;
}

// double getResponsiveText(context) {
//   if (Platform.isAndroid) {
//     return getWidth(context) > 600 ? 1.5 : 0.8;
//   } else {
//     return getWidth(context) > 600 ? 1.5 : 0.9;
//   }
// }

double getResponsiveText(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width >= 900) {
    // Large tablets or landscape tablets
    return 1.6;
  } else if (width >= 600) {
    // 7-inch tablets or small tablets
    return 1.4;
  } else {
    // Mobile devices
    return 0.9;
  }
}
