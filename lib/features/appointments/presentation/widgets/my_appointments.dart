import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_person_details.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_shimmer.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/reason_value_common_row.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  late PreferenceManager preferenceManager;


  Color getHeaderColor(String status) {
    switch (status) {
      case '1': // Approved
        return AppTheme.getColor(context).secondary;
      case '0': // Pending
        return AppColors.spanishYellow;
      case '2': // Rejected
        return AppTheme.getColor(context).error;
      default:
        return Colors.grey;
    }
  }

  String getStatusLabel(String status) {
    switch (status) {
      case '1':
        return 'Approved';
      case '0':
        return 'Pending';
      case '2':
        return 'Rejected';
      default:
        return 'N/A';
    }
  }

  @override
  void initState() {
    super.initState();
    preferenceManager = GetIt.I<PreferenceManager>();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AppointmentBloc, AppointmentState>(
    listener: (context, state) async {
      if (state is CommonResponseAppointment) {
        Fluttertoast.showToast(
          msg: state.commonResponse.message ?? 'Action successful!',
        );

        final userId = await preferenceManager.getUserId();
        final companyId = await preferenceManager.getCompanyId();
        final languageId = await preferenceManager.getLanguageId();

        context.read<AppointmentBloc>().add(
          GetMyAppointmentEvent(
            GetMyAppointmentsRequestModel(
              getMyAppointments: 'getMyAppointments',
              userId: userId,
              companyId: companyId,
              languageId: languageId,
            ),
          ),
        );

        context.read<AppointmentBloc>().add(const AppointmentTabChange(tabIndex: 1));
      } else if (state is AppointmentError) {
        Fluttertoast.showToast(msg: state.message);
      }
    } ,

      builder: (context, state) {

        if (state.tabIndex != 1 && (state is AppointmentLoaded || state is AppointmentError)) {
          return const Center(child: CustomText('Switch to My Appointments Tab'));
        }

        if(state is AppointmentLoading) {
          return const AppointmentShimmer();
        } else if(state is AppointmentLoaded) {
          if (state.appointments.myAppointments == null || state.appointments.myAppointments!.isEmpty) {
            return const Center(child: CustomText('No Appointments Found.'));
          }
          return ListView.builder(
            itemCount: state.appointments.myAppointments?.length ?? 0,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final myAppointment = state.appointments.myAppointments![index];
              final status = myAppointment.appointmentStatus ?? '';

              return Padding(
                padding: EdgeInsets.only(bottom: 21 * Responsive.getResponsive(context)),
                child: CommonCard(
                  title: myAppointment.appointmentDatetime ?? 'NA',
                  headerPrefixIcon: AppAssets.calendarIcon,
                  showHeaderPrefixIcon: true,
                  headerColor: getHeaderColor(status),
                  suffixIcon: (status == '0' || status == '2')
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                          child: SvgPicture.asset(AppAssets.assetBellRinging)
                      ),
                      SizedBox(width: 0.03
                          * Responsive.getWidth(context)),
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) => CustomAlertDialog(
                              alertType: AlertType.delete,
                              title:
                              'Are you sure do you want to delete this appointment?',
                              onCancel: () async {
                                Navigator.pop(context);
                              },
                              cancelText: 'No',
                              onConfirm: () async {
                                Navigator.pop(context);
                                context.read<AppointmentBloc>().add(
                                  DeleteAppointmentEvent(
                                    DeleteAppointmentRequestModel(
                                      deleteAppointment:
                                      'deleteAppointment',
                                      companyId: await preferenceManager.getCompanyId(),
                                      languageId: await preferenceManager.getLanguageId(),
                                      appointmentId: myAppointment.appointmentId,
                                    ),

                                  ),
                                );
                              },
                              confirmText: 'Yes',
                            ),
                          );
                        },
                          child: SvgPicture.asset(AppAssets.assetTrashIcon)
                      ),
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
                              title: getStatusLabel(status),
                              textStyle: TextStyle(
                                color: getHeaderColor(status),
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
                        if (status == '2')
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
          return const CustomText('Your internet connection is slow');
        }
        return  const Center(child: CustomText('Tap to load My Appointment'));
      },
  );
}
