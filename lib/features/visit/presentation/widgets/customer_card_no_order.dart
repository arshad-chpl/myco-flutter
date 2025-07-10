import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/get_common_row.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerCardNoOrder extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardNoOrder({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final multiplier = getResponsiveText(context);
    final theme = AppTheme.getColor(context);

    return CommonCard(
      title: 'Ganesh Auto Garage (RT4982)',
      suffixIcon: SizedBox(
        height: 32 * multiplier,
        width: 110 * multiplier,
        child: MyCoButton(
          onTap: () {},
          title: 'No Order',
          backgroundColor: AppColors.primary,
          textStyle: TextStyle(
            color: theme.onPrimary,
            fontSize: 12 * multiplier,
            fontWeight: FontWeight.w600,
          ),
          boarderRadius: 30,
          borderColor: theme.onPrimary,
          wantBorder: false,
        ),
      ),
      onTap: onTap,
      headerColor: AppTheme.getColor(context).primary,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget: CardBottomContent(multiplier: multiplier, isOrderNow: false),
    );
  }
}

class CustomerCardOrderNow extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardOrderNow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final multiplier = getResponsiveText(context);

    return CommonCard(
      title: 'Ganesh Auto Garage (RT4982)',
      onTap: onTap,
      suffixIcon: SizedBox(
        height: 32 * multiplier,
        width: 110 * multiplier,
        child: MyCoButton(
          onTap: () {},
          title: 'Order Taken',
          backgroundColor: AppColors.secondary,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 12 * multiplier,
            fontWeight: FontWeight.w600,
          ),
          boarderRadius: 30,
          borderColor: AppColors.white,
          wantBorder: false,
        ),
      ),
      headerColor: AppTheme.getColor(context).secondary,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget: CardBottomContent(multiplier: multiplier, isOrderNow: true),
    );

  }
}

class CustomerCardOnlyVisit extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomerCardOnlyVisit({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final multiplier = getResponsiveText(context);

    return CommonCard(
      title: 'Ganesh Auto Garage (RT4982)',
      suffixIcon: SizedBox(
        height: 32 * multiplier,
        width: 110 * multiplier,
        child: MyCoButton(
          onTap: () {},
          title: 'Only Visit',
          backgroundColor: AppColors.spanishYellow,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 12 * multiplier,
            fontWeight: FontWeight.w600,
          ),
          boarderRadius: 30,
          borderColor: AppColors.white,
          wantBorder: false,
        ),
      ),
      onTap: onTap,
      headerColor: AppColors.spanishYellow,
      borderColor: AppTheme.getColor(context).outline,
      bottomWidget: CardBottomContent(multiplier: multiplier, isOnlyVisit: true),
    );
  }
}

class CardBottomContent extends StatefulWidget {
  final double multiplier;
  final bool isOrderNow;
  final bool isOnlyVisit;

  const CardBottomContent({
    required this.multiplier, super.key,
    this.isOrderNow = false,
    this.isOnlyVisit = false,
  });

  @override
  State<CardBottomContent> createState() => _CardBottomContentState();
}

class _CardBottomContentState extends State<CardBottomContent> {
  bool isExpanded = false;

  void toggleExpand() {
    if (!widget.isOrderNow && !widget.isOnlyVisit) {
      setState(() {
        isExpanded = !isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNoOrder = !widget.isOrderNow && !widget.isOnlyVisit;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(12 * getResponsive(context)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 600;

          return Column(
            children: [
              // Main Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(16 * getResponsive(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 16 * widget.multiplier,
                                color: AppTheme.getColor(context).onSurface,
                              ),
                              children: const [
                                TextSpan(
                                  text: 'Category : ',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                TextSpan(
                                  text: 'CHPL',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8 * getResponsive(context)),
                          Row(
                            children: [
                              SvgPicture.asset('assets/visit/svgs/profile-circle.svg',
                                  height: 20 * getResponsive(context)),
                              SizedBox(width: 8 * getResponsive(context)),
                              CustomText(
                                'Yash Soni',
                                fontSize: 18 * widget.multiplier,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 8 * getResponsive(context)),
                          Row(
                            children: [
                              SvgPicture.asset('assets/visit/svgs/call-calling.svg',
                                  height: 18 * getResponsive(context)),
                              SizedBox(width: 8 * getResponsive(context)),
                              CustomText(
                                '+91 9909945983',
                                fontSize: 14 * widget.multiplier,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                          SizedBox(height: 8 * getResponsive(context)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/visit/svgs/location.svg',
                                  height: 18 * getResponsive(context)),
                              SizedBox(width: 8 * getResponsive(context)),
                              Expanded(
                                child: CustomText(
                                  '101, Sanand - Sarkhej Rd, Makarba, Ahmedabad...',
                                  fontSize: 12 * widget.multiplier,
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

                  SizedBox(width: 12 * getResponsive(context)),

                  // Right Column (Flexible to avoid overflow)
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12 * getResponsive(context)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/visit/svgs/map.svg',
                                  height: 50, width: 50),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText('333.04 Km',
                                        fontSize: 14 * widget.multiplier,
                                        fontWeight: FontWeight.w700),
                                    const SizedBox(height: 4),
                                    CustomText('(Air Distance)',
                                        fontSize: 14 * widget.multiplier),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (widget.isOrderNow)
                            Padding(
                              padding: const EdgeInsets.only(right: 10, bottom: 35),
                              child: SvgPicture.asset('assets/visit/svgs/cart_no.svg',
                                  height: 32, width: 32),
                            )
                          else if (!widget.isOnlyVisit)
                            Padding(
                              padding: const EdgeInsets.only(right: 10, bottom: 10),
                              child: SvgPicture.asset('assets/visit/svgs/cart.svg',
                                  height: 32, width: 32),
                            ),

                          /// Tapable Last Visit History
                          GestureDetector(
                            onTap: toggleExpand,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(right: 10, top: 12, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    'Last Visit History',
                                    fontSize: 13 * widget.multiplier,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                  const SizedBox(width: 6),
                                  SvgPicture.asset(
                                    isNoOrder
                                        ? (isExpanded
                                        ? 'assets/visit/svgs/CaretCircleDown.svg'
                                        : 'assets/visit/svgs/CaretCircleUp.svg')
                                        : 'assets/visit/svgs/CaretCircleUp.svg',
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /// Blue Expanded Detail Section
              if (isNoOrder && isExpanded) ...[
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppTheme.getColor(context).primary,
                ),
                Container(
                  width: double.infinity,
                  color: const Color(0xFFEEF7FD),
                  padding: EdgeInsets.all(16 * getResponsive(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCommonRow(context,
                          title: 'Last Order Date',
                          value: '02:21 PM, 25th Mar 2025',
                          onTap: () {},
                          textColor: AppTheme.getColor(context).primary),
                      const SizedBox(height: 12),
                      getCommonRow(context,
                          title: 'Last Visit Date',
                          value: '02:21 PM, 25th Mar 2025',
                          onTap: () {},
                          textColor: AppTheme.getColor(context).primary),
                      const SizedBox(height: 12),
                      getCommonRow(context,
                          title: 'Last Order Amount',
                          value: '1164.70',
                          onTap: () {},
                          textColor: AppTheme.getColor(context).primary),
                      const SizedBox(height: 12),
                      getCommonRow(context,
                          title: 'Last Visit By',
                          value: 'Manish Chandra (Tester)',
                          onTap: () {},
                          textColor: AppTheme.getColor(context).primary),
                      const SizedBox(height: 12),
                      getCommonRow(context,
                          title: 'Last Visit Remarks',
                          value: 'Done',
                          onTap: () {},
                          textColor: AppTheme.getColor(context).primary),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

Widget lastVisitHistoryRow(double multiplier) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      CustomText(
        'Last Visit History',
        fontSize: 15 * multiplier,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      const SizedBox(width: 6),
      SvgPicture.asset('assets/visit/svgs/CaretCircleDown.svg', height: 20, width: 20),
    ],
  );
