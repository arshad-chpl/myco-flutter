import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_person_details.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/reason_value_common_row_widget.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AppointmentRequestListViewWidget extends StatefulWidget {
  const AppointmentRequestListViewWidget({super.key});

  @override
  State<AppointmentRequestListViewWidget> createState() => _AppointmentRequestListViewWidgetState();
}

class _AppointmentRequestListViewWidgetState extends State<AppointmentRequestListViewWidget> {


  List<Map<String, dynamic>> appointmentRequestData = [
    {
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
    },
    {
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
    },
    {
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
    },
    {
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
    },
  ];

  @override
  Widget build(BuildContext context) => ListView.builder(
      scrollDirection: Axis.vertical,
        itemCount: appointmentRequestData.length,
        itemBuilder: (context, index) {
          final appointmentRequest = appointmentRequestData[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 21 * Responsive.getResponsive(context)),
            child: CommonCard(
              title: appointmentRequest['timeDate'],
              headerPrefixIcon: AppAssets.myCoLogo,
              showHeaderPrefixIcon: true,
              headerColor: AppTheme.getColor(context).primary,
              bottomWidget: Padding(
                padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Appointment Request By',
                      fontSize: 10,
                      color: AppTheme.getColor(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
                    AppointmentPersonDetails(
                      imagePath: AppAssets.myCoLogo,
                      empName: appointmentRequest['requesterName'],
                      designation: appointmentRequest['requesterDesignation'],
                      fieldWithCity: appointmentRequest['requesterFieldCity'],
                    ),
                    Divider(color: AppTheme.getColor(context).secondary),
                     ReasonValueCommonRowWidget(
                      heading: 'Reason for Appointment',
                      value: appointmentRequest['reason'],
                    ),
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                     ReasonValueCommonRowWidget(
                      heading: 'Location',
                      value: appointmentRequest['location'],
                    ),
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                     ReasonValueCommonRowWidget(
                      heading: 'Phone No. ',
                      value: appointmentRequest['phoneNo'],
                    ),
                    SizedBox(height: 0.03 * Responsive.getHeight(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyCoButton(
                          onTap: () {},
                          title: 'Reject',
                          textStyle: TextStyle(
                              color: AppTheme.getColor(context).error
                          ),
                          height: 0.045 * Responsive.getHeight(context),
                          width: 0.40 * Responsive.getWidth(context),
                          boarderRadius: 23 * Responsive.getResponsive(context),
                          borderColor: AppTheme.getColor(context).error,
                          backgroundColor: AppColors.removeBackground,
                        ),
                        MyCoButton(
                          onTap: () {},
                          title: 'Approve',
                          textStyle: TextStyle(
                              color: AppTheme.getColor(context).surface
                          ),
                          height: 0.045 * Responsive.getHeight(context),
                          width: 0.40 * Responsive.getWidth(context),
                          isShadowBottomLeft: true,
                          boarderRadius: 23 * Responsive.getResponsive(context),
                          borderColor: AppTheme.getColor(context).secondary,
                          backgroundColor: AppTheme.getColor(context).secondary,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
    );
}
