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
import 'package:myco_flutter/widgets/ios_calendar_time_picker.dart'
    show DialDatePickerWidget;

class AddShortLeaveScreen extends StatefulWidget {
  AddShortLeaveScreen({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<AddShortLeaveScreen> createState() => _AddShortLeaveScreenState();
}

class _AddShortLeaveScreenState extends State<AddShortLeaveScreen> {
  final TextEditingController dateController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController reasonController = TextEditingController();

  final FocusNode dateFocusNode = FocusNode();

  final FocusNode timeFocusNode = FocusNode();

  final FocusNode reasonFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(title: const Text('Add Short Leave')),
    body: InkWell(
      focusColor: Colors.transparent,
      onTap: reasonFocusNode.unfocus,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20 * getResponsive(context),
            right: 20 * getResponsive(context),
          ),
          child: Form(
            key: AddShortLeaveScreen.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RequiredTextLabel(
                  text: 'Select Date',
                  isRequired: true,
                  style: TextStyle(
                    fontSize: 15 * getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 0.01 * getHeight(context)),
                MyCoTextfield(
                  controller: dateController,
                  focusNode: dateFocusNode,
                  hintText: 'Select Date',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select a date'
                      : null,
                  onClick: () {
                    showModalBottomSheet(
                      backgroundColor: AppColors.white,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 10,
                        ),
                        child: CustomDatePicker(
                          initialDate: DateTime.now(),
                          onSubmit: (selectedDate) {
                            final String date = DateFormat(
                              'dd-MM-yy',
                            ).format(selectedDate);
                            dateController.text = date;
                            log(date, name: 'Picked Date');
                            Navigator.pop(context);
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
                RequiredTextLabel(
                  text: 'Short Leave Time',
                  isRequired: true,
                  style: TextStyle(
                    fontSize: 15 * getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 0.01 * getHeight(context)),
                MyCoTextfield(
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select a time'
                      : null,
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
                            final String time = DateFormat(
                              'hh:mm a',
                            ).format(selectedDate);
                            timeController.text = time;
                            log(time, name: 'Picked Time');
                            Navigator.pop(context);
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
                RequiredTextLabel(
                  text: 'Add Reason',
                  isRequired: true,
                  style: TextStyle(
                    fontSize: 15 * getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 0.01 * getHeight(context)),
                MyCoTextfield(
                  focusNode: reasonFocusNode,
                  isReadOnly: false,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a reason for leave'
                      : null,
                  controller: reasonController,
                  hintText: 'Reason for Leave',
                  hintTextStyle: TextStyle(
                    fontSize: 18 * getResponsiveText(context),
                    color: AppTheme.getColor(context).outline,
                  ),
                  preFixImage: 'assets/images/message-question.png',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
                  ),
                  textAlignment: TextAlign.start,
                  maxLines: 5,
                ),
                Spacer(),
                Center(
                  child: MyCoButton(
                    onTap: () {
                      if (AddShortLeaveScreen.formKey.currentState!
                          .validate()) {
                        final String date = dateController.text;
                        final String time = timeController.text;
                        final String reason = reasonController.text;

                        final Map<String, String> leaveData = {
                          'date': date,
                          'time': time,
                          'reason': reason,
                        };

                        log('Leave Data: $leaveData');
                        reasonFocusNode.unfocus();
                        dateFocusNode.unfocus();
                        timeFocusNode.unfocus();
                        dateController.clear();
                        timeController.clear();
                        reasonController.clear();
                        Navigator.pop(context);
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
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
