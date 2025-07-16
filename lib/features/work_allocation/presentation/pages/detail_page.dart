import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
        children: [
          CommonCard(
            title: 'Assign To ',
            bottomWidget: ListTile(
              leading: Image.asset(
                width: 47,
                height: 47,
                'assets/svgs/visit/userpro.png',
              ),
              title: const CustomText(
                'Mukund Madhav',
                fontWeight: FontWeight.w600,
              ),
              subtitle: const Column(
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
          BorderContainerWraper(
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Work Start Date',

                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          '21 st May 2025',
                          color: AppColors.textGray,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          'Work Completion Date',
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          '21 st May 2025',
                          color: AppColors.textGray,
                        ),
                      ],
                    ),

                    Divider(),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
