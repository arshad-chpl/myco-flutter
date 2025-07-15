import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/card_bottom_content.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerCardOnlyVisit extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardOnlyVisit({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => CommonCard(
      title: 'Ganesh Auto Garage (RT4982)',
    suffixIcon: Container(
      height: 32 * Responsive.getResponsiveText(context),
      width: 110 * Responsive.getResponsiveText(context),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.getColor(context).onPrimary, // White border
          width: 1.2,
        ),
        color: Colors.transparent, // Transparent background
      ),
        child: CustomText(
          'only_visit',
          isKey: true,
          color: Colors.white,
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        )

    ),
      onTap: onTap,
      headerColor: AppColors.spanishYellow,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget: const CardBottomContent(
        isOnlyVisit: true,
      ),
    );
}
