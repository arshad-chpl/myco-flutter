import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/distributor_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AllDistributorPage extends StatelessWidget {
  const AllDistributorPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const BackButton(),
      centerTitle: false,
      title: CustomText(
        'All Distributor',
        fontSize: 20 * getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
    ),

    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        // vertical: 0.02 * getHeight(context),
      ),
      child: Column(
        children: [
          MyCoTextfield(
            prefix: const Icon(Icons.search),
            hintText: 'Search',
            hintTextStyle: TextStyle(color: AppTheme.getColor(context).outline),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
            ),
          ),
          SizedBox(height: 0.015 * getHeight(context)),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => InkWell(
                onTap: () => context.pushNamed('distributor-visitor'),
                child: DistributorCard(
                  headerHeight: 0.045 * getHeight(context),
                  title: 'Mukund',
                  bottomWidget: Padding(
                    padding: EdgeInsets.only(
                      left: 0.02 * getWidth(context),
                      right: 0.02 * getWidth(context),
                      bottom: 0.01 * getHeight(context),
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
                        SizedBox(height: 0.01 * getHeight(context)),
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
                  SizedBox(height: 0.01 * getHeight(context)),
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
      Icon(icon, size: 20 * getResponsive(context)),
      SizedBox(width: 0.01 * getWidth(context)),
      CustomText(
        title,
        fontSize: 14 * getResponsiveText(context),
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
