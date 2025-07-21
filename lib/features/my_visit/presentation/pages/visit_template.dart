import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

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
  final TextEditingController q1Controller = TextEditingController();
  final TextEditingController branchTypeController = TextEditingController();



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
          // Text field with label "Q1"
          NewTextField(
            label: 'Q1',
            hintText: 'Type here',
            prefixIconPath: AppAssets.assetNoteFavorite,
            controller: q1Controller,
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),

          // Custom dropdown to select branch
          NewTextField(
            label: 'Branch',
            hintText: 'Select',
            prefixIconPath: AppAssets.assetData,
            controller: branchTypeController,
            onTap: () async {
              // handle branch selection
            },
          ),

          SizedBox(height: 0.10 * Responsive.getHeight(context)),

          // Submit button
          MyCoButton(
            boarderRadius: 30 * Responsive.getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {
              // handle submit button
            },
            title: 'SUBMIT',
          ),

          SizedBox(height: 0.01 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );
}
