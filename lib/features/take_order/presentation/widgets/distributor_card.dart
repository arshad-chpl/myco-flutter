import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class DistributorCard extends StatelessWidget {
  final String title;
  final bool isButton;
  final String buttonText;
  final Widget bottomWidget;
  final VoidCallback? onTap;
  final double? headerHeight;
  const DistributorCard({
    required this.title,
    required this.bottomWidget,
    this.isButton = false,
    this.buttonText = '',
    this.onTap,
    this.headerHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    color: AppColors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12 * getResponsive(context)),
            topRight: Radius.circular(12 * getResponsive(context)),
          ),
          elevation: 3.0,
          child: Container(
            height: headerHeight ?? 0.06 * getHeight(context),
            padding: EdgeInsets.all(10 * getResponsive(context)),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12 * getResponsive(context)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22 * getResponsiveText(context),
                  ),
                ),
                isButton
                    ? MyCoButton(
                        onTap: onTap,
                        title: buttonText,
                        width: 0.18 * getWidth(context),
                        boarderRadius: 30 * getResponsive(context),
                        height: 0.03 * getHeight(context),
                        isShadowBottomLeft: true,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        bottomWidget,
      ],
    ),
  );
}
