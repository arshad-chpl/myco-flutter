import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TestTextIcon extends StatelessWidget {
  const TestTextIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Custom Text for Test New vist row
        CustomText(
          'Test New Visit',
          fontWeight: FontWeight.w600,
          fontSize: 20 * Responsive.getResponsiveText(context),
        ),
        InkWell(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(AppAssets.doubleDA, fit: BoxFit.scaleDown),
        ),
      ],
    );
  }
}
