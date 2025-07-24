import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';
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
  Widget build(BuildContext context) => BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {

        if (state.tabIndex != 1 && (state is AppointmentLoaded || state is AppointmentError)) {
          return const Center(child: CustomText('Switch to My Appointments Tab'));
        }

        if(state is AppointmentLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if(state is AppointmentLoaded) {
          if (state.appointments.myAppointments == null || state.appointments.myAppointments!.isEmpty) {
            return const Center(child: CustomText('No Appointments Found.'));
          }
          return ListView.builder(
            itemCount: state.appointments.myAppointments!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final myAppointment = state.appointments.myAppointments![index];
              final isRejected = myAppointment.appointmentStatus == 'rejected';

              return Padding(
                padding: EdgeInsets.only(bottom: 21 * Responsive.getResponsive(context)),
                child: CommonCard(
                  title: myAppointment.appointmentDatetime ?? 'NA',
                  headerPrefixIcon: AppAssets.myCoLogo,
                  showHeaderPrefixIcon: true,
                  headerColor: getHeaderColor(myAppointment.appointmentStatusView ?? ''),
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
                              title: getStatusLabel(myAppointment.appointmentStatus ?? ''),
                              textStyle: TextStyle(
                                color: getHeaderColor(myAppointment.appointmentStatus ?? ''),
                              ),
                              height: 0.030 * Responsive.getHeight(context),
                              width: 0.23 * Responsive.getWidth(context),
                              boarderRadius: 23 * Responsive.getResponsive(context),
                              borderColor: getHeaderColor(myAppointment.appointmentStatus ?? ''),
                              borderWidth: 2,
                              backgroundColor: AppTheme.getColor(context).surface,
                            )
                          ],
                        ),
                        AppointmentPersonDetails(
                          imagePath: AppAssets.myCoLogo,
                          empName: myAppointment.userFullName ?? '',
                          designation: myAppointment.userDesignation ?? '',
                          fieldWithCity: '${myAppointment.branchName ?? ''} - ${myAppointment.departmentName ?? ''}',
                        ),
                        Divider(color: AppTheme.getColor(context).secondary),
                        ReasonValueCommonRow(
                          heading: 'Reason for Appointment',
                          value: myAppointment.appointmentAgenda ?? '',
                        ),
                        SizedBox(height: 0.01 * Responsive.getHeight(context)),
                        ReasonValueCommonRow(
                          heading: 'Location',
                          value: myAppointment.appointmentPlace ?? '',
                        ),
                        SizedBox(height: 0.01 * Responsive.getHeight(context)),
                        ReasonValueCommonRow(
                          heading: 'Phone No. ',
                          value: myAppointment.userMobile ?? '',
                        ),
                        if (myAppointment.appointmentRejectReason != null)
                          Column(
                            children: [
                              SizedBox(height: 0.01 * Responsive.getHeight(context)),
                              ReasonValueCommonRow(
                                heading: 'Reason for Rejection',
                                value: myAppointment.appointmentRejectReason ?? '',
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
        } else if(state is AppointmentError) {
          return const CustomText('error');
        }
        return  const Center(child: CustomText('Tap to load My Appointment'));
      },
  );
}
