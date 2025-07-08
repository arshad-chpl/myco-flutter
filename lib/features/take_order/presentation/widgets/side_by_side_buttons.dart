import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class SideBySideButtons extends StatelessWidget {
  final String button1Name;
  final String button2Name;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final Color? bgColor1;
  final Color? bgColor2;
  final double? width1;
  final double? width2;
  final double? height1;
  final double? height2;
  const SideBySideButtons({
    required this.button1Name,
    required this.button2Name,
    required this.onTap1,
    required this.onTap2,
    super.key,
    this.bgColor1,
    this.bgColor2,
    this.width1,
    this.width2,
    this.height1,
    this.height2,
  });

  @override
  Widget build(BuildContext context) => Row(
    spacing: 14,
    children: [
      Expanded(
        child: MyCoButton(
          onTap: onTap1,
          title: button1Name,
          height: height1 ?? 0.04 * Responsive.getHeight(context),
          backgroundColor: bgColor1 ?? AppTheme.getColor(context).onPrimary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          textStyle: AppTheme.getTextStyle(
            context,
          ).bodyLarge!.copyWith(color: AppTheme.getColor(context).primary),
        ),
      ),
      Expanded(
        child: MyCoButton(
          onTap: onTap2,
          title: button2Name,
          height: height2 ?? 0.04 * Responsive.getHeight(context),
          backgroundColor: bgColor2 ?? AppColors.primary,
          boarderRadius: 30 * Responsive.getResponsive(context),
          textStyle: AppTheme.getTextStyle(
            context,
          ).bodyLarge!.copyWith(color: AppTheme.getColor(context).onPrimary),
        ),
      ),
    ],
  );
}
