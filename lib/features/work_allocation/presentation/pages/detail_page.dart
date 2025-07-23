import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bottom_sheet/completion_remark_bottom_sheet.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/work_detail_card.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_vertical_stepper.dart';

// Page to show work allocation details assigned to an employee.
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Responsive.init(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    // Custom app bar
    appBar: const CustomAppbar(title: 'work_allocation', isKey: true),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
          vertical:
              VariableBag.formContentSpacingVertical *
              Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // Card to show assignee info (name, image, role)
          children: [
            //common card widget to show Assign tasks
            CommonCard(
              headerPadding: EdgeInsets.only(
                top: 13 * Responsive.getResponsive(context),
                bottom: 13 * Responsive.getResponsive(context),
                left: 20 * Responsive.getResponsive(context),
              ),
              title: 'Assign To',
              bottomWidget: Padding(
                padding: EdgeInsets.only(
                  top: 17 * Responsive.getResponsive(context),
                  bottom: 14 * Responsive.getResponsive(context),
                  left: 16 * Responsive.getResponsive(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Assignee profile image
                        Image(
                          width: 70 * Responsive.getResponsive(context),
                          height: 70 * Responsive.getResponsive(context),
                          image: const AssetImage(AppAssets.personProfileImage),
                        ),

                        SizedBox(width: 0.03 * Responsive.getWidth(context)),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name, role, and location
                            CustomText(
                              'Mukund Madhav',
                              fontSize: 14 * Responsive.getResponsive(context),
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getColor(
                                context,
                              ).onSurfaceVariant,
                            ),

                            CustomText(
                              'QA',
                              fontSize: 12 * Responsive.getResponsive(context),
                              color: AppTheme.getColor(context).outline,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              'QA Technical - Junagadh',
                              fontSize: 12 * Responsive.getResponsive(context),
                              fontWeight: FontWeight.w500,
                              color: AppTheme.getColor(context).outline,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height:
                  VariableBag.textFieldRowGap *
                  Responsive.getResponsive(context),
            ),

            // Card to show detailed work information
            const WorkDetailCard(),

            SizedBox(
              height:
                  VariableBag.textFieldRowGap *
                  Responsive.getResponsive(context),
            ),

            // Vertical stepper to show task progress (Pending > Approved > Completed > Authorized)
            CustomVerticalStepper(
              steps: [
                // Step 1 - PENDING
                StepData(
                  title: 'PENDING',
                  status: StepStatus.pending,
                  isStepIconShow: false,
                ),

                // Step 2 - APPROVED
                StepData(title: 'APPROVED', status: StepStatus.completed),

                // Step 3 - COMPLETED with additional info
                StepData(
                  subTitleFontWeight: FontWeight.w600,
                  subTitleFontSize: 12 * Responsive.getResponsiveText(context),
                  title: 'COMPLETED',
                  status: StepStatus.completed,
                  details: [
                    StepDetail(title: 'Date', description: '21st May, 2025'),
                    StepDetail(title: 'Remark', description: 'Done'),
                  ],
                ),

                // Step 4 - AUTHORIZED (yet to be completed)
                StepData(
                  title: 'AUTHORIZED',
                  status: StepStatus.inActive,
                  isStepIconShow: false,
                ),
              ],
            ),

            SizedBox(
              height:
                  VariableBag.textFieldRowGap *
                  Responsive.getResponsive(context),
            ),

            // Button to authorize the work (action pending implementation)
            MyCoButton(
              textStyle: TextStyle(
                color: AppTheme.getColor(context).surfaceBright,
                fontSize: 16 * Responsive.getResponsive(context),
              ),
              boarderRadius: 30 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  builder: (context) => const CompletionRemarkBottomSheet(),
                );
              },
              title: 'Authorize Work',
            ),
          ],
        ),
      ),
    ),
  );
}
