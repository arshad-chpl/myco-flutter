import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/required_text_label.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AddShortLeaveScreen extends StatelessWidget {
  AddShortLeaveScreen({super.key});

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  final FocusNode dateFocusNode = FocusNode();
  final FocusNode timeFocusNode = FocusNode();
  final FocusNode reasonFocusNode = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add Short Leave')),
    body: Padding(
      padding: EdgeInsets.only(
        left: 20 * getResponsive(context),
        right: 20 * getResponsive(context),
        bottom: 20 * getResponsive(context),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RequiredTextLabel(
                text: 'Select Date',
                isRequired: true,
                style: TextStyle(
                  fontSize: 15 * getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(height: 0.01 * getHeight(context)),
            MyCoTextfield(
              controller: dateController,
              focusNode: dateFocusNode,
              hintText: 'Select Date',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a date';
                }
                return null;
              },
              onClick: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.white,
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: DialDatePickerWidget(
                      initialDate: DateTime.now(),
                      onSubmit: (selectedDate) {
                        final String date = DateFormat(
                          'dd-MM-yy',
                        ).format(selectedDate);
                        dateController.text = date;
                        log(date, name: 'Picked Date');
                      },
                    ),
                  ),
                );
              },
              hintTextStyle: TextStyle(
                fontSize: 18 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              preFixImage: 'assets/images/note-favorite.png',

              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
              ),
              height: 0.02 * getHeight(context),
              textAlignment: TextAlign.start,
              isSuffixIconOn: true,
              image1: 'assets/images/arrow-down.png',
              isReadOnly: true,
              suffix: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppTheme.getColor(context).primary,
                size: 30 * getResponsive(context),
              ),
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: RequiredTextLabel(
                text: 'Short Leave Time',
                isRequired: true,
                style: TextStyle(
                  fontSize: 15 * getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(height: 0.01 * getHeight(context)),
            MyCoTextfield(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a time';
                }
                return null;
              },
              onClick: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.white,
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 10,
                    ),
                    child: DialDatePickerWidget(
                      timePicker: true,
                      initialDate: DateTime.now(),
                      onSubmit: (selectedDate) {
                        final String date = DateFormat(
                          'hh-mm-a',
                        ).format(selectedDate);
                        timeController.text = date;
                        log(date, name: 'Picked Date');
                      },
                    ),
                  ),
                );
              },
              isReadOnly: true,
              controller: timeController,
              focusNode: timeFocusNode,
              hintText: 'Select Time',
              hintTextStyle: TextStyle(
                fontSize: 18 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              preFixImage: 'assets/images/clock.png',

              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
              ),
              height: 0.02 * getHeight(context),
              textAlignment: TextAlign.start,
            ),
            SizedBox(height: 0.02 * getHeight(context)),
            Align(
              alignment: Alignment.centerLeft,
              child: RequiredTextLabel(
                text: 'Add Reason',
                isRequired: true,
                style: TextStyle(
                  fontSize: 15 * getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              ),
            ),
            SizedBox(height: 0.01 * getHeight(context)),

            MyCoTextfield(
              focusNode: reasonFocusNode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a reason for leave';
                }
                return null;
              },

              controller: reasonController,
              hintText: 'Reason  for Leave',
              hintTextStyle: TextStyle(
                fontSize: 18 * getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              preFixImage: 'assets/images/message-question.png',

              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
              ),
              // height: 0.05 * getHeight(context),
              textAlignment: TextAlign.start,
              maxLines: 5,
            ),
            Spacer(),
            MyCoButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  final String date = dateController.text;
                  final String time = timeController.text;
                  final String reason = reasonController.text;

                  final Map<String, String> leaveData = {
                    'date': date,
                    'time': time,
                    'reason': reason,
                  };
                  log('Leave Data: $leaveData');
                  dateController.clear();
                  timeController.clear();
                  reasonController.clear();
                }
              },
              title: "SUBMIT",
              height: 0.065 * getHeight(context),
              boarderRadius: 30,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).onPrimary,
              ),
              backgroundColor: AppTheme.getColor(context).primary,
              isShadowBottomLeft: true,
            ),
          ],
        ),
      ),
    ),
  );
}
