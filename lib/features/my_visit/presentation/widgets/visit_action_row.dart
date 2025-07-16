import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class VisitActionRow extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;

  const VisitActionRow({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final double multiplier = Responsive.getResponsiveText(context);
    final Size screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icons
        Flexible(
          flex: 6,
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.whatsapp),
              SizedBox(width: screenSize.width * 0.03),
              SvgPicture.asset(AppAssets.share),
              SizedBox(width: screenSize.width * 0.03),
              SvgPicture.asset(AppAssets.delete),
            ],
          ),
        ),

        // Button
        Flexible(
          flex: 5,
          child: Align(
            alignment: Alignment.centerRight,
            child: MyCoButton(
              onTap: onTap,
              title: buttonText,
              textStyle: TextStyle(
                color: AppColors.spanishYellow,
                fontWeight: FontWeight.w500,
                fontSize: 13 * multiplier,
              ),
              boarderRadius: 30 * Responsive.getResponsive(context),
              borderColor: AppColors.spanishYellow,
              borderWidth: 1.2,
              backgroundColor: Colors.transparent,
              wantBorder: true,
            ),
          ),
        ),
      ],
    );
  }
}
