import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.whats),
        SizedBox(width: 0.045 * Responsive.getWidth(context)),
        SvgPicture.asset(AppAssets.share),
        SizedBox(width: 0.30 * Responsive.getWidth(context)),
        MyCoButton(
          onTap: () {
            context.push("/visit_report");
          },
          title: LanguageManager().get('view_report'),
          isShadowBottomLeft: true,
          width: 0.33 * Responsive.getWidth(context),
          height: 0.033 * Responsive.getHeight(context),
          boarderRadius: 20,
        ),
      ],
    );
  }
}
