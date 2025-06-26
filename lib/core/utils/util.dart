import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Util {
  // // Private constructor
  // Util._privateConstructor();

  // // Singleton instance
  // static final Util _instance = Util._privateConstructor();

  // // Getter to access the singleton
  // static Util get instance => _instance;
  /// Method to generate password
  static String getCurrentPassword(
    String societyId,
    String userId,
    String userMobile,
  ) {
    final subMobile = _getLastThreeChars(userMobile);
    return '$userId@$subMobile@$societyId';
  }

  /// Utility to get last 3 characters
 static String _getLastThreeChars(String input) {
    if (input.length < 3) return input;
    return input.substring(input.length - 3);
  }

  /// Method to apply opacity to a color
  /// opacity should be between 0.0 and 1.0
static  Color applyOpacity(Color color, double opacity) =>
      color.withAlpha((opacity * 255).round());

///Gilroy-Thin
// Gilroy-UltraLight
// Gilroy-Light
// Gilroy-Regular
// Gilroy-Medium
// Gilroy-SemiBold
// Gilroy-Bold
// Gilroy-ExtraBold
// Gilroy-Heavy
  // Method to convert FontWeight to String
static  String getFontFamily(FontWeight? fontWeight) {
    switch (fontWeight) {
      case FontWeight.w100:
        return 'Gilroy-Thin';
      case FontWeight.w200:
        return 'Gilroy-UltraLight';
      case FontWeight.w300:
        return 'Gilroy-Light';
      case FontWeight.w400:
        return 'Gilroy-Regular';
      case FontWeight.w500:
        return 'Gilroy-Medium';
      case FontWeight.w600:
        return 'Gilroy-SemiBold';
      case FontWeight.w700:
        return 'Gilroy-Bold';
      case FontWeight.w800:
        return 'Gilroy-ExtraBold';
      case FontWeight.w900:
        return 'Gilroy-Heavy';
      default:
        return 'Gilroy-Regular';
    }
  }

  // Future<String?> getDeviceId() async {
  //   if (Platform.isAndroid || Platform.isIOS) {
  //     try {
  //       // Use platform_device_id for best persistent ID
  //       return await MobileDeviceIdentifier().getDeviceId();
  //     } catch (e) {
  //       debugPrint('Error getting device ID: $e');
  //     }
  //   }
  //   return null;
  // }

static  String getMonthName(int month) => switch (month) {
    0 => 'All',
    1 => 'January',
    2 => 'February',
    3 => 'March',
    4 => 'April',
    5 => 'May',
    6 => 'June',
    7 => 'July',
    8 => 'August',
    9 => 'September',
    10 => 'October',
    11 => 'November',
    12 => 'December',
    _ => 'Unknown', // Return a non-null String
  };
}
