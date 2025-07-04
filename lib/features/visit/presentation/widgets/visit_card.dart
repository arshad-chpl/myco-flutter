import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';


Widget buildVisitCard(
    BuildContext context,
    Map<String, dynamic> visit,
    int index,
    Size screenSize,
    ) {
  final bool showExtraButtons = visit['showExtraButtons'] == true;
  final bool showStartedVisit = visit['showStartedVisit'] == true;
  final String statusText = visit['status']?.toString().toLowerCase() ?? '';
  final Color statusColor = statusText == 'visit started'
      ? AppColors.secondary
      : AppColors.spanishYellow;

  final bool isSixthContainer = visit['isSixthContainer'] == true;
  final double multiplier = getResponsiveText(context);
  final double screenHeight = getHeight(context);
  final double screenWidth = getWidth(context);

  return Padding(
    padding: EdgeInsets.only(bottom: screenHeight * 0.02),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.8),
        border: Border.all(color: AppColors.textfieldBorder),
      ),
        child: CommonCard(
          title: visit['title'],
          subTitle: visit['time'],
          subTitleIcon: SvgPicture.asset(
            'assets/visit/svgs/calendar.svg',
          ),
          onTap: () {},
          headerColor: AppTheme.getColor(context).primary,
          borderColor: AppTheme.getColor(context).outline,
          showBlackShadowInChild: true,
          bottomWidget: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
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
                          fontSize: 13 * multiplier,
                          fontWeight: FontWeight.w400,
                        ),
                        boarderRadius: 40,
                        borderColor: statusColor,
                        borderWidth: 1,
                        wantBorder: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyCoButton(
                        onTap: () {},
                        title: 'View Details',
                        backgroundColor: AppTheme.getColor(context).primary,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 13 * multiplier,
                          fontWeight: FontWeight.w400,
                        ),
                        boarderRadius: 40,
                        wantBorder: false,
                        isShadowBottomLeft: true,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // details
                ...visit['details'].entries.map((e) {
                  final key = e.key.trim();
                  final value = e.value.toString();
                  final lowerKey = key.toLowerCase();

                  Color valueColor = AppColors.black;
                  if (lowerKey == 'visit status') {
                    valueColor = value.toLowerCase() == 'approved'
                        ? AppColors.secondary
                        : AppColors.spanishYellow;
                  } else if (lowerKey == 'visit') {
                    valueColor = AppColors.textGray;
                  }

                  return Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                    child: getCommonRow(
                      context,
                      title: key,
                      value: value,
                      textColor: valueColor,
                      onTap: () {},
                      showMap: lowerKey == 'address' && visit['showImage'] == true,
                    ),
                  );
                }).toList(),

                // Reschedule Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Reschedule Visit?',
                      fontWeight: FontWeight.w600,
                      fontSize: 14 * multiplier,
                      color: AppTheme.getColor(context).primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.getColor(context).primary,
                    ),
                    Row(
                      children: [
                        if (visit['showWhatsapp'] == true)
                          ...[
                            SvgPicture.asset('assets/visit/svgs/whatsapp.svg'),
                            SizedBox(width: screenWidth * 0.03),
                          ],
                        if (visit['showShare'] == true)
                          ...[
                            SvgPicture.asset('assets/visit/svgs/share.svg'),
                            SizedBox(width: screenWidth * 0.03),
                          ],
                        if (visit['showDelete'] == true)
                          SvgPicture.asset('assets/visit/svgs/delete.svg'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // Buttons
                if (index == 2 || index == 3)
                  Row(
                    children: [
                      Expanded(
                        child: MyCoButton(
                          onTap: () {},
                          boarderRadius: 40,
                          backgroundColor: Util.applyOpacity(AppColors.red, 0.1),
                          isShadowBottomLeft: true,
                          title: 'END VISIT',
                          textStyle: TextStyle(
                            color: AppColors.red,
                            fontSize: 13.5 * multiplier,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: MyCoButton(
                          onTap: () {},
                          title: 'TAKE ORDER',
                          backgroundColor: AppColors.primary,
                          boarderRadius: 40,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5 * multiplier,
                          ),
                          isShadowBottomLeft: true,
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: screenHeight * 0.02),

                if (visit['isSeventhContainer'] != true)
                  MyCoButton(
                    onTap: () {},
                    title: isSixthContainer
                        ? 'ADD REQUEST TO END VISIT'
                        : showExtraButtons
                        ? (visit['hideOrderButtons'] != true && showStartedVisit
                        ? 'ADD REQUEST TO END VISIT'
                        : 'ADD EXPENSES')
                        : 'START VISIT',
                    backgroundColor: AppColors.secondary,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * multiplier,
                    ),
                    boarderRadius: 30,
                    wantBorder: false,
                    isShadowBottomLeft: true,
                  ),

                // Rejection Message
                if (visit['isEighthContainer'] == true) ...[
                  SizedBox(height: screenHeight * 0.03),
                  CustomText(
                    'End Visit Request',
                    fontWeight: FontWeight.w600,
                    fontSize: 14 * multiplier,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  getCommonRow(
                    context,
                    title: 'Rejected By',
                    value: 'vatsal soni (UIUX Designer)',
                    onTap: () {},
                    textColor: AppTheme.getColor(context).onSurface,
                  ),
                  getCommonRow(
                    context,
                    title: 'Date',
                    value: '03:58 PM , 03 Jun 2025',
                    onTap: () {},
                    textColor: AppTheme.getColor(context).onSurface,
                  ),
                  getCommonRow(
                    context,
                    title: 'Reason',
                    value: 'There were lots of missing data here',
                    onTap: () {},
                    textColor: AppTheme.getColor(context).onSurface,
                  ),
                ],
              ],
            ),
          ),
        )

    ),
  );
}
