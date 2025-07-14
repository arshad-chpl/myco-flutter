import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CurrentLocationWithLabelWidget extends StatefulWidget {
  final String address;

  const CurrentLocationWithLabelWidget({required this.address, super.key});

  @override
  State<CurrentLocationWithLabelWidget> createState() =>
      _CurrentLocationWithLabelWidgetState();
}

class _CurrentLocationWithLabelWidgetState
    extends State<CurrentLocationWithLabelWidget> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        'current_location',
        isKey: true,
        color: AppColors.textGray,
        fontSize: 16 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.bold,
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      BorderContainerWraper(
        borderColor: AppColors.borderColor,
        width: double.infinity,
        backgroundColor: AppColors.removeBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 5 * Responsive.getResponsive(context),
              ),
              child: Image(
                image: const AssetImage(AppAssets.locationIcon),
                height: 0.060 * Responsive.getHeight(context),
                width: 0.060 * Responsive.getWidth(context),
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 0.017 * Responsive.getWidth(context)),
            CustomText(
              widget.address,
              // isKey: true,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 15 * Responsive.getResponsiveText(context),
            ),
            SizedBox(width: 0.040 * Responsive.getWidth(context)),
            Image(
              image: const AssetImage(AppAssets.locationPreview),
              height: 0.09 * Responsive.getHeight(context),
              width: 0.2 * Responsive.getWidth(context),
            ),
          ],
        ),
      ),
    ],
  );
}
