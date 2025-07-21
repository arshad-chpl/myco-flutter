import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CardBottomContent extends StatefulWidget {
  final bool isOrderNow;
  final bool isOnlyVisit;

  const CardBottomContent({
    super.key,
    this.isOrderNow = false,
    this.isOnlyVisit = false,
  });

  @override
  State<CardBottomContent> createState() => _CardBottomContentState();
}

class _CardBottomContentState extends State<CardBottomContent> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final responsiveHeight = Responsive.getHeight(context);
    final responsiveWidth = Responsive.getWidth(context);
    final textResponsive = Responsive.getResponsiveText(context);

    final isNoOrder = !widget.isOrderNow && !widget.isOnlyVisit;
    final colorTheme = AppTheme.getColor(context);

    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(12 * responsive),
      ),
      child: Container(
        color: AppTheme.getColor(context).surface,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Main Content Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Left Column (Customer Info)
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(16 * responsive),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              'category : ',
                              fontSize: 16 * textResponsive,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              LanguageManager().get('CHPL'),
                              fontSize: 14 * textResponsive,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.009 * responsiveHeight),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.profileCircle,
                              height: 0.020 * responsiveHeight,
                            ),
                            SizedBox(width: 8),
                            CustomText(
                              'Yash Soni',
                              fontSize: 18 * textResponsive,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.008 * responsiveHeight),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.callCalling,
                              height: 0.018 * responsiveHeight,
                            ),
                            SizedBox(width: 0.030 * responsiveWidth),
                            CustomText(
                              '+91 9909945983',
                              fontSize: 14 * textResponsive,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.010 * responsiveHeight),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              AppAssets.location,
                              height: 0.018 * responsiveHeight,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: CustomText(
                                '101, Sanand - Sarkhej Rd, Makarba, Ahmedabad...',
                                fontSize: 12 * textResponsive,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// Right Column (Distance & Cart icon)
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12 * responsive),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (isNoOrder)
                          Padding(
                            padding: EdgeInsets.only(
                              right: 10 * responsive,
                              bottom: 8 * responsive,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.cart,
                              height: 0.035 * responsiveHeight,
                              width: 0.035 * responsiveWidth,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(left: 50 * responsive),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.map,
                                height: 0.035 * responsiveHeight,
                                width: 0.035 * responsiveWidth,
                              ),
                              SizedBox(width: 0.006 * responsiveWidth),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    '333.04 Km',
                                    fontSize: 14 * textResponsive,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 0.0001 * responsiveHeight),
                                  CustomText(
                                    '(Air Distance)',
                                    fontSize: 12 * textResponsive,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (widget.isOrderNow && !widget.isOnlyVisit)
                          Padding(
                            padding: EdgeInsets.only(
                              right: 10 * responsive,
                              top: 10 * responsive,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.cart_no,
                              height: 0.035 * responsiveHeight,
                              width: 0.035 * responsiveWidth,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            /// Last Visit History
            GestureDetector(
              onTap: toggleExpand,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 10 * responsive,
                  bottom: 10 * responsive,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      'last_visit_history',
                      isKey: true,
                      fontSize: 13 * textResponsive,
                      fontWeight: FontWeight.w600,
                      color: colorTheme.primary,
                    ),
                    SizedBox(width: 0.020 * responsiveWidth),
                    SvgPicture.asset(
                      isNoOrder
                          ? (isExpanded
                                ? AppAssets.CaretCircleDown
                                : AppAssets.CaretCircleUp)
                          : AppAssets.CaretCircleUp,
                      height: 0.016 * responsiveHeight,
                      width: 0.016 * responsiveWidth,
                    ),
                  ],
                ),
              ),
            ),

            /// Expanded Last Visit Info
            if (isExpanded)
              Column(
                children: [
                  Divider(
                    color: colorTheme.primary,
                    height: 0.001 * responsiveHeight,
                  ),
                  Container(
                    width: double.infinity,
                    color: colorTheme.surfaceContainer,
                    padding: EdgeInsets.all(16 * responsive),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCommonRow(
                          context,
                          title: 'Last Order Date',
                          value: '02:21 PM, 25th Mar 2025',
                          onTap: () {},
                          textColor: colorTheme.primary,
                        ),
                        SizedBox(height: 0.012 * responsiveHeight),
                        getCommonRow(
                          context,
                          title: 'Last Visit Date',
                          value: '02:21 PM, 25th Mar 2025',
                          onTap: () {},
                          textColor: colorTheme.primary,
                        ),
                        SizedBox(height: 0.012 * responsiveHeight),
                        getCommonRow(
                          context,
                          title: 'Last Order Amount',
                          value: '1164.70',
                          onTap: () {},
                          textColor: colorTheme.primary,
                        ),
                        SizedBox(height: 0.012 * responsiveHeight),
                        getCommonRow(
                          context,
                          title: 'Last Visit By',
                          value: 'Manish Chandra (Tester)',
                          onTap: () {},
                          textColor: colorTheme.primary,
                        ),
                        SizedBox(height: 0.012 * responsiveHeight),
                        getCommonRow(
                          context,
                          title: 'Last Visit Remarks',
                          value: 'Done',
                          onTap: () {},
                          textColor: colorTheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
