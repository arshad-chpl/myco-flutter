import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ReportDashedContainer extends StatelessWidget {
  const ReportDashedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Media',
          fontSize: 16 * getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppColors.textGray,
        ),
        SizedBox(height: 4),
        DesignBorderContainer(
          backgroundColor: AppColors.lightTeal,
          width: 0.25 * getWidth(context),
          height: 0.090 * getHeight(context),
          borderRadius: 10,
          child: FittedBox(
            child: Column(
              children: [
                Container(
                  height: 0.17 * getHeight(context),
                  width: 0.70 * getWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(
                      20 * getResponsive(context),
                    ),
                    color: AppColors.gray10,
                  ),
                ),
                CustomText(
                  'yash.jpg',
                  color: AppColors.textGray,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
