import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OfferBox extends StatelessWidget {
  const OfferBox({
    required this.title,
    required this.textContent,
    required this.offerTime,
    super.key,
  });

  final String title;
  final String textContent;
  final String offerTime;
  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12 * Responsive.getResponsive(context),
      ),
      side: BorderSide(color: AppTheme.getColor(context).outline),
    ),
    // color: AppTheme.getColor(context).onPrimary,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Container(
          height: 0.05 * Responsive.getHeight(context),
          padding: EdgeInsets.all(8 * Responsive.getResponsive(context)),
          decoration: BoxDecoration(
            color: AppColors.myCoCyan,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12 * Responsive.getResponsive(context)),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/take_order/offer.png',
                height: 0.02 * Responsive.getHeight(context),
              ),
              SizedBox(width: 0.02 * Responsive.getWidth(context)),
              CustomText(
                title,
                color: AppTheme.getColor(context).onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18 * Responsive.getResponsiveText(context),
              ),
            ],
          ),
        ),

        // Offer Description
        Padding(
          padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
          child: CustomText(
            textContent,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
        ),

        // Footer with validity
        Padding(
          padding: EdgeInsets.fromLTRB(
            12 * Responsive.getResponsive(context),
            0,
            12 * Responsive.getResponsive(context),
            12 * Responsive.getResponsive(context),
          ),
          child: CustomText(
            offerTime,
            fontSize: 12 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
