import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/bottom_sheet.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_slider.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_timer.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/face_detection_page.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget timerAndSlider(BuildContext context) =>
    // Responsive.getWidth(context) > 600
    //     ? Row(
    //         children: [
    //           punchInAndTimeCard(context: context),
    //           CustomSlider(
    //             width: Responsive.getWidth(context) / 2,
    //             imagePaths: [AppAssets.mycobanner, AppAssets.mycobanner1],
    //           ),
    //         ],
    //       )
    //     :
    Column(
      children: [
        punchInAndTimeCard(context: context),

        // CustomSlider
        const CustomSlider(
          imagePaths: [AppAssets.mycobanner, AppAssets.mycobanner1],
        ),
      ],
    );

Widget punchInAndTimeCard({required BuildContext context}) =>
    BorderContainerWraper(
      padding: EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12,
            children: [
              LiveClock(isAppBar: false),
              Spacer(),
              SvgPicture.asset(AppAssets.scanQR),
              SvgPicture.asset(AppAssets.refresh),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTimer(
                timerHeight: 150,
                timerWidth: 150,
                maxMinutes: 90,
                minutesPerSegment: 10,
                strokeWidth: 22,
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
                    onTap: () {
                      context.pushNamed('faceDetection');
                    },

                    // height: 0.18 * Responsive.getWidth(context),
                    width: 160,
                    height: 72,
                    image: SvgPicture.asset(AppAssets.punchIn),
                    spacing: 10,
                    imagePosition: AxisDirection.right,
                    textStyle: TextStyle(
                      fontFamily: Util.getFontFamily(FontWeight.w600),
                      fontSize: 22,
                      color: AppTheme.getColor(context).onSecondary,
                    ),
                    backgroundColor: AppTheme.getColor(context).secondary,
                    isShadowTopLeft: true,
                    wantBorder: false,
                  ),
                  MyCoButton(
                    onTap: () {},
                    title: 'My \nTimecard',
                    image: SvgPicture.asset(AppAssets.timeCardBtn),
                    spacing: 10,
                    imagePosition: AxisDirection.right,
                    width: 160,
                    height: 72,
                    textStyle: TextStyle(
                      fontFamily: Util.getFontFamily(FontWeight.w600),
                      fontSize: 22,
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
            onTap: () {
              showModalBottomSheet(
                context: context,
                clipBehavior: Clip.hardEdge,
                useSafeArea: true,
                // showDragHandle: true,
                builder: (context) => AnimatedBottomSheet(),
              );
            },
            title: 'Take A Break',
            backgroundColor: AppTheme.getColor(context).secondary,
            textStyle: TextStyle(
              fontFamily: Util.getFontFamily(FontWeight.w600),
              fontSize: 15 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSecondary,
            ),
            wantBorder: false,
            isShadowBottomLeft: true,
            boarderRadius: 100,
          ),
        ],
      ),
    );

class LiveClock extends StatefulWidget {
  final bool isAppBar;
  final double? fontSize;
  final FontWeight? fontWeight;
  // final Color? color;

  const LiveClock({
    super.key,
    required this.isAppBar,
    this.fontSize,
    this.fontWeight,
  });

  @override
  State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  late String _timeString;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat(
      widget.isAppBar ? 'dd-MM-yyyy hh:mm a' : 'hh:mm a dd-MM-yyyy',
    ).format(now);
    setState(() {
      _timeString = formattedTime;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomText(
      _timeString,
      fontSize: widget.fontSize ?? 13 * Responsive.getResponsiveText(context),
      fontWeight: widget.fontWeight ?? FontWeight.w500,
    );
}
