import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
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
          fontSize: 16 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppColors.textGray,
        ),
        SizedBox(height: 4),
        DesignBorderContainer(
          borderRadius: 12,
          height: 78,
          width: 87,
          borderColor: AppTheme.getColor(context).primary,
          backgroundColor: AppTheme.getColor(context).surfaceContainer,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 43,
                width: 71,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    08 * Responsive.getResponsive(context),
                  ),
                  color: AppColors.gray10,
                ),
              ),
              SizedBox(height: 5),
              CustomText("yash.jpg", fontSize: 10),
              //SizedBox(height: 0.001 * Responsive.getHeight(context)),
            ],
          ),
        ),
      ],
    );
  }
}
