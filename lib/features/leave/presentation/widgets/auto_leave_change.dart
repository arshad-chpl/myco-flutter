import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/leave_utils/leave_skeloton/leave_type_shimmer.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class DialogChangeAutoLeave extends StatefulWidget {
  final LeaveHistoryEntity leaveHistory;
  final bool isUser;
  final bool isUserSandwichLeaveUpdate;
  final bool updateStatus;
  final Function onSubmit;
  final VoidCallback onClose;
  final LeaveBloc leaveBloc;

  const DialogChangeAutoLeave({
    required this.leaveHistory,
    required this.isUser,
    required this.isUserSandwichLeaveUpdate,
    required this.updateStatus,
    required this.onSubmit,
    required this.onClose,
    required this.leaveBloc,
    super.key,
  });

  @override
  _DialogChangeAutoLeaveState createState() => _DialogChangeAutoLeaveState();
}

class LeaveSubmitData {
  final String leaveTypeId;
  final bool isPaidLeave;
  final String leaveDayTypeStatus;
  final String isSpecialLeave;
  final double leavePercentage;

  LeaveSubmitData({
    required this.leaveTypeId,
    required this.isPaidLeave,
    required this.leaveDayTypeStatus,
    required this.isSpecialLeave,
    required this.leavePercentage,
  });
}

class EditSandwichLeaveData {
  final String leaveName;
  final String leaveId;
  final bool isPaidUnpaid;
  final String useFullName;
  final String unitId;
  final String sandwichId;
  final String userId;
  final double leavePercentage;

  EditSandwichLeaveData({
    required this.leaveName,
    required this.leaveId,
    required this.isPaidUnpaid,
    required this.useFullName,
    required this.unitId,
    required this.sandwichId,
    required this.userId,
    required this.leavePercentage,
  });
}

class _DialogChangeAutoLeaveState extends State<DialogChangeAutoLeave> {
  late LeaveHistoryEntity leaveHistory;
  bool isLoading = true;
  bool isPaidLeave = false;
  bool isDecimalConditionTrue = false;
  bool applyLeaveWithActualDecimalLeaveBalance = false;
  bool showNoLeaveMessage = false;
  bool showLeaveTypeField = true;
  bool showLeaveTypeSpinner = true;
  bool showPaidUnpaidSpinner = true;
  bool showLeaveCountData = false;
  bool showSalaryGeneratedMessage = false;
  bool showShiftHours = false;
  bool showWorkingHours = false;
  bool showLeaveDayTypeSpinner = true;
  bool isUpdateButtonEnabled = true; // New state for button enable/disable

  String? leaveId;
  String? leaveName;
  String isSpecialLeave = '0';
  String unpaidLeaveAvailable = '0';
  String tempLeaveDayTypeSelected = '0';

  int selectedLeaveTypePosition = 0;
  int leaveApplyType = 0;
  int leavePercentage = 0;

  double applicableLeaveMonth = 0;
  double applicableLeaveMonthGlobal = 0;

  List<String> leaveTypeNames = ['Select'];
  List<String> leaveTypeIds = ['0'];
  List<String> isSpecialLeaveList = ['0'];
  List<bool> leaveApplyOnDateList = [false];
  List<String> paidUnpaidOptions = ['Select', 'Paid', 'Unpaid'];

  List<String> leaveDayTypes = [];

  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _leaveDayTypeController = TextEditingController();
  final TextEditingController _paidUnpaidController = TextEditingController();

  @override
  void initState() {
    super.initState();
    leaveHistory = widget.leaveHistory;
    tempLeaveDayTypeSelected = leaveHistory.leaveDayTypeStatus ?? '0';
    leavePercentage =
        double.tryParse(leaveHistory.leavePercentage ?? '100')?.toInt() ?? 100;

    // Initialize button as disabled
    disableAddButton();

    if (leaveHistory.isExtraDay == '1') {
      showLeaveCountData = true;
      showLeaveTypeField = false;
      showLeaveTypeSpinner = false;
      showPaidUnpaidSpinner = false;
    } else {
      showLeaveTypeField = true;
      showLeaveTypeSpinner = true;
      showPaidUnpaidSpinner = true;
      _fetchLeaveTypesWithData();
    }

    if (widget.isUser) {
      showShiftHours = false;
      showWorkingHours = false;
      showLeaveDayTypeSpinner = false;
    } else {
      showShiftHours =
          leaveHistory.totalShiftHours != null &&
          leaveHistory.totalShiftHours!.isNotEmpty;
      showWorkingHours =
          leaveHistory.totalWorkingHours != null &&
          leaveHistory.totalWorkingHours!.isNotEmpty;
    }

    if (widget.isUserSandwichLeaveUpdate) {
      showLeaveCountData = false;
      showPaidUnpaidSpinner = false;
      showShiftHours = false;
      showWorkingHours = false;
      showLeaveDayTypeSpinner = false;
    }
  }

  void disableAddButton() {
    setState(() {
      isUpdateButtonEnabled = false;
    });
  }

  void enableAddButton() {
    setState(() {
      isUpdateButtonEnabled = true;
    });
  }

  void leaveNotAvailable() {
    setState(() {
      disableAddButton();
      showSalaryGeneratedMessage = true;
    });
  }

  void _fetchLeaveTypesWithData() {
    widget.leaveBloc.add(
      LeaveTypesWithData(
        leaveHistory.unitId ?? '',
        leaveHistory.userId ?? '',
        leaveHistory.userFullName ?? '',
        leaveHistory.year ?? '',
        leaveHistory.leaveDate ?? '',
      ),
    );
  }

  void _setLeaveTypes(LeaveTypeResponseEntity response) {
    if (response.leaveTypes == null || response.leaveTypes!.isEmpty) {
      setState(() {
        isLoading = false;
        showNoLeaveMessage = true;
        showLeaveCountData = false;
      });
      return;
    }

    setState(() {
      leaveTypeNames = ['Select'];
      leaveTypeIds = ['0'];
      isSpecialLeaveList = ['0'];
      leaveApplyOnDateList = [false];

      for (var leaveType in response.leaveTypes!) {
        leaveTypeNames.add(leaveType.leaveTypeName ?? '');
        leaveTypeIds.add(leaveType.leaveTypeId ?? '');
        isSpecialLeaveList.add(leaveType.specialLeave ?? '0');
        leaveApplyOnDateList.add(leaveType.leaveApplyOnDate ?? false);
      }

      if (leaveHistory.leaveTypeId != null) {
        final index = leaveTypeIds.indexOf(leaveHistory.leaveTypeId!);
        if (index != -1) {
          selectedLeaveTypePosition = index;
          _leaveTypeController.text = leaveTypeNames[index];
          leaveId = leaveTypeIds[index];
          leaveName = leaveTypeNames[index];
          isSpecialLeave = isSpecialLeaveList[index];

          if (index > 0) {
            _getLeaveBalanceForAutoLeave(isSpecialLeave);
          }
        }
      }

      isLoading = false;
      showNoLeaveMessage = false;
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
        final selectedLeaveApplyDate = leaveApplyOnDateList[index];

        if (selectedLeaveApplyDate) {
          final leaveDateParts = leaveHistory.leaveDate?.split('-');
          if (leaveDateParts != null && leaveDateParts.length >= 3) {
            final selectedMonth = leaveDateParts[1];
            final selectedDay = leaveDateParts[2];
            final finalSelectedDate = '$selectedDay-$selectedMonth';
            String myFinalSelectedBirthDate = '';
            String myFinalSelectedAnniversaryDate = '';

            final String birthdayDate =
                '2025-03-13'; // Replace with actual birthday from preferences
            final String anniversaryDate =
                '2024-04-01'; // Replace with actual anniversary from preferences

            if (birthdayDate != null && birthdayDate.trim().isNotEmpty) {
              final dateMyBirthDay = birthdayDate.split('-');
              if (dateMyBirthDay.length >= 3) {
                final selectedMyBirthDayMonth = dateMyBirthDay[1];
                final selectedMyBirthDayDay = dateMyBirthDay[2];
                myFinalSelectedBirthDate =
                    '$selectedMyBirthDayDay-$selectedMyBirthDayMonth';
              }
            }
            if (anniversaryDate != null && anniversaryDate.trim().isNotEmpty) {
              final dateMyAnniversary = anniversaryDate.split('-');
              if (dateMyAnniversary.length >= 3) {
                final selectedAnniversaryMonth = dateMyAnniversary[1];
                final selectedAnniversaryDay = dateMyAnniversary[2];
                myFinalSelectedAnniversaryDate =
                    '$selectedAnniversaryDay-$selectedAnniversaryMonth';
              }
            }

            if (myFinalSelectedBirthDate.isNotEmpty ||
                myFinalSelectedAnniversaryDate.isNotEmpty) {
              if (myFinalSelectedBirthDate == finalSelectedDate ||
                  myFinalSelectedAnniversaryDate == finalSelectedDate) {
                if (index > 0) {
                  showLeaveCountData = false;
                  _getLeaveBalanceForAutoLeave(isSpecialLeave);
                }
              } else {
                showLeaveCountData = false;
                Fluttertoast.showToast(
                  msg: 'Please select correct $leaveName date',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                disableAddButton();
              }
            }
          }
        } else {
          if (index > 0) {
            showLeaveCountData = false;
            _getLeaveBalanceForAutoLeave(isSpecialLeave);
          }
        }
      });
    }
  }

  void _getLeaveBalanceForAutoLeave(String isSpecialLeave) {
    setState(() {
      isLoading = true;
      showLeaveCountData = false;
      showSalaryGeneratedMessage = false;
    });

    widget.leaveBloc.add(
      CheckAutoLeaveBalance(
        leaveHistory.userId ?? '',
        leaveHistory.leaveDate ?? '',
        leaveId ?? '',
      ),
    );
  }

  void _onLeaveBalanceFetched(CheckLeaveBalanceResponse response) {
    setState(() {
      if (response.status == '200') {
        unpaidLeaveAvailable = response.leave?.applicableUnpaidLeave ?? '0';
        leaveApplyType =
            int.tryParse(response.leave?.leaveApplyType ?? '0') ?? 0;
        applyLeaveWithActualDecimalLeaveBalance =
            response.leave?.applyLeaveWithActualDecimalLeaveBalance ?? false;
        applicableLeaveMonth =
            double.tryParse(response.leave?.availablePaidLeave ?? '0') ?? 0;
        applicableLeaveMonthGlobal = applicableLeaveMonth;
        showLeaveCountData = true;

        _setLeaveDayType();
        _setDataPaidUnpaidFilterNew();

        if (isSpecialLeave == '1' && applicableLeaveMonth == 0) {
          leaveNotAvailable();
          showLeaveCountData = false;
        } else {
          enableAddButton();
          showSalaryGeneratedMessage = false;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Error fetching leave balance'),
          ),
        );
        showLeaveCountData = false;
        disableAddButton();
      }
      isLoading = false;
    });
  }

  void _setDataPaidUnpaidFilterNew() {
    isDecimalConditionTrue = false;
    switch (leaveHistory.leaveDayTypeStatus) {
      case '0': // Full day leave
        if (applicableLeaveMonth >= 1.0) {
          _setPaidUnpaid();
          leavePercentage = 100;
        } else if (applicableLeaveMonth != 0 &&
            applicableLeaveMonth < 1 &&
            applyLeaveWithActualDecimalLeaveBalance) {
          _setPaidUnpaid();
          isDecimalConditionTrue = true;
          leavePercentage = (applicableLeaveMonth * 100).round();
        } else {
          leavePercentage = 0;
          _setUnpaid();
        }
        break;

      case '1': // Half day leave
        if (applicableLeaveMonth >= 0.5) {
          leavePercentage = 50;
          _setPaidUnpaid();
        } else if (applicableLeaveMonth != 0 &&
            applicableLeaveMonth < 0.5 &&
            applyLeaveWithActualDecimalLeaveBalance) {
          _setPaidUnpaid();
          isDecimalConditionTrue = true;
          leavePercentage = (applicableLeaveMonth * 100).round();
        } else {
          leavePercentage = 0;
          _setUnpaid();
        }
        break;

      case '2': // Quarter day leave
        if (applicableLeaveMonth >= 0.25) {
          leavePercentage = 25;
          _setPaidUnpaid();
        } else if (applicableLeaveMonth != 0 &&
            applicableLeaveMonth < 0.25 &&
            applyLeaveWithActualDecimalLeaveBalance) {
          _setPaidUnpaid();
          isDecimalConditionTrue = true;
          leavePercentage = (applicableLeaveMonth * 100).round();
        } else {
          leavePercentage = 0;
          _setUnpaid();
        }
        break;

      case '3': // Three-quarter day leave
        if (applicableLeaveMonth >= 0.75) {
          leavePercentage = 75;
          _setPaidUnpaid();
        } else if (applicableLeaveMonth != 0 &&
            applicableLeaveMonth < 0.75 &&
            applyLeaveWithActualDecimalLeaveBalance) {
          _setPaidUnpaid();
          isDecimalConditionTrue = true;
          leavePercentage = (applicableLeaveMonth * 100).round();
        } else {
          leavePercentage = 0;
          _setUnpaid();
        }
        break;

      default:
        leavePercentage = 0;
        _setUnpaid();
        break;
    }
  }

  void _setPaidUnpaid() {
    isPaidLeave = false;
    paidUnpaidOptions = ['Select', 'Paid', 'Unpaid'];
    _paidUnpaidController.text = 'Paid';
  }

  void _setUnpaid() {
    isPaidLeave = false;
    paidUnpaidOptions = ['Unpaid'];
    _paidUnpaidController.text = 'Unpaid';
  }

  void _setLeaveDayType() {
    final tempLeaveTypes = [
      'Select',
      'Full Day',
      'Half Day',
      'Quarter Day',
      'Three-Quarter Day',
    ];
    final actualLeaveTypes = <String>[];

    actualLeaveTypes.add(tempLeaveTypes[0]); // Add "Select"

    if (leaveApplyType == 0) {
      actualLeaveTypes.add(tempLeaveTypes[1]); // Full Day
      actualLeaveTypes.add(tempLeaveTypes[2]); // Half Day
    } else if (leaveApplyType == 1) {
      actualLeaveTypes.add(tempLeaveTypes[1]); // Full Day
    } else if (leaveApplyType == 2) {
      actualLeaveTypes.add(tempLeaveTypes[1]); // Full Day
      actualLeaveTypes.add(tempLeaveTypes[2]); // Half Day
      actualLeaveTypes.add(tempLeaveTypes[3]); // Quarter Day
      actualLeaveTypes.add(tempLeaveTypes[4]); // Three-Quarter Day
    }

    if (leaveHistory.leaveDayTypeStatus == '2' &&
        !actualLeaveTypes.contains(tempLeaveTypes[3])) {
      actualLeaveTypes.add(tempLeaveTypes[3]);
    }

    if (leaveHistory.leaveDayTypeStatus == '3' &&
        !actualLeaveTypes.contains(tempLeaveTypes[4])) {
      actualLeaveTypes.add(tempLeaveTypes[4]);
    }

    setState(() {
      leaveDayTypes = actualLeaveTypes;

      // Set initial selection
      if (leaveHistory.leaveDayTypeStatus != null &&
          leaveHistory.leaveDayTypeStatus!.isNotEmpty) {
        switch (leaveHistory.leaveDayTypeStatus) {
          case '0':
            _leaveDayTypeController.text = tempLeaveTypes[1];
            leavePercentage = 100;
            break;
          case '1':
            _leaveDayTypeController.text = tempLeaveTypes[2];
            leavePercentage = 50;
            break;
          case '2':
            _leaveDayTypeController.text = tempLeaveTypes[3];
            leavePercentage = 25;
            break;
          case '3':
            _leaveDayTypeController.text = tempLeaveTypes[4];
            leavePercentage = 75;
            break;
        }
      } else {
        _leaveDayTypeController.text = tempLeaveTypes[1]; // Default to Full Day
        leavePercentage = 100;
      }
    });
  }

  void _onLeaveDayTypeSelected(String selectedValue) {
    final index = leaveDayTypes.indexOf(selectedValue);
    if (index > 0) {
      setState(() {
        _leaveDayTypeController.text = selectedValue;
        leaveHistory = leaveHistory.copyWith(
          leaveDayTypeStatus: _getLeaveDayTypeStatus(index, selectedValue),
          leavePercentage: _calculateLeavePercentage(
            index,
            selectedValue,
          ).toString(),
        );
        leavePercentage = _calculateLeavePercentage(index, selectedValue);
      });
    }
  }

  String _getLeaveDayTypeStatus(int index, String selectedValue) {
    switch (index) {
      case 1: // Full Day
        return '0';
      case 2: // Half Day
        if (selectedValue == leaveDayTypes[4]) {
          return '3';
        } else if (selectedValue == leaveDayTypes[3]) {
          return '2';
        } else {
          return '1';
        }
      case 3: // Quarter Day
        if (selectedValue == leaveDayTypes[4]) {
          return '3';
        } else {
          return '2';
        }
      case 4: // Three-Quarter Day
        return '3';
      default:
        return '0';
    }
  }

  int _calculateLeavePercentage(int index, String selectedValue) {
    int percentage;
    switch (index) {
      case 1: // Full Day
        percentage = 100;
        break;
      case 2: // Half Day
        if (selectedValue == leaveDayTypes[4]) {
          percentage = 75;
        } else if (selectedValue == leaveDayTypes[3]) {
          percentage = 25;
        } else {
          percentage = 50;
        }
        break;
      case 3: // Quarter Day
        if (selectedValue == leaveDayTypes[4]) {
          percentage = 75;
        } else {
          percentage = 25;
        }
        break;
      case 4: // Three-Quarter Day
        percentage = 75;
        break;
      default:
        percentage = 100;
    }

    if (applyLeaveWithActualDecimalLeaveBalance &&
        applicableLeaveMonth > 0 &&
        applicableLeaveMonth < 1) {
      isDecimalConditionTrue = false;

      switch (index) {
        case 1: // Full Day
          if (applicableLeaveMonth < 1) {
            isDecimalConditionTrue = true;
            percentage = (applicableLeaveMonth * 100).round();
          }
          break;
        case 2: // Half Day
          if (applicableLeaveMonth >= 0.5) {
            percentage = 50;
          } else {
            isDecimalConditionTrue = true;
            percentage = (applicableLeaveMonth * 100).round();
          }
          break;
        case 3: // Quarter Day
          if (selectedValue == leaveDayTypes[4]) {
            if (applicableLeaveMonth >= 0.75) {
              percentage = 75;
            } else {
              isDecimalConditionTrue = true;
              percentage = (applicableLeaveMonth * 100).round();
            }
          } else {
            if (applicableLeaveMonth >= 0.25) {
              percentage = 25;
            } else {
              isDecimalConditionTrue = true;
              percentage = (applicableLeaveMonth * 100).round();
            }
          }
          break;
        case 4: // Three-Quarter Day
          if (applicableLeaveMonth >= 0.75) {
            percentage = 75;
          } else {
            isDecimalConditionTrue = true;
            percentage = (applicableLeaveMonth * 100).round();
          }
          break;
      }
    }

    return percentage;
  }

  void _onPaidUnpaidSelected(String value) {
    setState(() {
      isPaidLeave = value == 'Paid';

      if (widget.isUser) {
        if (!isPaidLeave) {
          if (applyLeaveWithActualDecimalLeaveBalance &&
              unpaidLeaveAvailable == '1') {
            leaveNotAvailable();
          } else if (unpaidLeaveAvailable == '1') {
            leaveNotAvailable();
          } else {
            enableAddButton();
            showSalaryGeneratedMessage = false;
          }
        } else {
          if (applicableLeaveMonthGlobal == 0 && unpaidLeaveAvailable == '1') {
            leaveNotAvailable();
          } else if (isDecimalConditionTrue &&
              applyLeaveWithActualDecimalLeaveBalance &&
              unpaidLeaveAvailable == '1') {
            leaveNotAvailable();
          } else {
            enableAddButton();
            showSalaryGeneratedMessage = false;
          }
        }
      }
    });
  }

  void _onSubmit() {
    if (widget.isUserSandwichLeaveUpdate) {
      if (selectedLeaveTypePosition == 0) {
        Fluttertoast.showToast(
          msg: 'Please select leave type',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        if (applicableLeaveMonth < 1) {
          Fluttertoast.showToast(
            msg: 'Paid leave is not available',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          widget.onSubmit(
            EditSandwichLeaveData(
              leaveName: leaveName ?? '',
              leaveId: leaveId ?? '',
              isPaidUnpaid: isPaidLeave,
              useFullName: leaveHistory.userFullName ?? '',
              unitId: leaveHistory.unitId ?? '',
              sandwichId: leaveHistory.sandwichLeaveId ?? '',
              userId: leaveHistory.userId ?? '',
              leavePercentage: leavePercentage.toDouble(),
            ),
          );
          Navigator.pop(context);
        }
      }
    } else {
      if (selectedLeaveTypePosition == 0) {
        Fluttertoast.showToast(
          msg: 'Please select leave type',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (_paidUnpaidController.text.isEmpty ||
          _paidUnpaidController.text == 'Select') {
        Fluttertoast.showToast(
          msg: 'Please select paid/unpaid',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (applicableLeaveMonth == 0.5 &&
          leaveHistory.leaveDayTypeStatus == '0' &&
          _paidUnpaidController.text == 'Paid') {
        Fluttertoast.showToast(
          msg: 'Please change to half day leave',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        widget.onSubmit(
          LeaveSubmitData(
            leaveTypeId: leaveId ?? '',
            isPaidLeave: isPaidLeave,
            leaveDayTypeStatus: leaveHistory.leaveDayTypeStatus ?? '0',
            isSpecialLeave: isSpecialLeave,
            leavePercentage: leavePercentage.toDouble(),
          ),
        );
        Navigator.pop(context);
      }
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
        } else if (state is CheckAutoLeaveBalanceFetched) {
          _onLeaveBalanceFetched(state.checkLeaveBalanceResponse);
        } else if (state is LeaveError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            isLoading = false;
            showLeaveCountData = false;
            disableAddButton();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Util.getFormattedDateLeave(leaveHistory.leaveDate),
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: height * 0.01),

              if (showShiftHours)
                Column(
                  children: [
                    Text(
                      'Employee shift hours is: ${leaveHistory.totalShiftHours}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),

              if (showWorkingHours)
                Column(
                  children: [
                    Text(
                      'Employee working hours is: ${leaveHistory.totalWorkingHours}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                  ],
                ),

              // Show "No leave assigned" message if applicable
              if (showNoLeaveMessage)
                Text(
                  'Leave not assigned',
                  style: TextStyle(fontSize: width * 0.035, color: Colors.red),
                ),

              // Show "Select Leave Type" field if visible
              if (showLeaveTypeField)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Leave Type',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
                  ],
                ),

              // Show leave type spinner if visible
              if (showLeaveTypeSpinner)
                isLoading
                    ? const LeaveTypeShimmer()
                    : MyCoTextfield(
                        isReadOnly: true,
                        validator: (value) =>
                            value == null || value.isEmpty || value == 'Select'
                            ? 'Please select a type of leave'
                            : null,
                        controller: _leaveTypeController,
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
                              _leaveTypeController.text,
                              (selectedValue) {
                                _leaveTypeController.text = selectedValue;
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

              // Show "No comp-off leave balance available" message if visible
              if (showSalaryGeneratedMessage)
                Text(
                  'No comp-off leave balance available',
                  style: TextStyle(fontSize: width * 0.035, color: Colors.red),
                ),

              // Show leave count data if visible
              if (showLeaveCountData) ...[
                // Available Leave Balance
                Text(
                  'Available Leave Balance: $applicableLeaveMonth',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: height * 0.01),

                // Leave Day Type (only for non-user)
                if (showLeaveDayTypeSpinner) ...[
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
                        ? 'Please select leave day type'
                        : null,
                    controller: _leaveDayTypeController,
                    hintText: 'Select',
                    hintTextStyle: TextStyle(
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).outline,
                    ),
                    image1: 'assets/images/arrow-down.png',
                    onClick: () {
                      if (leaveDayTypes.isNotEmpty) {
                        showLeaveFilterBottomSheet(
                          context,
                          _leaveDayTypeController.text,
                          (selectedValue) {
                            _onLeaveDayTypeSelected(selectedValue);
                          },
                          leaveDayTypes,
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
                ],

                // Paid or Unpaid
                if (showPaidUnpaidSpinner) ...[
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
                    validator: (value) =>
                        value == null || value.isEmpty || value == 'Select'
                        ? 'Please select paid/unpaid'
                        : null,
                    controller: _paidUnpaidController,
                    hintText: 'Select',
                    hintTextStyle: TextStyle(
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).outline,
                    ),
                    image1: 'assets/images/arrow-down.png',
                    onClick: () {
                      showLeaveFilterBottomSheet(
                        context,
                        _paidUnpaidController.text,
                        (selectedValue) {
                          _paidUnpaidController.text = selectedValue;
                          _onPaidUnpaidSelected(selectedValue);
                        },
                        paidUnpaidOptions,
                      );
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
              ],

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCoButton(
                    onTap: widget.onClose,
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
                  MyCoButton(
                    onTap: isUpdateButtonEnabled ? _onSubmit : null,
                    title: 'Update',
                    height: 0.06 * Responsive.getHeight(context),
                    boarderRadius: 30,
                    width: 0.3 * Responsive.getWidth(context),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isUpdateButtonEnabled
                          ? AppTheme.getColor(context).onPrimary
                          : Colors.grey,
                    ),
                    backgroundColor: isUpdateButtonEnabled
                        ? AppTheme.getColor(context).primary
                        : Colors.grey.shade400,
                    isShadowBottomLeft: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
