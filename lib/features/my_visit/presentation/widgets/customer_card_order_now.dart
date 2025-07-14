import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/card_bottom_content.dart';

class CustomerCardOrderNow extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardOrderNow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => CommonCard(
      title: 'Ganesh Auto Garage (RT4982)',
      onTap: onTap,
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
      child: Text(
        'Order Taken',
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
      headerColor: AppTheme.getColor(context).secondary,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget: const CardBottomContent(
        isOrderNow: true,
      ),
    );
}