import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';


class RescheduleVisitRow extends StatelessWidget {
  final VoidCallback onTap;

  const RescheduleVisitRow({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double multiplier = Responsive.getResponsiveText(context);
    final double screenWidth = Responsive.getWidth(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            'Visit Added For',
            color: AppTheme.getColor(context).onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 14 * multiplier,
          ),
          GestureDetector(
            onTap: onTap,
            child: CustomText(
              'Reschedule Visit?',
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14 * multiplier,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
