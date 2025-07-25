import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class VisitTemplate extends StatefulWidget {
  const VisitTemplate({super.key});

  @override
  State<VisitTemplate> createState() => _VisitTemplateState();
}

class _VisitTemplateState extends State<VisitTemplate> {
  final List<String> branchType = [
    'Head Office',
    'Mumbai Branch',
    'Delhi Branch',
    'Bangalore Warehouse',
    'Pune Client Site',
    'Hyderabad Branch',
    'Chennai Regional Office',
    'Kolkata Branch',
    'Ahmedabad Branch',
    'Remote Site',
  ];
  final TextEditingController q1Controller = TextEditingController();
  final TextEditingController branchTypeController = TextEditingController();

  String? selectedBranchType;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: bottomInset > 0
              ? bottomInset + 30
              : VariableBag.bottomSheetBottomPadding *
                    Responsive.getResponsive(context),
          left:
              VariableBag.bottomSheetLeftPadding *
              Responsive.getResponsive(context),
          right:
              VariableBag.bottomSheetRightPadding *
              Responsive.getResponsive(context),
          top:
              VariableBag.bottomSheetTopPadding *
              Responsive.getResponsive(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing:
              VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
          children: [
            // row with title and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'Visit Template',
                  fontWeight: FontWeight.w600,
                  fontSize: 16 * Responsive.getResponsiveText(context),
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

            /// Text field with label "Q1"
            NewTextField(
              label: 'Q1',
              hintText: LanguageManager().get('type_here'),
              prefixIconPath: AppAssets.note_favorite,
              suffixIconPath: AppAssets.arrow_down,
            ),

            /// Custom dropdown to select branch
            NewTextField(
              isKey: true,
              label: 'blocks_colon',
              hintText: LanguageManager().get('select'),
              prefixIconPath: AppAssets.assetData,
              suffixIconPath: AppAssets.arrow_down,
            ),

            ///Submit button
            MyCoButton(
              boarderRadius:
                  VariableBag.buttonBorderRadius *
                  Responsive.getResponsive(context),
              isShadowBottomLeft: true,
              onTap: () {
                //use below code to open bottom sheet
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //       top: Radius.circular(
                //         16 * Responsive.getResponsive(context),
                //       ),
                //     ),
                //   ),
                //   builder: (context) => const RemarkBottomSheet(),
                // );
                context.pop();
              },
              title: LanguageManager().get('submit'),
            ),
          ],
        ),
      ),
    );
  }
}
