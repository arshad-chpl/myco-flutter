import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_progress_bar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({super.key});

  @override
  Widget build(BuildContext context) => CommonCard(
    title: "Developer QA",
    bottomWidget: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14 * Responsive.getResponsive(context),
        vertical: 12 * Responsive.getResponsive(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              badges.Badge(
                badgeStyle: badges.BadgeStyle(badgeColor: Colors.transparent),
                position: badges.BadgePosition.bottomEnd(
                  bottom: -13 * Responsive.getResponsive(context),
                  end: -6 * Responsive.getResponsive(context),
                ),
                badgeContent: ClipRRect(
                  child: Image.asset(
                    "assets/sign_in/camera_icon.png",
                    fit: BoxFit.contain,
                    height: 0.04 * Responsive.getHeight(context),
                  ),
                ),
                child: Image.asset(
                  "assets/dashboard/person_photo.png",
                  fit: BoxFit.contain,
                  height: 0.12 * Responsive.getHeight(context),
                ),
              ),
              SizedBox(width: 0.015 * Responsive.getWidth(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    "Manish Chandra",
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    "Emplolyee ID : CHPL-QA-085",
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    "Tester",
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).outline,
                  ),
                  CustomText(
                    "Junagadh - Technical - QA",
                    color: AppTheme.getColor(context).outline,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 0.07 * Responsive.getHeight(context)),
          Container(
            child: CustomSegmentedProgressBar(
              totalSegments: 4,
              percentComplete: 90,
              gradientColors: [
                AppTheme.getColor(context).primary,
                AppTheme.getColor(context).tertiary,
                AppTheme.getColor(context).onTertiaryContainer,
                AppTheme.getColor(context).tertiary,
                AppTheme.getColor(context).primary,
              ],
            ),
          ),
          CustomText(
            "Profile Completion",
            color: AppTheme.getColor(context).primary,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),
          Container(
            width: 0.9 * Responsive.getWidth(context),
            child: Divider(color: AppTheme.getColor(context).onTertiary),
          ),
          Row(
            spacing: 0.015 * Responsive.getWidth(context),
            children: [
              SvgPicture.asset("assets/dashboard/svgs/call-calling.svg"),
              CustomText(
                "+91 9909945983",
                fontWeight: FontWeight.w500,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
            ],
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),
          Row(
            spacing: 0.015 * Responsive.getWidth(context),
            children: [
              SvgPicture.asset("assets/dashboard/svgs/sms.svg"),
              CustomText(
                "Mukund@yopmail.com",
                fontWeight: FontWeight.w500,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
            ],
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Row(
            spacing: 0.02 * Responsive.getWidth(context),
            children: [
              Image.asset(
                "assets/dashboard/facebook_logo.png",
                height: 0.035 * Responsive.getHeight(context),
              ),
              Image.asset(
                "assets/dashboard/linked_in_logo.png",
                height: 0.035 * Responsive.getHeight(context),
              ),
              Image.asset(
                "assets/dashboard/x_logo.png",
                height: 0.035 * Responsive.getHeight(context),
              ),
              Image.asset(
                "assets/dashboard/instagram_logo.png",
                height: 0.035 * Responsive.getHeight(context),
              ),
              Image.asset(
                "assets/dashboard/whatsapp_logo.png",
                height: 0.035 * Responsive.getHeight(context),
              ),
              Spacer(),
              SvgPicture.asset(
                "assets/dashboard/svgs/message-edit.svg",
                height: 0.035 * Responsive.getHeight(context),
              ),
            ],
          ),
        ],
      ),
    ),
    subTitle: "WTT, S.G Highway, Ahmedabad",
  );
}
