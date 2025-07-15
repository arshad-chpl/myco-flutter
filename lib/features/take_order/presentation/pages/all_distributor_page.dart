import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AllDistributorPage extends StatelessWidget {
  const AllDistributorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(appBarText: 'All Distributor'),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
        // vertical: 0.02 * Responsive.getHeight(context),
      ),
      child: Column(
        children: [
          MyCoTextfield(
            prefix: const Icon(Icons.search),
            hintText: 'Search',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => InkWell(
                onTap: () => context.pushNamed('distributor-visitor'),
                child: DistributorCard(
                  headerHeight: 0.045 * Responsive.getHeight(context),
                  title: 'Mukund',
                  bottomWidget: Padding(
                    padding: EdgeInsets.only(
                      left: 0.02 * Responsive.getWidth(context),
                      right: 0.02 * Responsive.getWidth(context),
                      bottom: 0.01 * Responsive.getHeight(context),
                    ),
                    child: Column(
                      children: [
                        getCommonRow(
                          context,
                          icon: Icons.person,
                          title: 'Manish',
                          isRadio: true,
                        ),
                        getCommonRow(
                          context,
                          icon: Icons.email,
                          title: 'Mukund@yopmail.com',
                        ),
                        SizedBox(height: 0.01 * Responsive.getHeight(context)),
                        getCommonRow(
                          context,
                          icon: Icons.call,
                          title: '+919909945983',
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );

  Row getCommonRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    TextDecoration? decoration,
    bool isRadio = false,
  }) => Row(
    children: [
      Icon(icon, size: 20 * Responsive.getResponsive(context)),
      SizedBox(width: 0.01 * Responsive.getWidth(context)),
      CustomText(
        title,
        fontSize: 14 * Responsive.getResponsiveText(context),
        decoration: decoration,
      ),
      const Spacer(),
      isRadio
          ? Transform.scale(
              scale: 0.7,
              child: Radio(value: true, groupValue: '', onChanged: (value) {}),
            )
          : const SizedBox.shrink(),
    ],
  );
}
