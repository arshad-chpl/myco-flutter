import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/reschedule_visit_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/end_visit_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/start_visit_bottom_sheet.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Widget buildVisitCard(
    BuildContext context,
    Map<String, dynamic> visit,
    int index,
    Size screenSize,
    int totalLength,
    ) {
  final bool showExtraButtons = visit['showExtraButtons'] == true;
  final bool showStartedVisit = visit['showStartedVisit'] == true;
  final String statusText = visit['status']?.toString().toLowerCase() ?? '';
  final Color statusColor = statusText == 'visit started'
      ? AppTheme.getColor(context).secondary
      : AppColors.spanishYellow;

  final bool isSixthContainer = visit['isSixthContainer'] == true;

  return Padding(
    padding: EdgeInsets.only(bottom: Responsive.getHeight(context) * 0.02),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.8),
      ),
        child: CommonCard(
          title: visit['title'],
          borderRadius: 12.8,
          suffixIcon: index >= totalLength - 5
              ? SvgPicture.asset(
            'assets/visit/svgs/refresh.svg',
          )
              : null,
          subTitle: visit['time'],
          subTitleIcon: SvgPicture.asset(
            'assets/visit/svgs/calendar.svg',
          ),
          onTap: () {},
          headerColor: AppTheme.getColor(context).primary,
          borderColor: AppTheme.getColor(context).outline,
          showBlackShadowInChild: true,
          bottomWidget: Padding(
            padding: EdgeInsets.all(Responsive.getWidth(context) * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status + View Details
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: MyCoButton(
                        onTap: () {},
                        title: visit['status'] ?? '',
                        backgroundColor: Colors.transparent,
                        textStyle: TextStyle(
                          color: statusColor,
                          fontSize: 13 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        boarderRadius: 40,
                        borderColor: statusColor,
                        borderWidth: 1,
                      ),
                    ),
                    SizedBox(width: Responsive.getWidth(context) * 0.25),
                    Expanded(
                      child: MyCoButton(
                        onTap: () {},
                        title: 'View Details',
                        backgroundColor: AppTheme.getColor(context).primary,
                        textStyle: TextStyle(
                          color: AppTheme.getColor(context).onPrimary,
                          fontSize: 13 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        boarderRadius: 40,
                        wantBorder: false,
                        isShadowBottomLeft: true,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: Responsive.getHeight(context) * 0.02),

                // details
                ...visit['details'].entries.map((e) {
                  final key = e.key.trim();
                  final value = e.value.toString();
                  final lowerKey = key.toLowerCase();

                  Color valueColor = AppTheme.getColor(context).onSurface;
                  if (lowerKey == 'visit status') {
                    valueColor = value.toLowerCase() == 'approved'
                        ? AppTheme.getColor(context).secondary
                        : AppColors.spanishYellow;
                  } else if (lowerKey == 'visit') {
                    valueColor = AppColors.textGray;
                  }

                  return getCommonRow(
                    context,
                    title: key,
                    value: value,
                    textColor: valueColor,
                    onTap: () {},
                    showMap: lowerKey == 'address' && visit['showImage'] == true,
                  );
                }).toList(),

                SizedBox(height: 0.020 * Responsive.getHeight(context),),
                // Reschedule Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RescheduleVisitPage(),
                          ),
                        );
                      },
                      child: CustomText(
                        'Reschedule Visit?',
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        color: AppTheme.getColor(context).primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.getColor(context).primary,
                      ),
                    ),

                    Row(
                      children: [
                        if (visit['showWhatsapp'] == true)
                          ...[
                            SvgPicture.asset('assets/visit/svgs/whatsapp.svg'),
                            SizedBox(width: Responsive.getWidth(context) * 0.03),
                          ],
                        if (visit['showShare'] == true)
                          ...[
                            SvgPicture.asset('assets/visit/svgs/share.svg'),
                            SizedBox(width: Responsive.getWidth(context) * 0.03),
                          ],
                        if (visit['showDelete'] == true)
                          SvgPicture.asset('assets/visit/svgs/delete.svg'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: Responsive.getHeight(context) * 0.02),

                // Buttons
                if (index == 2 || index == 3)
                  Row(
                    children: [
                      Expanded(
                        child: MyCoButton(
                          onTap: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            ),
                            builder: (_) => const EndVisitBottomSheet(),
                          ),
                          boarderRadius: 40,
                          backgroundColor: Util.applyOpacity(AppColors.red, 0.1),
                          isShadowBottomLeft: true,
                          title: 'END VISIT',
                          textStyle: TextStyle(
                            color: AppColors.red,
                            fontSize: 13.5 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: Responsive.getWidth(context) * 0.040),
                      Expanded(
                        child: MyCoButton(
                          onTap: () {},
                          title: 'TAKE ORDER',
                          backgroundColor: AppTheme.getColor(context).primary,
                          boarderRadius: 40,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5 * Responsive.getResponsiveText(context),
                          ),
                          isShadowBottomLeft: true,
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: Responsive.getHeight(context) * 0.02),

                if (isSixthContainer && index == 5)
                  Padding(
                    padding: EdgeInsets.only(bottom: Responsive.getHeight(context) * 0.008),
                    child: Center(
                      child: CustomText(
                        'Visit Not Ended, Forgot to end Visit',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getColor(context).primary,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                if (visit['isSeventhContainer'] != true)
                  MyCoButton(
                    onTap: () {
                      if (!showExtraButtons && !isSixthContainer) {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: AppTheme.getColor(context).onPrimary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => startVisitBottomSheet(context),
                        );
                      }
                    },
                    title: isSixthContainer
                        ? 'ADD REQUEST TO END VISIT'
                        : showExtraButtons
                        ? (visit['hideOrderButtons'] != true && showStartedVisit
                        ? 'ADD REQUEST TO END VISIT'
                        : 'ADD EXPENSES')
                        : 'START VISIT',
                    backgroundColor: AppTheme.getColor(context).secondary,
                    textStyle: TextStyle(
                      color: AppTheme.getColor(context).onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                    ),
                    boarderRadius: 30,
                    wantBorder: false,
                    isShadowBottomLeft: true,
                  ),

                // Rejection Message
                if (visit['isEighthContainer'] == true) ...[
                  SizedBox(height: Responsive.getHeight(context) * 0.03),
                  CustomText(
                    'End Visit Request',
                    fontWeight: FontWeight.w600,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                  ),
                  SizedBox(height: Responsive.getHeight(context) * 0.015),
                  getCommonRow(
                    context,
                    title: 'Rejected By',
                    value: 'vatsal soni (UIUX Designer)',
                    textColor: AppTheme.getColor(context).onSurface,
                    onTap: () {},
                  ),
                  getCommonRow(
                    context,
                    title: 'Date',
                    value: '03:58 PM , 03 Jun 2025',
                    textColor: AppTheme.getColor(context).onSurface,
                    onTap: () {},
                  ),
                  getCommonRow(
                    context,
                    title: 'Reason',
                    value: 'There were lots of missing data here',
                    textColor: AppTheme.getColor(context).onSurface,
                    onTap: () {},
                  ),
                ],
              ],
            ),
          ),
        )
    ),
  );
}