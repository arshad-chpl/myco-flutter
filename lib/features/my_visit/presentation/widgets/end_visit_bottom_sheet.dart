import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/remark_bottom_sheet.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/test_new_visit1.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_template.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class EndVisitBottomSheet extends StatefulWidget {
  const EndVisitBottomSheet({super.key});

  @override
  State<EndVisitBottomSheet> createState() => _EndVisitBottomSheetState();
}

class _EndVisitBottomSheetState extends State<EndVisitBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Padding(
      padding: EdgeInsets.only(
        left:
            VariableBag.bottomSheetLeftPadding *
            Responsive.getResponsive(context),
        right:
            VariableBag.bottomSheetRightPadding *
            Responsive.getResponsive(context),
        bottom:
            VariableBag.bottomSheetBottomPadding *
            Responsive.getResponsive(context),
        top:
            VariableBag.bottomSheetTopPadding *
            Responsive.getResponsive(context),
      ),
      child: Column(
        spacing:
            VariableBag.formContentSpacingVertical *
            Responsive.getResponsive(context),
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              'visit_report',
              isKey: true,
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
          ),

          /// Image
          Center(
            child: Image.asset(AppAssets.visitReport, fit: BoxFit.contain),
          ),

          /// Dropdown 1
          NewTextField(
            hintText: 'Visit Template',
            prefixIconPath: AppAssets.message_edit,
            suffixIconPath: AppAssets.arrow_down,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => VisitTemplate(),
              );
            },
          ),

          /// Dropdown 2
          NewTextField(
            prefixIconPath: AppAssets.message_edit,

            hintText: 'Test New Visit',
            suffixIconPath: AppAssets.arrow_down,
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => TestNewVisit1(),
              );
            },
          ),

          /// Button Row
          Row(
            spacing:
                VariableBag.buttonRowSpacing *
                Responsive.getResponsive(context),
            children: [
              Expanded(
                child: MyCoButton(
                  onTap: () => Navigator.pop(context),
                  title: LanguageManager().get('close'),
                  textStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.transparent,
                  boarderRadius:
                      VariableBag.buttonBorderRadius *
                      Responsive.getResponsive(context),
                  borderColor: AppColors.primary,
                ),
              ),
              Expanded(
                child: MyCoButton(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => RemarkBottomSheet(),
                    );
                  },
                  title: LanguageManager().get('end_visit'),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColors.primary,
                  boarderRadius: 30,
                  wantBorder: false,
                  isShadowBottomLeft: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
