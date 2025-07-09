import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_myteam%20(1).dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
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
      backgroundColor: Colors.transparent,
      title: Text("My Profile"),
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
                    CommonCard(
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
                                    badgeColor: Colors.transparent,
                                  ),
                                  position: badges.BadgePosition.bottomEnd(
                                    bottom:
                                        -13 * Responsive.getResponsive(context),
                                    end: -6 * Responsive.getResponsive(context),
                                  ),
                                  badgeContent: ClipRRect(
                                    child: Image.asset(
                                      "assets/sign_in/camera_icon.png",
                                      fit: BoxFit.contain,
                                      height:
                                          0.04 * Responsive.getHeight(context),
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/dashboard/person_photo.png",
                                    fit: BoxFit.contain,
                                    height:
                                        0.12 * Responsive.getHeight(context),
                                  ),
                                ),
                                SizedBox(
                                  width: 0.015 * Responsive.getWidth(context),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      "Manish Chandra",
                                      fontSize:
                                          22 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CustomText(
                                      "Emplolyee ID : CHPL-QA-085",
                                      fontSize:
                                          18 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    CustomText(
                                      "Tester",
                                      fontSize:
                                          16 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.getColor(context).outline,
                                    ),
                                    CustomText(
                                      "Junagadh - Technical - QA",
                                      color: AppTheme.getColor(context).outline,
                                      fontSize:
                                          16 *
                                          Responsive.getResponsiveText(context),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.07 * Responsive.getHeight(context),
                            ),
                            Container(
                              child: CustomSegmentedProgressBar(
                                totalSegments: 4,
                                percentComplete: 90,
                                gradientColors: [
                                  AppTheme.getColor(context).primary,
                                  AppTheme.getColor(context).tertiary,
                                  AppTheme.getColor(
                                    context,
                                  ).onTertiaryContainer,
                                  AppTheme.getColor(context).tertiary,
                                  AppTheme.getColor(context).primary,
                                ],
                              ),
                            ),
                            CustomText(
                              "Profile Completion",
                              color: AppTheme.getColor(context).primary,
                              fontSize:
                                  16 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 0.01 * Responsive.getHeight(context),
                            ),
                            Container(
                              width: 0.9 * Responsive.getWidth(context),
                              child: Divider(
                                color: AppTheme.getColor(context).onTertiary,
                              ),
                            ),
                            Row(
                              spacing: 0.015 * Responsive.getWidth(context),
                              children: [
                                SvgPicture.asset(
                                  "assets/dashboard/svgs/call-calling.svg",
                                ),
                                CustomText(
                                  "+91 9909945983",
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      16 *
                                      Responsive.getResponsiveText(context),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.005 * Responsive.getHeight(context),
                            ),
                            Row(
                              spacing: 0.015 * Responsive.getWidth(context),
                              children: [
                                SvgPicture.asset(
                                  "assets/dashboard/svgs/sms.svg",
                                ),
                                CustomText(
                                  "Mukund@yopmail.com",
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      16 *
                                      Responsive.getResponsiveText(context),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.02 * Responsive.getHeight(context),
                            ),
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
                    ),
                    CommonCard(
                      title: "Reporting Person",
                      bottomWidget: Row(children: [CustomTaskWidget()]),
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 14 * Responsive.getResponsive(context),
                    //   ),
                    //   height: 0.05 * Responsive.getHeight(context),
                    //   width: 0.9 * Responsive.getWidth(context),
                    //   decoration: BoxDecoration(
                    //     color: AppTheme.getColor(context).secondary,
                    //     borderRadius: BorderRadius.circular(
                    //       10 * Responsive.getResponsive(context),
                    //     ),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       CustomText(
                    //         "Personal Info",
                    //         color: AppTheme.getColor(context).onPrimary,
                    //         fontSize: 17 * Responsive.getResponsiveText(context),
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //       ClipRRect(
                    //           borderRadius: BorderRadiusGeometry.circular(10*Responsive.getResponsive(context)),
                    //           child: Image.asset("assets/gifs/profile_info.gif",height: 0.035*Responsive.getHeight(context),))
                    //     ],
                    //   ),
                    // ),
                    CustomLabelGifs(
                      title: 'Personal Info',
                      gifAssetPath: 'assets/gifs/profile_info.gif',
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
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
                          border: Border.all(),
                        ),
                        child: CustomShadowContainer(
                          image: Image.asset(
                            "assets/dashboard/person_photo.png",
                          ),
                          title: "hello",
                          containerHeight: 0.08 * Responsive.getHeight(context),
                          titleStyle: TextStyle(
                            fontSize:
                                50 * Responsive.getResponsiveText(context),
                          ),
                        ),
                      ),
                    ),
                    CustomLabelGifs(
                      title: 'Work & Attendance',
                      gifAssetPath: 'assets/gifs/profile_work_attendance.gif',
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      shrinkWrap: true,
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
                          border: Border.all(),
                        ),
                        child: CustomShadowContainer(
                          image: Image.asset(
                            "assets/dashboard/person_photo.png",
                          ),
                          title: "hello",
                          containerHeight: 0.08 * Responsive.getHeight(context),
                          titleStyle: TextStyle(
                            fontSize:
                                50 * Responsive.getResponsiveText(context),
                          ),
                        ),
                      ),
                    ),
                    CustomLabelGifs(
                      title: 'Work & Attendance',
                      gifAssetPath:
                          'assets/gifs/profile_tool_support_setting.gif',
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
                          border: Border.all(),
                        ),
                        child: CustomShadowContainer(
                          image: Image.asset(
                            "assets/dashboard/person_photo.png",
                          ),
                          title: "hello",
                          containerHeight: 0.08 * Responsive.getHeight(context),
                          titleStyle: TextStyle(
                            fontSize:
                                50 * Responsive.getResponsiveText(context),
                          ),
                        ),
                      ),
                    ),
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
                    MyCoButton(
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      onTap: () {},
                      title: "APPLY RESIGNATION",
                      isShadowBottomLeft: true,
                    ),
                    Column(children: [CustomText("WWW.MY-COMPANY.APP",color: AppTheme.getColor(context).primary,decoration: TextDecoration.underline,fontWeight: FontWeight.bold,),
                      CustomText("What’s New",fontWeight: FontWeight.bold,color: AppTheme.getColor(context).primary,decoration: TextDecoration.underline,),
                      CustomText("V.211",fontWeight: FontWeight.bold),],),
                    SizedBox(height: 0.01*Responsive.getHeight(context),)
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
