import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_detail_card.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_vertical_stepper.dart';

// DetailPage to show work allocation details
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
    appBar: CustomAppbar(
      title: 'Work Allocation',
      titleFontWeight: FontWeight.w700,
      titleFontSize: 18 * Responsive.getResponsiveText(context),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.04 * Responsive.getWidth(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          // Card displaying assignee details
          children: [
            //common card widget to show Assign tasks
            CommonCard(
              headerPadding: EdgeInsets.all(
                0.03 * Responsive.getWidth(context),
              ),
              title: 'Assign To',

              bottomWidget: Padding(
                padding: EdgeInsets.all(0.04 * Responsive.getWidth(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // User image
                        const Image(
                          width: 90,
                          height: 90,
                          image: AssetImage(
                            'assets/work_allocation/person_image.png',
                          ),
                        ),

                        SizedBox(width: 0.05 * Responsive.getWidth(context)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name of the user
                            CustomText(
                              'Mukund Madhav',
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getColor(
                                context,
                              ).onSurfaceVariant,
                            ),

                            // User role and location
                            CustomText(
                              'QA',
                              color: AppTheme.getColor(context).outline,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomText(
                              'QA Technical - Junagadh',
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

            SizedBox(height: 0.02 * Responsive.getHeight(context)),

            //widget for work detailed info
            const WorkDetailCard(),

            SizedBox(height: 0.03 * Responsive.getHeight(context)),

            //vertical custom stepper for task approval
            CustomVerticalStepper(
              steps: [
                StepData(
                  title: 'PENDING',
                  status: StepStatus.pending,
                  isStepIconShow: false,
                ),

                StepData(title: 'APPROVED', status: StepStatus.completed),

                StepData(
                  title: 'COMPLETED',
                  status: StepStatus.completed,
                  details: [
                    StepDetail(title: 'Date', description: '21st May, 2025'),
                    StepDetail(title: 'Remark', description: 'Done'),
                  ],
                ),

                StepData(
                  title: 'AUTHORIZED',
                  status: StepStatus.inActive,
                  isStepIconShow: false,
                ),
              ],
            ),

            SizedBox(height: 0.03 * Responsive.getHeight(context)),

            //  button label Authorize Work
            MyCoButton(
              textStyle: TextStyle(
                color: AppTheme.getColor(context).surfaceBright,
                fontSize: 16 * Responsive.getResponsive(context),
              ),
              boarderRadius: 30 * Responsive.getResponsive(context),
              isShadowBottomLeft: true,
              onTap: () {},
              title: 'Authorize Work',
            ),
            SizedBox(height: 0.04 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
