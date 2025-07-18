import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/device_change/device_change_state.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class GetReasonUi extends StatelessWidget {
  final String title;

  const GetReasonUi({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();

    return BlocListener<DeviceChangeBloc, DeviceChangeState>(
      listener: (context, state) {
        if (state is DeviceChangeLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is DeviceChangeSuccess) {
          Navigator.of(context).pop(); // Closing Loading
          Navigator.of(context).pop(); // Closing Reason Dialog

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: CustomAlertDialog(
                alertType: AlertType.defaultType,
                content: state.response.message,
                confirmText: 'Ok',
                onConfirm: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        } else if (state is DeviceChangeFailure) {
          Fluttertoast.showToast(msg: state.response ?? '');
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: SvgPicture.asset(
                          'assets/login/ic_ui_message_edit.svg',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: reasonController,
                          maxLines: 4,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: const InputDecoration(
                            hintText: 'Type Here',
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 12,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10), // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
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
                        textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(
                          context,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyCoButton(
                        title: 'Submit',
                        height: Responsive.getHeight(context) * .05,
                        isShadowBottomLeft: true,
                        boarderRadius: 30,
                        width: Responsive.getWidth(context) * .450,
                        onTap: () {
                          final reason = reasonController.text.trim();
                          if (reason.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'Please enter a reason',
                            );
                          } else {
                            final preferenceManager =
                                GetIt.I<PreferenceManager>();
                            final model = RequestDeviceChangeModel(
                              user_id: preferenceManager.getUserId(),
                              mac_address_change_reason: reason,
                              user_mac_address: '',
                              // Todo
                              mac_address_device: '',
                              // Todo
                              mac_address_phone_modal: '',
                              // Todo
                              language_id: '1',
                              societyId: '1',
                            );

                            context.read<DeviceChangeBloc>().add(
                              SubmitDeviceChangeRequest(model),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
