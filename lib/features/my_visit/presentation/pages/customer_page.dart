import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/customer_card_no_order.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final List<String> customers = ['Customer A', 'Customer B', 'Customer C'];
  String? selectedCustomer;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final multiplier = Responsive.getResponsiveText(context);
    final theme = AppTheme.getColor(context);

    final screenWidth = Responsive.getWidth(context);
    final isTablet = screenWidth >= 600;
    final buttonHeight = isTablet
        ? 0.08 * Responsive.getHeight(context)
        : 0.04 * Responsive.getHeight(context);

    return Scaffold(
      appBar: CustomAppbar(
        appBarBackgoundColor: theme.surface,
        title: CustomText(
          'Customer',
          fontSize: 18 * multiplier,
          fontWeight: FontWeight.w700,
          color: theme.onSurface,
        ),
        actions: [
          MyCoButton(
            title: 'Refresh',
            onTap: () {},
            width: 0.17 * screenWidth,
            height: buttonHeight,
            backgroundColor: AppColors.secondary,
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14 * multiplier,
              fontWeight: FontWeight.w500,
            ),
            boarderRadius: 40,
            borderColor: theme.secondary,
            isShadowBottomLeft: true,
          ),
          SizedBox(width: 8 * Responsive.getResponsive(context)),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: MyCoButton(
              title: 'Reset',
              onTap: () {},
              width: 0.17 * screenWidth,
              height: buttonHeight,
              backgroundColor: AppColors.primary,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14 * multiplier,
                fontWeight: FontWeight.w500,
              ),
              boarderRadius: 40,
              isShadowBottomLeft: true,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search
              MyCoTextfield(
                controller: searchController,
                focusNode: searchFocus,
                hintText: 'Search',
                fillColor: Colors.white,
                boarderRadius: 10,
                contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 12 * multiplier, right: 8 * multiplier),
                  child: Icon(
                    CupertinoIcons.search,
                    color: theme.primary,
                    size: 24 * multiplier,
                  ),
                ),
                typingtextStyle: TextStyle(fontSize: 14 * multiplier),
                hintTextStyle: TextStyle(
                  fontSize: 14 * multiplier,
                ),
                textAlignment: TextAlign.start,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10 * multiplier),
                  borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                ),
              ),

              SizedBox(height: 16 * Responsive.getResponsive(context)),

              //no order
              CustomerCardNoOrder(onTap: () {}),
              SizedBox(height: 16 * Responsive.getResponsive(context)),

              //take order
              CustomerCardOrderNow(onTap: () {}),
              SizedBox(height: 16 * Responsive.getResponsive(context)),

              //only visit
              CustomerCardOnlyVisit(onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}