import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final String? subTitle, secondTitle;
  final bool isButton;
  final String buttonText;
  final Widget bottomWidget;
  final void Function()? onTap;
  final double? headerHeight,
      borderRadius,
      titleSecondTitleBetweenSpace,
      secondTitleSubTitleBetweenSpace;
  final EdgeInsetsGeometry? headerPadding;
  final Color? headerColor, borderColor, headerPrefixIconColor;
  final bool? showHeaderPrefixIcon, showBlackShadowInChild;
  final String? headerPrefixIcon;
  final Widget? suffixIcon, titleSuffix, subTitleIcon;
  final double? headerPrefixIconHeight, headerPrefixIconWidth;
  final FontWeight? titleFontWeight,
      secondTitleFontWeight,
      subTitleFontWeight,
      buttonTextFontWeight;
  final Color? titleColor, secondTitleColor, subTitleColor, buttonTextColor;
  final double? titleFontSize,
      secondTitleFontSize,
      subTitleFontSize,
      buttonTextFontSize;
  const CommonCard({
    required this.title,
    required this.bottomWidget,
    this.isButton = false,
    this.buttonText = '',
    this.onTap,
    this.headerHeight,
    super.key,
    this.borderColor,
    this.headerPadding,
    this.showHeaderPrefixIcon,
    this.headerPrefixIcon,
    this.headerPrefixIconColor,
    this.subTitle,
    this.secondTitle,
    this.borderRadius,
    this.headerColor,
    this.suffixIcon,
    this.headerPrefixIconHeight,
    this.headerPrefixIconWidth,
    this.showBlackShadowInChild,
    this.subTitleIcon,
    this.titleSuffix,
    this.titleFontWeight,
    this.secondTitleFontWeight,
    this.subTitleFontWeight,
    this.titleColor,
    this.secondTitleColor,
    this.subTitleColor,
    this.titleFontSize,
    this.secondTitleFontSize,
    this.subTitleFontSize,
    this.titleSecondTitleBetweenSpace,
    this.secondTitleSubTitleBetweenSpace,
    this.buttonTextFontWeight,
    this.buttonTextColor,
    this.buttonTextFontSize,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        (borderRadius ?? 12) * Responsive.getResponsive(context),
      ),
      border: Border.all(
        color: borderColor ?? AppTheme.getColor(context).outline,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Container(
          height: headerHeight, //?? 0.06 * Responsive.getHeight(context),
          padding:
              headerPadding ??
              EdgeInsets.all(10 * Responsive.getResponsive(context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                (borderRadius ?? 12) * Responsive.getResponsive(context) - 1.0,
              ),
            ),
            boxShadow: [
              if (showBlackShadowInChild == true)
                const BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              BoxShadow(
                color:
                    headerColor?.withAlpha(180) ??
                    AppTheme.getColor(context).secondary.withAlpha(180),
              ),
              BoxShadow(
                color: headerColor ?? AppTheme.getColor(context).secondary,
                offset: const Offset(1, 4),
                spreadRadius: -6.0,
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            children: [
              if (showHeaderPrefixIcon == true)
                Image.asset(
                  headerPrefixIcon ?? 'assets/take_order/profile-circle.png',
                  // height: headerPrefixIconHeight ?? 0.1 * Responsive.getHeight(context),
                  width:
                      headerPrefixIconWidth ??
                      0.06 * Responsive.getWidth(context),
                  color: headerPrefixIconColor,
                ),
              if (showHeaderPrefixIcon == true)
                SizedBox(width: 0.02 * Responsive.getWidth(context)),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            isKey: true,
                            title,
                            color:
                                titleColor ??
                                AppTheme.getColor(context).onPrimary,
                            fontSize:
                                titleFontSize ??
                                18 * Responsive.getResponsiveText(context),
                            fontWeight: titleFontWeight ?? FontWeight.w700,
                          ),
                        ),
                        if (titleSuffix != null)
                          titleSuffix ?? const SizedBox.shrink(),
                      ],
                    ),

                    SizedBox(height: titleSecondTitleBetweenSpace),
                    if (secondTitle != null)
                      CustomText(
                        isKey: true,
                        '$secondTitle',
                        color:
                            secondTitleColor ??
                            AppTheme.getColor(context).onPrimary,
                        fontSize:
                            secondTitleFontSize ??
                            18 * Responsive.getResponsiveText(context),
                        fontWeight: secondTitleFontWeight ?? FontWeight.w700,
                      ),
                    SizedBox(height: secondTitleSubTitleBetweenSpace),
                    if (subTitle != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (subTitleIcon != null)
                            subTitleIcon ?? const SizedBox.shrink(),
                          if (subTitleIcon != null)
                            SizedBox(
                              width: 0.01 * Responsive.getWidth(context),
                            ),

                          Expanded(
                            child: CustomText(
                              isKey: true,
                              '$subTitle',
                              color:
                                  subTitleColor ??
                                  AppTheme.getColor(context).onPrimary,
                              fontSize:
                                  subTitleFontSize ??
                                  15 * Responsive.getResponsiveText(context),
                              fontWeight: subTitleFontWeight ?? FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (isButton == true)
                SizedBox(width: 0.02 * Responsive.getWidth(context)),

              if (isButton == true)
                MyCoButton(
                  onTap: onTap,
                  title: buttonText,
                  textStyle: TextStyle(
                    fontFamily: 'Gilroy-semiBold',
                    fontSize:
                        buttonTextFontSize ??
                        13 * Responsive.getResponsiveText(context),
                    color:
                        buttonTextColor ?? AppTheme.getColor(context).onPrimary,
                    fontWeight: buttonTextFontWeight,
                  ),
                  width: 0.16 * Responsive.getWidth(context),
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  height: 0.03 * Responsive.getHeight(context),
                  isShadowBottomLeft: true,
                ),
              if (suffixIcon != null) suffixIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
        bottomWidget,
      ],
    ),
  );
}
