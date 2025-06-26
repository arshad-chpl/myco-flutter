import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_timer.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/myTeamCard.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_stepper.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    backgroundColor: AppTheme.getColor(context).surface,

    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // AppBar
            DashboardAppBar(),

            BorderContainerWraper(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('text'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTimer(
                        timerHeight: 0.43 * getWidth(context),
                        timerWidth: 0.43 * getWidth(context),
                        maxMinutes: 10,
                        minutesPerSegment: 2,
                        strokeWidth: 25,
                        sectionGap: 2,
                        primaryColor: [
                          AppTheme.getColor(context).primary,
                          AppTheme.getColor(context).secondary,
                        ],
                        backgroundColor: AppColors.white,
                        colorRanges: [
                          ColorRange(4, 6, AppColors.spanishYellow),
                          ColorRange(1, 2, Color(0xff2F648E)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          // CustomText('text'),
                          // CustomText('text'),
                          MyCoButton(
                            title: 'Punch Out',
                            onTap: () {},
                            height: 0.18 * getWidth(context),
                            width: 0.4 * getWidth(context),

                            image: SvgPicture.asset(AppAssets.punchIn),
                            spacing: 50 * getResponsiveOnWidth(context),
                            imagePosition: AxisDirection.right,
                            textStyle: TextStyle(
                              fontFamily: Util.getFontFamily(FontWeight.w600),
                              fontSize: 22 * getResponsiveText(context),
                              color: AppTheme.getColor(context).onSecondary,
                            ),
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).secondary,
                            isShadowTopLeft: true,
                            wantBorder: false,
                          ),
                          MyCoButton(
                            onTap: () {},
                            title: 'My \nTimecard',
                            image: SvgPicture.asset(AppAssets.timeCardBtn),
                            spacing: 50 * getResponsiveOnWidth(context),
                            imagePosition: AxisDirection.right,
                            height: 0.18 * getWidth(context),
                            width: 0.4 * getWidth(context),
                            textStyle: TextStyle(
                              fontFamily: Util.getFontFamily(FontWeight.w600),
                              fontSize: 22 * getResponsiveText(context),
                              color: AppTheme.getColor(context).onSecondary,
                            ),
                            backgroundColor: AppTheme.getColor(context).primary,
                            isShadowTopLeft: true,
                            wantBorder: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                  MyCoButton(
                    onTap: () {},
                    title: 'Take A Break',
                    backgroundColor: AppTheme.getColor(context).secondary,
                    textStyle: TextStyle(
                      fontFamily: Util.getFontFamily(FontWeight.w600),
                      fontSize: 15 * getResponsiveText(context),
                      color: AppTheme.getColor(context).onSecondary,
                    ),
                    wantBorder: false,
                    isShadowBottomLeft: true,
                    boarderRadius: 100,
                  ),
                ],
              ),
            ),
            CustomSection(
              title: 'Quick Access',
              subtitle: 'All Your Work Related Tools.',
              icon: Image.asset(
                AppAssets.quickAccessGif,
                height: 70 * getResponsiveOnWidth(context),
              ),
              wantCount: true,
              count: '04',
              child: CustomShadowContainer(image: Container(), title: ' title'),
            ),
          ],
        ),
      ),
    ),
  );

  // Widget TextPreview(BuildContext context) {
  //   return Column(
  //     children: [
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w100),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w200),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w300),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w400),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w500),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w600),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w700),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w800),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w900),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  String getFontFamily(FontWeight fontWeight) {
    switch (fontWeight) {
      case FontWeight.w100:
        return 'Gilroy-Thin';
      case FontWeight.w200:
        return 'Gilroy-UltraLight';
      case FontWeight.w300:
        return 'Gilroy-Light';
      case FontWeight.w400:
        return 'Gilroy-Regular';
      case FontWeight.w500:
        return 'Gilroy-Medium';
      case FontWeight.w600:
        return 'Gilroy-SemiBold';
      case FontWeight.w700:
        return 'Gilroy-Bold';
      case FontWeight.w800:
        return 'Gilroy-ExtraBold';
      case FontWeight.w900:
        return 'Gilroy-Heavy';
      default:
        return 'Gilroy-Regular';
    }
  }
}
