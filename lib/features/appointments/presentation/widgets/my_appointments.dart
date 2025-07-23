import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_person_details.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/reason_value_common_row.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {


  List<Map<String, dynamic>> myAppointmentData = [
    {
      'status' : 'Approved',
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
      'rejectionReason': 'Lmnopq',
    },
    {
      'status' : 'Rejected',
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'To meet and learn',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
      'rejectionReason': 'Lmnopq',
    },
    {
      'status' : 'Pending',
      'timeDate': '05:14 PM, 18th Jun 2025',
      'requesterName': 'Ajaj Ajmeri',
      'requesterDesignation': 'Tester',
      'requesterFieldCity': 'Junagadh - Technical - QA',
      'reason': 'XYZ',
      'location': 'CHPL',
      'phoneNo': '+91 7980239236',
      'rejectionReason': 'Lmnopq',
    }
  ];

  Color getHeaderColor(String status) {
    if(status.toLowerCase() == 'approved') {
      return AppTheme.getColor(context).secondary;
    } else if (status.toLowerCase() == 'pending') {
      return AppColors.spanishYellow;
    } else if(status.toLowerCase() == 'rejected') {
      return AppTheme.getColor(context).error;
    }
    return AppTheme.getColor(context).secondary;
  }

  String getStatusLabel(String label) {
    if(label.toLowerCase() == 'approved') {
      return 'Approved';
    } else if (label.toLowerCase() == 'pending') {
      return 'Pending';
    } else if(label.toLowerCase() == 'rejected') {
      return 'Rejected';
    }
    return 'not define';
  }
  
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: myAppointmentData.length,
    scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
      final myAppointment = myAppointmentData[index];
      final isRejected = myAppointment['status'].toLowerCase() == 'rejected';

        return Padding(
          padding: EdgeInsets.only(bottom: 21 * Responsive.getResponsive(context)),
          child: CommonCard(
            title: myAppointment['timeDate'],
            headerPrefixIcon: AppAssets.myCoLogo,
            showHeaderPrefixIcon: true,
            headerColor: getHeaderColor(myAppointment['status']),
            suffixIcon: isRejected
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppAssets.assetBellRinging),
                SizedBox(width: 0.01 * Responsive.getWidth(context)),
                SvgPicture.asset(AppAssets.assetTrashIcon),
              ],
            )
                : null,
            bottomWidget: Padding(
              padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'Appointment From',
                        fontSize: 10,
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                      MyCoButton(
                        onTap: () {},
                        title: getStatusLabel(myAppointment['status']),
                        textStyle: TextStyle(
                            color: getHeaderColor(myAppointment['status']),
                        ),
                        height: 0.030 * Responsive.getHeight(context),
                        width: 0.23 * Responsive.getWidth(context),
                        boarderRadius: 23 * Responsive.getResponsive(context),
                        borderColor: getHeaderColor(myAppointment['status']),
                        borderWidth: 2,
                        backgroundColor: AppTheme.getColor(context).surface,
                      )
                    ],
                  ),
                  AppointmentPersonDetails(
                    imagePath: AppAssets.myCoLogo,
                    empName: myAppointment['requesterName'],
                    designation: myAppointment['requesterDesignation'],
                    fieldWithCity: myAppointment['requesterFieldCity'],
                  ),
                  Divider(color: AppTheme.getColor(context).secondary),
                  ReasonValueCommonRow(
                    heading: 'Reason for Appointment',
                    value: myAppointment['reason'],
                  ),
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  ReasonValueCommonRow(
                    heading: 'Location',
                    value: myAppointment['location'],
                  ),
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  ReasonValueCommonRow(
                    heading: 'Phone No. ',
                    value: myAppointment['phoneNo'],
                  ),
                  if (isRejected && myAppointment['rejectionReason'] != null)
                    Column(
                      children: [
                        SizedBox(height: 0.01 * Responsive.getHeight(context)),
                        ReasonValueCommonRow(
                          heading: 'Reason for Rejection',
                          value: myAppointment['rejectionReason'],
                        ),
                      ],
                    ),
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomText(
                      'Re-Appointment',
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).primary,
                      textAlign: TextAlign.end,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.getColor(context).primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
  );
}
