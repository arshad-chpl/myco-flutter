import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class NoDataPreview extends StatelessWidget {
  const NoDataPreview({super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 20 * Responsive.getResponsive(context),
    children: [
      SvgPicture.asset(
        width: 0.072 * Responsive.getWidth(context),
        height: 0.072 * Responsive.getHeight(context),
        AppAssets.noDataImage,
      ),
      const CustomText(
        'data_not_available',
        isKey: true,
        fontWeight: FontWeight.w500,
        color: AppColors.textGray,
      ),
    ],
  );
}
