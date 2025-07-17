import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// DetailPage to show work allocation details
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'Work Allocation'),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.04 * Responsive.getWidth(context),
      ),
      child: Column(
        // Card displaying assignee details
        children: [
          //common card widget to show Assign tasks
          const CommonCard(
            title: 'Assign To ',
            bottomWidget: ListTile(
              // User image
              leading: Image(
                image: AssetImage('assets/work_allocation/person_image.png'),
              ),
              // Name of the user
              title: CustomText('Mukund Madhav', fontWeight: FontWeight.w600),

              // User role and location
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'QA',
                    color: AppColors.textGray,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    'QA Technical - Junagadh',
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGray,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 0.02 * Responsive.getHeight(context)),

          //Border Container for detailed info
          BorderContainerWraper(
            borderColor: AppTheme.getColor(context).outline,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Work Start and Completion Date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Work Start Date',
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText('21 st May 2025', color: AppColors.textGray),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          'Work Completion Date',
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText('22nd May 2025', color: AppColors.textGray),
                      ],
                    ),
                  ],
                ),
                Divider(color: AppTheme.getColor(context).secondary),
                // Work-related details using reusable CommonRow
                const CommonRow(
                  title: 'Work Category',
                  value: 'AI Tools',
                  textColor: AppColors.textGray,
                ),
                const CommonRow(
                  title: 'Project',
                  value: 'Abc',
                  textColor: AppColors.textGray,
                ),
                const CommonRow(
                  title: 'Location',
                  value: 'Abc',
                  textColor: AppColors.textGray,
                ),
                const CommonRow(
                  title: 'Site',
                  value: 'Abc',
                  textColor: AppColors.textGray,
                ),
                const CommonRow(
                  title: 'HOD Remark',
                  value: 'Abc',
                  textColor: AppColors.textGray,
                ),
                const CommonRow(
                  title: 'Created Date & Time',
                  value: '12 May 2025 , 10:00 AM',
                  textColor: AppColors.textGray,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
