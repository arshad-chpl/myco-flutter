import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OrderSummaryPage extends StatelessWidget {
  final bool isRepeatOrder;
  const OrderSummaryPage({super.key, this.isRepeatOrder = false});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Order Summary'),
          CustomText(
            'Order Summary',
            fontSize: 20 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
          CustomText(
            'Mukund Madhav',
            fontSize: 18 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    ),
    body: Container(
      height: Responsive.getHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
        vertical: 0.01 * Responsive.getHeight(context),
      ),
      child: SingleChildScrollView(
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
              // padding: EdgeInsets.symmetric(
              //   vertical: 8 * Responsive.getResponsive(context),
              // ),
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
                                horizontal:
                                    6 * Responsive.getResponsive(context),
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
                                    height:
                                        0.015 * Responsive.getHeight(context),
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
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 0.01 * Responsive.getWidth(context),
                            ),
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
              onTap: () {
                print('shipping');
              },
              buttonText: '₹Add',
              bottomWidget: Padding(
                padding: EdgeInsets.all(
                  10.0 * Responsive.getResponsive(context),
                ),
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
            SizedBox(height: 0.015 * Responsive.getHeight(context)),
            // Remark Section
            CustomText(
              'Remark',
              fontWeight: FontWeight.w700,
              fontSize: 13 * Responsive.getResponsiveText(context),
            ),
            SizedBox(height: 0.005 * Responsive.getHeight(context)),
            Container(
              height: 0.115 * Responsive.getHeight(context),
              decoration: BoxDecoration(
                // color: AppTheme.getColor(context).onPrimary,
                border: Border.all(color: AppTheme.getColor(context).outline),
                borderRadius: BorderRadius.circular(
                  12 * Responsive.getResponsive(context),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.03 * Responsive.getWidth(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 0.01 * Responsive.getHeight(context),
                    ),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.022 * Responsive.getHeight(context),
                    ),
                  ),
                  SizedBox(width: 0.03 * Responsive.getWidth(context)),
                  Expanded(
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        hintStyle: TextStyle(
                          color: AppTheme.getColor(context).outline,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.015 * Responsive.getHeight(context)),
            // Distributor Card
            DistributorCard(
              title: 'Distributor',
              isButton: true,
              buttonText: 'Change',
              onTap: () {
                context.pushNamed('all-distributor');
              },
              bottomWidget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * Responsive.getResponsive(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 0.01 * Responsive.getWidth(context),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Mukund (M77)',
                            fontWeight: FontWeight.w600,
                            fontSize:
                                16 * Responsive.getResponsiveText(context),
                          ),
                          Transform.scale(
                            scale: 0.7,
                            child: Radio(
                              value: true,
                              groupValue: '',
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.0 * Responsive.getResponsive(context),
                      ),
                      child: CustomText(
                        'Contact Person :  Manish ( +91 7980239236 )',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  ],
                ),
              ),
            ),
            // Buttons
            SizedBox(height: 0.03 * Responsive.getHeight(context)),
            isRepeatOrder
                ? MyCoButton(
                    onTap: () {
                      context.pushNamed('order-history');
                    },
                    title: 'Place Order',
                    // width: 0.4 * Responsive.getWidth(context),
                    height: 0.055 * Responsive.getHeight(context),
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    textStyle: AppTheme.getTextStyle(context).headlineSmall!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                  )
                : SideBySideButtons(
                    button1Name: 'Add More',
                    button2Name: 'Place Order',
                    onTap1: () {},
                    onTap2: () {
                      context.pushNamed('order-history');
                    },
                  ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );

  Row getTotalAmountRow(
    BuildContext context, {
    required String leftText,
    required String rightText,
    Color? textColor,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        leftText,
        fontSize: 15 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w600,
        color: textColor ?? AppTheme.getColor(context).onSurface,
      ),
      CustomText(
        rightText,
        fontSize: 15 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w500,
        color: textColor ?? AppTheme.getColor(context).onSurface,
      ),
    ],
  );

  BoxDecoration getCommonDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: AppTheme.getColor(context).outline),
    borderRadius: BorderRadius.circular(12 * Responsive.getResponsive(context)),
    // color: AppTheme.getColor(context).onPrimary,
  );
}
