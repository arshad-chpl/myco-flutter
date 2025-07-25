import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_radio_button.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/travel_mode.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/field_virtual_visit_toggle.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_custom_radio_button.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AssignToVisit extends StatefulWidget {
  const AssignToVisit({super.key});

  @override
  State<AssignToVisit> createState() => _AssignToVisitState();
}

class _AssignToVisitState extends State<AssignToVisit> {
  String selectedVisitType = 'Self Visit';
  String selectedFieldVisit = 'Field Visit';

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
      title: 'add_new_visit',
      isKey: true,
      appBarBackgoundColor: AppTheme.getColor(context).surface,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: Column(
          spacing:
              VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
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

            CommonCard(
              title: LanguageManager().get('assign_to'),
              borderRadius:
                  VariableBag.commonCardBorderRadius *
                  Responsive.getResponsive(context),
              headerPadding: EdgeInsets.symmetric(
                horizontal:
                    VariableBag.commonCardHorizontalPadding *
                    Responsive.getResponsive(context),
                vertical:
                    VariableBag.commonCardVerticalPadding *
                    Responsive.getResponsive(context),
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
                boarderRadius:
                    VariableBag.buttonBorderRadius *
                    Responsive.getResponsive(context),
                isShadowBottomLeft: true,
                backgroundColor: AppTheme.getColor(context).primary,
              ),
              bottomWidget: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 9 * Responsive.getResponsive(context),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 45 * Responsive.getResponsive(context),
                    crossAxisSpacing: 20 * Responsive.getResponsive(context),
                    mainAxisSpacing: 5 * Responsive.getResponsive(context),
                  ),
                  itemBuilder: (context, index) => Row(
                    spacing:
                        VariableBag.textFieldRowGap *
                        Responsive.getResponsive(context),
                    children: [
                      CircleAvatar(
                        radius: 14 * Responsive.getResponsive(context),
                        backgroundColor: AppTheme.getColor(
                          context,
                        ).outlineVariant,
                      ),
                      Expanded(
                        child: Column(
                          spacing: 5 * Responsive.getResponsive(context),
                          mainAxisAlignment: MainAxisAlignment.center,
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
            NewTextField(
              label: 'customer_to_visit',
              isKey: true,
              prefixIconPath: AppAssets.personalcard,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              onTap: () async {
                // handle on tap function
              },
            ),
            NewTextField(
              label: 'visit_date',
              isKey: true,
              hintText: LanguageManager().get('select_date'),
              prefixIconPath: AppAssets.note_favorite,
              onTap: () async {
                // show date picker
              },
            ),
            NewTextField(
              label: 'visit_slots',
              isKey: true,
              prefixIconPath: AppAssets.clock,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select_time_slot'),
              onTap: () async {
                // handle tap function
              },
            ),
            FieldVirtualVisitToggle(
              selectedValue: selectedFieldVisit,
              onChanged: (v) => {
                // handle toggle button
              },
            ),

            NewTextField(
              label: LanguageManager().get('visit_purpose'),
              prefixIconPath: AppAssets.gps,
              suffixIconPath: AppAssets.arrow_down,
              hintText: LanguageManager().get('select'),
              onTap: () async {
                // handle tap function
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0 * Responsive.getResponsive(context)),
              child: MyCoButton(
                onTap: () {},
                title: LanguageManager().get('submit'),
                textStyle: TextStyle(
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize:
                      22 * Responsive.getResponsiveText(context), // reduced
                  fontFamily: 'Gilroy-Bold',
                ),
                isShadowBottomLeft: true,
                boarderRadius:
                    VariableBag.buttonBorderRadius *
                    Responsive.getResponsive(context),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
