import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/pages/reject_request_bottom_sheet.dart';
import 'package:myco_flutter/features/payslip/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

// Bottom sheet widget to handle appointment details
class AppointmentDetailsBottomSheet extends StatefulWidget {
  const AppointmentDetailsBottomSheet({super.key});

  @override
  State<AppointmentDetailsBottomSheet> createState() =>
      _AppointmentDetailsBottomSheetState();
}

class _AppointmentDetailsBottomSheetState
    extends State<AppointmentDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: CommonCard(
      headerColor: AppTheme.getColor(context).primary,
      title: 'Manish Chandra',
      headerPrefixIcon: 'assets/svgs/appointments/person.png',
      showHeaderPrefixIcon: true,
      bottomWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10 * Responsive.getResponsive(context),
              top: 16 * Responsive.getResponsive(context),
            ),
            // Section title for appointment details
            child: CustomText(
              'Appointment Details',
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).primary,
            ),
          ),

          // NewTextField for time, place, and reason
          Padding(
            padding: EdgeInsets.all(24.0 * Responsive.getResponsive(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10 * Responsive.getResponsive(context),
              children: [
                // Time picker (disabled input, opens iOS-style time picker)
                NewTextField(
                  label: 'Time',
                  hintText: 'Select Time',
                  prefixIconPath: AppAssets.assetClock2.toString(),
                  enabled: false,

                  onTap: () async {
                    final selectedDate = await showPicker(
                      context,
                      minDate: DateTime(2020),
                      maxDate: DateTime(2030),
                      pickDay: false,
                      timePicker: true,
                    );

                    if (selectedDate != null) {}
                  },
                ),

                //  NewTextField to enter Place
                NewTextField(
                  label: 'Place',
                  hintText: 'Type Here',
                  prefixIconPath: AppAssets.assetLocation.toString(),
                ),

                // NewTextField to enter Reason
                NewTextField(
                  hintText: 'Type Here',
                  label: 'Reason',
                  enabled: true,
                  maxLines: 3,
                  prefixIconPath: AppAssets.assetStickyNote.toString(),
                ),

                SizedBox(height: 0.01 * Responsive.getHeight(context)),

                // Buttons: Cancel & Send Request
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //MyCoButton CANCEL Button
                    MyCoButton(
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      width: 0.42 * Responsive.getWidth(context),
                      height: 0.06 * Responsive.getHeight(context),
                      onTap: () {
                        context.pop();
                      },
                      backgroundColor: AppTheme.getColor(context).surfaceBright,
                      title: 'CANCEL',
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //MyCoButton SEND REQUEST Button
                    MyCoButton(
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      width: 0.42 * Responsive.getWidth(context),
                      height: 0.06 * Responsive.getHeight(context),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                16 * Responsive.getResponsive(context),
                              ),
                            ),
                          ),
                          builder: (context) =>
                              const RejectRequestBottomSheet(),
                        );
                      },
                      title: 'SEND REQUEST',
                      isShadowBottomLeft: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      headerPrefixIconWidth: 50 * Responsive.getResponsive(context),
      subTitle: '7980239236',
    ),
  );
}
