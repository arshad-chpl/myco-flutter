import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/common_row.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/get_common_row.dart';

class WorkAllocationPage extends StatefulWidget {
  const WorkAllocationPage({super.key});

  @override
  State<WorkAllocationPage> createState() => _WorkAllocationPageState();
}

class _WorkAllocationPageState extends State<WorkAllocationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(
      title: 'work_allocation',
      isKey: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
      child: Column(
        children: [
          const CustomSearchField(
            hintText: 'Search',
          ),
          SizedBox(height: 0.023 * Responsive.getHeight(context),),
          // MonthYearHeader(
          //   onChanged: (month, year) => month + year,
          // ),
          // SizedBox(height: 0.023 * Responsive.getHeight(context),),
          CommonCard(
              title: 'title',
              headerColor: AppTheme.getColor(context).primary,
              headerPrefixIcon: 'assets/work_allocation/calendar.png',
              showHeaderPrefixIcon: true,
              bottomWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            'Assign To',
                          fontSize: 12 * Responsive.getResponsive(context),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.getColor(context).primary,
                        ),
                        MyCoButton(
                            onTap: () {},
                            title: LanguageManager().get('view_details'),
                          fontWeight: FontWeight.w700,
                          height: 0.03 * Responsive.getHeight(context),
                          width: 0.28 * Responsive.getWidth(context),
                          backgroundColor: AppTheme.getColor(context).secondary,
                          borderColor: AppTheme.getColor(context).secondary,
                          boarderRadius: 23 ,
                        )
                      ],
                    ),
                    ListTile(
                      leading: SvgPicture.asset(AppAssets.personImage),
                      title: CustomText(
                        'Ajaj Ajmeri',
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              'hod',
                            isKey: true,
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            'Technical - Ahmedabad',
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppTheme.getColor(context).secondary,),
                    CommonRow(
                        title: 'Work Category',
                        value: 'AI Tools',
                        textColor: AppColors.textGray,
                        onTap: () {},
                    ),
                    SizedBox(height: 0.005 * Responsive.getHeight(context),),
                    CommonRow(
                      title: 'Project',
                      value: 'Fjc',
                      textColor: AppColors.textGray,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.005 * Responsive.getHeight(context),),
                    CommonRow(
                      title: 'Work Start Date',
                      value: '21st May 2025',
                      textColor: AppColors.textGray,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.005 * Responsive.getHeight(context),),
                    CommonRow(
                      title: 'Target Date of Completion',
                      value: '22nd May 2025',
                      textColor: AppColors.textGray,
                      onTap: () {},
                    ),
                    SizedBox(height: 0.005 * Responsive.getHeight(context),),
                    Divider(color: AppTheme.getColor(context).secondary,),
                  ],
                ),
              )
          )
        ],
      ),
    ),
  );
}
