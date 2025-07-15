import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/add_order_bottomsheet.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class FrequentBuyCard extends StatelessWidget {
  const FrequentBuyCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(
        12 * Responsive.getResponsive(context),
      ),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.only(
        left: 12.0 * Responsive.getResponsive(context),
        right: 12.0 * Responsive.getResponsive(context),
        top: 6.0 * Responsive.getResponsive(context),
      ),
      // isThreeLine: true,
      leading: Image.asset(
        'assets/take_order/apple_image.png',
        width: 0.12 * Responsive.getWidth(context),
      ),
      title: CustomText(
        'Appy Fizz (Apple)',
        fontWeight: FontWeight.w500,
        fontSize: 13 * Responsive.getResponsiveText(context),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            'KG',
            fontSize: 12 * Responsive.getResponsiveText(context),
          ),
          CustomText(
            '2322342',
            fontSize: 10 * Responsive.getResponsiveText(context),
          ),
        ],
      ),
      trailing: Column(
        children: [
          MyCoButton(
            onTap: () {
              // showModalBottomSheet(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadiusGeometry.circular(20),
              //   ),
              //   clipBehavior: Clip.hardEdge,
              //   useSafeArea: true,

              //   context: context,
              //   builder: (context) => const AddOrderBottomsheet(),
              // );
              getBottomSheet(context, const AddOrderBottomsheet());
            },
            title: LanguageManager().get('add'),
            textStyle: TextStyle(
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onPrimary,
            ),
            boarderRadius: 30 * Responsive.getResponsive(context),
            width: 0.17 * Responsive.getWidth(context),
            height: 0.028 * Responsive.getHeight(context),
          ),
        ],
      ),
    ),
  );

  // Container buildContainer(
  //   BuildContext context, {
  //   required double width,
  //   Color? bgColor,
  //   bool isIcon = true,
  //   IconData? icon,
  //   String? textData,
  // }) => Container(
  //   height: 0.045 * Responsive.getHeight(context),
  //   width: width,
  //   decoration: BoxDecoration(
  //     color: bgColor ?? AppTheme.getColor(context).primary,
  //     borderRadius: BorderRadius.circular(8.0 * Responsive.getResponsive(context)),
  //   ),
  //   child: Center(
  //     child: isIcon
  //         ? Icon(icon, color: AppTheme.getColor(context).onPrimary)
  //         : CustomText(
  //             textData ?? '',
  //             fontSize: 20 * Responsive.getResponsiveText(context),
  //             fontWeight: FontWeight.bold,
  //           ),
  //   ),
  // );
}
