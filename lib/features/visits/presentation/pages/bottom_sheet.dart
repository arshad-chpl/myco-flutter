import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';
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
    padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),

    child: SingleChildScrollView(
      child: Column(
        spacing: 10 * getResponsive(context),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.03 * getHeight(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'Test New Visit',
                fontWeight: FontWeight.w600,
                fontSize: 16 * getResponsiveText(context),
              ),
              SizedBox(
                height: 0.02 * getHeight(context),
                width: 0.05 * getWidth(context),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/visit_svgs/double_DA.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.03 * getHeight(context)),

          LabeledTextField(
            label: 'Branch',
            hint: 'Sales',
            hintTextStyle: TextStyle(
              color: AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlignment: TextAlign.start,
            prefix: SvgPicture.asset(
              'assets/visit_svgs/data.svg',
              fit: BoxFit.scaleDown,
            ),
            widthFactor: getWidth(context),
          ),

          CustomText(
            'Media',
            fontSize: 12 * getResponsiveText(context),
            fontWeight: FontWeight.w700,
            color: AppColors.textGray,
          ),
          InkWell(
            onTap: () {},
            child: DesignBorderContainer(
              backgroundColor: AppColors.lightTeal,
              width: 90,
              borderRadius: 10,
              child: FittedBox(
                child: Column(
                  children: [
                    Container(
                      height: 0.050 * getHeight(context),
                      width: 0.22 * getWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        color: AppColors.gray10,
                      ),
                    ),
                    CustomText(
                      'yash.jpg',
                      color: AppTheme.getColor(context).onSurface,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 0.02 * getHeight(context)),
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
              'assets/visit_svgs/document-text.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(height: 50),
        ],
      ),
    ),
  );
}
