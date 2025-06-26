import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const BackButton(),
      title: const CustomText('Order History', fontWeight: FontWeight.w600),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => const OrderHistoryCard(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );
}

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
      side: BorderSide(color: AppTheme.getColor(context).outline),
    ),

    color: AppTheme.getColor(context).onPrimary,
    child: Column(
      children: [
        // Header
        Stack(
          children: [
            Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12 * getResponsive(context)),
                topRight: Radius.circular(12 * getResponsive(context)),
              ),
              elevation: 3.0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10 * getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12 * getResponsive(context)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Order Number : #230',
                          fontWeight: FontWeight.w800,
                          fontSize: 17 * getResponsiveText(context),
                          color: AppTheme.getColor(context).onPrimary,
                        ),
                        // SizedBox(height: 0.01 * getHeight(context)),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppTheme.getColor(context).onPrimary,
                              size: 18 * getResponsive(context),
                            ),
                            CustomText(
                              '01st April, 2025( 09:45 AM)',
                              fontWeight: FontWeight.w600,
                              fontSize: 13 * getResponsiveText(context),
                              color: AppTheme.getColor(context).onPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                    MyCoButton(
                      onTap: () {},
                      title: 'Approved',
                      textStyle: AppTheme.getTextStyle(context).bodyMedium!
                          .copyWith(
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                      backgroundColor: AppTheme.getColor(context).secondary,
                      width: 0.2 * getWidth(context),
                      height: 0.028 * getHeight(context),
                      boarderRadius: 30 * getResponsive(context),
                      isShadowBottomLeft: true,
                    ),
                  ],
                ),
              ),
            ),
            // Inner shadow simulation using a white gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.3), // top white fade
                      Colors.transparent, // fade to transparent
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.03 * getWidth(context),
            vertical: 0.01 * getHeight(context),
          ),
          child: Column(
            children: [
              getCommonRow(
                context,
                title: 'Order By',
                value: 'Manish Chandra',
                onTap: () {},
              ),
              getCommonRow(
                context,
                title: 'Order Process Status',
                value: 'Change',
                decoration: TextDecoration.underline,
                textColor: AppTheme.getColor(context).primary,
                onTap: () {
                  changeProcessStatusBottomSheet(context);
                },
              ),
              SizedBox(height: 0.01 * getHeight(context)),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    getOrderContainer(context),
                    getOrderContainer(context),
                    getOrderContainer(context),
                  ],
                ),
              ),
              SizedBox(height: 0.005 * getHeight(context)),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      orderedProductsBottomSheet(context);
                    },
                    child: CustomText(
                      'View Ordered Products',
                      fontWeight: FontWeight.w600,
                      fontSize: 10 * getResponsiveText(context),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.03 * getHeight(context)),
              Row(
                children: [
                  MyCoButton(
                    onTap: () {
                      cancelOrderBottomSheet(context);
                    },
                    title: 'Cancel Order',
                    width: 0.25 * getWidth(context),
                    height: 0.028 * getHeight(context),
                    textStyle: AppTheme.getTextStyle(context).labelMedium!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                    boarderRadius: 30 * getResponsive(context),
                    backgroundColor: AppColors.red,
                    borderColor: AppColors.red,
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(width: 0.01 * getWidth(context)),
                  MyCoButton(
                    onTap: () {
                      context.pushNamed('order-summary', extra: true);
                    },
                    title: 'Repeat Order',
                    width: 0.25 * getWidth(context),
                    height: 0.028 * getHeight(context),
                    textStyle: AppTheme.getTextStyle(context).labelMedium!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                    boarderRadius: 30 * getResponsive(context),
                    backgroundColor: AppTheme.getColor(context).secondary,
                    borderColor: AppTheme.getColor(context).secondary,
                    isShadowBottomLeft: true,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.pushNamed('edit-order'),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.023 * getHeight(context),
                    ),
                  ),
                  SizedBox(width: 0.01 * getWidth(context)),
                  Image.asset(
                    'assets/take_order/fluent_share.png',
                    height: 0.023 * getHeight(context),
                  ),
                ],
              ),
              SizedBox(height: 0.003 * getHeight(context)),
            ],
          ),
        ),
      ],
    ),
  );

  Future<dynamic> orderedProductsBottomSheet(
    BuildContext context,
  ) => showModalBottomSheet(
    shape: const BeveledRectangleBorder(),
    context: context,
    builder: (context) => Container(
      color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                width: getWidth(context),
                height: 0.05 * getHeight(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'Order #230',
                      fontWeight: FontWeight.w600,
                      fontSize: 18 * getResponsiveText(context),
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/take_order/down_arrow.png',
                        width: 0.05 * getWidth(context),
                      ),
                    ),
                  ],
                ),
              ),
              // Inner shadow simulation using a white gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.3), // top white fade
                        Colors.transparent, // fade to transparent
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.008 * getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * getWidth(context),
              vertical: 0.01 * getHeight(context),
            ),
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 12,
                ),
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(8 * getResponsive(context)),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      12 * getResponsive(context),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/take_order/apple_image.png',
                        height: 0.025 * getHeight(context),
                      ),
                      SizedBox(height: 0.01 * getHeight(context)),
                      CustomText(
                        'Seven Up (7UP Soda) (500 ml)',
                        maxLines: 2,
                        fontWeight: FontWeight.w700,
                        fontSize: 10 * getResponsiveText(context),
                        color: AppTheme.getColor(context).primary,
                      ),
                      SizedBox(height: 0.03 * getHeight(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            'Unit: 25',
                            fontWeight: FontWeight.w600,
                            fontSize: 10 * getResponsiveText(context),
                          ),
                          CustomText(
                            '₹2000.0',
                            fontWeight: FontWeight.w600,
                            fontSize: 10 * getResponsiveText(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Future<dynamic> changeProcessStatusBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(
            12 * getResponsive(context),
          ),
        ),
        context: context,
        builder: (context) => Container(
          width: getWidth(context),
          color: AppTheme.getColor(context).onPrimary,
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02 * getHeight(context)),
              CustomText(
                'Change Order Process Status',
                fontWeight: FontWeight.w600,
                fontSize: 14 * getResponsiveText(context),
              ),
              // SizedBox(height: 0.02 * getHeight(context)),
              DropdownMenu(
                width: 0.8 * getWidth(context),
                hintText: 'Select',
                leadingIcon: const Icon(Icons.notes),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: '1',
                    label: 'select',
                    leadingIcon: Icon(Icons.notes),
                  ),
                ],
              ),
              SizedBox(height: 0.025 * getHeight(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCoButton(
                    onTap: () {},
                    title: 'CANCEL',
                    width: 0.4 * getWidth(context),
                    height: 0.04 * getHeight(context),
                    backgroundColor: AppTheme.getColor(context).onPrimary,
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: AppTheme.getTextStyle(context).bodyLarge!
                        .copyWith(color: AppTheme.getColor(context).primary),
                  ),
                  MyCoButton(
                    onTap: () {},
                    title: 'SUBMIT',
                    width: 0.4 * getWidth(context),
                    height: 0.04 * getHeight(context),
                    backgroundColor: AppColors.primary,
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: AppTheme.getTextStyle(context).bodyLarge!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                  ),
                ],
              ),
              SizedBox(height: 0.035 * getHeight(context)),
            ],
          ),
        ),
      );

  Row getCommonRow(
    BuildContext context, {
    required String title,
    required String value,
    required VoidCallback onTap,
    Color textColor = AppColors.black,
    TextDecoration? decoration,
  }) => Row(
    children: [
      Expanded(
        flex: 7,
        child: CustomText(
          title,
          fontWeight: FontWeight.w700,
          fontSize: 14 * getResponsiveText(context),
        ),
      ),
      const CustomText(':'),
      SizedBox(width: 0.03 * getWidth(context)),
      Expanded(
        flex: 5,
        child: InkWell(
          onTap: onTap,
          child: CustomText(
            value,
            decoration: decoration,
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 13 * getResponsiveText(context),
          ),
        ),
      ),
    ],
  );

  Future<dynamic> cancelOrderBottomSheet(
    BuildContext context,
  ) => showModalBottomSheet(
    shape: const BeveledRectangleBorder(),
    context: context,
    builder: (context) => Container(
      color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.06 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                width: getWidth(context),
                height: 0.05 * getHeight(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                ),

                child: CustomText(
                  'Order #232',
                  color: AppTheme.getColor(context).onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * getResponsiveText(context),
                ),
              ),
              // Inner shadow simulation using a white gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.3), // top white fade
                        Colors.transparent, // fade to transparent
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.02 * getHeight(context)),
          Center(
            child: Image.asset(
              'assets/take_order/cancel_order.png',
              height: 0.2 * getHeight(context),
            ),
          ),
          SizedBox(height: 0.015 * getHeight(context)),
          Center(
            child: CustomText(
              'Do you Want ot Cancel this Order ?',
              fontWeight: FontWeight.w500,
              fontSize: 18 * getResponsiveText(context),
            ),
          ),
          SizedBox(height: 0.015 * getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCoButton(
                  onTap: () {},
                  title: 'NO',
                  width: 0.4 * getWidth(context),
                  height: 0.04 * getHeight(context),
                  backgroundColor: AppTheme.getColor(context).onPrimary,
                  boarderRadius: 30 * getResponsive(context),
                  textStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MyCoButton(
                  onTap: () {},
                  title: 'YES',
                  width: 0.4 * getWidth(context),
                  height: 0.04 * getHeight(context),
                  backgroundColor: AppTheme.getColor(context).primary,
                  boarderRadius: 30 * getResponsive(context),
                  textStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.03 * getHeight(context)),
        ],
      ),
    ),
  );

  Container getOrderContainer(BuildContext context) => Container(
    width: 0.23 * getWidth(context),
    height: 0.09 * getHeight(context),
    padding: EdgeInsets.symmetric(
      horizontal: 8 * getResponsive(context),
      vertical: 4 * getResponsive(context),
    ),
    margin: EdgeInsets.symmetric(horizontal: 0.01 * getWidth(context)),
    decoration: BoxDecoration(
      border: Border.all(color: AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: Column(
      children: [
        Image.asset(
          'assets/take_order/apple_image.png',
          height: 0.025 * getHeight(context),
        ),
        SizedBox(height: 0.01 * getHeight(context)),
        CustomText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'Appy Fizz (Apple)',
          color: AppTheme.getColor(context).primary,
          fontSize: 11 * getResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 0.005 * getHeight(context)),
        CustomText(
          'Unit: 25 ₹2000.0',
          fontSize: 10 * getResponsiveText(context),
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}
