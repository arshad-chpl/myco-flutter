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
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

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
            NewTextField(
              label: LanguageManager().get('customer_to_visit'),
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              onTap: () async {
                // open bottom sheet, modal, or page to pick customer
                // after user selects, setState(() => selectedCustomer = value);
              },
              controller: TextEditingController(
                text: selectedleavetype ?? '', // show selected item
              ),
              isRequired: false,
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            NewTextField(
              label: LanguageManager().get('visit_date'),
              hintText: LanguageManager().get('select_date'),
              prefixIconPath: AppAssets.note_favorite,
              suffixIconPath: null, // if you want, you can add calendar icon here
              onTap: () async {
                // show date picker
              }
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            NewTextField(
              label: LanguageManager().get('visit_slots'),
              prefixIconPath: AppAssets.clock,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select_time_slot'),
              controller: TextEditingController(
                text: selectedleavetype ?? '',
              ),
              onTap: () async {
                // handle tap function
              },
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            CustomRadioButton(
              height: 0.06 * Responsive.getHeight(context),
              options: ['Field visit', 'Virtual visit'],
              onChanged: (selected) {},
            ),
            SizedBox(height: 16 * Responsive.getResponsive(context)),
            NewTextField(
              label: LanguageManager().get('visit_purpose'),
              prefixIconPath: AppAssets.gps,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              controller: TextEditingController(
                text: selectedleavetype ?? '',
              ),
              onTap: () async {
                // handle tap function
              },
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