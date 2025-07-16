import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0 * Responsive.getResponsive(context),
    ),
    child: SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0 * Responsive.getResponsive(context),
        right: 16.0 * Responsive.getResponsive(context),
        top: 20 * Responsive.getResponsive(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          // row with title and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Visit Template',
                fontWeight: FontWeight.w600,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              SvgPicture.asset(AppAssets.assetVector, fit: BoxFit.scaleDown),
            ],
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          // Text field with label "Q1"
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

          // Custom dropdown to select branch
          LabeledDropdown(
            label: 'Branch',
            items: branchType,
            width: Responsive.getWidth(context),
            hintText: 'Select',
            border: BoxBorder.all(color: AppTheme.getColor(context).outline),
            prefix: SvgPicture.asset(
              AppAssets.assetData,
              fit: BoxFit.scaleDown,
            ),
            itemToString: (item) => item,
            selectedItem: selectedBranchType,
            onChanged: (value, index) {},
          ),

          SizedBox(height: 0.10 * Responsive.getHeight(context)),

          // Submit button
          MyCoButton(
            boarderRadius: 30 * Responsive.getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {

               //use below code to open bottom sheet
              // showModalBottomSheet(
              //   context: context,
              //   isScrollControlled: true,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.vertical(
              //       top: Radius.circular(
              //         16 * Responsive.getResponsive(context),
              //       ),
              //     ),
              //   ),
              //   builder: (context) => const RemarkBottomSheet(),
              // );
            },
            title: 'SUBMIT',
          ),

          SizedBox(height: 0.01 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );
}
