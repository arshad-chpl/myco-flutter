import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';

import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

//Bottom sheet for show visit report content
class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(
      left:
          VariableBag.bottomSheetLeftPadding *
          Responsive.getResponsive(context),
      right:
          VariableBag.bottomSheetRightPadding *
          Responsive.getResponsive(context),
      top:
          VariableBag.bottomSheetTopPadding * Responsive.getResponsive(context),
      bottom:
          VariableBag.bottomSheetRightPadding *
          Responsive.getResponsive(context),
    ),

    child: SingleChildScrollView(
      child: Column(
        spacing:
            VariableBag.textFieldRowGap * Responsive.getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Test heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Custom Text for Test New vist row
              CustomText(
                'Test New Visit',
                fontWeight: FontWeight.w600,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  AppAssets.arrowDoubleDown,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),

          //Branch LabelTextField
          NewTextField(
            label: 'Branch',
            hintText: 'Salse',
            prefixIconPath: AppAssets.assetData,
          ),
          //image_Dashed Container
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                'Media',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              SizedBox(height: 6 * Responsive.getResponsive(context)),
              DesignBorderContainer(
                borderRadius: 12 * Responsive.getResponsive(context),
                height: 0.088 * Responsive.getHeight(context),
                width: 0.21 * Responsive.getWidth(context),
                borderColor: AppTheme.getColor(context).primary,
                backgroundColor: AppTheme.getColor(context).surfaceContainer,
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      height: 0.047 * Responsive.getHeight(context),
                      width: 0.17 * Responsive.getWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          08 * Responsive.getResponsive(context),
                        ),
                        color: AppColors.gray10,
                      ),
                    ),
                    SizedBox(height: 0.005 * Responsive.getHeight(context)),
                    CustomText("yash.jpg", fontSize: 10),
                    //SizedBox(height: 0.001 * Responsive.getHeight(context)),
                  ],
                ),
              ),
            ],
          ),

          //Today work LabelTextField
          NewTextField(
            label: 'Today Work',
            hintText: 'SalseNVISWINDO',
            prefixIconPath: AppAssets.assetDocumentText,
          ),

          Container(height: 10),
        ],
      ),
    ),
  );
}
