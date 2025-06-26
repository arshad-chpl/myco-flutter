import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

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
          const Text('Order Summary'),
          Text(
            'Mukund Madhav',
            style: AppTheme.getTextStyle(
              context,
            ).titleLarge!.copyWith(color: AppTheme.getColor(context).primary),
          ),
        ],
      ),
    ),
    body: Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.02 * getHeight(context),
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
                  Text(
                    'Item (1)',
                    style: AppTheme.getTextStyle(
                      context,
                    ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Units (25)',
                    style: AppTheme.getTextStyle(
                      context,
                    ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 0.015 * getWidth(context)),
                  Text(
                    'Total: ₹20000',
                    style: AppTheme.getTextStyle(
                      context,
                    ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
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
                          style: AppTheme.getTextStyle(context).labelLarge!
                              .copyWith(
                                color: AppTheme.getColor(context).primary,
                              ),
                        ),
                        SizedBox(height: 0.01 * getHeight(context)),
                        Text(
                          'Available Stocks : 9989',
                          style: AppTheme.getTextStyle(context).labelLarge!
                              .copyWith(
                                color: AppTheme.getColor(context).secondary,
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
                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.005 * getHeight(context)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.04 * getWidth(context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Piece Wise(25 * ₹80.0)'),
                        Text(
                          '₹2000.0',
                          style: AppTheme.getTextStyle(context).bodyMedium!
                              .copyWith(
                                color: AppTheme.getColor(context).primary,
                              ),
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
              bottomWidget: Padding(
                padding: EdgeInsets.all(10.0 * getResponsive(context)),
                child: Text(
                  'Amount cannot Exceed 1,00,000',
                  style: AppTheme.getTextStyle(
                    context,
                  ).bodyMedium!.copyWith(color: AppColors.error),
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
                    textColor: AppTheme.getColor(context).primary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Remark Section
            Text(
              'Remark',
              style: AppTheme.getTextStyle(
                context,
              ).bodyMedium!.copyWith(color: AppTheme.getColor(context).primary),
            ),
            SizedBox(height: 0.005 * getHeight(context)),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.getColor(context).onPrimary,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(
                  12 * getResponsive(context),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.018 * getWidth(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 0.01 * getHeight(context)),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.025 * getHeight(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        hintStyle: TextStyle(
                          color: AppTheme.getColor(context).onSurfaceVariant,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            // Distributor Card
            DistributorCard(
              title: 'Distributor',
              isButton: true,
              buttonText: 'Change',
              onTap: () {
                context.goNamed('all-distributor');
              },
              bottomWidget: Padding(
                padding: EdgeInsets.all(8 * getResponsive(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 0.03 * getWidth(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mukund (M77)',
                            style: AppTheme.getTextStyle(
                              context,
                            ).headlineMedium,
                          ),
                          Radio(
                            value: true,
                            groupValue: '',
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0 * getResponsive(context),
                      ),
                      child: const Text(
                        'Contact Person :  Manish ( +91 7980239236 )',
                      ),
                    ),
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
                    width: getWidth(context),
                    height: 0.05 * getHeight(context),
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: AppTheme.getTextStyle(context).headlineMedium!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCoButton(
                        onTap: () {},
                        title: 'Add More',
                        width: 0.4 * getWidth(context),
                        height: 0.05 * getHeight(context),
                        backgroundColor: AppColors.backgroundPrimary,
                        textStyle: AppTheme.getTextStyle(context)
                            .headlineMedium!
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
                        height: 0.05 * getHeight(context),
                        boarderRadius: 30 * getResponsive(context),
                        textStyle: AppTheme.getTextStyle(context)
                            .headlineMedium!
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
      Text(
        leftText,
        style: AppTheme.getTextStyle(
          context,
        ).headlineSmall!.copyWith(color: textColor),
      ),
      Text(
        rightText,
        style: AppTheme.getTextStyle(
          context,
        ).headlineSmall!.copyWith(color: textColor),
      ),
    ],
  );

  BoxDecoration getCommonDecoration(BuildContext context) => BoxDecoration(
    border: Border.all(color: Colors.grey[400]!),
    borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    color: AppTheme.getColor(context).onPrimary,
  );
}
