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
  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      //padding: EdgeInsets.all(0.08*getResponsive(context)),
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * getWidth(context),
        vertical: 0.02 * getHeight(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 0.05 * getHeight(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Visit Template',
                fontWeight: FontWeight.w600,
                fontSize: 16 * getResponsiveText(context),
              ),
              SizedBox(
                height: 0.02 * getHeight(context),
                width: 0.05 * getWidth(context),
                child: SvgPicture.asset(
                  AppAssets.assetVector,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.03 * getHeight(context)),

          LabeledTextField(
            label: 'Q1',
            hint: 'Type here',
            textAlignment: TextAlign.start,
            widthFactor: getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(10 * getResponsive(context)),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetNoteFavorite,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 0.02 * getHeight(context)),
          CustomText(
            'Branch',
            fontSize: 16 * getResponsiveText(context),
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 0.01 * getHeight(context)),

          CustomPopupDropdownStyled<String>(
            items: leavetype,
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

            // width: double.infinity,
            selectedItem: selectedleavetype,
            itemToString: (item) => item,
            onChanged: (value, index) {
              setState(() {
                selectedleavetype = value;
              });
            },
            useRadioList: true,
          ),

          SizedBox(height: 0.10 * getHeight(context)),
          MyCoButton(
            boarderRadius: 30 * getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {
              // Navigator.push(
              //   context,
              //  MaterialPageRoute(builder: (context) => const TestNewVisit()),
              // );
            },
            title: 'SUBMIT',
          ),
        ],
      ),
    ),
  );
}
