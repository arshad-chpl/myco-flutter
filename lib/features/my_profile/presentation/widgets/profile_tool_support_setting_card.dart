import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/custom_shadow_container.dart';

class ProfileToolSupportSettingCard extends StatelessWidget {
  ProfileToolSupportSettingCard({super.key});

  List svgList = [
    "assets/dashboard/svgs/nominees.svg",
    "assets/dashboard/svgs/hold_team_salary.svg",
    "assets/dashboard/svgs/notfication_settings.svg",
    "assets/dashboard/svgs/setting.svg",
    "assets/dashboard/svgs/my_activities.svg",
    "assets/dashboard/svgs/app_support.svg",
    "assets/dashboard/svgs/rate_app.svg",
    "assets/dashboard/svgs/share_app.svg",
    "assets/dashboard/svgs/log_out.svg",
  ];

  @override
  Widget build(BuildContext context) => Column(
    spacing: 0.015 * Responsive.getHeight(context),
    children: [
      CustomLabelGifs(
        title: 'Tools, Supports & Settings',
        gifAssetPath: 'assets/gifs/profile_tool_support_setting.gif',
      ),
      GridView.builder(
        itemCount: 9,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(
            vertical: 16 * Responsive.getResponsive(context),
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(
              12 * Responsive.getResponsive(context),
            ),
            border: Border.all(color: AppTheme.getColor(context).outlineVariant),
          ),
          child: CustomShadowContainer(
            textAlign: TextAlign.center,
            image: SvgPicture.asset(svgList[index]),
            title: "hello",
            containerHeight: 0.08 * Responsive.getHeight(context),
            titleStyle: TextStyle(
              fontSize: 50 * Responsive.getResponsiveText(context),
            ),
          ),
        ),
      ),
    ],
  );
}
