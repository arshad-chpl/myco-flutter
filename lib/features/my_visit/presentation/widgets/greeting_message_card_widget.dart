import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/show_date_time_widget.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class GreetingMessageCardWidget extends StatelessWidget {
  const GreetingMessageCardWidget({super.key});

  @override
  Widget build(BuildContext context) => BorderContainerWraper(
      width: double.infinity,
      backgroundColor: AppColors.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'Welcome To Work',
            fontSize: 21 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSecondary,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.spanishYellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10 * Responsive.getResponsive(context),
                    vertical: 3 * Responsive.getResponsive(context),
                  ),
                  child: CustomText(
                    'Flutter Developer',
                    fontSize: 21 * Responsive.getResponsiveText(context),
                  ),
                ),
              ),

              ShowDateTimeWidget(
                color: AppTheme.getColor(context).onSecondary,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
}
