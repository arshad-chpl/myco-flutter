import 'dart:convert';

GetNewListTypeResponse getNewListTypeResponseFromJson(String str) => GetNewListTypeResponse.fromJson(json.decode(str));

String getNewListTypeResponseToJson(GetNewListTypeResponse data) => json.encode(data.toJson());

class GetNewListTypeResponse {
  List<LeaveType>? leaveTypes;
  String? totalLeaves;
  String? totalUsedLeaves;
  String? totalRemainingLeaves;
  String? message;
  String? status;

  GetNewListTypeResponse({
    this.leaveTypes,
    this.totalLeaves,
    this.totalUsedLeaves,
    this.totalRemainingLeaves,
    this.message,
    this.status,
  });

  factory GetNewListTypeResponse.fromJson(Map<String, dynamic> json) => GetNewListTypeResponse(
    leaveTypes: json["leave_types"] == null ? [] : List<LeaveType>.from(json["leave_types"]!.map((x) => LeaveType.fromJson(x))),
    totalLeaves: json["total_leaves"],
    totalUsedLeaves: json["total_used_leaves"],
    totalRemainingLeaves: json["total_remaining_leaves"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "leave_types": leaveTypes == null ? [] : List<dynamic>.from(leaveTypes!.map((x) => x.toJson())),
    "total_leaves": totalLeaves,
    "total_used_leaves": totalUsedLeaves,
    "total_remaining_leaves": totalRemainingLeaves,
    "message": message,
    "status": status,
  };
}

class LeaveType {
  String? leaveTypeId;
  String? leaveTypeName;
  String? viewLeaveCount;
  String? isSpecialLeave;
  String? applicableLeavesInMonth;
  UserMonthlyLeaveBalanceData? userMonthlyLeaveBalanceData;
  String? leaveCalculation;
  DateTime? applyLeaveStartDate;
  String? carryForwardIncludes;
  String? previousYearCarryForwardLeave;
  String? previouslyUsedPaidLeave;
  String? previouslyUsedUnpaidLeave;
  String? assignLeaveFrequency;
  String? leavesAccordingToPayrollCycle;
  String? takeLeaveDuringNoticePeriod;
  String? maxLeaveDuringNoticePeriod;
  String? takeLeaveDuringProbationPeriod;
  String? maxLeavePerMonthDuringProbationPeriod;
  String? leaveExpireAfterDays;
  bool? leaveRestrictions;
  List<LeaveRestrictionsRule>? leaveRestrictionsRules;
  String? userTotalUsedLeave;
  String? userTotalLeave;
  String? remainingLeave;
  DateTime? startDate;
  DateTime? endDate;
  String? leaveAllocationType;
  String? currentMonthLeave;
  String? remainingPastMonthsLeave;
  String? totalPayout;
  String? totalCarryForward;
  String? allowUnpaidLeaves;
  String? negativeLeaveBalanceManage;
  String? negativeLeaveBalanceValue;
  String? leaveEncashmentOption;
  List<dynamic>? leaveEncashment;
  String? encashmentAllowed;
  EncasementSummary? encasementSummary;
  String? leaveCreditLastDate;
  String? maxLEaveDuringNoticePeriod;

  LeaveType({
    this.leaveTypeId,
    this.leaveTypeName,
    this.viewLeaveCount,
    this.isSpecialLeave,
    this.applicableLeavesInMonth,
    this.userMonthlyLeaveBalanceData,
    this.leaveCalculation,
    this.applyLeaveStartDate,
    this.carryForwardIncludes,
    this.previousYearCarryForwardLeave,
    this.previouslyUsedPaidLeave,
    this.previouslyUsedUnpaidLeave,
    this.assignLeaveFrequency,
    this.leavesAccordingToPayrollCycle,
    this.takeLeaveDuringNoticePeriod,
    this.maxLeaveDuringNoticePeriod,
    this.takeLeaveDuringProbationPeriod,
    this.maxLeavePerMonthDuringProbationPeriod,
    this.leaveExpireAfterDays,
    this.leaveRestrictions,
    this.leaveRestrictionsRules,
    this.userTotalUsedLeave,
    this.userTotalLeave,
    this.remainingLeave,
    this.startDate,
    this.endDate,
    this.leaveAllocationType,
    this.currentMonthLeave,
    this.remainingPastMonthsLeave,
    this.totalPayout,
    this.totalCarryForward,
    this.allowUnpaidLeaves,
    this.negativeLeaveBalanceManage,
    this.negativeLeaveBalanceValue,
    this.leaveEncashmentOption,
    this.leaveEncashment,
    this.encashmentAllowed,
    this.encasementSummary,
    this.leaveCreditLastDate,
    this.maxLEaveDuringNoticePeriod,
  });

  factory LeaveType.fromJson(Map<String, dynamic> json) => LeaveType(
    leaveTypeId: json["leave_type_id"],
    leaveTypeName: json["leave_type_name"],
    viewLeaveCount: json["view_leave_count"],
    isSpecialLeave: json["is_special_leave"],
    applicableLeavesInMonth: json["applicable_leaves_in_month"],
    userMonthlyLeaveBalanceData: json["user_monthly_leave_balance_data"] == null ? null : UserMonthlyLeaveBalanceData.fromJson(json["user_monthly_leave_balance_data"]),
    leaveCalculation: json["leave_calculation"],
    applyLeaveStartDate: json["apply_leave_start_date"] == null ? null : DateTime.parse(json["apply_leave_start_date"]),
    carryForwardIncludes: json["carry_forward_includes"],
    previousYearCarryForwardLeave: json["previous_year_carry_forward_leave"],
    previouslyUsedPaidLeave: json["previously_used_paid_leave"],
    previouslyUsedUnpaidLeave: json["previously_used_unpaid_leave"],
    assignLeaveFrequency: json["assign_leave_frequency"],
    leavesAccordingToPayrollCycle: json["leaves_according_to_payroll_cycle"],
    takeLeaveDuringNoticePeriod: json["take_leave_during_notice_period"],
    maxLeaveDuringNoticePeriod: json["max_leave_during_notice_period"],
    takeLeaveDuringProbationPeriod: json["take_leave_during_probation_period"],
    maxLeavePerMonthDuringProbationPeriod: json["max_leave_per_month_during_probation_period"],
    leaveExpireAfterDays: json["leave_expire_after_days"],
    leaveRestrictions: json["leave_restrictions"],
    leaveRestrictionsRules: json["leave_restrictions_rules"] == null ? [] : List<LeaveRestrictionsRule>.from(json["leave_restrictions_rules"]!.map((x) => LeaveRestrictionsRule.fromJson(x))),
    userTotalUsedLeave: json["user_total_used_leave"],
    userTotalLeave: json["user_total_leave"],
    remainingLeave: json["remaining_leave"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    leaveAllocationType: json["leave_allocation_type"],
    currentMonthLeave: json["current_month_leave"],
    remainingPastMonthsLeave: json["remaining_past_months_leave"],
    totalPayout: json["totalPayout"],
    totalCarryForward: json["totalCarryForward"],
    allowUnpaidLeaves: json["allow_unpaid_leaves"],
    negativeLeaveBalanceManage: json["negative_leave_balance_manage"],
    negativeLeaveBalanceValue: json["negative_leave_balance_value"],
    leaveEncashmentOption: json["leave_encashment_option"],
    leaveEncashment: json["leave_encashment"] == null ? [] : List<dynamic>.from(json["leave_encashment"]!.map((x) => x)),
    encashmentAllowed: json["encashmentAllowed"],
    encasementSummary: json["encasement_summary"] == null ? null : EncasementSummary.fromJson(json["encasement_summary"]),
    leaveCreditLastDate: json["leave_credit_last_date"],
    maxLEaveDuringNoticePeriod: json["max_l eave_during_notice_period"],
  );

  Map<String, dynamic> toJson() => {
    "leave_type_id": leaveTypeId,
    "leave_type_name": leaveTypeName,
    "view_leave_count": viewLeaveCount,
    "is_special_leave": isSpecialLeave,
    "applicable_leaves_in_month": applicableLeavesInMonth,
    "user_monthly_leave_balance_data": userMonthlyLeaveBalanceData?.toJson(),
    "leave_calculation": leaveCalculation,
    "apply_leave_start_date": "${applyLeaveStartDate!.year.toString().padLeft(4, '0')}-${applyLeaveStartDate!.month.toString().padLeft(2, '0')}-${applyLeaveStartDate!.day.toString().padLeft(2, '0')}",
    "carry_forward_includes": carryForwardIncludes,
    "previous_year_carry_forward_leave": previousYearCarryForwardLeave,
    "previously_used_paid_leave": previouslyUsedPaidLeave,
    "previously_used_unpaid_leave": previouslyUsedUnpaidLeave,
    "assign_leave_frequency": assignLeaveFrequency,
    "leaves_according_to_payroll_cycle": leavesAccordingToPayrollCycle,
    "take_leave_during_notice_period": takeLeaveDuringNoticePeriod,
    "max_leave_during_notice_period": maxLeaveDuringNoticePeriod,
    "take_leave_during_probation_period": takeLeaveDuringProbationPeriod,
    "max_leave_per_month_during_probation_period": maxLeavePerMonthDuringProbationPeriod,
    "leave_expire_after_days": leaveExpireAfterDays,
    "leave_restrictions": leaveRestrictions,
    "leave_restrictions_rules": leaveRestrictionsRules == null ? [] : List<dynamic>.from(leaveRestrictionsRules!.map((x) => x.toJson())),
    "user_total_used_leave": userTotalUsedLeave,
    "user_total_leave": userTotalLeave,
    "remaining_leave": remainingLeave,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "leave_allocation_type": leaveAllocationType,
    "current_month_leave": currentMonthLeave,
    "remaining_past_months_leave": remainingPastMonthsLeave,
    "totalPayout": totalPayout,
    "totalCarryForward": totalCarryForward,
    "allow_unpaid_leaves": allowUnpaidLeaves,
    "negative_leave_balance_manage": negativeLeaveBalanceManage,
    "negative_leave_balance_value": negativeLeaveBalanceValue,
    "leave_encashment_option": leaveEncashmentOption,
    "leave_encashment": leaveEncashment == null ? [] : List<dynamic>.from(leaveEncashment!.map((x) => x)),
    "encashmentAllowed": encashmentAllowed,
    "encasement_summary": encasementSummary?.toJson(),
    "leave_credit_last_date": leaveCreditLastDate,
    "max_l eave_during_notice_period": maxLEaveDuringNoticePeriod,
  };
}

class EncasementSummary {
  String? totalPaid;
  String? totalEncashment;
  String? totalUnpaid;

  EncasementSummary({
    this.totalPaid,
    this.totalEncashment,
    this.totalUnpaid,
  });

  factory EncasementSummary.fromJson(Map<String, dynamic> json) => EncasementSummary(
    totalPaid: json["total_paid"],
    totalEncashment: json["total_encashment"],
    totalUnpaid: json["total_unpaid"],
  );

  Map<String, dynamic> toJson() => {
    "total_paid": totalPaid,
    "total_encashment": totalEncashment,
    "total_unpaid": totalUnpaid,
  };
}

class LeaveRestrictionsRule {
  String? leave;
  String? applyBefore;

  LeaveRestrictionsRule({
    this.leave,
    this.applyBefore,
  });

  factory LeaveRestrictionsRule.fromJson(Map<String, dynamic> json) => LeaveRestrictionsRule(
    leave: json["leave"],
    applyBefore: json["apply_before"],
  );

  Map<String, dynamic> toJson() => {
    "leave": leave,
    "apply_before": applyBefore,
  };
}

class UserMonthlyLeaveBalanceData {
  String? january;
  String? february;
  String? march;
  String? april;
  String? may;
  String? june;
  String? july;
  String? august;
  String? september;
  String? october;
  String? november;
  String? december;

  UserMonthlyLeaveBalanceData({
    this.january,
    this.february,
    this.march,
    this.april,
    this.may,
    this.june,
    this.july,
    this.august,
    this.september,
    this.october,
    this.november,
    this.december,
  });

  factory UserMonthlyLeaveBalanceData.fromJson(Map<String, dynamic> json) => UserMonthlyLeaveBalanceData(
    january: json["January"],
    february: json["February"],
    march: json["March"],
    april: json["April"],
    may: json["May"],
    june: json["June"],
    july: json["July"],
    august: json["August"],
    september: json["September"],
    october: json["October"],
    november: json["November"],
    december: json["December"],
  );

  Map<String, dynamic> toJson() => {
    "January": january,
    "February": february,
    "March": march,
    "April": april,
    "May": may,
    "June": june,
    "July": july,
    "August": august,
    "September": september,
    "October": october,
    "November": november,
    "December": december,
  };
}
