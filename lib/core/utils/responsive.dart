import 'dart:io';

import 'package:flutter/foundation.dart';
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

  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(context) {
    print(MediaQuery.of(context).size.width);
    return MediaQuery.of(context).size.width;
  }

  static double getResponsive(context) {
    print(
      '${MediaQuery.of(context).size.width} , ${MediaQuery.of(context).size.height}',
    );
    return MediaQuery.of(context).size.height * 0.001;
  }

  static double getResponsiveOnWidth(context) {
    kDebugMode
        ? print(
            'Responsive Width: ${MediaQuery.of(context).size.width * 0.001}',
          )
        : null;
    return MediaQuery.of(context).size.width * 0.001;
  }

  static double getResponsiveText(context) {
    if (Platform.isAndroid) {
      return Responsive.getWidth(context) > 600 ? 1.5 : 0.8;
    } else {
      return Responsive.getWidth(context) > 600 ? 1.5 : 0.9;
    }
  }

  static double getDashboardResponsiveText(BuildContext context) {
    if (Responsive.getWidth(context) > 600) {
      return 1.2;
    } else {
      return 1;
    }
  }
}
