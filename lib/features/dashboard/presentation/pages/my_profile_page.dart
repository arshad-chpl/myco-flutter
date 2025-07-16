import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_myteam.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_details_card.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_personal_info_card.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_reporting_card.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_tool_support_setting_card.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_word_attendance_card.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_employee_card.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_progress_bar.dart';
import 'package:myco_flutter/widgets/custom_task_widget.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      // automaticallyImplyLeading: false,
      appBarBackgoundColor: Colors.transparent,
      leadingWidth: 0.1 * Responsive.getWidth(context),
      title: CustomText(
        "My Profile",
        fontWeight: FontWeight.bold,
        fontSize: 26 * Responsive.getResponsiveText(context),
      ),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18 * Responsive.getResponsive(context),
      ),
      child: Container(
        child: Column(
          spacing: 0.015 * Responsive.getHeight(context),
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 0.015 * Responsive.getWidth(context),
              children: [
                Container(
                  height: 0.04 * Responsive.getHeight(context),
                  width: 0.3 * Responsive.getWidth(context),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).primary,
                    borderRadius: BorderRadius.circular(
                      10 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12 * Responsive.getResponsive(context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/dashboard/svgs/admin_view_icon.svg",
                              height: 0.02 * Responsive.getHeight(context),
                            ),
                          ),
                          height: 0.03 * Responsive.getHeight(context),
                          width: 0.07 * Responsive.getWidth(context),
                          decoration: BoxDecoration(
                            color: AppTheme.getColor(context).onPrimary,
                            borderRadius: BorderRadius.circular(
                              10 * Responsive.getResponsive(context),
                            ),
                          ),
                        ),
                        CustomText(
                          "Admin View",
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.035 * Responsive.getHeight(context),
                  width: 0.08 * Responsive.getWidth(context),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(
                      context,
                    ).tertiary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(
                      30 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/dashboard/svgs/profile_exit.svg",
                      height: 0.015 * Responsive.getHeight(context),
                    ),
                  ),
                ),
                Container(
                  height: 0.035 * Responsive.getHeight(context),
                  width: 0.08 * Responsive.getWidth(context),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(
                      context,
                    ).tertiary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(
                      30 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/dashboard/svgs/profile_setting.svg",
                      height: 0.015 * Responsive.getHeight(context),
                    ),
                  ),
                ),
                Container(
                  height: 0.035 * Responsive.getHeight(context),
                  width: 0.08 * Responsive.getWidth(context),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(
                      context,
                    ).tertiary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(
                      30 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/dashboard/svgs/profile_share.svg",
                      height: 0.015 * Responsive.getHeight(context),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 0.015 * Responsive.getHeight(context),
                  children: [
                    //Details Card
                    ProfileDetailsCard(),

                    //Reporting Card
                    ProfileReportingCard(),

                    //Personal Info Card
                    ProfilePersonalInfoCard(),

                    //Work Atendance Card
                    ProfileWordAttendanceCard(),

                    //Tool Support Setting Card
                    ProfileToolSupportSettingCard(),

                    //Overlaping image
                    CustomSection(
                      title: 'My Team',
                      child: BorderContainerWraper(
                        child: OverlappingPeopleCard(
                          people: [
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                          ],
                        ),
                      ),
                      hasViewMoreButton: true,
                      subtitle: "It’s Team That can Make it Happen",
                      count: "04",
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * Responsive.getResponsiveOnWidth(context),
                      ),
                    ),

                    //MycoButton for apply
                    MyCoButton(
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      onTap: () {},
                      title: "APPLY RESIGNATION",
                      isShadowBottomLeft: true,
                    ),
                    Column(
                      children: [
                        CustomText(
                          "WWW.MY-COMPANY.APP",
                          color: AppTheme.getColor(context).primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          "What’s New",
                          fontWeight: FontWeight.bold,
                          color: AppTheme.getColor(context).primary,
                          decoration: TextDecoration.underline,
                        ),
                        CustomText("V.211", fontWeight: FontWeight.bold),
                      ],
                    ),
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
