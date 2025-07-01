import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/add_order_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class FrequentBuyCard extends StatelessWidget {
  const FrequentBuyCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
      border: Border.all(),
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(8.0 * getResponsive(context)),
      // isThreeLine: true,
      leading: Image.asset(
        'assets/take_order/apple_image.png',
        fit: BoxFit.contain,
      ),
      title: Text(
        'Appy Fizz (Apple)',
        style: AppTheme.getTextStyle(
          context,
        ).bodyLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('KG', style: AppTheme.getTextStyle(context).labelLarge),
          Text('2322342', style: AppTheme.getTextStyle(context).labelLarge),
        ],
      ),
      trailing: Column(
        children: [
          MyCoButton(
            onTap: () {
              showModalBottomSheet(
                shape: const BeveledRectangleBorder(),
                context: context,
                builder: (context) => const AddOrderBottomsheet(),
              );
            },
            title: 'Add',
            boarderRadius: 30 * getResponsive(context),
            width: 0.17 * getWidth(context),
            height: 0.04 * getHeight(context),
          ),
          const Spacer(),
        ],
      ),
    ),
  );

  Container buildContainer(
    BuildContext context, {
    required double width,
    Color? bgColor,
    bool isIcon = true,
    IconData? icon,
    String? textData,
  }) => Container(
    height: 0.045 * getHeight(context),
    width: width,
    decoration: BoxDecoration(
      color: bgColor ?? AppTheme.getColor(context).primary,
      borderRadius: BorderRadius.circular(8.0 * getResponsive(context)),
    ),
    child: Center(
      child: isIcon
          ? Icon(icon, color: AppTheme.getColor(context).onPrimary)
          : Text(
              textData ?? '',
              style: TextStyle(
                fontSize: 20 * getResponsiveText(context),
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  );
}
