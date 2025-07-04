import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/all_distributor_page.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class RescheduleVisit extends StatelessWidget {
  const RescheduleVisit({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const BackButton(),
      centerTitle: false,
      title: const CustomText('Reschedule Visit', fontWeight: FontWeight.w600),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 0.018 * getWidth(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonRow(
                  context,
                  title: 'Self Visit',
                  isRadio: true,
                  isChecked: true,
                ),
                getCommonRow(
                  context,
                  title: 'Add visit for other employee',
                  isRadio: true,
                ),
                getCommonRow(context, title: 'Visit With', isRadio: true),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Row getCommonRow(
    BuildContext context, {
    required String title,
    TextDecoration? decoration,
    bool isRadio = false,
    bool isChecked = false,
  }) => Row(
    children: [
      if (isRadio)
        Transform.scale(
          scale: 0.6,
          child: Radio(
            value: true,
            groupValue: isChecked,
            onChanged: (value) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),

      CustomText(
        title,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w300,
        fontSize: 16 * getResponsiveText(context),
        decoration: decoration,
      ),
    ],
  );
}
