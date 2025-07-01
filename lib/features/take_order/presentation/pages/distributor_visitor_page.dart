import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class DistributorVisitorPage extends StatelessWidget {
  const DistributorVisitorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      backgroundColor: AppTheme.getColor(context).surface,
      title: CustomText(
        'Mahakali Tractors (RT43575)',
        fontSize: 20 * getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
    ),
    body: SingleChildScrollView(
      child: Container(
        height: getHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
        child: Column(
          children: [
            DistributorCard(
              headerHeight: 0.055 * getHeight(context),
              title: 'No Name',
              isHeaderIconEnabled: true,
              bottomWidget: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/take_order/call-calling.png',
                          width: 0.04 * getWidth(context),
                        ),
                        SizedBox(width: 0.02 * getWidth(context)),
                        CustomText(
                          '+91 9909945983',
                          decoration: TextDecoration.underline,
                          fontSize: 14 * getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 0.01 * getHeight(context)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/take_order/location.png',
                          width: 0.04 * getWidth(context),
                        ),
                        SizedBox(width: 0.02 * getWidth(context)),
                        Expanded(
                          child: CustomText(
                            'A-809 World Trade Tower (WTT, Nr BMW Showroom, Sarkhej Gandhinagar Hwy, Makarba, Ahmedabad, Sarkhej-Okaf, Gujarat 380051, India',
                            fontSize: 12 * getResponsiveText(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.005 * getHeight(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/take_order/geo_location.png',
                          // height: 0.01 * getHeight(context),
                          width: 0.06 * getWidth(context),
                        ),
                        SizedBox(width: 0.01 * getWidth(context)),
                        CustomText(
                          'Get Direction',
                          decoration: TextDecoration.underline,
                          fontSize: 12 * getResponsiveText(context),
                          color: AppTheme.getColor(context).primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 0.01 * getHeight(context)),
            BlocBuilder<TakeOrderBloc, TakeOrderState>(
              builder: (context, state) {
                final bool isRunning = state is VisitRunning;
                Duration duration = Duration.zero;

                if (state is VisitRunning || state is VisitStopped) {
                  if (state is VisitRunning) {
                    duration = state.duration;
                  }
                  if (state is VisitStopped) {
                    duration = state.duration;
                  }
                }

                final String formatted = duration
                    .toString()
                    .split('.')
                    .first
                    .padLeft(8, '0');

                return Container(
                  padding: EdgeInsets.all(12 * getResponsive(context)),
                  width: 0.83 * getWidth(context),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    color: AppTheme.getColor(context).onPrimary,
                    borderRadius: BorderRadius.circular(
                      12 * getResponsive(context),
                    ),
                  ),
                  child: Column(
                    children: [
                      MyCoButton(
                        onTap: () {
                          if (isRunning) {
                            getEndVisitBottomSheet(
                              context,
                              onTap: () {
                                Navigator.pop(context);

                                context.read<TakeOrderBloc>().add(
                                  StopVisitEvent(),
                                );
                              },
                            );
                          } else {
                            getVisitPurposeBottomSheet(
                              context,
                              onTap: () {
                                Navigator.pop(context);
                                context.read<TakeOrderBloc>().add(
                                  StartVisitEvent(),
                                );
                              },
                            );
                          }
                        },
                        title: isRunning ? 'Stop' : 'Start',
                        width: 0.2 * getWidth(context),
                        height: 0.035 * getHeight(context),
                        backgroundColor: AppTheme.getColor(context).secondary,
                        boarderRadius: 30 * getResponsive(context),
                        borderColor: AppTheme.getColor(context).secondary,
                        isShadowBottomLeft: true,
                        image: isRunning
                            ? Image.asset(
                                'assets/take_order/stop-button.png',
                                width: 0.05 * getWidth(context),
                              )
                            : Image.asset(
                                'assets/take_order/play-button.png',
                                width: 0.03 * getWidth(context),
                              ),

                        spacing: 3 * getResponsive(context),
                      ),

                      if (state is VisitRunning || state is VisitStopped)
                        isRunning
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 0.08 * getWidth(context)),
                                  CustomText(
                                    textAlign: TextAlign.center,
                                    formatted,
                                    fontSize: 14 * getResponsiveText(context),
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.getColor(context).primary,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.refresh,
                                      color: AppTheme.getColor(context).primary,
                                      size: 20 * getResponsive(context),
                                    ),
                                    onPressed: () {
                                      context.read<TakeOrderBloc>().add(
                                        RefreshTimerEvent(),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      isRunning
                          ? const SizedBox.shrink()
                          : SizedBox(height: 0.01 * getHeight(context)),
                      CustomText(
                        'Click on ${isRunning ? "Stop" : "Start"} Button to ${isRunning ? "End" : "Start"} your Visit',
                        fontSize: 14 * getResponsiveText(context),
                        color: AppColors.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getCommonColumn(
                  context,
                  imagePath: 'assets/take_order/place_order.png',
                  name: 'Place Order',
                  onTap: () {
                    context.pushNamed('take-order');
                  },
                ),
                getCommonColumn(
                  context,
                  imagePath: 'assets/take_order/order_history.png',
                  name: 'Order History',
                  onTap: () {
                    context.pushNamed('order-history');
                  },
                ),
                getCommonColumn(
                  context,
                  imagePath: 'assets/take_order/no_order.png',
                  name: 'No Order',
                  onTap: () {
                    context.pushNamed('no-order');
                  },
                ),
              ],
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8 * getResponsive(context),
                horizontal: 12 * getResponsive(context),
              ),
              width: 0.83 * getWidth(context),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.getColor(context).outline),
                color: AppTheme.getColor(context).onPrimary,
                borderRadius: BorderRadius.circular(
                  12 * getResponsive(context),
                ),
              ),
              child: Column(
                children: [
                  getCommonRow(context, title: 'Category', value: 'CHPL'),
                  SizedBox(height: 0.01 * getHeight(context)),
                  getCommonRow(context, title: 'Area', value: '-'),
                  SizedBox(height: 0.01 * getHeight(context)),
                  getCommonRow(context, title: 'GST', value: '-'),
                  SizedBox(height: 0.01 * getHeight(context)),
                  getCommonRow(
                    context,
                    title: 'Retailer Code',
                    value: 'RT43575',
                  ),
                  SizedBox(height: 0.01 * getHeight(context)),
                  getCommonRow(context, title: 'Credit Days', value: '0'),
                  SizedBox(height: 0.01 * getHeight(context)),
                  getCommonRow(context, title: 'Credit Limit', value: '0.00'),
                ],
              ),
            ),
            SizedBox(height: 0.01 * getHeight(context)),
            DistributorCard(
              headerHeight: 0.055 * getHeight(context),
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
          ],
        ),
      ),
    ),
  );

  Future<dynamic> getEndVisitBottomSheet(
    BuildContext context, {
    required VoidCallback onTap,
  }) => getBottomSheet(
    context,
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * getResponsive(context)),
        color: AppTheme.getColor(context).onPrimary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.03 * getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: CustomText(
              'Remark',
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 0.01 * getHeight(context)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            decoration: BoxDecoration(
              color: AppTheme.getColor(context).onPrimary,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
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
                    height: 0.022 * getHeight(context),
                  ),
                ),
                SizedBox(width: 0.01 * getWidth(context)),
                Expanded(
                  child: TextFormField(
                    maxLines: 6,
                    minLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Type Here',
                      hintStyle: TextStyle(
                        color: AppTheme.getColor(context).outline,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 0.02 * getHeight(context)),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: SideBySideButtons(
              button1Name: 'CLOSE',
              button2Name: 'END VISIT',
              onTap1: () {},
              onTap2: onTap,
            ),
          ),
          SizedBox(height: 0.03 * getHeight(context)),
        ],
      ),
    ),
  );

  Future<dynamic> getVisitPurposeBottomSheet(
    BuildContext context, {
    required VoidCallback onTap,
  }) => getBottomSheet(
    context,
    Container(
      color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                width: getWidth(context),
                height: 0.05 * getHeight(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).primary,
                ),
                child: CustomText(
                  'Visit Purpose',
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 20 * getResponsiveText(context),
                  fontWeight: FontWeight.w500,
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
          SizedBox(height: 0.02 * getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: const MyCoTextfield(
              hintText: 'Search',
              isSuffixIconOn: true,
              image1: 'assets/take_order/microphone-2.png',
              preFixImage: 'assets/take_order/search-normal.png',
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.02 * getWidth(context)),
            child: Column(
              children: [
                RadioListTile(
                  radioScaleFactor: 0.7,
                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: CustomText(
                    'Vendor Closed',
                    fontSize: 18 * getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile(
                  radioScaleFactor: 0.7,

                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: CustomText(
                    'Shop Closed',
                    fontSize: 18 * getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RadioListTile(
                  radioScaleFactor: 0.7,

                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: CustomText(
                    'Approved',
                    fontSize: 18 * getResponsiveText(context),
                    color: AppTheme.getColor(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 0.01 * getHeight(context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: SideBySideButtons(
              button1Name: 'CLOSE',
              button2Name: 'DONE',
              onTap1: () {},
              onTap2: onTap,
            ),
          ),
          SizedBox(height: 0.03 * getHeight(context)),
        ],
      ),
    ),
  );

  Row getCommonRow(
    BuildContext context, {
    required String title,
    required String value,
  }) => Row(
    children: [
      Expanded(
        flex: 5,
        child: CustomText(
          title,
          fontWeight: FontWeight.w700,
          fontSize: 15 * getResponsiveText(context),
        ),
      ),
      const CustomText(':'),
      SizedBox(width: 0.03 * getWidth(context)),
      Expanded(
        flex: 5,
        child: CustomText(
          value,
          fontSize: 15 * getResponsiveText(context),
          color: AppTheme.getColor(context).outline,
        ),
      ),
    ],
  );
  InkWell getCommonColumn(
    BuildContext context, {
    required String imagePath,
    required String name,
    required VoidCallback onTap,
  }) => InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Image.asset(imagePath, width: 0.13 * getWidth(context)),
        SizedBox(height: 0.03 * getWidth(context)),
        CustomText(
          name,
          fontWeight: FontWeight.bold,
          fontSize: 16 * getResponsiveText(context),
        ),
      ],
    ),
  );
}
