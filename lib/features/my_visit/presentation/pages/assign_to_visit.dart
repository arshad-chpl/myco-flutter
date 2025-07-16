import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
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
      size: 16 * Responsive.getResponsive(context),
      appBarBackgoundColor: AppTheme.getColor(context).surface,
      leading: BackButton(),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 31.0 * Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 16 * getResponsive(context)),
            CustomVisitTypeRadioButton(
              textStyle: TextStyle(
                fontSize: 16 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),
              borderRadius: 8 * Responsive.getResponsive(context),
              height: 30 * Responsive.getHeight(context),
              borderColor: AppTheme.getColor(context).primary,
              options: visitTypes,
              selectedValue: selectedVisitType,
              onChanged: (value) {
                // Handle radio button change
              },
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CommonCard(
              suffixIcon: MyCoButton(
                onTap: () {},
                title: 'Change',
                isShadowBottomLeft: true,
                boarderRadius: 50 * Responsive.getResponsive(context),
                height: 0.04 * Responsive.getHeight(context),
                width: 0.2 * Responsive.getWidth(context),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 15 * Responsive.getResponsiveText(context),
                ),
              ),
              title: 'Assign To',
              onTap: () {
                // Handle change assign action
              },
              bottomWidget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 9 * Responsive.getResponsive(context),
                  vertical: 3 * Responsive.getResponsive(context),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 45 * Responsive.getResponsive(context),
                    crossAxisSpacing: 30 * Responsive.getResponsive(context),
                    mainAxisSpacing: 10 * Responsive.getResponsive(context),
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.only(
                      right: 6 * Responsive.getResponsive(context),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14 * Responsive.getResponsive(context),
                          backgroundColor: AppTheme.getColor(
                            context,
                          ).outlineVariant,
                        ),
                        SizedBox(width: 2 * Responsive.getResponsive(context)),
                        Expanded(
                          child: Column(
                            children: [
                              CustomText(
                                'Vatsal Champaneri',
                                color: AppTheme.getColor(context).onSurface,
                                fontSize:
                                    10 * Responsive.getResponsiveText(context),
                                overflow: TextOverflow.ellipsis,
                              ),
                              CustomText(
                                'QA',
                                fontSize:
                                    10 * Responsive.getResponsiveText(context),
                                color: AppTheme.getColor(context).onSurface,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2 * Responsive.getResponsive(context)),
                        SvgPicture.asset(
                          AppAssets.trash,
                          height: 0.02 * Responsive.getHeight(context),
                          width: 0.02 * Responsive.getWidth(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomText(
              'customer_to_visit',
              isKey: true,
              fontSize: 13 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.personalcard),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              items: Customer,
              hintText: 'Select ',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            LabeledTextField(
              heightFactor: 0.06 * Responsive.getHeight(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).primary,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              textAlignment: TextAlign.start,
              label: 'Visit Date',
              hint: 'Select Date',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              widthFactor: Responsive.getWidth(context),
              prefix: SvgPicture.asset(
                AppAssets.note_favorite,
                fit: BoxFit.scaleDown,
              ),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomText(
              'Visit Slot',
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock),
              items: VisitSlot,
              hintText: 'Select Slot',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomRadioButton(
              height: 0.06 * Responsive.getHeight(context),
              options: ['Field visit', 'Virtual visit'],
              onChanged: (selected) {},
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomText(
              'Visit Purpose',
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
            CustomPopupDropdownStyled<String>(
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.gps),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              items: VisitPurpose,
              hintText: 'Select',
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w400,
              ),
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {},
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30 * Responsive.getResponsive(context),
                right: 20 * Responsive.getResponsive(context),
                bottom: 8 * Responsive.getResponsive(context),
                left: 20 * Responsive.getResponsive(context),
              ),
              child: MyCoButton(
                onTap: () {},
                title: 'SUBMIT',
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize:
                      22 * Responsive.getResponsiveText(context), // reduced
                  fontFamily: 'Gilroy-Bold',
                ),
                isShadowBottomLeft: true,
                boarderRadius: 50 * Responsive.getResponsive(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
