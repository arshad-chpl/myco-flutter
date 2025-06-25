import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class AddOrderBottomsheet extends StatelessWidget {
  const AddOrderBottomsheet({super.key});

  @override
  Widget build(BuildContext context) => Container(
    color: AppTheme.getColor(context).onPrimary,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * getWidth(context),
            vertical: 0.01 * getHeight(context),
          ),
          width: getWidth(context),
          height: 0.06 * getHeight(context),
          decoration: BoxDecoration(color: AppTheme.getColor(context).primary),
          child: Text(
            'Appy Fizz (Apple)',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24 * getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(height: 0.02 * getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Text(
            'Add Quantity',
            style: TextStyle(
              fontSize: 22 * getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 0.03 * getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Row(
            children: [
              Text(
                'Price (₹)',
                style: TextStyle(fontSize: 22 * getResponsiveText(context)),
              ),
              const Spacer(),
              Container(
                height: 0.05 * getHeight(context),
                width: 0.25 * getWidth(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(
                    context,
                  ).secondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(
                    12 * getResponsive(context),
                  ),
                ),
                child: Center(
                  child: Text(
                    '17',
                    style: TextStyle(
                      fontSize: 22 * getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.03 * getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Row(
            children: [
              Text(
                'Units',
                style: TextStyle(fontSize: 22 * getResponsiveText(context)),
              ),
              const Spacer(),
              Row(
                children: [
                  buildContainer(
                    context,
                    width: 0.09 * getWidth(context),
                    icon: Icons.remove,
                  ),
                  SizedBox(width: 0.02 * getWidth(context)),
                  buildContainer(
                    context,
                    width: 0.17 * getWidth(context),
                    isIcon: false,
                    textData: 'Add',
                    bgColor: AppTheme.getColor(
                      context,
                    ).primary.withValues(alpha: 0.2),
                  ),
                  SizedBox(width: 0.02 * getWidth(context)),
                  buildContainer(
                    context,
                    width: 0.09 * getWidth(context),
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 0.03 * getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyCoButton(
                onTap: () {},
                title: 'CANCEL',
                width: 0.4 * getWidth(context),
                backgroundColor: AppTheme.getColor(context).onPrimary,
                boarderRadius: 30 * getResponsive(context),
                textStyle: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              MyCoButton(
                onTap: () {},
                title: 'ADD',
                width: 0.4 * getWidth(context),
                backgroundColor: AppTheme.getColor(context).primary,
                boarderRadius: 30 * getResponsive(context),
                textStyle: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.04 * getHeight(context)),
      ],
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
