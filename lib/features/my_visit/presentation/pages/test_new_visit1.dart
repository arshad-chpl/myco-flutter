import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/select_attachment_widget.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TestNewVisit1 extends StatefulWidget {
  const TestNewVisit1({super.key});

  @override
  State<TestNewVisit1> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit1> {
  final List<String> branchType = [
    'Head Office',
    'Mumbai Branch',
    'Delhi Branch',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.02 * Responsive.getHeight(context)),

          //label for Test New Visit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Test New Visit',
                fontWeight: FontWeight.w600,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              SvgPicture.asset(AppAssets.assetVector, fit: BoxFit.scaleDown),
            ],
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          //dropdown for branch selection
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

          SizedBox(height: 0.02 * Responsive.getHeight(context)),

          // Section label for media upload
          CustomText(
            'Media',
            fontWeight: FontWeight.w600,
            fontSize: 16 * Responsive.getResponsiveText(context),
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          // Media Picker container
          const SelectAttachmentWidget(
            label: 'Select Media',
            iconPath: AppAssets.assetGalleryExport,
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),

          // Text field for "Today's Work"
          LabeledTextField(
            label: 'Today Work',
            hint: 'Type here',
            widthFactor: Responsive.getWidth(context),
            textAlignment: TextAlign.start,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetDocumentText,
              fit: BoxFit.scaleDown,
            ),
          ),

          SizedBox(height: 0.08 * Responsive.getHeight(context)),

          //submit button
          MyCoButton(
            boarderRadius: 30 * Responsive.getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {},
            title: 'SUBMIT',
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );
}
