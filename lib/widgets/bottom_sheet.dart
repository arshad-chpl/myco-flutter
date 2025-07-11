import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),

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
              SizedBox(
                height: 0.02 * getHeight(context),
                width: 0.05 * getWidth(context),
                child: SvgPicture.asset(
                  'assets/visit_svgs/calendar.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.03 * getHeight(context)),
          CustomText(
            'Branch',
            fontWeight: FontWeight.w600,
            fontSize: 16 * getResponsiveText(context),
          ),

          CustomPopupDropdownStyled<String>(
            items: leavetype,
            hintText: 'Select',
            prefix: SvgPicture.asset(
              'assets/visit_svgs/calendar.svg',
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * getResponsiveText(context),
              color: AppTheme.getColor(context).outline,
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

          Container(
            width: double.infinity,
            color: AppTheme.getColor(context).surfaceContainer,
            height: 0.11 * getHeight(context),
            child: BorderContainerWraper(
              isBorder: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/visit_svgs/calendar.svg',
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
          SizedBox(height: 0.02 * getHeight(context)),
          LabeledTextField(
            label: 'Today Work',
            hint: 'Type here',
            widthFactor: getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(10 * getResponsive(context)),
            ),
            prefix: SvgPicture.asset(
              'assets/visit_svgs/calendar.svg',
              fit: BoxFit.scaleDown,
            ),
          ),

          SizedBox(height: 0.10 * getHeight(context)),
          MyCoButton(
            boarderRadius: 30 * getResponsive(context),
            isShadowBottomLeft: true,
            onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const VisitReport(),));
            },
            title: 'SUBMIT',
          ),
        ],
      ),
    ),
  );
}
