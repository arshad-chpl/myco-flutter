import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/theme/text_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_calendar_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/ios_calendar_time_picker.dart';

class IdeaRequest extends StatelessWidget {
  const IdeaRequest({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      titleSpacing: 0,
      title: const Text('Idea Request'),
      leading: const BackButton(),
      centerTitle: false,
    ),
    body: Column(
      children: [
                 Container(
          padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * getResponsive(context),
                  ),
                  color: AppColors.gray10,
                ),
                child: const Center(
                  child: CustomText('<', fontWeight: FontWeight.w700),
                ),
              ),
              InkWell(
                // onTap: () async{
                //   final selectedDate = await showPicker(
                //     context,
                //     minDate: DateTime(2020),
                //     maxDate: DateTime(2030),
                //     pickDay: false,
                //     timePicker: false,
                //   );
                // },
                child: Row(
                  children: [
                    CustomText(
                      '2024-2025',
                      fontSize: 16 * getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 25 * getResponsive(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8 * getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    6 * getResponsive(context),
                  ),
                  color: AppColors.gray10,
                ),
                child: const Center(
                  child: CustomText('>', fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 0.74* getHeight(context)),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyCoButton(
              height: 0.05 * getHeight(context),
              boarderRadius: 
              40 * getResponsive(context),
              width: 0.45 * getWidth(context),
              onTap: () {},
              title: 'SHORT BY',
              textStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).onPrimary,
              ),
            ),
            
             MyCoButton(
              height: 0.05 * getHeight(context),
              boarderRadius: 
              40 * getResponsive(context),
              width: 0.45 * getWidth(context),
              onTap: () {},
              title: 'FILTER',
              textStyle: TextStyle(
                fontSize: 14 * getResponsiveText(context),
                color: AppTheme.getColor(context).onPrimary,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
