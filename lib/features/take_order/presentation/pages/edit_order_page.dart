import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EditOrderPage extends StatelessWidget {
  const EditOrderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      backgroundColor: AppTheme.getColor(context).surface,
      leading: const BackButton(),
      // centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'Edit Order #241',
            fontSize: 20 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            'Mukund Madhav',
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).primary,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
        vertical: 0.01 * Responsive.getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Container
          Container(
            padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
            decoration: getCommonDecoration(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Item (1)',
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  'Units (25)',
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: 0.015 * Responsive.getWidth(context)),
                CustomText(
                  'Total: ₹20000',
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(height: 0.018 * Responsive.getHeight(context)),
          // Unit Container
          Container(
            decoration: getCommonDecoration(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Container(
                    decoration: getCommonDecoration(context),
                    child: Image.asset(
                      'assets/take_order/apple_image.png',
                      height: 0.045 * Responsive.getHeight(context),
                      width: 0.1 * Responsive.getWidth(context),
                    ),
                  ),
                  horizontalTitleGap: 0.01 * Responsive.getWidth(context),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Appy Fizz (Apple)',
                        fontSize: 12 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w700,
                        color: AppTheme.getColor(context).primary,
                      ),
                      SizedBox(height: 0.01 * Responsive.getHeight(context)),
                      CustomText(
                        'Available Stocks : 9989',
                        fontSize: 12 * Responsive.getResponsiveText(context),
                        color: AppTheme.getColor(context).secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 0.01 * Responsive.getHeight(context)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6 * Responsive.getResponsive(context),
                              vertical: 1 * Responsive.getResponsive(context),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.getColor(context).outline,
                              ),
                              borderRadius: BorderRadius.circular(
                                8 * Responsive.getResponsive(context),
                              ),
                              color: AppColors.lightTeal,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/take_order/message-edit.png',
                                  fit: BoxFit.cover,
                                  height: 0.015 * Responsive.getHeight(context),
                                ),
                                SizedBox(
                                  width: 0.02 * Responsive.getWidth(context),
                                ),
                                CustomText(
                                  '25 Units',
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 0.01 * Responsive.getWidth(context)),
                          Image.asset(
                            'assets/take_order/xcircle.png',
                            width: 0.06 * Responsive.getWidth(context),
                            height: 0.025 * Responsive.getHeight(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * Responsive.getWidth(context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Piece Wise(25 * ₹80.0)',
                        fontSize: 13 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        '₹2000.0',
                        fontSize: 13 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getColor(context).primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.008 * Responsive.getHeight(context)),
              ],
            ),
          ),

          SizedBox(height: 0.01 * Responsive.getHeight(context)),
          // Shipping Charges Card
          DistributorCard(
            headerHeight: 0.04 * Responsive.getHeight(context),
            title: 'Shipping Charges',
            isButton: true,
            buttonText: '₹Add',
            bottomWidget: Padding(
              padding: EdgeInsets.all(10.0 * Responsive.getResponsive(context)),
              child: CustomText(
                'Amount cannot Exceed 1,00,000',
                fontSize: 13 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          // Total Amount Container
          Container(
            padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
            decoration: getCommonDecoration(context),
            child: Column(
              children: [
                getTotalAmountRow(
                  context,
                  leftText: 'Total',
                  rightText: '₹2000.0',
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
                getTotalAmountRow(
                  context,
                  leftText: 'Shipping Charges',
                  rightText: '₹00.0',
                ),
                const Divider(),
                getTotalAmountRow(
                  context,
                  leftText: 'Grand Total',
                  rightText: '₹2000.0',
                  textColor: AppTheme.getColor(context).primary,
                ),
              ],
            ),
          ),
          const Spacer(),
          MyCoButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Update Order',
            width: Responsive.getWidth(context),
            height: 0.055 * Responsive.getHeight(context),
            boarderRadius: 30 * Responsive.getResponsive(context),
            textStyle: TextStyle(
              color: AppColors.white,
              fontSize: 18 * Responsive.getResponsiveText(context),
            ),
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );

  Row getTotalAmountRow(
    BuildContext context, {
    required String leftText,
    required String rightText,
    Color textColor = AppColors.black,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        leftText,
        fontSize: 15 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      CustomText(
        rightText,
        fontSize: 15 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ],
  );
  BoxDecoration getCommonDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: AppTheme.getColor(context).outline),
    borderRadius: BorderRadius.circular(12 * Responsive.getResponsive(context)),
    color: AppTheme.getColor(context).onPrimary,
  );
}
