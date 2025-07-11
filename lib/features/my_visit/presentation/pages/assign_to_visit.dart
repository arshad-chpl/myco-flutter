import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/employees/presentation/widgets/custom_appbar.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignToVisit extends StatefulWidget {
  const AssignToVisit({super.key});

  @override
  State<AssignToVisit> createState() => _AssignToVisitState();
}

class _AssignToVisitState extends State<AssignToVisit> {
  String selectedVisitType = 'Self Visit';

  final List<String> Customer = ['Customer 1', 'Customer 2', 'Customer 3'];
  final List<String> VisitSlot = ['Morning', 'Afternoon', 'Evening'];
  final List<String> VisitPurpose = ['Purpose 1', 'Purpose 2', 'Purpose 3'];

  String? selectedleavetype;

  final List<String> visitTypes = [
    'Self Visit',
    'Add visit for other employee',
    'Visit With',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      appBarText: 'Add New Visit',
      appbartxtcolor: AppTheme.getColor(context).onSurface,
      size: 16 * getResponsive(context),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: BackButton(),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 31.0 * getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16 * getResponsive(context)),
            CustomVisitTypeRadioButton(
              textStyle: TextStyle(
                fontSize: 16 * getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              borderRadius: 8 * getResponsive(context),
              height: 30 * getHeight(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) {
                // Handle radio button change
              },
            ),
            SizedBox(height: 16 * getResponsive(context)),
            CommonCard(
              suffixIcon: MyCoButton(
                onTap: () {},
                title: 'Change',
                isShadowBottomLeft: true,
                boarderRadius: 50 * getResponsive(context),
                height: 0.03 * getHeight(context),
                width: 0.3 * getWidth(context),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 16 * getResponsiveText(context),
                ),
              ),
              title: 'Assign To',
              onTap: () {
                // Handle change assign action
              },
              bottomWidget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * getResponsive(context),
                  vertical: 2 * getResponsive(context),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 40 * getResponsive(context),
                    crossAxisSpacing: 20 * getResponsive(context),
                    mainAxisSpacing: 15 * getResponsive(context),
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(right: 4 * getResponsive(context)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14 * getResponsive(context),
                          backgroundColor: AppTheme.getColor(
                            context,
                          ).outlineVariant,
                        ),
                        SizedBox(width: 4 * getResponsive(context)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                'Vatsal Champaneri',
                                color: AppTheme.getColor(context).onSurface,
                                fontSize: 10 * getResponsiveText(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                'QA',
                                fontSize: 10 * getResponsiveText(context),
                                color: AppTheme.getColor(context).onSurface,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4 * getResponsive(context)),
                        SvgPicture.asset(
                          AppAssets.trash,
                          height: 0.02 * getHeight(context),
                          width: 0.02 * getWidth(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16 * getResponsive(context)),
            CustomText(
              'Customer to visit',
              fontSize: 13 * getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * getHeight(context),
              spacing: 10 * getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.personalcard),
              prefixImageHeight: 20 * getHeight(context),
              prefixImageWidth: 20 * getWidth(context),
              items: Customer,
              hintText: '  Select ',
              hintTextStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            SizedBox(height: 16 * getResponsive(context)),
            LabeledTextField(
              heightFactor: 0.06 * getHeight(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).primary,
                ),
                borderRadius: BorderRadius.circular(
                  10 * getResponsive(context),
                ),
              ),
              textAlignment: TextAlign.start,
              label: 'Visit Date',
              hint: 'Select Date',
              hintTextStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              widthFactor: getWidth(context),
              prefix: SvgPicture.asset(
                AppAssets.note_favorite,
                fit: BoxFit.scaleDown,
              ),
              prefixImageHeight: 20 * getHeight(context),
              prefixImageWidth: 20 * getWidth(context),
            ),
            SizedBox(height: 16 * getResponsive(context)),
            CustomText(
              'Visit Slot',
              fontSize: 12 * getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * getHeight(context),
              spacing: 10 * getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock),
              items: VisitSlot,
              hintText: 'Select Slot',
              hintTextStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            SizedBox(height: 16 * getResponsive(context)),
            CustomRadioButton(
              height: 0.06 * getHeight(context),
              options: ['Field visit', 'Virtual visit'],
              onChanged: (selected) {},
            ),
            SizedBox(height: 16 * getResponsive(context)),
            CustomText(
              'Visit Purpose',
              fontSize: 12 * getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * getHeight(context),
              spacing: 10 * getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.gps , fit: BoxFit.scaleDown,),
              prefixImageHeight: 20 * getHeight(context),
              prefixImageWidth: 20 * getWidth(context),
              items: VisitPurpose,
              hintText: 'Select',
              hintTextStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w400,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            Padding(
              padding:
                  const EdgeInsets.only(
                    top: 30,
                    right: 20,
                    bottom: 12,
                    left: 20,
                  ) *
                  getResponsive(context),
              child: MyCoButton(
                onTap: () {},
                title: 'SUBMIT',
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 25 * getResponsiveText(context),
                  fontFamily: 'Gilroy-Bold',
                ),
                isShadowBottomLeft: true,
                boarderRadius: 50 * getResponsive(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
