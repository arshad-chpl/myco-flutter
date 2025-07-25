import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    final double padding = 10 * responsive;
    final double borderRadius = isTablet ? 40 * responsive : 20 * responsive;
    final double blurRadius = isTablet ? 30 * responsive : 6 * responsive;
    final double imageWidth = isTablet
        ? 0.2 * Responsive.getWidth(context)
        : 0.25 * Responsive.getWidth(context);
    final double imageHeight = isTablet
        ? 0.2 * Responsive.getWidth(context)
        : 0.1 * Responsive.getHeight(context);

    return Stack(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: blurRadius,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(
              AppAssets.loaderGif,
              width: imageWidth,
              height: imageHeight,
            ),
          ),
        ),
      ],
    );
  }
}
