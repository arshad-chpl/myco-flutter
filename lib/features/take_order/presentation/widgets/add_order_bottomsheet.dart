import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AddOrderBottomsheet extends StatelessWidget {
  const AddOrderBottomsheet({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        12 * Responsive.getResponsive(context),
      ),
      color: AppTheme.getColor(context).onPrimary,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.08 * Responsive.getWidth(context),
                vertical: 0.01 * Responsive.getHeight(context),
              ),
              width: Responsive.getWidth(context),
              height: 0.05 * Responsive.getHeight(context),
              decoration: BoxDecoration(
                color: AppTheme.getColor(context).primary,
              ),
              child: CustomText(
                'Appy Fizz (Apple)',
                fontSize: 20 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).onPrimary,
              ),
            ),
            // Inner shadow simulation using a white gradient
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.getColor(
                          context,
                        ).onPrimary.withValues(alpha: 0.3), // top white fade
                        Colors.transparent, // fade to transparent
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 0.02 * Responsive.getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: CustomText(
            'Add Quantity',
            fontSize: 18 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 0.01 * Responsive.getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: Row(
            children: [
              CustomText(
                'Price (₹)',
                fontSize: 18 * Responsive.getResponsiveText(context),
              ),
              const Spacer(),
              Container(
                height: 0.038 * Responsive.getHeight(context),
                width: 0.22 * Responsive.getWidth(context),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(
                    context,
                  ).secondary.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
                child: Center(
                  child: CustomText(
                    '17',
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: Row(
            children: [
              CustomText(
                'Units',
                fontSize: 18 * Responsive.getResponsiveText(context),
              ),
              const Spacer(),
              Row(
                children: [
                  buildContainer(
                    context,
                    width: 0.09 * Responsive.getWidth(context),
                    icon: Icons.remove,
                  ),
                  SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  buildContainer(
                    context,
                    width: 0.17 * Responsive.getWidth(context),
                    isIcon: false,
                    textData: 'Add',
                    bgColor: AppTheme.getColor(
                      context,
                    ).primary.withValues(alpha: 0.2),
                  ),
                  SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  buildContainer(
                    context,
                    width: 0.09 * Responsive.getWidth(context),
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 0.045 * Responsive.getHeight(context)),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: SideBySideButtons(
            button1Name: 'CANCEL',
            button2Name: 'ADD',
            onTap1: () {},
            onTap2: () {},
          ),
        ),
        SizedBox(height: 0.03 * Responsive.getHeight(context)),
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
    height: 0.035 * Responsive.getHeight(context),
    width: width,
    decoration: BoxDecoration(
      color: bgColor ?? AppTheme.getColor(context).primary,
      borderRadius: BorderRadius.circular(
        8.0 * Responsive.getResponsive(context),
      ),
    ),
    child: Center(
      child: isIcon
          ? Icon(
              icon,
              color: AppTheme.getColor(context).onPrimary,
              size: 20 * Responsive.getResponsive(context),
            )
          : CustomText(
              textData ?? '',
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
    ),
  );
}
