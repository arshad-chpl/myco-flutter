import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget buildAutoExpenseCard(BuildContext context) => CommonCard(
    title: 'Auto Expense Category',
    headerColor: AppTheme.getColor(context).tertiary,
    borderColor: AppTheme.getColor(context).outline,
    showHeaderPrefixIcon: false,
    showBlackShadowInChild: true,
    bottomWidget: Padding(
      padding: EdgeInsets.all(12 * Responsive.getResponsiveText(context)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8 * Responsive.getResponsiveText(context),
            horizontal: 12 * Responsive.getResponsiveText(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8 * Responsive.getResponsiveText(context)),
            border: Border.all(color: AppTheme.getColor(context).tertiary),
          ),
          child: IntrinsicWidth(
            child: CustomText(
              'Mukund - Visit Expense',
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurface,
            ),
          ),
        ),
      ),
    ),
  );
