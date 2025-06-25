import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_timer.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/myTeamCard.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: CustomPaint(
      size: Size(390, 73),
      painter: RPSCustomPainter(),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      backgroundColor: AppTheme.getColor(context).primary,
      child: Icon(Icons.add, color: AppColors.white),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    backgroundColor: AppTheme.getColor(context).surface,

    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          ColorRange(4, 6, Color(0xffFDB913)),
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
                            onTap: () {},
                            title: 'title',
                            textStyle: AppTheme.getTextStyle(
                              context,
                            ).titleMedium,
                            height: 0.18 * getWidth(context),
                            width: 0.4 * getWidth(context),
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).secondary,
                          ),
                          MyCoButton(
                            onTap: () {},
                            title: 'title',
                            height: 0.18 * getWidth(context),
                            width: 0.4 * getWidth(context),
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // TODO: Add your feature widgets here
            // Example:
            // MyCustomButton(),
            // FeatureCard(),
            // InputFieldPreview(),

            // MyTeamCard(),
            MyCoButton(onTap: () {}, title: 'title'),
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
