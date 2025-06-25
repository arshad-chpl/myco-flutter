import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.backgroundPrimary,
    appBar: AppBar(
      backgroundColor: AppColors.backgroundPrimary,
      leading: const BackButton(),
      title: const Text('Order History'),
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
    ),

    color: AppColors.white,
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12 * getResponsive(context)),
            topRight: Radius.circular(12 * getResponsive(context)),
          ),
          elevation: 3.0,
          child: Container(
            // height: 0.06 * getHeight(context),
            padding: EdgeInsets.all(8 * getResponsive(context)),
            decoration: BoxDecoration(
              color: AppColors.primary,
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
                    Text(
                      'Order Number : #230',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * getResponsiveText(context),
                      ),
                    ),
                    SizedBox(height: 0.01 * getHeight(context)),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: AppColors.white,
                          size: 20 * getResponsive(context),
                        ),
                        Text(
                          '01st April, 2025( 09:45 AM)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14 * getResponsiveText(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // const Spacer(),
                MyCoButton(
                  onTap: () {},
                  title: 'Approved',
                  backgroundColor: AppColors.secondary,
                  width: 0.25 * getWidth(context),
                  height: 0.03 * getHeight(context),
                  boarderRadius: 30 * getResponsive(context),
                  isShadowBottomLeft: true,
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.06 * getWidth(context),
            vertical: 0.01 * getHeight(context),
          ),
          child: Column(
            children: [
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Order By',
              //       style: TextStyle(
              //         fontSize: 16 * getResponsiveText(context),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     // SizedBox(width: 0.22 * getWidth(context)),
              //     Text(
              //       ':',
              //       style: TextStyle(fontSize: 16 * getResponsiveText(context)),
              //     ),
              //     SizedBox(width: 0.05 * getWidth(context)),
              //     Text(
              //       'Manish Chandra',
              //       style: TextStyle(
              //         fontSize: 16 * getResponsiveText(context),
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 0.01 * getHeight(context)),
              // Row(
              //   children: [
              //     Text(
              //       'Order Process Status',
              //       style: TextStyle(
              //         fontSize: 16 * getResponsiveText(context),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     SizedBox(width: 0.04 * getWidth(context)),
              //     Text(
              //       ':',
              //       style: TextStyle(fontSize: 16 * getResponsiveText(context)),
              //     ),
              //     SizedBox(width: 0.05 * getWidth(context)),
              //     InkWell(
              //       onTap: () {
              //         changeProcessStatusBottomSheet(context);
              //       },
              //       child: Text(
              //         'Change',
              //         style: TextStyle(
              //           fontSize: 16 * getResponsiveText(context),
              //           fontWeight: FontWeight.bold,
              //           color: AppColors.primary,
              //           decoration: TextDecoration.underline,
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 0.01 * getWidth(context)),
              //   ],
              // ),
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
                textColor: AppColors.primary,
                onTap: () {
                  changeProcessStatusBottomSheet(context);
                },
              ),
              SizedBox(height: 0.02 * getHeight(context)),

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
              SizedBox(height: 0.008 * getHeight(context)),
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      orderedProductsBottomSheet(context);
                    },
                    child: Text(
                      'View Ordered Products',
                      style: TextStyle(
                        fontSize: 14 * getResponsiveText(context),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.02 * getHeight(context)),
              Row(
                children: [
                  MyCoButton(
                    onTap: () {
                      cancelOrderBottomSheet(context);
                    },
                    title: 'Cancel Order',
                    width: 0.25 * getWidth(context),
                    height: 0.03 * getHeight(context),
                    textStyle: TextStyle(
                      fontSize: 15 * getResponsiveText(context),
                      color: AppColors.white,
                    ),
                    boarderRadius: 30 * getResponsive(context),
                    backgroundColor: AppColors.red,
                    borderColor: AppColors.red,
                    isShadowBottomLeft: true,
                  ),
                  SizedBox(width: 0.01 * getWidth(context)),
                  MyCoButton(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         const OrderSummaryPage(isRepeatOrder: true),
                      //   ),
                      // );
                      context.pushNamed('order-summary', extra: true);
                    },
                    title: 'Repeat Order',
                    width: 0.25 * getWidth(context),
                    height: 0.03 * getHeight(context),
                    textStyle: TextStyle(
                      fontSize: 15 * getResponsiveText(context),
                      color: AppColors.white,
                    ),
                    boarderRadius: 30 * getResponsive(context),
                    backgroundColor: AppColors.secondary,
                    borderColor: AppColors.secondary,
                    isShadowBottomLeft: true,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.pushNamed('edit-order'),
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditOrderPage(),
                    //   ),
                    // ),
                    child: Image.asset(
                      'assets/take_order/message-edit.png',
                      height: 0.025 * getHeight(context),
                    ),
                  ),
                  Image.asset(
                    'assets/take_order/fluent_share.png',
                    height: 0.025 * getHeight(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Future<dynamic> orderedProductsBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        shape: const BeveledRectangleBorder(),
        context: context,
        builder: (context) => Container(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                width: getWidth(context),
                height: 0.06 * getHeight(context),
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #230',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24 * getResponsiveText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/take_order/down_arrow.png',
                        width: 0.06 * getWidth(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * getWidth(context),
                  vertical: 0.01 * getHeight(context),
                ),
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    shrinkWrap: true,
                    itemCount: 9,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(8 * getResponsive(context)),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[600]!),
                        borderRadius: BorderRadius.circular(
                          12 * getResponsive(context),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/take_order/apple_image.png',
                            height: 0.04 * getHeight(context),
                          ),
                          SizedBox(height: 0.01 * getHeight(context)),
                          Text(
                            'Appy Fizz',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20 * getResponsiveText(context),
                            ),
                          ),
                          SizedBox(height: 0.01 * getHeight(context)),
                          Text(
                            'Unit: 25 ₹2000.0',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16 * getResponsiveText(context),
                            ),
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
        shape: const BeveledRectangleBorder(),
        context: context,
        builder: (context) => Container(
          width: getWidth(context),
          color: AppColors.white,
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.02 * getHeight(context)),
              Text(
                'Change Order Process Status',
                style: TextStyle(
                  fontSize: 22 * getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0.02 * getHeight(context)),
              DropdownMenu(
                width: 0.8 * getWidth(context),
                hintText: 'Select',
                leadingIcon: Icon(Icons.notes),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: '1',
                    label: 'select',
                    leadingIcon: Icon(Icons.notes),
                  ),
                ],
              ),
              SizedBox(height: 0.02 * getHeight(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCoButton(
                    onTap: () {},
                    title: 'CANCEL',
                    width: 0.4 * getWidth(context),
                    height: 0.04 * getHeight(context),
                    backgroundColor: AppColors.white,
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MyCoButton(
                    onTap: () {},
                    title: 'ADD',
                    width: 0.4 * getWidth(context),
                    height: 0.04 * getHeight(context),
                    backgroundColor: AppColors.primary,
                    boarderRadius: 30 * getResponsive(context),
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
    required VoidCallback onTap,
    Color textColor = AppColors.black,
    TextDecoration? decoration,
  }) => Row(
    children: [
      Expanded(
        flex: 7,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14 * getResponsiveText(context),
          ),
        ),
      ),
      const Text(':'),
      SizedBox(width: 0.03 * getWidth(context)),
      Expanded(
        flex: 5,
        child: InkWell(
          onTap: onTap,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14 * getResponsiveText(context),
              color: textColor,
              decoration: decoration,
            ),
          ),
        ),
      ),
    ],
  );

  Future<dynamic> cancelOrderBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        shape: const BeveledRectangleBorder(),
        context: context,
        builder: (context) => Container(
          color: AppColors.white,
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
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Text(
                  'Order #230',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24 * getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/take_order/cancel_order.png',
                  height: 0.2 * getHeight(context),
                ),
              ),
              SizedBox(height: 0.015 * getHeight(context)),
              Center(
                child: Text(
                  'Do you Want to Cancel this Order ?',
                  style: TextStyle(
                    fontSize: 22 * getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 0.015 * getHeight(context)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * getWidth(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCoButton(
                      onTap: () {},
                      title: 'CANCEL',
                      width: 0.4 * getWidth(context),
                      height: 0.04 * getHeight(context),
                      backgroundColor: AppColors.white,
                      boarderRadius: 30 * getResponsive(context),
                      textStyle: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyCoButton(
                      onTap: () {},
                      title: 'ADD',
                      width: 0.4 * getWidth(context),
                      height: 0.04 * getHeight(context),
                      backgroundColor: AppColors.primary,
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

  Container getOrderContainer(BuildContext context) => Container(
    padding: EdgeInsets.all(8 * getResponsive(context)),
    margin: EdgeInsets.symmetric(horizontal: 0.01 * getWidth(context)),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[600]!),
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: Column(
      children: [
        Image.asset(
          'assets/take_order/apple_image.png',
          height: 0.02 * getHeight(context),
        ),
        SizedBox(height: 0.01 * getHeight(context)),
        const Text('Appy Fizz', style: TextStyle(color: AppColors.primary)),
        SizedBox(height: 0.005 * getHeight(context)),
        Text(
          'Unit: 25 ₹2000.0',
          style: TextStyle(fontSize: 12 * getResponsiveText(context)),
        ),
      ],
    ),
  );
}
