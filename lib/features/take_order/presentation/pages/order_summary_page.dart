import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OrderSummaryPage extends StatelessWidget {
  final bool isRepeatOrder;
  const OrderSummaryPage({super.key, this.isRepeatOrder = false});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      backgroundColor: AppTheme.getColor(context).surface,
      leading: const BackButton(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Order Summary'),
          const CustomText('Order Summary', fontWeight: FontWeight.w600),
          CustomText(
            'Mukund Madhav',
            fontSize: 18 * getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    ),
    body: Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.01 * getHeight(context),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Container
            Container(
              padding: EdgeInsets.all(10 * getResponsive(context)),
              decoration: getCommonDecoration(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Item (1)',
                    fontSize: 16 * getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    'Units (25)',
                    fontSize: 16 * getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 0.015 * getWidth(context)),
                  CustomText(
                    'Total: ₹20000',
                    fontSize: 16 * getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.018 * getHeight(context)),
            // Unit Container
            Container(
              // padding: EdgeInsets.symmetric(
              //   vertical: 8 * getResponsive(context),
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
                        height: 0.045 * getHeight(context),
                        width: 0.1 * getWidth(context),
                      ),
                    ),
                    horizontalTitleGap: 0.01 * getWidth(context),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Appy Fizz (Apple)',
                          fontSize: 12 * getResponsiveText(context),
                          fontWeight: FontWeight.w700,
                          color: AppTheme.getColor(context).primary,
                        ),
                        SizedBox(height: 0.01 * getHeight(context)),
                        CustomText(
                          'Available Stocks : 9989',
                          fontSize: 12 * getResponsiveText(context),
                          color: AppTheme.getColor(context).secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 0.01 * getHeight(context)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6 * getResponsive(context),
                                vertical: 1 * getResponsive(context),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.getColor(context).outline,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8 * getResponsive(context),
                                ),
                                color: AppColors.lightTeal,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/take_order/message-edit.png',
                                    fit: BoxFit.cover,
                                    height: 0.015 * getHeight(context),
                                  ),
                                  SizedBox(width: 0.02 * getWidth(context)),
                                  CustomText(
                                    '25 Units',
                                    fontSize: 12 * getResponsiveText(context),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 0.01 * getWidth(context)),
                            Image.asset(
                              'assets/take_order/xcircle.png',
                              width: 0.06 * getWidth(context),
                              height: 0.025 * getHeight(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.04 * getWidth(context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Piece Wise(25 * ₹80.0)',
                          fontSize: 13 * getResponsiveText(context),
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          '₹2000.0',
                          fontSize: 13 * getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.getColor(context).primary,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.008 * getHeight(context)),
                ],
              ),
            ),

            SizedBox(height: 0.01 * getHeight(context)),
            // Shipping Charges Card
            DistributorCard(
              headerHeight: 0.04 * getHeight(context),
              title: 'Shipping Charges',
              isButton: true,
              onTap: () {
                print('shipping');
              },
              buttonText: '₹Add',
              bottomWidget: Padding(
                padding: EdgeInsets.all(10.0 * getResponsive(context)),
                child: CustomText(
                  'Amount cannot Exceed 1,00,000',
                  fontSize: 13 * getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
            ),
            SizedBox(height: 0.015 * getHeight(context)),
            // Total Amount Container
            Container(
              padding: EdgeInsets.all(10 * getResponsive(context)),
              decoration: getCommonDecoration(context),
              child: Column(
                children: [
                  getTotalAmountRow(
                    context,
                    leftText: 'Total',
                    rightText: '₹2000.0',
                  ),
                  SizedBox(height: 0.005 * getHeight(context)),
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
            SizedBox(height: 0.015 * getHeight(context)),
            // Remark Section
            CustomText(
              'Remark',
              fontWeight: FontWeight.w700,
              fontSize: 13 * getResponsiveText(context),
            ),
            SizedBox(height: 0.005 * getHeight(context)),
            Container(
              height: 0.115 * getHeight(context),
              decoration: BoxDecoration(
                color: AppTheme.getColor(context).onPrimary,
                border: Border.all(color: AppTheme.getColor(context).outline),
                borderRadius: BorderRadius.circular(
                  12 * getResponsive(context),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.03 * getWidth(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0.01 * getHeight(context)),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.022 * getHeight(context),
                    ),
                  ),
                  SizedBox(width: 0.03 * getWidth(context)),
                  Expanded(
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        hintStyle: TextStyle(
                          color: AppTheme.getColor(context).outline,
                          fontSize: 14 * getResponsiveText(context),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.015 * getHeight(context)),
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
                  horizontal: 8 * getResponsive(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0.01 * getWidth(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Mukund (M77)',
                            fontWeight: FontWeight.w600,
                            fontSize: 16 * getResponsiveText(context),
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
                        horizontal: 6.0 * getResponsive(context),
                      ),
                      child: CustomText(
                        'Contact Person :  Manish ( +91 7980239236 )',
                        fontSize: 14 * getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.01 * getHeight(context)),
                  ],
                ),
              ),
            ),
            // Buttons
            SizedBox(height: 0.03 * getHeight(context)),
            isRepeatOrder
                ? MyCoButton(
                    onTap: () {
                      context.pushNamed('order-history');
                    },
                    title: 'Place Order',
                    // width: 0.4 * getWidth(context),
                    height: 0.055 * getHeight(context),
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: AppTheme.getTextStyle(context).headlineSmall!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCoButton(
                        onTap: () {
                          context.pushNamed('all-distributor');
                        },
                        title: 'Add More',
                        width: 0.4 * getWidth(context),
                        height: 0.04 * getHeight(context),
                        backgroundColor: AppColors.backgroundPrimary,
                        textStyle: AppTheme.getTextStyle(context).headlineSmall!
                            .copyWith(
                              color: AppTheme.getColor(context).primary,
                            ),
                        boarderRadius: 30 * getResponsive(context),
                      ),
                      MyCoButton(
                        onTap: () {
                          context.pushNamed('order-history');
                        },
                        title: 'Place Order',
                        width: 0.4 * getWidth(context),
                        height: 0.04 * getHeight(context),
                        boarderRadius: 30 * getResponsive(context),
                        textStyle: AppTheme.getTextStyle(context).headlineSmall!
                            .copyWith(
                              color: AppTheme.getColor(context).onPrimary,
                            ),
                      ),
                    ],
                  ),
            SizedBox(height: 0.02 * getHeight(context)),
          ],
        ),
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
        fontSize: 15 * getResponsiveText(context),
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      CustomText(
        rightText,
        fontSize: 15 * getResponsiveText(context),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    ],
  );

  BoxDecoration getCommonDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: AppTheme.getColor(context).outline),
    borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    color: AppTheme.getColor(context).onPrimary,
  );
}
