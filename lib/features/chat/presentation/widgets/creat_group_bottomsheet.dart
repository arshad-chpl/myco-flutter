import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class FilterBottomSheet extends StatelessWidget {
  final double? headerWidth;
  final double? headerHeight;
  final EdgeInsetsGeometry? headerPadding;
  final Decoration? decoration;
  final TextStyle? optionTextStyle;
  final Color? headerColor;
  final bool? isHeaderRequired;
  final bool? isButtonRequired;

  const FilterBottomSheet({
    super.key,

    this.headerWidth,
    this.headerHeight,
    this.headerPadding,
    this.decoration,
    this.optionTextStyle,
    this.headerColor,
    this.isHeaderRequired = true,
    this.isButtonRequired = true,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(bottom: 20 * Responsive.getResponsive(context)),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        isHeaderRequired == false
            ? SizedBox.shrink()
            : Container(
                height: headerHeight,
                width: headerWidth ?? double.infinity,
                padding:
                    headerPadding ??
                    EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                decoration:
                    decoration ??
                    BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),

                      boxShadow: [
                        BoxShadow(
                          color:
                              headerColor?.withAlpha(200) ??
                              AppTheme.getColor(context).primary.withAlpha(200),
                        ),
                        BoxShadow(
                          color:
                              headerColor ?? AppTheme.getColor(context).primary,
                          spreadRadius: -4.0,
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                child: CustomText(
                  'Filter',

                  fontSize: 22 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onPrimary,
                ),
              ),

        // Radio List
         SizedBox(height: 12 * Responsive.getResponsive(context)),
         Center(
      child: Stack(
        children: [
          /// Main CircleAvatar with logo inside
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade50, // light background like in the image
            child: Image.asset(
              'assets/chat/creat_group.png', // replace with your logo path
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),

          /// Camera icon on bottom-right
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.all(Radius.circular(8))
                // shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.camera_alt,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
         SizedBox(height: 12 * Responsive.getResponsive(context)),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: MyCoTextfield(
            hintText: 'Enter Group Name',
            hintTextStyle: AppTheme.getTextStyle(
              context,
            ).labelLarge!.copyWith(color: AppColors.textSecondary),
            prefix: const Icon(Icons.search),
            contentPadding: EdgeInsets.only(
              top: 0.012 * Responsive.getHeight(context),
            ),
            boarderRadius: 12 * Responsive.getResponsive(context),
          
            onChanged: (value) => {},
          ),
        ),
        const SizedBox(height: 8),

        // Buttons
        isButtonRequired == false
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 12),
                    MyCoButton(
                      textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(
                        context,
                      ),
                      backgroundColor: Colors.white,
                      onTap: () => Navigator.pop(context),
                      title: 'CANCEL',
                      boarderRadius: 30,
                      width: 0.4 * Responsive.getWidth(context),
                    ),

                    const SizedBox(width: 16),

                    MyCoButton(
                      boarderRadius: 30,
                      width: 0.4 * Responsive.getWidth(context),

                      onTap: () {
                        // widget.onApply?.call(_selectedIndex);
                        Navigator.pop(context);
                      },
                      title: 'CREATE',
                      isShadowBottomLeft: true,
                    ),

                    const SizedBox(width: 12),
                  ],
                ),
              ),
      ],
    ),
  );
}
