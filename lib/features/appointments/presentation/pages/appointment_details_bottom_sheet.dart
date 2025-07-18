import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AppointmentDetailsBottomSheet extends StatefulWidget {
  const AppointmentDetailsBottomSheet({super.key});

  @override
  State<AppointmentDetailsBottomSheet> createState() =>
      _AppointmentDetailsBottomSheetState();
}

class _AppointmentDetailsBottomSheetState
    extends State<AppointmentDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: AppTheme.getColor(context).primary,
        ),

        height: 0.07 * Responsive.getHeight(context),
        child: ListTile(
          leading: SvgPicture.asset(
            AppAssets.assetPerson,
            fit: BoxFit.scaleDown,
          ),

          title: CustomText(
            'Manish Chandra',
            color: AppTheme.getColor(context).surfaceBright,
          ),
          subtitle: CustomText(
            '7980239236',
            color: AppTheme.getColor(context).surfaceBright,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.only(
          left: 12 * Responsive.getResponsive(context),
          top: 16 * Responsive.getResponsive(context),
        ),
        child: CustomText(
          'Appointment Details',
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).primary,
        ),
      ),

      Padding(
        padding: EdgeInsets.all(32 * Responsive.getResponsive(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            LabeledTextField(
              textFieldHeight: 0.06 * Responsive.getHeight(context),
              textAlignment: TextAlign.start,
              label: 'Time',
              hint: 'Select Time',
              widthFactor: Responsive.getWidth(context),
              onClick: () {},
              isReadOnly: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                AppAssets.assetClock2,
                fit: BoxFit.scaleDown,
              ),
            ),
            LabeledTextField(
              textFieldHeight: 0.06 * Responsive.getHeight(context),
              textAlignment: TextAlign.start,
              label: 'Place',
              hint: 'Type Here',
              widthFactor: Responsive.getWidth(context),
              isSuffixIconOn: true,
              onClick: () {},
              isReadOnly: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              prefix: SvgPicture.asset(
                AppAssets.assetLocation,
                fit: BoxFit.scaleDown,
              ),
            ),

            CustomText(
              'Reason',
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),

            BigMyCoTextField(
              hintText: 'Type Here',
              prefixImage: SvgPicture.asset(
                AppAssets.assetStickyNote,
                fit: BoxFit.scaleDown,
              ),
            ),

            //SizedBox(height: 40 * Responsive.getResponsive(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCoButton(
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  width: 0.40 * Responsive.getWidth(context),
                  height: 0.06 * Responsive.getHeight(context),
                  onTap: () {},
                  backgroundColor: AppTheme.getColor(context).surfaceBright,
                  title: 'CANCEL',
                  textStyle: TextStyle(
                    color: AppTheme.getColor(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MyCoButton(
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  width: 0.40 * Responsive.getWidth(context),
                  height: 0.06 * Responsive.getHeight(context),
                  onTap: () {},
                  title: 'SEND REQUEST',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
