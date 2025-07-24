import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/leave/domain/entities/leave_history_response_entity.dart';

part 'leave_history_response_model.g.dart';

LeaveHistoryResponseModel leaveHistoryResponseModelFromJson(String str) =>
    LeaveHistoryResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class LeaveHistoryResponseModel {
  @JsonKey(name: 'total_leaves')
  final String? totalLeaves;

  @JsonKey(name: 'total_used_leaves')
  final String? totalUsedLeaves;

  @JsonKey(name: 'total_remaining_leaves')
  final String? totalRemainingLeaves;

  @JsonKey(name: 'hide_late_in_early_out')
  final bool? hideLateInEarlyOut;

  @JsonKey(name: 'leave_types')
  final List<LeaveTypeModel>? leaveTypes;

  @JsonKey(name: 'leave_history')
  final List<LeaveHistoryModel>? leaveHistory;

  @JsonKey(name: 'all_leaves')
  final List<LeaveHistoryModel>? allLeaves;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'total_approved_leaves')
  final String? totalApprovedLeaves;

  @JsonKey(name: 'total_rejected_leaves')
  final String? totalRejectedLeaves;

  @JsonKey(name: 'total_pending_leaves')
  final String? totalPendingLeaves;

  @JsonKey(name: 'total_auto')
  final String? totalAuto;

  @JsonKey(name: 'previously_used_paid_leave')
  final String? previouslyUsedPaidLeave;

  @JsonKey(name: 'team_leave')
  final bool? teamLeave;

  @JsonKey(name: 'modification_access')
  final bool? modificationAccess;

  LeaveHistoryResponseModel({
    this.totalLeaves,
    this.totalUsedLeaves,
    this.totalRemainingLeaves,
    this.hideLateInEarlyOut,
    this.leaveTypes,
    this.leaveHistory,
    this.allLeaves,
    this.message,
    this.status,
    this.totalApprovedLeaves,
    this.totalRejectedLeaves,
    this.totalPendingLeaves,
    this.totalAuto,
    this.previouslyUsedPaidLeave,
    this.teamLeave,
    this.modificationAccess,
  });

  factory LeaveHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveHistoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveHistoryResponseModelToJson(this);

  LeaveHistoryResponseEntity toEntity() => LeaveHistoryResponseEntity(
    totalLeaves: totalLeaves,
    totalUsedLeaves: totalUsedLeaves,
    totalRemainingLeaves: totalRemainingLeaves,
    hideLateInEarlyOut: hideLateInEarlyOut,
    leaveTypes: leaveTypes?.map((model) => model.toEntity()).toList(),
    leaveHistory: leaveHistory?.map((model) => model.toEntity()).toList(),
    allLeaves: allLeaves?.map((model) => model.toEntity()).toList(),
    message: message,
    status: status,
    totalApprovedLeaves: totalApprovedLeaves,
    totalRejectedLeaves: totalRejectedLeaves,
    totalPendingLeaves: totalPendingLeaves,
    totalAuto: totalAuto,
    previouslyUsedPaidLeave: previouslyUsedPaidLeave,
    teamLeave: teamLeave,
    modificationAccess: modificationAccess,
  );
}

@JsonSerializable()
class LeaveHistoryModel {
  @JsonKey(name: 'sandwich_leave')
  final bool? sandwichLeave;

  @JsonKey(name: 'sandwich_leave_id')
  final String? sandwichLeaveId;

  @JsonKey(name: 'is_special_leave')
  final String? isSpecialLeave;

  @JsonKey(name: 'late_in')
  final String? lateIn;

  @JsonKey(name: 'early_out')
  final String? earlyOut;

  @JsonKey(name: 'leave_created_date')
  final String? leaveCreatedDate;

  @JsonKey(name: 'leave_approved_date')
  final String? leaveApprovedDate;

  @JsonKey(name: 'previous_leave_id')
  final String? previousLeaveId;

  @JsonKey(name: 'next_leave_date')
  final String? nextLeaveDate;

  @JsonKey(name: 'prev_leave_date')
  final String? prevLeaveDate;

  @JsonKey(name: 'sandwich_leave_date')
  final String? sandwichLeaveDate;

  @JsonKey(name: 'sandwich_leave_date_view')
  final String? sandwichLeaveDateView;

  @JsonKey(name: 'short_leave_time')
  final String? shortLeaveTime;

  @JsonKey(name: 'short_leave_available')
  final bool? shortLeaveAvailable;

  @JsonKey(name: 'total_working_hours')
  final String? totalWorkingHours;

  @JsonKey(name: 'total_shift_hours')
  final String? totalShiftHours;

  @JsonKey(name: 'productive_working_hours')
  final String? productiveWorkingHours;

  @JsonKey(name: 'leave_requested_date')
  final String? leaveRequestedDate;

  @JsonKey(name: 'is_extra_day')
  final String? isExtraDay;

  @JsonKey(name: 'attendance_id')
  final String? attendanceId;

  @JsonKey(name: 'attendance_date_start')
  final String? attendanceDateStart;

  @JsonKey(name: 'attendance_date_end')
  final String? attendanceDateEnd;

  @JsonKey(name: 'punch_in_time')
  final String? punchInTime;

  @JsonKey(name: 'punch_out_time')
  final String? punchOutTime;

  @JsonKey(name: 'leave_id')
  final String? leaveId;

  @JsonKey(name: 'society_id')
  final String? societyId;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'unit_id')
  final String? unitId;

  @JsonKey(name: 'floor_id')
  final String? floorId;

  @JsonKey(name: 'user_full_name')
  final String? userFullName;

  @JsonKey(name: 'floor_name')
  final String? floorName;

  @JsonKey(name: 'block_name')
  final String? blockName;

  @JsonKey(name: 'year')
  final String? year;

  @JsonKey(name: 'year_new')
  final String? yearNew;

  @JsonKey(name: 'month')
  final String? month;

  @JsonKey(name: 'leave_type_name')
  final String? leaveTypeName;

  @JsonKey(name: 'user_designation')
  final String? userDesignation;

  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;

  @JsonKey(name: 'short_name')
  final String? shortName;

  @JsonKey(name: 'leave_reason')
  final String? leaveReason;

  @JsonKey(name: 'leave_alternate_number')
  final String? leaveAlternateNumber;

  @JsonKey(name: 'leave_attachment')
  final String? leaveAttachment;

  @JsonKey(name: 'leave_task_dependency')
  final bool? leaveTaskDependency;

  @JsonKey(name: 'leave_handle_dependency')
  final String? leaveHandleDependency;

  @JsonKey(name: 'leave_status')
  final String? leaveStatus;

  @JsonKey(name: 'half_day_session')
  final String? halfDaySession;

  @JsonKey(name: 'leave_day_type')
  final String? leaveDayType;

  @JsonKey(name: 'leave_day_type_status')
  final String? leaveDayTypeStatus;

  @JsonKey(name: 'leave_status_view')
  final String? leaveStatusView;

  @JsonKey(name: 'leave_day_view')
  final String? leaveDayView;

  @JsonKey(name: 'leave_date')
  final String? leaveDate;

  @JsonKey(name: 'leave_type_id')
  final String? leaveTypeId;

  @JsonKey(name: 'leave_date_view')
  final String? leaveDateView;

  @JsonKey(name: 'leave_admin_reason')
  final String? leaveAdminReason;

  @JsonKey(name: 'paid_unpaid')
  final String? paidUnpaid;

  @JsonKey(name: 'approved_by_name')
  final String? approvedByName;

  @JsonKey(name: 'rejected_by_name')
  final String? rejectedByName;

  @JsonKey(name: 'paid_unpaid_status')
  final String? paidUnpaidStatus;

  @JsonKey(name: 'user_total_leave')
  final String? userTotalLeave;

  @JsonKey(name: 'user_total_used_leave')
  final String? userTotalUsedLeave;

  @JsonKey(name: 'remaining_leave')
  final String? remainingLeave;

  @JsonKey(name: 'auto_leave_reason')
  final String? autoLeaveReason;

  @JsonKey(name: 'leave_percentage')
  final String? leavePercentage;

  @JsonKey(name: 'auto_leave')
  final bool? autoLeave;

  @JsonKey(name: 'is_date_gone')
  final bool? isDateGone;

  @JsonKey(name: 'is_salary_generated')
  final bool? isSalaryGenerated;

  @JsonKey(name: 'is_multi_level_approval')
  final bool? isMultiLevelApproval;

  @JsonKey(name: 'approval_users')
  final List<ApprovalUserModel>? approvalUsers;

  @JsonKey(name: 'is_my_approval')
  final bool? isMyApproval;

  @JsonKey(name: 'multi_approved_by_me')
  final bool? multiApprovedByMe;

  @JsonKey(name: 'expanded')
  final bool? expanded;

  @JsonKey(name: 'short_leave_id')
  final String? shortLeaveId;

  @JsonKey(name: 'short_leave')
  final bool? shortLeave;

  @JsonKey(name: 'short_leave_status')
  final String? shortLeaveStatus;

  @JsonKey(name: 'short_leave_date')
  final String? shortLeaveDate;

  @JsonKey(name: 'short_leave_apply_reason')
  final String? shortLeaveApplyReason;

  @JsonKey(name: 'short_leave_date_view')
  final String? shortLeaveDateView;

  @JsonKey(name: 'short_leave_status_view')
  final String? shortLeaveStatusView;

  @JsonKey(name: 'short_leave_status_change_name')
  final String? shortLeaveStatusChangeName;

  @JsonKey(name: 'short_leave_status_change_reason')
  final String? shortLeaveStatusChangeReason;

  @JsonKey(name: 'short_leave_status_change_date')
  final String? shortLeaveStatusChangeDate;

  @JsonKey(name: 'converted_from_auto_leave')
  final String? convertedFromAutoLeave;

  LeaveHistoryModel({
    this.sandwichLeave,
    this.sandwichLeaveId,
    this.isSpecialLeave,
    this.lateIn,
    this.earlyOut,
    this.leaveCreatedDate,
    this.leaveApprovedDate,
    this.previousLeaveId,
    this.nextLeaveDate,
    this.prevLeaveDate,
    this.sandwichLeaveDate,
    this.sandwichLeaveDateView,
    this.shortLeaveTime,
    this.shortLeaveAvailable,
    this.totalWorkingHours,
    this.totalShiftHours,
    this.productiveWorkingHours,
    this.leaveRequestedDate,
    this.isExtraDay,
    this.attendanceId,
    this.attendanceDateStart,
    this.attendanceDateEnd,
    this.punchInTime,
    this.punchOutTime,
    this.leaveId,
    this.societyId,
    this.userId,
    this.unitId,
    this.floorId,
    this.userFullName,
    this.floorName,
    this.blockName,
    this.year,
    this.yearNew,
    this.month,
    this.leaveTypeName,
    this.userDesignation,
    this.userProfilePic,
    this.shortName,
    this.leaveReason,
    this.leaveAlternateNumber,
    this.leaveAttachment,
    this.leaveTaskDependency,
    this.leaveHandleDependency,
    this.leaveStatus,
    this.halfDaySession,
    this.leaveDayType,
    this.leaveDayTypeStatus,
    this.leaveStatusView,
    this.leaveDayView,
    this.leaveDate,
    this.leaveTypeId,
    this.leaveDateView,
    this.leaveAdminReason,
    this.paidUnpaid,
    this.approvedByName,
    this.rejectedByName,
    this.paidUnpaidStatus,
    this.userTotalLeave,
    this.userTotalUsedLeave,
    this.remainingLeave,
    this.autoLeaveReason,
    this.leavePercentage,
    this.autoLeave,
    this.isDateGone,
    this.isSalaryGenerated,
    this.isMultiLevelApproval,
    this.approvalUsers,
    this.isMyApproval,
    this.multiApprovedByMe,
    this.expanded,
    this.shortLeaveId,
    this.shortLeave,
    this.shortLeaveStatus,
    this.shortLeaveDate,
    this.shortLeaveApplyReason,
    this.shortLeaveDateView,
    this.shortLeaveStatusView,
    this.shortLeaveStatusChangeName,
    this.shortLeaveStatusChangeReason,
    this.shortLeaveStatusChangeDate,
    this.convertedFromAutoLeave,
  });

  factory LeaveHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveHistoryModelToJson(this);

  LeaveHistoryEntity toEntity() => LeaveHistoryEntity(
    sandwichLeave: sandwichLeave,
    sandwichLeaveId: sandwichLeaveId,
    isSpecialLeave: isSpecialLeave,
    lateIn: lateIn,
    earlyOut: earlyOut,
    leaveCreatedDate: leaveCreatedDate,
    leaveApprovedDate: leaveApprovedDate,
    previousLeaveId: previousLeaveId,
    nextLeaveDate: nextLeaveDate,
    prevLeaveDate: prevLeaveDate,
    sandwichLeaveDate: sandwichLeaveDate,
    sandwichLeaveDateView: sandwichLeaveDateView,
    shortLeaveTime: shortLeaveTime,
    shortLeaveAvailable: shortLeaveAvailable,
    totalWorkingHours: totalWorkingHours,
    totalShiftHours: totalShiftHours,
    productiveWorkingHours: productiveWorkingHours,
    leaveRequestedDate: leaveRequestedDate,
    isExtraDay: isExtraDay,
    attendanceId: attendanceId,
    attendanceDateStart: attendanceDateStart,
    attendanceDateEnd: attendanceDateEnd,
    punchInTime: punchInTime,
    punchOutTime: punchOutTime,
    leaveId: leaveId,
    societyId: societyId,
    userId: userId,
    unitId: unitId,
    floorId: floorId,
    userFullName: userFullName,
    floorName: floorName,
    blockName: blockName,
    year: year,
    yearNew: yearNew,
    month: month,
    leaveTypeName: leaveTypeName,
    userDesignation: userDesignation,
    userProfilePic: userProfilePic,
    shortName: shortName,
    leaveReason: leaveReason,
    leaveAlternateNumber: leaveAlternateNumber,
    leaveAttachment: leaveAttachment,
    leaveTaskDependency: leaveTaskDependency,
    leaveHandleDependency: leaveHandleDependency,
    leaveStatus: leaveStatus,
    halfDaySession: halfDaySession,
    leaveDayType: leaveDayType,
    leaveDayTypeStatus: leaveDayTypeStatus,
    leaveStatusView: leaveStatusView,
    leaveDayView: leaveDayView,
    leaveDate: leaveDate,
    leaveTypeId: leaveTypeId,
    leaveDateView: leaveDateView,
    leaveAdminReason: leaveAdminReason,
    paidUnpaid: paidUnpaid,
    approvedByName: approvedByName,
    rejectedByName: rejectedByName,
    paidUnpaidStatus: paidUnpaidStatus,
    userTotalLeave: userTotalLeave,
    userTotalUsedLeave: userTotalUsedLeave,
    remainingLeave: remainingLeave,
    autoLeaveReason: autoLeaveReason,
    leavePercentage: leavePercentage,
    autoLeave: autoLeave,
    isDateGone: isDateGone,
    isSalaryGenerated: isSalaryGenerated,
    isMultiLevelApproval: isMultiLevelApproval,
    approvalUsers: approvalUsers?.map((model) => model.toEntity()).toList(),
    isMyApproval: isMyApproval,
    multiApprovedByMe: multiApprovedByMe,
    expanded: expanded,
    shortLeaveId: shortLeaveId,
    shortLeave: shortLeave,
    shortLeaveStatus: shortLeaveStatus,
    shortLeaveDate: shortLeaveDate,
    shortLeaveApplyReason: shortLeaveApplyReason,
    shortLeaveDateView: shortLeaveDateView,
    shortLeaveStatusView: shortLeaveStatusView,
    shortLeaveStatusChangeName: shortLeaveStatusChangeName,
    shortLeaveStatusChangeReason: shortLeaveStatusChangeReason,
    shortLeaveStatusChangeDate: shortLeaveStatusChangeDate,
    convertedFromAutoLeave: convertedFromAutoLeave,
  );
}

@JsonSerializable()
class LeaveTypeModel {
  @JsonKey(name: 'leave_type_id')
  final String? leaveTypeId;

  @JsonKey(name: 'leave_type_name')
  final String? leaveTypeName;

  @JsonKey(name: 'view_leave_count')
  final String? viewLeaveCount;

  @JsonKey(name: 'is_special_leave')
  final String? specialLeave;

  @JsonKey(name: 'applicable_leaves_in_month')
  final String? applicableLeavesInMonth;

  @JsonKey(name: 'user_monthly_leave_balance_data')
  final Map<String, String>? userMonthlyLeaveBalanceData;

  @JsonKey(name: 'leave_calculation')
  final String? leaveCalculation;

  @JsonKey(name: 'apply_leave_start_date')
  final String? applyLeaveStartDate;

  @JsonKey(name: 'assign_leave_frequency')
  final String? assignLeaveFrequency;

  @JsonKey(name: 'leaves_according_to_payroll_cycle')
  final String? leavesAccordingToPayrollCycle;

  @JsonKey(name: 'take_leave_during_notice_period')
  final String? takeLeaveDuringNoticePeriod;

  @JsonKey(name: 'max_leave_during_notice_period')
  final String? maxLeaveDuringNoticePeriod;

  @JsonKey(name: 'take_leave_during_probation_period')
  final String? takeLeaveDuringProbationPeriod;

  @JsonKey(name: 'max_leave_per_month_during_probation_period')
  final String? maxLeavePerMonthDuringProbationPeriod;

  @JsonKey(name: 'leave_restrictions')
  final bool? leaveRestrictions;

  @JsonKey(name: 'leave_restrictions_rules')
  final List<LeaveRestrictionRulesModel>? leaveRestrictionsRules;

  @JsonKey(name: 'user_total_used_leave')
  final String? userTotalUsedLeave;

  @JsonKey(name: 'user_total_leave')
  final String? userTotalLeave;

  @JsonKey(name: 'remaining_leave')
  final String? remainingLeave;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  @JsonKey(name: 'leave_allocation_type')
  final String? leaveAllocationType;

  @JsonKey(name: 'current_month_leave')
  final String? currentMonthLeave;

  @JsonKey(name: 'remaining_past_months_leave')
  final String? remainingPastMonthsLeave;

  @JsonKey(name: 'totalPayout')
  final String? totalPayout;

  @JsonKey(name: 'totalCarryForward')
  final String? totalCarryForward;

  @JsonKey(name: 'leave_expire_after_days')
  final String? leaveExpireAfterDays;

  @JsonKey(name: 'leave_credit_last_date')
  final String? leaveCreditLastDate;

  @JsonKey(name: 'carry_forward_includes')
  final String? carryForwardIncludes;

  @JsonKey(name: 'previous_year_carry_forward_leave')
  final String? previousYearCarryForwardLeave;

  @JsonKey(name: 'previously_used_paid_leave')
  final String? previouslyUsedPaidLeave;

  @JsonKey(name: 'previously_used_unpaid_leave')
  final String? previouslyUsedUnpaidLeave;

  @JsonKey(name: 'leave_encashment_option')
  final String? leaveEncashmentOption;

  @JsonKey(name: 'encashmentAllowed')
  final String? encashmentAllowed;

  @JsonKey(name: 'encasement_summary')
  final EncasementSummaryModel? encasementSummary;

  LeaveTypeModel({
    this.leaveTypeId,
    this.leaveTypeName,
    this.viewLeaveCount,
    this.specialLeave,
    this.applicableLeavesInMonth,
    this.userMonthlyLeaveBalanceData,
    this.leaveCalculation,
    this.applyLeaveStartDate,
    this.assignLeaveFrequency,
    this.leavesAccordingToPayrollCycle,
    this.takeLeaveDuringNoticePeriod,
    this.maxLeaveDuringNoticePeriod,
    this.takeLeaveDuringProbationPeriod,
    this.maxLeavePerMonthDuringProbationPeriod,
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
    this.leaveExpireAfterDays,
    this.leaveCreditLastDate,
    this.carryForwardIncludes,
    this.previousYearCarryForwardLeave,
    this.previouslyUsedPaidLeave,
    this.previouslyUsedUnpaidLeave,
    this.leaveEncashmentOption,
    this.encashmentAllowed,
    this.encasementSummary,
  });

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeModelToJson(this);

  LeaveTypeEntity toEntity() => LeaveTypeEntity(
    leaveTypeId: leaveTypeId,
    leaveTypeName: leaveTypeName,
    viewLeaveCount: viewLeaveCount,
    specialLeave: specialLeave,
    applicableLeavesInMonth: applicableLeavesInMonth,
    userMonthlyLeaveBalanceData: userMonthlyLeaveBalanceData,
    leaveCalculation: leaveCalculation,
    applyLeaveStartDate: applyLeaveStartDate,
    assignLeaveFrequency: assignLeaveFrequency,
    leavesAccordingToPayrollCycle: leavesAccordingToPayrollCycle,
    takeLeaveDuringNoticePeriod: takeLeaveDuringNoticePeriod,
    maxLeaveDuringNoticePeriod: maxLeaveDuringNoticePeriod,
    takeLeaveDuringProbationPeriod: takeLeaveDuringProbationPeriod,
    maxLeavePerMonthDuringProbationPeriod:
        maxLeavePerMonthDuringProbationPeriod,
    leaveRestrictions: leaveRestrictions,
    leaveRestrictionsRules: leaveRestrictionsRules
        ?.map((model) => model.toEntity())
        .toList(),
    userTotalUsedLeave: userTotalUsedLeave,
    userTotalLeave: userTotalLeave,
    remainingLeave: remainingLeave,
    startDate: startDate,
    endDate: endDate,
    leaveAllocationType: leaveAllocationType,
    currentMonthLeave: currentMonthLeave,
    remainingPastMonthsLeave: remainingPastMonthsLeave,
    totalPayout: totalPayout,
    totalCarryForward: totalCarryForward,
    leaveExpireAfterDays: leaveExpireAfterDays,
    leaveCreditLastDate: leaveCreditLastDate,
    carryForwardIncludes: carryForwardIncludes,
    previousYearCarryForwardLeave: previousYearCarryForwardLeave,
    previouslyUsedPaidLeave: previouslyUsedPaidLeave,
    previouslyUsedUnpaidLeave: previouslyUsedUnpaidLeave,
    leaveEncashmentOption: leaveEncashmentOption,
    encashmentAllowed: encashmentAllowed,
    encasementSummary: encasementSummary?.toEntity(),
  );
}

@JsonSerializable()
class ApprovalUserModel {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'designation')
  final String? designation;

  @JsonKey(name: 'branch')
  final String? branch;

  @JsonKey(name: 'department')
  final String? department;

  @JsonKey(name: 'profile')
  final String? profile;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'date')
  final String? date;

  ApprovalUserModel({
    this.id,
    this.name,
    this.designation,
    this.branch,
    this.department,
    this.profile,
    this.status,
    this.date,
  });

  factory ApprovalUserModel.fromJson(Map<String, dynamic> json) =>
      _$ApprovalUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalUserModelToJson(this);

  ApprovalUserEntity toEntity() => ApprovalUserEntity(
    id: id,
    name: name,
    designation: designation,
    branch: branch,
    department: department,
    profile: profile,
    status: status,
    date: date,
  );
}

@JsonSerializable()
class LeaveRestrictionRulesModel {
  @JsonKey(name: 'leave')
  final String? leave;

  @JsonKey(name: 'apply_before')
  final String? applyBefore;

  LeaveRestrictionRulesModel({this.leave, this.applyBefore});

  factory LeaveRestrictionRulesModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveRestrictionRulesModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveRestrictionRulesModelToJson(this);

  LeaveRestrictionRulesEntity toEntity() =>
      LeaveRestrictionRulesEntity(leave: leave, applyBefore: applyBefore);
}

@JsonSerializable()
class EncasementSummaryModel {
  @JsonKey(name: 'total_paid')
  final String? totalPaid;

  @JsonKey(name: 'total_encashment')
  final String? totalEncashment;

  @JsonKey(name: 'total_unpaid')
  final String? totalUnpaid;

  EncasementSummaryModel({
    this.totalPaid,
    this.totalEncashment,
    this.totalUnpaid,
  });

  factory EncasementSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$EncasementSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$EncasementSummaryModelToJson(this);

  EncasementSummaryEntity toEntity() => EncasementSummaryEntity(
    totalPaid: totalPaid,
    totalEncashment: totalEncashment,
    totalUnpaid: totalUnpaid,
  );
}
