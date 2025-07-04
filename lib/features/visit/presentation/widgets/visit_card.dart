import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Stack(
            children: [
              Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                elevation: 3.0,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenHeight * 0.015),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).primary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        visit['title'],
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16 * multiplier,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          SvgPicture.asset('assets/visit/svgs/calendar.svg',height: 0.025 * screenHeight,width: 0.025 * screenWidth),
                          const SizedBox(width: 4),
                          Expanded(
                            child: CustomText(
                              visit['time'],
                              fontSize: 13 * multiplier,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withAlpha(76),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Status + View Details
          SizedBox(height: screenHeight * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: MyCoButton(
                  onTap: () {},
                  title: visit['status'] ?? '',
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(
                    color: statusColor,
                    fontSize: 13 * multiplier,
                    fontWeight: FontWeight.w400,
                  ),
                  boarderRadius: 20,
                  borderColor: statusColor,
                  borderWidth: 1,
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.35,
                  wantBorder: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.03),
                child: MyCoButton(
                  onTap: () {},
                  title: 'View Details',
                  backgroundColor: AppTheme.getColor(context).primary,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13 * multiplier,
                    fontWeight: FontWeight.w400,
                  ),
                  boarderRadius: 20,
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.35,
                  wantBorder: false,
                  isShadowBottomLeft: true,
                ),
              ),
            ],
          ),

          // Visit Details using getCommonRow
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.015),
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


                // Reschedule Visit
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
                        if (visit['showWhatsapp'] == true) ...[
                          SvgPicture.asset('assets/visit/svgs/whatsapp.svg',height: 0.025 * screenHeight,width: 0.025 * screenWidth,),
                          SizedBox(width: screenWidth * 0.03),
                        ],
                        if (visit['showShare'] == true) ...[
                          SvgPicture.asset('assets/visit/svgs/share.svg',height: 0.025 * screenHeight,width: 0.025 * screenWidth,),
                          SizedBox(width: screenWidth * 0.03),
                        ],
                        if (visit['showDelete'] == true)
                          SvgPicture.asset('assets/visit/svgs/delete.svg',height: 0.025 * screenHeight,width: 0.025 * screenWidth,),
                      ],
                    ),

                  ],
                ),

                // End Visit Info (if already sent)
                if (visit['isSeventhContainer'] == true && visit['isEighthContainer'] != true) ...[
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'You Already Have sent End Visit Request',
                        fontWeight: FontWeight.w600,
                        fontSize: 14 * multiplier,
                        color: AppColors.primary,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14 * multiplier,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Requested On : ',
                              style: TextStyle(color: AppColors.black),
                            ),
                            TextSpan(
                              text: '03:58 PM , 03 Jun 2025',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Buttons (End Visit, Take Order, etc.)
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              children: [
                if (index == 2 || index == 3) ...[
                  Row(
                    children: [
                      Expanded(
                        child: MyCoButton(
                          onTap: () {},
                          height: screenHeight * 0.040,
                          boarderRadius: 40,
                          backgroundColor: Util.instance.applyOpacity(AppColors.red, 0.1),
                          isShadowBottomLeft: true,
                          title: 'END VISIT',
                          textStyle: TextStyle(
                            color: AppColors.red,
                            fontSize: 13.5 * multiplier,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: const StadiumBorder(),
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.014),
                          ),
                          onPressed: () {},
                          child: CustomText(
                            'TAKE ORDER',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5 * multiplier,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
                if (visit['isSeventhContainer'] != true)
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.05,
                    child: MyCoButton(
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
                  ),
              ],
            ),
          ),

          // Rejection Info (if 8th container)
          if (visit['isEighthContainer'] == true)
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: screenHeight * 0.01),

                  getCommonRow(
                    context,
                    title: 'Date',
                    value: '03:58 PM , 03 Jun 2025',
                    onTap: () {},
                    textColor:AppTheme.getColor(context).onSurface,
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  getCommonRow(
                    context,
                    title: 'Reason',
                    value: 'There were lots of missing data here',
                    onTap: () {},
                    textColor: AppTheme.getColor(context).onSurface,
                  ),
                ],
              ),
            )

        ],
      ),
    ),
  );
}
