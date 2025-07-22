import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignToVisit extends StatelessWidget {
   AssignToVisit({super.key});

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
      title: LanguageManager().get('add_new_visit'),
      // appbartxtcolor: AppTheme.getColor(context).onSurface,
      // size: 16 * Responsive.getResponsive(context),
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
              title: LanguageManager().get('assign_to'),
              borderRadius: 12,
              headerPadding: EdgeInsets.symmetric(
                horizontal: 12 * Responsive.getResponsive(context),
                vertical: 8 * Responsive.getResponsive(context),
              ),
              headerColor: AppTheme.getColor(context).secondary,
              suffixIcon: MyCoButton(
                onTap: () {
                  // Handle Change button tap
                },
                title: LanguageManager().get('change'),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 13 * Responsive.getResponsiveText(context),
                ),
                width: 0.18 * Responsive.getWidth(context),
                height: 0.03 * Responsive.getHeight(context),
                boarderRadius: 30 * Responsive.getResponsive(context),
                isShadowBottomLeft: true,
                wantBorder: false, // remove border for clean look
                backgroundColor: AppTheme.getColor(context).primary,
              ),
              bottomWidget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 9 * Responsive.getResponsive(context),
                  vertical:
                      0, // removed vertical padding to remove bottom space
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero, // remove internal GridView padding
                  physics: const NeverScrollableScrollPhysics(),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 14 * Responsive.getResponsive(context),
                          backgroundColor: AppTheme.getColor(
                            context,
                          ).outlineVariant,
                        ),
                        SizedBox(width: 6 * Responsive.getResponsive(context)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
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
                        SizedBox(width: 6 * Responsive.getResponsive(context)),
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
            LabeledDropdown<String>(
              label: LanguageManager().get('customer_to_visit'),
              items: Customer,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // handle change
              },
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(
                AppAssets.personalcard,
                fit: BoxFit.scaleDown,
              ),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              hintText: LanguageManager().get('select'),
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              textFontSize: 13 * Responsive.getResponsiveText(context),
              textColor: AppTheme.getColor(context).onSurface,
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            LabeledTextField(
              label: LanguageManager().get('visit_date'),
              hint: LanguageManager().get('select_date'),
              heightFactor: 0.06 * Responsive.getHeight(context),
              widthFactor: Responsive.getWidth(context),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.getColor(context).primary,
                ),
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
              ),
              textFontSize: 18 * Responsive.getResponsiveText(context),
              textColor: AppTheme.getColor(context).onSurface,
              textFontweight: FontWeight.w500,
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              prefix: SvgPicture.asset(
                AppAssets.note_favorite,
                fit: BoxFit.scaleDown,
              ),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            LabeledDropdown<String>(
              label: LanguageManager().get('visit_slots'),
              items: VisitSlot,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // handle change
              },
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.clock, fit: BoxFit.scaleDown),
              hintText: LanguageManager().get('select_time_slot'),
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              textFontSize: 12 * Responsive.getResponsiveText(context),
              textColor: AppTheme.getColor(context).onSurface,
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomRadioButton(
              height: 0.06 * Responsive.getHeight(context),
              options: ['Field visit', 'Virtual visit'],
              onChanged: (selected) {},
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            LabeledDropdown<String>(
              label: LanguageManager().get('visit_purpose'),
              items: VisitPurpose,
              selectedItem: selectedleavetype,
              itemToString: (item) => item,
              onChanged: (value, index) {
                // handle change
              },
              height: 0.06 * Responsive.getHeight(context),
              spacing: 10 * Responsive.getResponsive(context),
              prefix: SvgPicture.asset(AppAssets.gps, fit: BoxFit.scaleDown),
              prefixImageHeight: 20 * Responsive.getHeight(context),
              prefixImageWidth: 20 * Responsive.getWidth(context),
              hintText: LanguageManager().get('select'),
              hintTextStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
                fontWeight: FontWeight.w400,
              ),
              textFontSize: 12 * Responsive.getResponsiveText(context),
              textColor: AppTheme.getColor(context).onSurface,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30 * Responsive.getResponsive(context),
                right: 20 * Responsive.getResponsive(context),
                bottom: 8 * Responsive.getResponsive(context),
                left: 20 * Responsive.getResponsive(context),
              ),
              child: MyCoButton(
                onTap: () {

                },
                title: LanguageManager().get('submit'),
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
