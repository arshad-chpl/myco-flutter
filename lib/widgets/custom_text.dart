import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/util.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText(
      this.text, {
        super.key,
        this.fontSize = 16,
        this.fontWeight = FontWeight.w400,
        this.color,
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) => Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: Util.instance.getFontFamily(fontWeight),
        fontSize: fontSize,
        color: color ?? AppTheme.getColor(context).onSurface,
      ),
    );
}