import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_progress_bar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ProfileDetailsCard extends StatelessWidget {
  final String fullName;
  final String employeeId;
  final String designation;
  final String department;
  final String branchName;
  final String phoneNumber;
  final String email;
  final String profileImage;
  final List social_link;

  const ProfileDetailsCard({
    super.key,
    required this.fullName,
    required this.employeeId,
    required this.designation,
    required this.department,
    required this.branchName,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
    required this.social_link,
  });

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
                badgeStyle: badges.BadgeStyle(
                  // Kept the badge background transparent as in your original code
                  badgeColor: Colors.transparent,
                  // Set elevation to 0 to avoid the badge's default shadow
                  elevation: 0,
                ),
                position: badges.BadgePosition.bottomEnd(
                  bottom: -17 * Responsive.getResponsive(context),
                  end: -6 * Responsive.getResponsive(context),
                ),
                badgeContent: ClipRRect(
                  child: Image.asset(
                    "assets/sign_in/camera_icon.png",
                    fit: BoxFit.contain,
                    height: 0.04 * Responsive.getHeight(context),
                  ),
                ),
                // MODIFICATION: The original child is wrapped in a Container to add a shadow.
                child: Container(
                  height: 0.1 * Responsive.getHeight(context),
                  width: 0.1 * Responsive.getHeight(context),
                  decoration: BoxDecoration(
                    // The shape of the decoration should be circular to match the image.
                    shape: BoxShape.circle,
                    // The boxShadow property takes a list of BoxShadows.
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4), // Shadow color
                        spreadRadius: 2, // How far the shadow extends
                        blurRadius: 8, // The blurriness of the shadow
                        offset: const Offset(0, 4), // Moves the shadow (x, y)
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    // Corrected typo from BorderRadiusGeometry to BorderRadius
                    // A large radius on a square widget makes it circular.
                    borderRadius: BorderRadius.circular(
                      50 * Responsive.getResponsive(context),
                    ),
                    child: Image.network(
                      profileImage,
                      fit: BoxFit.cover,
                      // Height and width are now controlled by the parent Container.
                      height: 0.1 * Responsive.getHeight(context),
                      width: 0.1 * Responsive.getHeight(context),
                      // It's good practice to add a loading builder for network images.
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget child,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                      // And an error builder in case the image fails to load.
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.grey[600],
                            size: 0.06 * Responsive.getHeight(context),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 0.015 * Responsive.getWidth(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fullName,
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    employeeId,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    designation,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).outline,
                  ),
                  SizedBox(
                    width: 0.55 * Responsive.getWidth(context),
                    child: CustomText(
                      "${branchName} - ${department} - ${designation}",
                      color: AppTheme.getColor(context).outline,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
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
                phoneNumber,
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
                email,
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
