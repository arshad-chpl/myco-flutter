import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/report_dashed_container.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/test_text_icon.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';

//Bottom sheet for show visit report content
class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10 * getResponsive(context)),
        topRight: Radius.circular(10 * getResponsive(context)),
      ),
    ),

    child: SingleChildScrollView(
      child: Column(
        spacing: 10 * getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.015 * getHeight(context)),

          //Test heading
          TestTextIcon(),
          SizedBox(height: 0.008 * getHeight(context)),

          //Branch LabelTextField
          LabeledTextField(
            label: 'Branch',
            hint: 'Sales',
            hintTextStyle: TextStyle(
              color: AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlignment: TextAlign.start,
            prefix: SvgPicture.asset(AppAssets.data, fit: BoxFit.scaleDown),
            widthFactor: getWidth(context),
          ),
          SizedBox(height: 0.002 * getHeight(context)),

          //image_Dashed Container
          ReportDashedContainer(),
          SizedBox(height: 0.012 * getHeight(context)),

          //Today work LabelTextField
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Today Work',
            hint: 'SalesNVISWINDO',
            hintTextStyle: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurface,
            ),
            widthFactor: getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(12 * getResponsive(context)),
            ),
            prefix: SvgPicture.asset(
              AppAssets.docoumentText,
              fit: BoxFit.scaleDown,
            ),
          ),

          Container(height: 50),
        ],
      ),
    ),
  );
}
