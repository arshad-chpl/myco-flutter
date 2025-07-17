import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/intities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AutoLeaveChangeForm extends StatefulWidget {
  final List<String> leaveOptions;
  final void Function(String selectedLeave, String remark) onSave;
  final VoidCallback onCancel;
  final LeaveHistoryEntity leaveEntity;
  final bool isUser;
  final bool isUserSandwichLeaveUpdate;
  final bool updateStatus;
  final LeaveBloc leaveBloc;

  const AutoLeaveChangeForm({
    required this.leaveOptions,
    required this.onSave,
    required this.onCancel,
    required this.leaveEntity,
    required this.isUser,
    required this.isUserSandwichLeaveUpdate,
    required this.updateStatus,
    required this.leaveBloc,
    super.key,
  });

  @override
  State<AutoLeaveChangeForm> createState() => _LeaveEncashmentFormState();
}

class _LeaveEncashmentFormState extends State<AutoLeaveChangeForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _selectedLeave = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  List<String> leaveTypeNames = ['Select'];
  List<String> leaveTypeIds = ['0'];
  List<String> isSpecialLeaveList = ['0'];
  List<bool> leaveApplyOnDateList = [false];
  int selectedLeaveTypePosition = 0;
  String? leaveId;
  String? leaveName;
  String? isSpecialLeave;
  bool? selectedLeaveApplyDate;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLeaveTypesWithData();
  }

  @override
  void dispose() {
    _selectedLeave.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  void _fetchLeaveTypesWithData() {
    widget.leaveBloc.add(
      LeaveTypesWithData(
        widget.leaveEntity.unitId ?? '',
        widget.leaveEntity.userId ?? '',
        'Lucky Katre', // Replace with actual user name if available
        widget.leaveEntity.year ?? '',
        widget.leaveEntity.leaveDate ?? '',
      ),
    );
  }

  void _setLeaveTypes(LeaveTypeResponse response) {
    if (response.leaveTypes == null || response.leaveTypes!.isEmpty) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    setState(() {
      // Clear previous data (except the default "Select" option)
      leaveTypeNames = ['Select'];
      leaveTypeIds = ['0'];
      isSpecialLeaveList = ['0'];
      leaveApplyOnDateList = [false];

      // Add leave types from API response
      for (var leaveType in response.leaveTypes!) {
        leaveTypeNames.add(leaveType.leaveTypeName ?? '');
        leaveTypeIds.add(leaveType.leaveTypeId ?? '');
        isSpecialLeaveList.add(leaveType.specialLeave ?? '0');
        leaveApplyOnDateList.add(leaveType.leaveApplyOnDate ?? false);
      }

      // Set initial selection if leaveId is available
      if (widget.leaveEntity.leaveTypeId != null) {
        final index = leaveTypeIds.indexOf(widget.leaveEntity.leaveTypeId!);
        if (index != -1) {
          selectedLeaveTypePosition = index;
          _selectedLeave.text = leaveTypeNames[index];
          leaveId = leaveTypeIds[index];
          leaveName = leaveTypeNames[index];
          isSpecialLeave = isSpecialLeaveList[index];
          selectedLeaveApplyDate = leaveApplyOnDateList[index];
        }
      }

      isLoading = false;
    });
  }

  void _onLeaveTypeSelected(String selectedValue) {
    final index = leaveTypeNames.indexOf(selectedValue);
    if (index != -1 && index != selectedLeaveTypePosition) {
      setState(() {
        selectedLeaveTypePosition = index;
        leaveId = leaveTypeIds[index];
        leaveName = leaveTypeNames[index];
        isSpecialLeave = isSpecialLeaveList[index];
        selectedLeaveApplyDate = leaveApplyOnDateList[index];
      });

      // Check for special date conditions (birthday/anniversary)
      if (index > 0 && selectedLeaveApplyDate == true) {
        final leaveDateParts = widget.leaveEntity.leaveDate?.split('-');
        if (leaveDateParts != null && leaveDateParts.length >= 3) {
          final selectedMonth = leaveDateParts[1];
          final selectedDay = leaveDateParts[2];
          final finalSelectedDate = '$selectedDay-$selectedMonth';

          // Here you would check against user's birthday and anniversary dates
          // You'll need to get these from your user data/preferences
          // For example:
          // final birthdayDate = preferenceManager.getUserBirthday();
          // final anniversaryDate = preferenceManager.getUserAnniversary();
          // if (finalSelectedDate != birthdayDate && finalSelectedDate != anniversaryDate) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text('Please select correct date for $leaveName'),
          //   ));
          // }
        }
      }

      // Here you would call getLeaveBalanceForAutoLeave if needed
      // if (index > 0) {
      //   _getLeaveBalanceForAutoLeave(isSpecialLeave);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = Responsive.getWidth(context);
    final double height = Responsive.getHeight(context);

    return BlocListener<LeaveBloc, LeaveState>(
      bloc: widget.leaveBloc,
      listener: (context, state) {
        if (state is LeaveTypeWithDataFetched) {
          _setLeaveTypes(state.leaveType);
        } else if (state is LeaveError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          setState(() {
            isLoading = false;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.leaveEntity.leaveDateView ?? 'N/A',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: height * 0.01),
                if (!widget.isUser &&
                    widget.leaveEntity.totalShiftHours?.isNotEmpty == true)
                  Column(
                    children: [
                      Text(
                        'Employee shift hours is: ${widget.leaveEntity.totalShiftHours}',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                    ],
                  ),

                if (!widget.isUser &&
                    widget.leaveEntity.totalWorkingHours?.isNotEmpty == true)
                  Column(
                    children: [
                      Text(
                        'Employee working hours is: ${widget.leaveEntity.totalWorkingHours}',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                    ],
                  ),

                /// Dropdown
                Text(
                  'Select Leave Type',
                  style: TextStyle(
                    fontSize: width * 0.038,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.008),
                isLoading
                    ? CircularProgressIndicator()
                    : MyCoTextfield(
                  isReadOnly: true,
                  validator: (value) => value == null ||
                      value.isEmpty ||
                      value == 'Select'
                      ? 'Please select a type of leave'
                      : null,
                  controller: _selectedLeave,
                  hintText: 'Select',
                  hintTextStyle: TextStyle(
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).outline,
                  ),
                  image1: 'assets/images/arrow-down.png',
                  onClick: () {
                    if (leaveTypeNames.isNotEmpty) {
                      showLeaveFilterBottomSheet(
                        context,
                        _selectedLeave.text,
                            (selectedValue) {
                          _selectedLeave.text = selectedValue;
                          _onLeaveTypeSelected(selectedValue);
                        },
                        leaveTypeNames,
                      );
                    }
                  },
                  preFixImage: 'assets/images/note-favorite.png',
                  suffix: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppTheme.getColor(context).primary,
                    size: 30 * Responsive.getResponsive(context),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF98A2B3)),
                  ),
                  textAlignment: TextAlign.start,
                ),
                SizedBox(height: height * 0.025),

                Text(
                  'Leave Not Assigned',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: height * 0.01),

                if (!widget.isUser) ...[
                  Text(
                    'Leave Day Type',
                    style: TextStyle(
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.008),
                  MyCoTextfield(
                    isReadOnly: true,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please select a type of leave'
                        : null,
                    controller: _selectedLeave,
                    hintText: 'Select',
                    hintTextStyle: TextStyle(
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).outline,
                    ),
                    image1: 'assets/images/arrow-down.png',
                    onClick: () {
                      showLeaveFilterBottomSheet(context, _selectedLeave.text,
                              (p0) {
                            _selectedLeave.text = p0;
                            setState(() {});
                          }, widget.leaveOptions);
                    },
                    preFixImage: 'assets/images/note-favorite.png',
                    suffix: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppTheme.getColor(context).primary,
                      size: 30 * Responsive.getResponsive(context),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF98A2B3)),
                    ),
                    textAlignment: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.025),
                ],

                Text(
                  'Paid or Unpaid',
                  style: TextStyle(
                    fontSize: width * 0.038,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.008),
                MyCoTextfield(
                  isReadOnly: true,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select a type of leave'
                      : null,
                  controller: _selectedLeave,
                  hintText: 'Select',
                  hintTextStyle: TextStyle(
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).outline,
                  ),
                  image1: 'assets/images/arrow-down.png',
                  onClick: () {
                    showLeaveFilterBottomSheet(context, _selectedLeave.text,
                            (p0) {
                          _selectedLeave.text = p0;
                          setState(() {});
                        }, widget.leaveOptions);
                  },
                  preFixImage: 'assets/images/note-favorite.png',
                  suffix: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: AppTheme.getColor(context).primary,
                    size: 30 * Responsive.getResponsive(context),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xFF98A2B3)),
                  ),
                  textAlignment: TextAlign.start,
                ),
                SizedBox(height: height * 0.025),

                ///text
                Text(
                  'salary generated',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'Leave Not avilable',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: height * 0.03),

                /// Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyCoButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel',
                      height: 0.06 * Responsive.getHeight(context),
                      boarderRadius: 30,
                      width: 0.3 * Responsive.getWidth(context),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      backgroundColor: AppColors.transparent,
                    ),
                    // Save Button
                    MyCoButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onSave(
                            _selectedLeave.text.trim(),
                            _remarkController.text.trim(),
                          );
                        }
                      },
                      title: 'Save',
                      height: 0.06 * Responsive.getHeight(context),
                      boarderRadius: 30,
                      width: 0.3 * Responsive.getWidth(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}