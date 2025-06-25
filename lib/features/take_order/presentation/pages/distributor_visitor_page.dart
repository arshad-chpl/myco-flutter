import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class DistributorVisitorPage extends StatelessWidget {
  const DistributorVisitorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      backgroundColor: AppTheme.getColor(context).surface,
      title: Text(
        'Mahakali Tractors (RT43575)',
        style: TextStyle(fontSize: 20 * getResponsiveText(context)),
      ),
    ),
    body: SingleChildScrollView(
      child: Container(
        height: getHeight(context),
        padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
        child: Column(
          children: [
            DistributorCard(
              title: 'No Name',
              bottomWidget: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * getWidth(context),
                  vertical: 0.02 * getHeight(context),
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
                        Text(
                          '+91 9909945983',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14 * getResponsiveText(context),
                          ),
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
                          child: Text(
                            'A-809 World Trade Tower (WTT, Nr BMW Showroom, Sarkhej Gandhinagar Hwy, Makarba, Ahmedabad, Sarkhej-Okaf, Gujarat 380051, India',
                            style: TextStyle(
                              fontSize: 14 * getResponsiveText(context),
                            ),
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
                          width: 0.08 * getWidth(context),
                        ),
                        SizedBox(width: 0.01 * getWidth(context)),
                        Text(
                          'Get Direction',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12 * getResponsiveText(context),
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 0.02 * getHeight(context)),
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
                  width: 0.9 * getWidth(context),
                  // height: 0.2 * getHeight(context),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
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
                        width: 0.25 * getWidth(context),
                        height: 0.04 * getHeight(context),
                        backgroundColor: AppTheme.getColor(context).secondary,
                        boarderRadius: 30 * getResponsive(context),
                        borderColor: AppTheme.getColor(context).secondary,
                        isShadowBottomLeft: true,
                      ),

                      if (state is VisitRunning || state is VisitStopped)
                        isRunning
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    formatted,
                                    style: TextStyle(
                                      fontSize: 16 * getResponsiveText(context),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.refresh,
                                      color: AppTheme.getColor(context).primary,
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

                      SizedBox(height: 0.01 * getHeight(context)),
                      Text(
                        'Click on ${isRunning ? "Stop" : "Start"} Button to ${isRunning ? "End" : "Start"} your Visit',
                        style: TextStyle(
                          fontSize: 14 * getResponsiveText(context),
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => TakeOrderPage()),
                    // );
                    context.pushNamed('take-order');
                  },
                ),
                getCommonColumn(
                  context,
                  imagePath: 'assets/take_order/order_history.png',
                  name: 'Order History',
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const OrderHistoryPage(),
                    //   ),
                    // );
                    context.pushNamed('order-history');
                  },
                ),
                getCommonColumn(
                  context,
                  imagePath: 'assets/take_order/no_order.png',
                  name: 'No Order',
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const NoOrderPage(),
                    //   ),
                    // );
                    context.pushNamed('no-order');
                  },
                ),
              ],
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Container(
              padding: EdgeInsets.all(12 * getResponsive(context)),
              width: 0.9 * getWidth(context),
              // height: 0.2 * getHeight(context),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
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
            SizedBox(height: 0.02 * getHeight(context)),

            DistributorCard(
              title: 'Distributor',
              isButton: true,
              buttonText: 'Change',
              onTap: () {},
              bottomWidget: Padding(
                padding: EdgeInsets.all(8 * getResponsive(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mukund (M77)',
                          style: TextStyle(
                            fontSize: 18 * getResponsiveText(context),
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
                    Text(
                      'Contact Person : Manish ( +91 7980239236 )',
                      style: TextStyle(
                        fontSize: 14 * getResponsiveText(context),
                      ),
                    ),
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
  }) => showModalBottomSheet(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12 * getResponsive(context)),
    ),
    context: context,
    builder: (context) => Container(
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
            child: Text(
              'Remark',
              style: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 0.01 * getHeight(context)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
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
                    height: 0.025 * getHeight(context),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Type Here',
                      hintStyle: TextStyle(color: Colors.grey),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCoButton(
                  onTap: () => Navigator.pop(context),
                  title: 'CLOSE',
                  width: 0.4 * getWidth(context),
                  height: 0.06 * getHeight(context),
                  backgroundColor: AppTheme.getColor(context).onPrimary,
                  boarderRadius: 30 * getResponsive(context),
                  textStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MyCoButton(
                  onTap: onTap,
                  title: 'END VISIT',
                  width: 0.4 * getWidth(context),
                  height: 0.06 * getHeight(context),
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
          SizedBox(height: 0.02 * getHeight(context)),
        ],
      ),
    ),
  );

  Future<dynamic> getVisitPurposeBottomSheet(
    BuildContext context, {
    required VoidCallback onTap,
  }) => showModalBottomSheet(
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(8 * getResponsive(context)),
    ),
    context: context,
    builder: (context) => Container(
      color: AppTheme.getColor(context).onPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            child: Text(
              'Visit Purpose',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24 * getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
            ),
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
          SizedBox(height: 0.02 * getHeight(context)),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.02 * getWidth(context)),
            child: Column(
              children: [
                RadioListTile(
                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: Text(
                    'Vendor Closed',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: Text(
                    'Shop Closed',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: 'groupValue',
                  onChanged: (value) {},
                  title: Text(
                    'Approved',
                    style: TextStyle(
                      fontSize: 20 * getResponsiveText(context),
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 0.02 * getHeight(context)),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCoButton(
                  onTap: () => Navigator.pop(context),
                  title: 'CLOSE',
                  width: 0.4 * getWidth(context),
                  height: 0.06 * getHeight(context),
                  backgroundColor: AppTheme.getColor(context).onPrimary,
                  boarderRadius: 30 * getResponsive(context),
                  textStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MyCoButton(
                  onTap: onTap,
                  title: 'DONE',
                  width: 0.4 * getWidth(context),
                  height: 0.06 * getHeight(context),
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
          SizedBox(height: 0.02 * getHeight(context)),
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
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16 * getResponsiveText(context),
          ),
        ),
      ),
      const Text(':'),
      SizedBox(width: 0.03 * getWidth(context)),
      Expanded(
        flex: 5,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 16 * getResponsiveText(context),
            color: Colors.grey,
          ),
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
        Image.asset(imagePath, width: 0.15 * getWidth(context)),
        SizedBox(height: 0.02 * getWidth(context)),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
