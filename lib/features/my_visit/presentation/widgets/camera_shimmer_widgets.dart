import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class CameraShimmerWidgets extends StatelessWidget {
  const CameraShimmerWidgets({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: AppTheme.getColor(context).outlineVariant,
    highlightColor: AppColors.gray,
    child: Container(
      height: 0.32 * Responsive.getHeight(context),
      width: double.infinity * Responsive.getResponsiveOnWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          27 * Responsive.getResponsive(context),
        ),
        color: AppTheme.getColor(context).onPrimary,
      ),
    ),
  );
}
