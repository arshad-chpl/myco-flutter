import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/report_dashed_container.dart';

import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

//Bottom sheet for show visit report content
class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: 0.08 * Responsive.getWidth(context),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10 * Responsive.getResponsive(context)),
        topRight: Radius.circular(10 * Responsive.getResponsive(context)),
      ),
    ),

    child: SingleChildScrollView(
      child: Column(
        spacing: 10 * Responsive.getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          //Test heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Custom Text for Test New vist row
              CustomText(
                'Test New Visit',
                fontWeight: FontWeight.w600,
                fontSize: 20 * Responsive.getResponsiveText(context),
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
          SizedBox(height: 0.008 * Responsive.getHeight(context)),

          //Branch LabelTextField
          LabeledTextField(
            label: LanguageManager().get('branch'),
            hint: LanguageManager().get('sales'),
            hintTextStyle: TextStyle(
              color: AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w600,
            ),
            textAlignment: TextAlign.start,
            prefix: SvgPicture.asset(
              AppAssets.assetData,
              fit: BoxFit.scaleDown,
            ),
            widthFactor: Responsive.getWidth(context),
          ),
          SizedBox(height: 0.002 * Responsive.getHeight(context)),

          //image_Dashed Container
          ReportDashedContainer(),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),

          //Today work LabelTextField
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Today Work',
            hint: 'SalesNVISWINDO',
            hintTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurface,
            ),
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetDocumentText,
              fit: BoxFit.scaleDown,
            ),
          ),

          Container(height: 50),
        ],
      ),
    ),
  );
}
