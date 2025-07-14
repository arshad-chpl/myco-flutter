import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/get_common_row.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getCommonRow(
          context,
          title: 'Contact Person name',
          value: 'Jashvant Jatoliya',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Contact Person number',
          valueWidget: RichText(
            text: TextSpan(
              text: '+91 ',
              style: TextStyle(
                color: AppTheme.getColor(context).primary,
                fontSize: 12 * getResponsiveText(context),
              ),
              children: [
                TextSpan(
                  text: '9356326355',
                  style: TextStyle(
                    color: AppTheme.getColor(context).onSurface,
                    fontSize: 12 * getResponsiveText(context),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
          value: '',
        ),
        getCommonRow(
          context,
          title: 'Visit Status',
          value: 'Approved',
          textColor: AppTheme.getColor(context).secondary,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Visit Type',
          value: 'Test visit',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Visit Purpose',
          value: 'Feature check',
          textColor: AppTheme.getColor(context).onSurface,
          onTap: () {},
        ),
        getCommonRow(
          context,
          title: 'Address',
          valueWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                '101, Sarkhej-sanand cross road Makaraba, Ahmedabad, Sarkhej-Gandhinagar Gujarat, 385431, India',
                fontSize: 10 * getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                '(you are in range)',
                fontSize: 12 * getResponsiveText(context),
                color: AppTheme.getColor(context).secondary,
              ),
            ],
          ),
          onTap: () {},
          value: '',
        ),
        SizedBox(height: 0.007 * getHeight(context)),

        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 0.005 * getWidth(context),
        //     vertical: 0.0015 * getHeight(context),
        //   ),
        //   child: Row(
        //     spacing: 16,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             CustomText(
        //               'Start Visit date & Time',
        //               fontSize: 14 * getResponsiveText(context),
        //               fontWeight: FontWeight.w700,
        //             ),
        //             SizedBox(height: 4),
        //             CustomText(
        //               '09:45AM, 21st May 2025',
        //               fontSize: 14 * getResponsiveText(context),
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             CustomText(
        //               'End Visit date & Time',
        //               fontSize: 14 * getResponsiveText(context),
        //               fontWeight: FontWeight.w700,
        //             ),
        //             const SizedBox(height: 4),
        //             CustomText(
        //               '12:45PM, 21st May 2025',
        //               fontSize: 14 * getResponsiveText(context),
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
