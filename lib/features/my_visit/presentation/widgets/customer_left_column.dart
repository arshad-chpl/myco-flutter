import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerLeftColumn extends StatelessWidget {
  const CustomerLeftColumn({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
                children: const [
                  TextSpan(
                    text: 'Category : ',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: 'CHPL',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8 * Responsive.getResponsive(context)),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.profileCircle,
                  height: 20 * Responsive.getResponsive(context),
                ),
                SizedBox(width: 8 * Responsive.getResponsive(context)),
                CustomText(
                  'Yash Soni',
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 8 * Responsive.getResponsive(context)),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.callCalling,
                  height: 18 * Responsive.getResponsive(context),
                ),
                SizedBox(width: 8 * Responsive.getResponsive(context)),
                CustomText(
                  '+91 9909945983',
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ],
            ),
            SizedBox(height: 8 * Responsive.getResponsive(context)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.location,
                  height: 18 * Responsive.getResponsive(context),
                ),
                SizedBox(width: 8 * Responsive.getResponsive(context)),
                Expanded(
                  child: CustomText(
                    '101, Sanand - Sarkhej Rd, Makarba, Ahmedabad...',
                    fontSize: 12 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}
