import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomerRightColumn extends StatelessWidget {
  final bool isOrderNow;
  final bool isOnlyVisit;
  final bool isNoOrder;
  final bool isExpanded;
  final VoidCallback toggleExpand;

  const CustomerRightColumn({
    super.key,
    required this.isOrderNow,
    required this.isOnlyVisit,
    required this.isNoOrder,
    required this.isExpanded,
    required this.toggleExpand,
  });

  @override
  Widget build(BuildContext context) => Flexible(
      flex: 2,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12 * Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Distance Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/visit/svgs/map.svg',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        '333.04 Km',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 4),
                      CustomText(
                        '(Air Distance)',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Cart Icon
            if (isOrderNow)
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 35),
                child: SvgPicture.asset(
                  AppAssets.cart_no,
                  height: 32,
                  width: 32,
                ),
              )
            else if (!isOnlyVisit)
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: SvgPicture.asset(
                  AppAssets.cart,
                  height: 32,
                  width: 32,
                ),
              ),

            // Toggle Last Visit History
            GestureDetector(
              onTap: toggleExpand,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      'Last Visit History',
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset(
                      isNoOrder
                          ? (isExpanded
                          ? AppAssets.CaretCircleDown
                          : AppAssets.CaretCircleUp)
                          : AppAssets.CaretCircleUp,
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
    );
}
