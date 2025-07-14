import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';

class ProfileWordAttendanceCard extends StatelessWidget {
  ProfileWordAttendanceCard({super.key});

  List svgList = [
    "assets/dashboard/svgs/attendance_face.svg",
    "assets/dashboard/svgs/shift_details.svg",
    "assets/dashboard/svgs/local_attendance.svg",
    "assets/dashboard/svgs/my_travel_summary.svg",
    "assets/dashboard/svgs/my_transaction.svg",
    "assets/dashboard/svgs/admin_view.svg",
  ];

  @override
  Widget build(BuildContext context) => Column(
    spacing: 0.015 * Responsive.getHeight(context),
    children: [
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
            border: Border.all(
              color: AppTheme.getColor(context).outlineVariant,
            ),
          ),
          child: CustomShadowContainer(
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
