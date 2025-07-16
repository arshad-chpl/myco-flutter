import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class StartEndTime extends StatelessWidget {
  const StartEndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Start Visit date & Time',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 4),
              CustomText(
                '09:45AM, 21st May 2025',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(width: 0.12 * Responsive.getWidth(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'End Visit date & Time',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 4),
              CustomText(
                '12:45PM, 21st May 2025',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
