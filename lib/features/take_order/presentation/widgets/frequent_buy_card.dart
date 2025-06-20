import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/add_order_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class FrequentBuyCard extends StatelessWidget {
  const FrequentBuyCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.white,
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
        style: TextStyle(
          fontSize: 16 * getResponsiveText(context),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('KG', style: TextStyle(fontSize: 14 * getResponsive(context))),
          Text(
            '2322342',
            style: TextStyle(fontSize: 14 * getResponsive(context)),
          ),
        ],
      ),
      trailing: Column(
        children: [
          MyCoButton(
            onTap: () {
              showModalBottomSheet(
                shape: const BeveledRectangleBorder(),
                context: context,
                builder: (context) => AddOrderBottomsheet(),
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
}
