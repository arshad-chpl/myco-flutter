import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_no_order.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_only_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_order_now.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

enum CustomerCardType { noOrder, orderTaken, onlyVisit }

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final TextEditingController searchController = TextEditingController();

  final List<CustomerCardType> customerCardList = [
    CustomerCardType.noOrder,

    CustomerCardType.orderTaken,

    CustomerCardType.onlyVisit,

    CustomerCardType.noOrder,

    CustomerCardType.onlyVisit,
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: 'customer',
      isKey: true,
      actions: [
        MyCoButton(
          title: 'Refresh',
          onTap: () {},
          width: 0.20 * Responsive.getWidth(context),
          height: 0.038 * Responsive.getHeight(context),
          backgroundColor: AppTheme.getColor(context).secondary,
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onSecondary,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
          ),
          boarderRadius: 40 * Responsive.getResponsive(context),
          borderColor: AppTheme.getColor(context).secondary,
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.030 * Responsive.getWidth(context)),
        MyCoButton(
          title: 'Reset',
          onTap: () {},
          width: 0.20 * Responsive.getWidth(context),
          height: 0.038 * Responsive.getHeight(context),
          backgroundColor: AppColors.primary,
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onSecondary,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
          ),
          boarderRadius: 40 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 16 * Responsive.getResponsive(context)),
      ],
    ),

    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * Responsive.getResponsive(context),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomSearchField(controller: searchController, hintText: 'Search'),

            SizedBox(height: 16 * Responsive.getResponsive(context)),

            // Cards
            Column(
              children: customerCardList.map((cardType) {
                Widget card;

                switch (cardType) {
                  case CustomerCardType.noOrder:
                    card = CustomerCardNoOrder(onTap: () {});

                    break;

                  case CustomerCardType.orderTaken:
                    card = CustomerCardOrderNow(onTap: () {});

                    break;

                  case CustomerCardType.onlyVisit:
                    card = CustomerCardOnlyVisit(onTap: () {});

                    break;
                }

                return Column(
                  children: [
                    card,

                    SizedBox(height: 16 * Responsive.getResponsive(context)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ),
    floatingActionButton: MyCoButton(
      onTap: () {
        context.pushNamed("addCustomer");
      },
      title: "",
      boarderRadius: 50 * Responsive.getResponsive(context),
      height: 0.080 * Responsive.getHeight(context),
      width: 0.080 * Responsive.getHeight(context),
      isShadowBottomLeft: true,
      image: Icon(
        Icons.add,
        color: Colors.white,
        size: 60 * Responsive.getResponsive(context),
      ),
    ),
  );
}
