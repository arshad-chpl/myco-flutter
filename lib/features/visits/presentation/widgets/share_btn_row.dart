import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: Row(
        children: [
          //whatsapp icon
          SvgPicture.asset(AppAssets.whats),
          SizedBox(width: 0.045 * getWidth(context)),

          //share icon
          SvgPicture.asset(AppAssets.share),
          Spacer(),

          // visit report button
          MyCoButton(
            onTap: () {
              context.push('/visit_report');
            },
            title: 'View Report',
            isShadowBottomLeft: true,
            spacing: 5,
            width: 0.35 * getWidth(context),
            height: 0.025 * getHeight(context),
            boarderRadius: 20,
          ),
        ],
      ),
    );
  }
}
