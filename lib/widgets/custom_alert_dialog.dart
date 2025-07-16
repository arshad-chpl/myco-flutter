import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class CustomAlertDialog extends StatelessWidget {
  final String icon;
  final double? iconHeight;
  final double? iconWidth;
  final String description;
  final String firstButton;
  final String secondButton;
  final VoidCallback? firstButtonTap;
  final VoidCallback? secondButtonTap;
  const CustomAlertDialog({
    required this.icon,
    required this.description,
    required this.firstButton,
    required this.secondButton,
    super.key,
    this.firstButtonTap,
    this.secondButtonTap,
    this.iconHeight,
    this.iconWidth,
  });

  @override
  Widget build(BuildContext context) => MyCoDialog(
    isBottomSheet: true,
    image: icon.startsWith('http')
        ? Image.network(
      icon,
      height: iconHeight ?? .15 * Responsive.getHeight(context),
      width: iconWidth ?? .5 * Responsive.getWidth(context),
    )
        : Image.asset(
      icon,
      height: iconHeight ?? .15 * Responsive.getHeight(context),
      width: iconWidth ?? .5 * Responsive.getWidth(context),
    ),
    isDescriptionThere: false,
    title: description,
    actions: [
      MyCoButton(
        onTap: firstButtonTap,
        title: firstButton,
        height: 0.068 * Responsive.getHeight(context),
        width: .7 * Responsive.getWidth(context),
        backgroundColor: AppTheme.getColor(context).onPrimary,
        textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
        boarderRadius: 30 * Responsive.getResponsive(context),
      ),
      MyCoButton(
        onTap: secondButtonTap,
        title: secondButton,
        height: 0.068 * Responsive.getHeight(context),
        width: .7 * Responsive.getWidth(context),
        boarderRadius: 30 * Responsive.getResponsive(context),
        isShadowBottomLeft: true,
      ),
    ],
  );
}