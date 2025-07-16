import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class VisitTemplate extends StatefulWidget {
  const VisitTemplate({super.key});

  @override
  State<VisitTemplate> createState() => _VisitTemplateState();
}

class _VisitTemplateState extends State<VisitTemplate> {

  final List<String> branchType = [
  'Head Office',
  'Mumbai Branch',
  'Delhi Branch',
  'Bangalore Warehouse',
  'Pune Client Site',
  'Hyderabad Branch',
  'Chennai Regional Office',
  'Kolkata Branch',
  'Ahmedabad Branch',
  'Remote Site',
];

  String? selectedBranchType;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      //padding: EdgeInsets.all(0.08*Responsive.getResponsive(context)),
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
        vertical: 0.02 * Responsive.getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 0.05 * Responsive.getHeight(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Visit Template',
                fontWeight: FontWeight.w600,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              SvgPicture.asset(
                AppAssets.assetVector,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          LabeledTextField(
            label: 'Q1',
            hint: 'Type here',
            textAlignment: TextAlign.start,
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetNoteFavorite,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          CustomText(
            'Branch',
            fontSize: 16 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 0.01 * Responsive.getHeight(context)),

          CustomPopupDropdownStyled<String>(
            items: branchType,
            hintText: 'Select',
            spacing: 0.04 * Responsive.getWidth(context),
            height: 0.07 * Responsive.getHeight(context),
            prefix: SvgPicture.asset(
              AppAssets.assetData,
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).outline,
              fontWeight: FontWeight.w600,
            ),
            border: BoxBorder.all(color: AppTheme.getColor(context).outline),

            selectedItem: selectedBranchType,
            itemToString: (item) => item,
            onChanged: (value, index) {
              setState(() {
                selectedBranchType = value;
              });
            },
            useRadioList: true,
          ),

          SizedBox(height: 0.10 * Responsive.getHeight(context)),
          MyCoButton(
            boarderRadius: 30 * Responsive.getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {
              Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => const RemarkPage()),
              );
            },
            title: 'SUBMIT',
          ),
        ],
      ),
    ),
  );
}
