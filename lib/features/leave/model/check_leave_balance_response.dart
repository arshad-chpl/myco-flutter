import 'dart:convert';

CheckLeaveBalanceResponse checkLeaveBalanceResponseFromJson(String str) => CheckLeaveBalanceResponse.fromJson(json.decode(str));

String checkLeaveBalanceResponseToJson(CheckLeaveBalanceResponse data) => json.encode(data.toJson());

class CheckLeaveBalanceResponse {
  Leave? leave;
  String? message;
  String? status;
  bool? isSalaryGenerated;
  bool? hasAttendance;
  List<LeaveReason>? leaveReasons;

  CheckLeaveBalanceResponse({
    this.leave,
    this.message,
    this.status,
    this.isSalaryGenerated,
    this.hasAttendance,
    this.leaveReasons,
  });

  factory CheckLeaveBalanceResponse.fromJson(Map<String, dynamic> json) => CheckLeaveBalanceResponse(
    leave: json['leave'] == null ? null : Leave.fromJson(json['leave']),
    message: json['message'],
    status: json['status'],
    isSalaryGenerated: json['is_salary_generated'] ?? false,
    hasAttendance: json['has_attendance'] ?? false,
    leaveReasons: json['leave_reasons'] == null
        ? []
        : List<LeaveReason>.from(json['leave_reasons']!.map((x) => LeaveReason.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'leave': leave?.toJson(),
    'message': message,
    'status': status,
    'is_salary_generated': isSalaryGenerated,
    'has_attendance': hasAttendance,
    'leave_reasons': leaveReasons == null ? [] : List<dynamic>.from(leaveReasons!.map((x) => x.toJson())),
  };
}

class Leave {
  String? leaveTypeName;
  String? applicableUnpaidLeave;
  String? remainingPastMonthsLeave;
  String? currentMonthLeave;
  String? leaveApplyType;
  bool? applyLeaveWithActualDecimalLeaveBalance;
  String? quarterLeaveApplyType;
  String? carryForwardLeave;
  String? payoutLeave;
  String? totalRemainingLeaves;
  String? userTotalLeave;
  String? useLeave;
  String? useLeavePaid;
  String? useLeaveUnpaid;
  String? availablePaidLeave;
  String? remainingLeave;
  String? startDate;
  String? endDate;

  Leave({
    this.leaveTypeName,
    this.applicableUnpaidLeave,
    this.remainingPastMonthsLeave,
    this.currentMonthLeave,
    this.leaveApplyType,
    this.applyLeaveWithActualDecimalLeaveBalance,
    this.quarterLeaveApplyType,
    this.carryForwardLeave,
    this.payoutLeave,
    this.totalRemainingLeaves,
    this.userTotalLeave,
    this.useLeave,
    this.useLeavePaid,
    this.useLeaveUnpaid,
    this.availablePaidLeave,
    this.remainingLeave,
    this.startDate,
    this.endDate,
  });

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
    leaveTypeName: json['leave_type_name'],
    applicableUnpaidLeave: json['applicable_unpaid_leave'],
    remainingPastMonthsLeave: json['remaining_past_months_leave'],
    currentMonthLeave: json['current_month_leave'],
    leaveApplyType: json['leave_apply_type'],
    applyLeaveWithActualDecimalLeaveBalance: json['apply_leave_with_actual_decimal_leave_balance'],
    quarterLeaveApplyType: json['quarter_leave_apply_type'],
    carryForwardLeave: json['carry_forward_leave'],
    payoutLeave: json['payout_leave'],
    totalRemainingLeaves: json['total_remaining_leaves'],
    userTotalLeave: json['user_total_leave'],
    useLeave: json['use_leave'],
    useLeavePaid: json['use_leave_paid'],
    useLeaveUnpaid: json['use_leave_unpaid'],
    availablePaidLeave: json['available_paid_leave'],
    remainingLeave: json['remaining_leave'],
    startDate: json['start_date'],
    endDate: json['end_date'],
  );

  Map<String, dynamic> toJson() => {
    'leave_type_name': leaveTypeName,
    'applicable_unpaid_leave': applicableUnpaidLeave,
    'remaining_past_months_leave': remainingPastMonthsLeave,
    'current_month_leave': currentMonthLeave,
    'leave_apply_type': leaveApplyType,
    'apply_leave_with_actual_decimal_leave_balance': applyLeaveWithActualDecimalLeaveBalance,
    'quarter_leave_apply_type': quarterLeaveApplyType,
    'carry_forward_leave': carryForwardLeave,
    'payout_leave': payoutLeave,
    'total_remaining_leaves': totalRemainingLeaves,
    'user_total_leave': userTotalLeave,
    'use_leave': useLeave,
    'use_leave_paid': useLeavePaid,
    'use_leave_unpaid': useLeaveUnpaid,
    'available_paid_leave': availablePaidLeave,
    'remaining_leave': remainingLeave,
    'start_date': startDate,
    'end_date': endDate,
  };
}

class LeaveReason {
  String? reasonName;

  LeaveReason({
    this.reasonName,
  });

  factory LeaveReason.fromJson(Map<String, dynamic> json) => LeaveReason(
    reasonName: json['reason_name'],
  );

  Map<String, dynamic> toJson() => {
    'reason_name': reasonName,
  };
}