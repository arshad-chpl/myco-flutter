import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';
import 'package:myco_flutter/features/visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
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
      padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.05 * getHeight(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Test New Visit',
                fontWeight: FontWeight.w600,
                fontSize: 16 * getResponsiveText(context),
              ),
              SvgPicture.asset(AppAssets.assetVector, fit: BoxFit.scaleDown),
            ],
          ),
          SizedBox(height: 0.03 * getHeight(context)),
          CustomText(
            'Branch',
            fontWeight: FontWeight.w600,
            fontSize: 16 * getResponsiveText(context),
          ),
          SizedBox(height: 0.005 * getHeight(context)),
          CustomPopupDropdownStyled<String>(
            items: branchType,
            hintText: 'Select',
            spacing: 0.04 * getWidth(context),
            height: 0.07 * getHeight(context),
            prefix: SvgPicture.asset(
              AppAssets.assetData,
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * getResponsiveText(context),
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

          SizedBox(height: 0.02 * getHeight(context)),
          CustomText(
            'Media',
            fontWeight: FontWeight.w600,
            fontSize: 16 * getResponsiveText(context),
          ),
          SizedBox(height: 0.005 * getHeight(context)),

          Padding(
            padding: EdgeInsets.all(1 * getResponsive(context)),
            child: DesignBorderContainer(
              backgroundColor: AppTheme.getColor(context).surfaceContainer,
              width: double.infinity,
              height: 0.11 * getHeight(context),
              borderRadius: 10,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showMediaFilePicker(
                    isDialog: false,
                    isCameraShow: true,
                    isGalleryShow: true,
                    isDocumentShow: true,
                    context: context,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.assetGalleryExport,
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(height: 0.010 * getHeight(context)),

                    CustomText(
                      'Select Media',
                      fontSize: 14 * getResponsive(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 0.02 * getHeight(context)),
          LabeledTextField(
            label: 'Today Work',
            hint: 'Type here',
            widthFactor: getWidth(context),
            textAlignment: TextAlign.start,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(10 * getResponsive(context)),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetDocumentText,
              fit: BoxFit.scaleDown,
            ),
          ),

          SizedBox(height: 0.11 * getHeight(context)),
          MyCoButton(
            boarderRadius: 30 * getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const VisitReport(),));
            },
            title: 'SUBMIT',
          ),
        ],
      ),
    ),
  );
}
