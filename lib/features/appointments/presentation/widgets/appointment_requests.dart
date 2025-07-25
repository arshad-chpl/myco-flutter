import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/data/models/request/approve_appointment_entity_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:myco_flutter/features/appointments/presentation/pages/reject_request_bottom_sheet.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_person_details.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_shimmer.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/reason_value_common_row.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AppointmentRequests extends StatefulWidget {
  const AppointmentRequests({super.key});

  @override
  State<AppointmentRequests> createState() => _AppointmentRequestsState();
}

class _AppointmentRequestsState extends State<AppointmentRequests> {
  late PreferenceManager preferenceManager;

  @override
  void initState() {
    super.initState();
    preferenceManager = GetIt.I<PreferenceManager>();
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocConsumer<AppointmentBloc, AppointmentState>(
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
    },
    builder: (context, state) {
      if (state.tabIndex != 0 &&
          (state is AppointmentLoaded || state is AppointmentError)) {
        return const Center(child: CustomText('Switch to Requests Tab'));
      }

      if (state is AppointmentLoading) {
        return const AppointmentShimmer();
      } else if (state is AppointmentLoaded) {
        if (state.appointments.myAppointments == null ||
            state.appointments.myAppointments!.isEmpty) {
          return const Center(child: CustomText('No Appointments Found.'));
        }
        return ListView.builder(
          itemCount: state.appointments.myAppointments!.length,
          itemBuilder: (context, index) {
            final appointmentRequest =
                state.appointments.myAppointments![index];

            final String formattedTimeDate =
                appointmentRequest.appointmentDatetime ?? 'N/A';

            return Padding(
              padding: EdgeInsets.only(
                bottom: 21 * Responsive.getResponsive(context),
              ),
              child: CommonCard(
                borderRadius:
                    VariableBag.commonCardBorderRadius *
                    Responsive.getResponsive(context),
                title: formattedTimeDate,
                headerPrefixIcon: AppAssets.calendarIcon,
                showHeaderPrefixIcon: true,
                headerColor: AppTheme.getColor(context).primary,
                bottomWidget: Padding(
                  padding: EdgeInsets.all(
                    13 * Responsive.getResponsive(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Appointment Request By',
                        fontSize: 10 * Responsive.getResponsiveText(context),
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                      AppointmentPersonDetails(
                        imagePath: appointmentRequest.userProfilePic ?? '',
                        empName: appointmentRequest.userFullName ?? 'NA',
                        designation: appointmentRequest.userDesignation ?? 'NA',
                        fieldWithCity:
                            '${appointmentRequest.branchName ?? ''} - ${appointmentRequest.departmentName ?? ''}',
                      ),
                      Divider(color: AppTheme.getColor(context).secondary),
                      ReasonValueCommonRow(
                        heading: 'Reason for Appointment',
                        value: appointmentRequest.appointmentAgenda ?? 'NA',
                      ),
                      SizedBox(height: 0.01 * Responsive.getHeight(context)),
                      ReasonValueCommonRow(
                        heading: 'Location',
                        value: appointmentRequest.appointmentPlace ?? 'NA',
                      ),
                      SizedBox(height: 0.01 * Responsive.getHeight(context)),
                      ReasonValueCommonRow(
                        heading: 'Phone No. ',
                        value: appointmentRequest.userMobile ?? 'NA',
                      ),
                      SizedBox(height: 0.03 * Responsive.getHeight(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing:
                            VariableBag.buttonRowSpacing *
                            Responsive.getResponsive(context),
                        children: [
                          MyCoButton(
                            onTap: () async {
                              showBottomSheet(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                  alertType: AlertType.delete,
                                  title: 'Are you sure do you want to reject this appointment request?',
                                  onCancel: () {Navigator.pop(context);},
                                  cancelText: 'No',
                                  onConfirm: () async {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) => RejectRequestBottomSheet(
                                        userName: appointmentRequest.userFullName ?? '',
                                        appointmentId: appointmentRequest.appointmentId ?? '',
                                        appointmentWithUserProfilePic: appointmentRequest.userProfilePic ?? '',
                                        appointmentByUserId: appointmentRequest.appointmentByUserId ?? '',
                                      ),
                                    );
                                  },
                                  confirmText: 'Yes',
                                ),
                              );
                            },
                            title: 'Reject',
                            textStyle: TextStyle(
                              color: AppTheme.getColor(context).error,
                            ),
                            height: 0.045 * Responsive.getHeight(context),
                            width: 0.37 * Responsive.getWidth(context),
                            boarderRadius:
                                VariableBag.buttonBorderRadius *
                                Responsive.getResponsive(context),
                            borderColor: AppTheme.getColor(context).error,
                            backgroundColor: AppColors.removeBackground,
                          ),
                          MyCoButton(
                            onTap: () {
                              showBottomSheet(
                                context: context,
                                builder: (context) => CustomAlertDialog(
                                  alertType: AlertType.alert,
                                  title:
                                      'Are you sure do you want to approve this appointment request ?',
                                  onCancel: () async {
                                    Navigator.pop(context);
                                  },
                                  cancelText: 'No',
                                  onConfirm: () async {
                                    Navigator.pop(context);
                                    context.read<AppointmentBloc>().add(
                                      ApprovedAppointmentEvent(
                                        ApproveAppointmentRequestModel(
                                          approveAppointment:
                                              'approveAppointment',
                                          userId: await preferenceManager
                                              .getUserId(),
                                          companyId: await preferenceManager
                                              .getCompanyId(),
                                          languageId: await preferenceManager
                                              .getLanguageId(),
                                          userName:
                                              appointmentRequest.userFullName,
                                          appointmentId:
                                              appointmentRequest.appointmentId,
                                          appointmentByUserId:
                                              appointmentRequest
                                                  .appointmentByUserId,
                                        ),
                                      ),
                                    );
                                  },
                                  confirmText: 'Yes',
                                ),
                              );
                            },
                            title: 'Approve',
                            textStyle: TextStyle(
                              color: AppTheme.getColor(context).surface,
                            ),
                            height: 0.045 * Responsive.getHeight(context),
                            width: 0.37 * Responsive.getWidth(context),
                            isShadowBottomLeft: true,
                            boarderRadius:
                                VariableBag.buttonBorderRadius *
                                Responsive.getResponsive(context),
                            borderColor: AppTheme.getColor(context).secondary,
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else if (state is AppointmentError) {
        return const CustomText('Your internet connection is slow');
      }
      return const Center(child: CustomText('Tap to load appointments'));
    },
  );
}
