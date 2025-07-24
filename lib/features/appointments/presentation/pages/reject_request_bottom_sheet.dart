import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class RejectRequestBottomSheet extends StatefulWidget {
  final String appointmentId;
  final String appointmentByUserId;
  final String userName;
  final String appointmentWithUserProfilePic;

  const RejectRequestBottomSheet({
    super.key,
    required this.appointmentId,
    required this.appointmentByUserId,
    required this.userName,
    required this.appointmentWithUserProfilePic,
  });

  @override
  State<RejectRequestBottomSheet> createState() =>
      _RejectRequestBottomSheetState();
}

class _RejectRequestBottomSheetState extends State<RejectRequestBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final reasonController = TextEditingController();
  late final PreferenceManager preferenceManager;

  @override
  void initState() {
    super.initState();
    preferenceManager = GetIt.I<PreferenceManager>();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  Future<void> submitRejection() async {
    if (formKey.currentState!.validate()) {
      final rejectModel = RejectAppointmentRequestModel(
        rejectAppointment: 'rejectAppointment',
        userId: await preferenceManager.getUserId(),
        companyId: await preferenceManager.getCompanyId(),
        languageId: await preferenceManager.getLanguageId(),
        appointmentId: widget.appointmentId,
        appointmentByUserId: widget.appointmentByUserId,
        userName: widget.userName,
        appointmentRejectReason: reasonController.text.trim(),
      );

      if (mounted) {
        context.read<AppointmentBloc>().add(RejectAppointmentEvent(rejectModel));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Padding(
      padding: EdgeInsets.all(VariableBag.screenHorizontalPadding * Responsive.getResponsive(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          NewTextField(
            controller: reasonController,
            prefixIconPath: AppAssets.assetMsgEdit.toString(),
            maxLines: 15,
            hintText: 'Type Here',
            label: 'Reject Request',
            isRequired: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a reason for rejection.';
              }
              return null;
            },
          ),
          SizedBox(
            height:
                40 * Responsive.getResponsive(context),
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyCoButton(
                  title: 'Close',
                  height: Responsive.getHeight(context) * .05,
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  width: Responsive.getWidth(context) * .450,
                  backgroundColor: AppColors.white,
                  border: Border.all(
                    color: AppTheme.getColor(context).primary,
                  ),
                  textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MyCoButton(
                  title: 'Submit',
                  height: Responsive.getHeight(context) * .05,
                  isShadowBottomLeft: true,
                  boarderRadius: 30,
                  width: Responsive.getWidth(context) * .450,
                  onTap: () =>  submitRejection(),
                ),
              ),
            ],
          ),
          SizedBox(
            height:
                VariableBag.textFieldRowGap * Responsive.getResponsive(context),
          ),
        ],
      ),
    ),
  );
}
