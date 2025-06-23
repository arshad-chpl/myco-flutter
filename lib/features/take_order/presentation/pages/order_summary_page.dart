import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/all_distributor_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/order_history_page.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class OrderSummaryPage extends StatelessWidget {
  final bool isRepeatOrder;
  const OrderSummaryPage({super.key, this.isRepeatOrder = false});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.bgWhite,
    appBar: AppBar(
      backgroundColor: AppColors.bgWhite,
      leading: const BackButton(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Summary'),
          Text(
            'Mukund Madhav',
            style: TextStyle(
              fontSize: 18 * getResponsiveText(context),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
    body: SingleChildScrollView(
      child: Container(
        height: 0.9 * getHeight(context),
        padding: EdgeInsets.symmetric(
          horizontal: 0.08 * getWidth(context),
          vertical: 0.02 * getHeight(context),
        ),
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
                  Text(
                    'Item (1)',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Units (25)',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 0.015 * getWidth(context)),
                  Text(
                    'Total: ₹20000',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Unit Container
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10 * getResponsive(context),
              ),
              decoration: getCommonDecoration(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      decoration: getCommonDecoration(context),
                      child: Image.asset(
                        'assets/take_order/apple_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    horizontalTitleGap: 0.01 * getWidth(context),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appy Fizz (Apple)',
                          style: TextStyle(
                            fontSize: 14 * getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 0.01 * getHeight(context)),
                        Text(
                          'Available Stocks : 9989',
                          style: TextStyle(
                            fontSize: 13 * getResponsiveText(context),
                            color: AppColors.primary_1,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6 * getResponsive(context),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(
                                  12 * getResponsive(context),
                                ),
                                color: AppColors.lightTeal,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/take_order/message-edit.png',
                                    fit: BoxFit.cover,
                                    height: 0.02 * getHeight(context),
                                  ),
                                  SizedBox(width: 0.02 * getWidth(context)),
                                  const Text('25 Units'),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/take_order/xcircle.png',
                              width: 0.06 * getWidth(context),
                              height: 0.02 * getHeight(context),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.005 * getHeight(context)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.04 * getWidth(context),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Piece Wise(25 * ₹80.0)'),
                        Text(
                          '₹2000.0',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Shipping Charges Card
            DistributorCard(
              headerHeight: 0.05 * getHeight(context),
              title: 'Shipping Charges',
              isButton: true,
              buttonText: '₹Add',
              bottomWidget: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Amount cannot Exceed 1,00,000',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
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
                  SizedBox(height: 0.01 * getHeight(context)),
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
                    textColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Remark Section
            Text(
              'Remark',
              style: TextStyle(
                fontSize: 20 * getResponsiveText(context),
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 0.01 * getHeight(context)),
            MyCoTextfield(
              preFixImage: 'assets/take_order/message-edit.png',
              hintText: 'Type Here',
              hintTextStyle: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Distributor Card
            DistributorCard(
              title: 'Distributor',
              isButton: true,
              buttonText: 'Change',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllDistributorPage(),
                  ),
                );
              },
              bottomWidget: Padding(
                padding: EdgeInsets.all(8 * getResponsive(context)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0.03 * getWidth(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mukund (M77)',
                            style: TextStyle(
                              fontSize: 20 * getResponsiveText(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Radio(
                            value: true,
                            groupValue: '',
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    const Text('Contact Person :  Manish ( +91 7980239236 )'),
                  ],
                ),
              ),
            ),
            // Buttons
            const Spacer(),
            isRepeatOrder
                ? MyCoButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderHistoryPage(),
                        ),
                      );
                    },
                    title: 'Place Order',
                    width: getWidth(context),
                    height: 0.05 * getHeight(context),
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20 * getResponsiveText(context),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCoButton(
                        onTap: () {},
                        title: 'Add More',
                        width: 0.4 * getWidth(context),
                        height: 0.05 * getHeight(context),
                        backgroundColor: AppColors.bgWhite,
                        textStyle: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20 * getResponsiveText(context),
                        ),
                        boarderRadius: 30 * getResponsive(context),
                      ),
                      MyCoButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderHistoryPage(),
                            ),
                          );
                        },
                        title: 'Place Order',
                        width: 0.4 * getWidth(context),
                        height: 0.05 * getHeight(context),
                        boarderRadius: 30 * getResponsive(context),
                        textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20 * getResponsiveText(context),
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
      Text(
        leftText,
        style: TextStyle(
          fontSize: 18 * getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      Text(
        rightText,
        style: TextStyle(
          fontSize: 18 * getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    ],
  );

  BoxDecoration getCommonDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    color: AppColors.white,
  );
}
