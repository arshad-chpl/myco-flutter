import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:myco_flutter/core/theme/app_theme.dart';

import 'package:myco_flutter/core/utils/responsive.dart';

import 'package:myco_flutter/features/asset/widgets/custom_appbar.dart';

import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_no_order.dart';

import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_only_visit.dart';

import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_order_now.dart';

import 'package:myco_flutter/features/my_visit/presentation/widgets/refresh_reset_buttons_row.dart';

import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_search_bar.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

import 'package:myco_flutter/widgets/custom_text.dart';

enum CustomerCardType { noOrder, orderTaken, onlyVisit }

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final TextEditingController searchController = TextEditingController();

  final FocusNode searchFocus = FocusNode();

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
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      actions: [
        RefreshResetButtonsRow(
          onRefresh: () {},
          onReset: () {},
          buttonHeight: 40,
        ),
      ],
      title: 'customer',

      isKey: true,
    ),

    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Search
            VisitSearchBar(
              controller: searchController,

              focusNode: searchFocus,

              hintText: 'Search',
            ),

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
  );
}
