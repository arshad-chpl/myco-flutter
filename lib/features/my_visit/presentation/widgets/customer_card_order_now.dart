import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/card_bottom_content.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerCardOrderNow extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardOrderNow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => CommonCard(
    borderRadius: VariableBag.commonCardBorderRadius * Responsive.getResponsive(context),
      title: 'Ganesh Auto Garage (RT4982)',
      onTap: onTap,
    suffixIcon: Container(
      height: 32 * Responsive.getResponsiveText(context),
      width: 110 * Responsive.getResponsiveText(context),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(VariableBag.buttonBorderRadius * Responsive.getResponsive(context)),
        border: Border.all(
          color: AppTheme.getColor(context).onPrimary,
          width:  0.003 * Responsive.getWidth(context),
        ),
        color: AppTheme.getColor(context).secondary, // Transparent background
      ),
        child: CustomText(
          'order_taken',
          isKey: true,
          color: AppTheme.getColor(context).onSecondary,
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        )
    ),
      headerColor: AppTheme.getColor(context).secondary,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget:  CardBottomContent(
        isOrderNow: true,
      ),
    );
}