import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/util.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isKey;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontStyle? fontStyle;

  const CustomText(
    this.text, {
    super.key,
    this.isKey = true,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decorationColor, this.fontStyle,
  });

  @override
  Widget build(BuildContext context) => Text(
    isKey ? LanguageManager().get(text) : text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    
    style: TextStyle(
      fontFamily: Util.getFontFamily(fontWeight),
      fontSize: fontSize,
      color: color ?? AppTheme.getColor(context).onSurface,
      decoration: decoration,
      decorationColor: decorationColor,
      fontStyle: fontStyle
    ),
  );
}
