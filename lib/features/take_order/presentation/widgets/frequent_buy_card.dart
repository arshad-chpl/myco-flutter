import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
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
      color: AppTheme.getColor(context).onPrimary,
      border: Border.all(color: AppTheme.getColor(context).outline),
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.only(
        left: 12.0 * getResponsive(context),
        right: 12.0 * getResponsive(context),
        top: 6.0 * getResponsive(context),
      ),
      // isThreeLine: true,
      leading: Image.asset(
        'visit/take_order/apple_image.png',
        width: 0.12 * getWidth(context),
      ),
      title: CustomText(
        'Appy Fizz (Apple)',
        fontWeight: FontWeight.w500,
        fontSize: 13 * getResponsiveText(context),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText('KG', fontSize: 12 * getResponsiveText(context)),
          CustomText('2322342', fontSize: 10 * getResponsiveText(context)),
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
            title: 'Add',
            textStyle: TextStyle(
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onPrimary,
            ),
            boarderRadius: 30 * getResponsive(context),
            width: 0.17 * getWidth(context),
            height: 0.028 * getHeight(context),
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
  //   height: 0.045 * getHeight(context),
  //   width: width,
  //   decoration: BoxDecoration(
  //     color: bgColor ?? AppTheme.getColor(context).primary,
  //     borderRadius: BorderRadius.circular(8.0 * getResponsive(context)),
  //   ),
  //   child: Center(
  //     child: isIcon
  //         ? Icon(icon, color: AppTheme.getColor(context).onPrimary)
  //         : CustomText(
  //             textData ?? '',
  //             fontSize: 20 * getResponsiveText(context),
  //             fontWeight: FontWeight.bold,
  //           ),
  //   ),
  // );
}
