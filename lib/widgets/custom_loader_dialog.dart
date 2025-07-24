import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomLoaderDialog extends StatelessWidget {
  const CustomLoaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final isTablet = Responsive.screenWidth() > 600; // <-- use
    // context version!

    final double padding = 10 * responsive;
    final double borderRadius = isTablet ? 40 * responsive : 20 * responsive;
    final double blurRadius = isTablet ? 30 * responsive : 6 * responsive;
    final double imageWidth = isTablet
        ? 0.2 * Responsive.getWidth(context)
        : 0.25 * Responsive.getWidth(context);
    final double imageHeight = isTablet
        ? 0.2 * Responsive.getWidth(context)
        : 0.1 * Responsive.getHeight(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: Center(
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
    );
  }

  /// Helper to show dialog (non-dismissible)
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54, // overlay color, adjust if needed
      builder: (context) => const CustomLoaderDialog(),
    );
  }
}
