import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(title: 'Order History'),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => const OrderHistoryCard(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
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
      borderRadius: BorderRadius.circular(
        12 * Responsive.getResponsive(context),
      ),
      side: BorderSide(color: AppTheme.getColor(context).outline),
    ),

    // color: AppTheme.getColor(context).onPrimary,
    child: Column(
      children: [
        // Header
        Stack(
          children: [
            Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  12 * Responsive.getResponsive(context),
                ),
                topRight: Radius.circular(
                  12 * Responsive.getResponsive(context),
                ),
              ),
              elevation: 3.0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      12 * Responsive.getResponsive(context),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'order_number',
                          fontWeight: FontWeight.w800,
                          fontSize: 17 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).onPrimary,
                        ),
                        // SizedBox(height: 0.01 * Responsive.getHeight(context)),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppTheme.getColor(context).onPrimary,
                              size: 18 * Responsive.getResponsive(context),
                            ),
                            CustomText(
                              '01st April, 2025( 09:45 AM)',
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  13 * Responsive.getResponsiveText(context),
                              color: AppTheme.getColor(context).onPrimary,
                            ),
                          ],
                        ),
                      ],
                    ),
                    MyCoButton(
                      onTap: () {},
                      title: LanguageManager().get('approved'),
                      textStyle: AppTheme.getTextStyle(context).bodyMedium!
                          .copyWith(
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                      backgroundColor: AppTheme.getColor(context).secondary,
                      width: 0.2 * Responsive.getWidth(context),
                      height: 0.028 * Responsive.getHeight(context),
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      isShadowBottomLeft: true,
                    ),
                  ],
                ),
              ),
            ),
            // Inner shadow simulation using a white gradient
            Positioned.fill(
              child: IgnorePointer(
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
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.03 * Responsive.getWidth(context),
            vertical: 0.01 * Responsive.getHeight(context),
          ),
          child: Column(
            children: [
              getCommonRow(
                context,
                title: 'order_by',
                value: 'Manish Chandra',
                onTap: () {},
              ),
              getCommonRow(
                context,
                title: 'order_process_status',
                value: 'change',
                decoration: TextDecoration.underline,
                textColor: AppTheme.getColor(context).primary,
                onTap: () {
                  changeProcessStatusBottomSheet(context);
                },
              ),
              SizedBox(height: 0.01 * Responsive.getHeight(context)),

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
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      orderedProductsBottomSheet(context);
                    },
                    child: CustomText(
                      'view_order_product',
                      fontWeight: FontWeight.w600,
                      fontSize: 10 * Responsive.getResponsiveText(context),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.03 * Responsive.getHeight(context)),
              Row(
                children: [
                  MyCoButton(
                    onTap: () {
                      cancelOrderBottomSheet(context);
                    },
                    title: LanguageManager().get('cancel_order'),
                    width: 0.25 * Responsive.getWidth(context),
                    height: 0.028 * Responsive.getHeight(context),
                    textStyle: AppTheme.getTextStyle(context).labelMedium!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    backgroundColor: AppColors.red,
                    borderColor: AppColors.red,
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(width: 0.01 * Responsive.getWidth(context)),
                  MyCoButton(
                    onTap: () {
                      context.pushNamed('order-summary', extra: true);
                    },
                    title: LanguageManager().get('repeat_order'),
                    width: 0.25 * Responsive.getWidth(context),
                    height: 0.028 * Responsive.getHeight(context),
                    textStyle: AppTheme.getTextStyle(context).labelMedium!
                        .copyWith(color: AppTheme.getColor(context).onPrimary),
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    backgroundColor: AppTheme.getColor(context).secondary,
                    borderColor: AppTheme.getColor(context).secondary,
                    isShadowBottomLeft: true,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.pushNamed('edit-order'),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.023 * Responsive.getHeight(context),
                    ),
                  ),
                  SizedBox(width: 0.01 * Responsive.getWidth(context)),
                  Image.asset(
                    'assets/take_order/fluent_share.png',
                    height: 0.023 * Responsive.getHeight(context),
                  ),
                ],
              ),
              SizedBox(height: 0.003 * Responsive.getHeight(context)),
            ],
          ),
        ),
      ],
    ),
  );

  Future<dynamic> orderedProductsBottomSheet(
    BuildContext context,
  ) => getBottomSheet(
    context,
    Container(
      // color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * Responsive.getWidth(context),
                  vertical: 0.01 * Responsive.getHeight(context),
                ),
                width: Responsive.getWidth(context),
                height: 0.05 * Responsive.getHeight(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'order',
                      fontWeight: FontWeight.w600,
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/take_order/down_arrow.png',
                        width: 0.05 * Responsive.getWidth(context),
                      ),
                    ),
                  ],
                ),
              ),
              // Inner shadow simulation using a white gradient
              Positioned.fill(
                child: IgnorePointer(
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
              ),
            ],
          ),
          SizedBox(height: 0.008 * Responsive.getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * Responsive.getWidth(context),
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 6,
              ),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8 * Responsive.getResponsive(context)),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/take_order/apple_image.png',
                      height: 0.025 * Responsive.getHeight(context),
                    ),
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                    CustomText(
                      'Seven Up (7UP Soda) (500 ml)',
                      maxLines: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: 10 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).primary,
                    ),
                    SizedBox(height: 0.03 * Responsive.getHeight(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          'Unit',
                          fontWeight: FontWeight.w600,
                          fontSize: 10 * Responsive.getResponsiveText(context),
                        ),
                        CustomText(
                          '₹2000.0',
                          fontWeight: FontWeight.w600,
                          fontSize: 10 * Responsive.getResponsiveText(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Future<dynamic> changeProcessStatusBottomSheet(BuildContext context) =>
      getBottomSheet(
        context,
        Container(
          width: Responsive.getWidth(context),
          // color: AppTheme.getColor(context).onPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02 * Responsive.getHeight(context)),
              CustomText(
                'change_order_process_status',
                fontWeight: FontWeight.w600,
                fontSize: 14 * Responsive.getResponsiveText(context),
              ),
              // SizedBox(height: 0.02 * Responsive.getHeight(context)),
              DropdownMenu(
                width: 0.8 * Responsive.getWidth(context),
                hintText: LanguageManager().get('select'),
                leadingIcon: const Icon(Icons.notes),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: '1',
                    label: 'select',
                    leadingIcon: Icon(Icons.notes),
                  ),
                ],
              ),
              SizedBox(height: 0.025 * Responsive.getHeight(context)),
              SideBySideButtons(
                button1Name: LanguageManager().get('cancel'),
                button2Name: LanguageManager().get('submit'),
                onTap1: () {},
                onTap2: () {},
              ),
              SizedBox(height: 0.035 * Responsive.getHeight(context)),
            ],
          ),
        ),
      );

  Row getCommonRow(
    BuildContext context, {
    required String title,
    required String value,
    required VoidCallback onTap,
    Color? textColor,
    TextDecoration? decoration,
  }) => Row(
    children: [
      Expanded(
        flex: 7,
        child: CustomText(
          title,
          fontWeight: FontWeight.w700,
          fontSize: 14 * Responsive.getResponsiveText(context),
        ),
      ),
      const CustomText(':'),
      SizedBox(width: 0.03 * Responsive.getWidth(context)),
      Expanded(
        flex: 5,
        child: InkWell(
          onTap: onTap,
          child: CustomText(
            value,
            decoration: decoration,
            color: textColor ?? AppTheme.getColor(context).onSurface,
            fontWeight: FontWeight.w500,
            fontSize: 13 * Responsive.getResponsiveText(context),
          ),
        ),
      ),
    ],
  );

  Future<dynamic> cancelOrderBottomSheet(
    BuildContext context,
  ) => getBottomSheet(
    context,
    Container(
      // color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.06 * Responsive.getWidth(context),
                  vertical: 0.01 * Responsive.getHeight(context),
                ),
                width: Responsive.getWidth(context),
                height: 0.05 * Responsive.getHeight(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                ),

                child: CustomText(
                  'order',
                  color: AppTheme.getColor(context).onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                ),
              ),
              // Inner shadow simulation using a white gradient
              Positioned.fill(
                child: IgnorePointer(
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
              ),
            ],
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Center(
            child: Image.asset(
              'assets/take_order/cancel_order.png',
              height: 0.2 * Responsive.getHeight(context),
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          Center(
            child: CustomText(
              'Do you Want ot Cancel this Order ?',
              fontWeight: FontWeight.w500,
              fontSize: 18 * Responsive.getResponsiveText(context),
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.08 * Responsive.getWidth(context),
            ),
            child: SideBySideButtons(
              button1Name: LanguageManager().get('no'),
              button2Name: LanguageManager().get('yes'),
              onTap1: () {},
              onTap2: () {},
            ),
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );

  Container getOrderContainer(BuildContext context) => Container(
    width: 0.23 * Responsive.getWidth(context),
    height: 0.09 * Responsive.getHeight(context),
    padding: EdgeInsets.symmetric(
      horizontal: 8 * Responsive.getResponsive(context),
      vertical: 4 * Responsive.getResponsive(context),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: 0.01 * Responsive.getWidth(context),
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(
        12 * Responsive.getResponsive(context),
      ),
    ),
    child: Column(
      children: [
        Image.asset(
          'assets/take_order/apple_image.png',
          height: 0.025 * Responsive.getHeight(context),
        ),
        SizedBox(height: 0.01 * Responsive.getHeight(context)),
        CustomText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          'Appy Fizz (Apple)',
          color: AppTheme.getColor(context).primary,
          fontSize: 11 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),
        CustomText(
          'unit_web',
          fontSize: 10 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}
