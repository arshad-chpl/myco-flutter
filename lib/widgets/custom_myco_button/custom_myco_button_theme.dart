import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class MyCoButtonTheme {
  static const Color mobileBackgroundColor = Color(0xFF2F648E);
  static const Color whitemobileBackgroundColor = AppColors.white;
  static const Color tabletBackgroundColor = Color(0xFF2F648E);

  static TextStyle getMobileTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.w400,
      fontFamily: 'Churchward Isabella',
      color: Colors.white,
    );
  }

  static TextStyle getTabletTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      fontFamily: 'Churchward Isabella',
      color: Colors.white,
    );
  }

  static TextStyle getWhiteBackgroundTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return textTheme.bodyLarge!.copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
      fontFamily: 'Churchward Isabella',
    );
  }

  static const Border defaultBorder = Border.fromBorderSide(
    BorderSide(color: AppColors.primary, width: 1),
  );

  static const double borderRadius = 10;
}
