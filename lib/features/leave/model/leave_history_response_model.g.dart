// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveHistoryResponseModel _$LeaveHistoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    LeaveHistoryResponseModel(
      totalLeaves: json['total_leaves'] as String?,
      totalUsedLeaves: json['total_used_leaves'] as String?,
      totalRemainingLeaves: json['total_remaining_leaves'] as String?,
      hideLateInEarlyOut: json['hide_late_in_early_out'] as bool?,
      leaveTypes: (json['leave_types'] as List<dynamic>?)
          ?.map((e) => LeaveTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leaveHistory: (json['leave_history'] as List<dynamic>?)
          ?.map((e) => LeaveHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      allLeaves: (json['all_leaves'] as List<dynamic>?)
          ?.map((e) => LeaveHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
      totalApprovedLeaves: json['total_approved_leaves'] as String?,
      totalRejectedLeaves: json['total_rejected_leaves'] as String?,
      totalPendingLeaves: json['total_pending_leaves'] as String?,
      totalAuto: json['total_auto'] as String?,
      previouslyUsedPaidLeave: json['previously_used_paid_leave'] as String?,
      teamLeave: json['team_leave'] as bool?,
      modificationAccess: json['modification_access'] as bool?,
    );

Map<String, dynamic> _$LeaveHistoryResponseModelToJson(
        LeaveHistoryResponseModel instance) =>
    <String, dynamic>{
      'total_leaves': instance.totalLeaves,
      'total_used_leaves': instance.totalUsedLeaves,
      'total_remaining_leaves': instance.totalRemainingLeaves,
      'hide_late_in_early_out': instance.hideLateInEarlyOut,
      'leave_types': instance.leaveTypes,
      'leave_history': instance.leaveHistory,
      'all_leaves': instance.allLeaves,
      'message': instance.message,
      'status': instance.status,
      'total_approved_leaves': instance.totalApprovedLeaves,
      'total_rejected_leaves': instance.totalRejectedLeaves,
      'total_pending_leaves': instance.totalPendingLeaves,
      'total_auto': instance.totalAuto,
      'previously_used_paid_leave': instance.previouslyUsedPaidLeave,
      'team_leave': instance.teamLeave,
      'modification_access': instance.modificationAccess,
    };

LeaveHistoryModel _$LeaveHistoryModelFromJson(Map<String, dynamic> json) =>
    LeaveHistoryModel(
      sandwichLeave: json['sandwich_leave'] as bool?,
      sandwichLeaveId: json['sandwich_leave_id'] as String?,
      isSpecialLeave: json['is_special_leave'] as String?,
      lateIn: json['late_in'] as String?,
      earlyOut: json['early_out'] as String?,
      leaveCreatedDate: json['leave_created_date'] as String?,
      leaveApprovedDate: json['leave_approved_date'] as String?,
      previousLeaveId: json['previous_leave_id'] as String?,
      nextLeaveDate: json['next_leave_date'] as String?,
      prevLeaveDate: json['prev_leave_date'] as String?,
      sandwichLeaveDate: json['sandwich_leave_date'] as String?,
      sandwichLeaveDateView: json['sandwich_leave_date_view'] as String?,
      shortLeaveTime: json['short_leave_time'] as String?,
      shortLeaveAvailable: json['short_leave_available'] as bool?,
      totalWorkingHours: json['total_working_hours'] as String?,
      totalShiftHours: json['total_shift_hours'] as String?,
      productiveWorkingHours: json['productive_working_hours'] as String?,
      leaveRequestedDate: json['leave_requested_date'] as String?,
      isExtraDay: json['is_extra_day'] as String?,
      attendanceId: json['attendance_id'] as String?,
      attendanceDateStart: json['attendance_date_start'] as String?,
      attendanceDateEnd: json['attendance_date_end'] as String?,
      punchInTime: json['punch_in_time'] as String?,
      punchOutTime: json['punch_out_time'] as String?,
      leaveId: json['leave_id'] as String?,
      societyId: json['society_id'] as String?,
      userId: json['user_id'] as String?,
      unitId: json['unit_id'] as String?,
      floorId: json['floor_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      floorName: json['floor_name'] as String?,
      blockName: json['block_name'] as String?,
      year: json['year'] as String?,
      yearNew: json['year_new'] as String?,
      month: json['month'] as String?,
      leaveTypeName: json['leave_type_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      shortName: json['short_name'] as String?,
      leaveReason: json['leave_reason'] as String?,
      leaveAlternateNumber: json['leave_alternate_number'] as String?,
      leaveAttachment: json['leave_attachment'] as String?,
      leaveTaskDependency: json['leave_task_dependency'] as bool?,
      leaveHandleDependency: json['leave_handle_dependency'] as String?,
      leaveStatus: json['leave_status'] as String?,
      halfDaySession: json['half_day_session'] as String?,
      leaveDayType: json['leave_day_type'] as String?,
      leaveDayTypeStatus: json['leave_day_type_status'] as String?,
      leaveStatusView: json['leave_status_view'] as String?,
      leaveDayView: json['leave_day_view'] as String?,
      leaveDate: json['leave_date'] as String?,
      leaveTypeId: json['leave_type_id'] as String?,
      leaveDateView: json['leave_date_view'] as String?,
      leaveAdminReason: json['leave_admin_reason'] as String?,
      paidUnpaid: json['paid_unpaid'] as String?,
      approvedByName: json['approved_by_name'] as String?,
      rejectedByName: json['rejected_by_name'] as String?,
      paidUnpaidStatus: json['paid_unpaid_status'] as String?,
      userTotalLeave: json['user_total_leave'] as String?,
      userTotalUsedLeave: json['user_total_used_leave'] as String?,
      remainingLeave: json['remaining_leave'] as String?,
      autoLeaveReason: json['auto_leave_reason'] as String?,
      leavePercentage: json['leave_percentage'] as String?,
      autoLeave: json['auto_leave'] as bool?,
      isDateGone: json['is_date_gone'] as bool?,
      isSalaryGenerated: json['is_salary_generated'] as bool?,
      isMultiLevelApproval: json['is_multi_level_approval'] as bool?,
      approvalUsers: (json['approval_users'] as List<dynamic>?)
          ?.map((e) => ApprovalUserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isMyApproval: json['is_my_approval'] as bool?,
      multiApprovedByMe: json['multi_approved_by_me'] as bool?,
      expanded: json['expanded'] as bool?,
      shortLeaveId: json['short_leave_id'] as String?,
      shortLeave: json['short_leave'] as bool?,
      shortLeaveStatus: json['short_leave_status'] as String?,
      shortLeaveDate: json['short_leave_date'] as String?,
      shortLeaveApplyReason: json['short_leave_apply_reason'] as String?,
      shortLeaveDateView: json['short_leave_date_view'] as String?,
      shortLeaveStatusView: json['short_leave_status_view'] as String?,
      shortLeaveStatusChangeName:
          json['short_leave_status_change_name'] as String?,
      shortLeaveStatusChangeReason:
          json['short_leave_status_change_reason'] as String?,
      shortLeaveStatusChangeDate:
          json['short_leave_status_change_date'] as String?,
      convertedFromAutoLeave: json['converted_from_auto_leave'] as String?,
    );

Map<String, dynamic> _$LeaveHistoryModelToJson(LeaveHistoryModel instance) =>
    <String, dynamic>{
      'sandwich_leave': instance.sandwichLeave,
      'sandwich_leave_id': instance.sandwichLeaveId,
      'is_special_leave': instance.isSpecialLeave,
      'late_in': instance.lateIn,
      'early_out': instance.earlyOut,
      'leave_created_date': instance.leaveCreatedDate,
      'leave_approved_date': instance.leaveApprovedDate,
      'previous_leave_id': instance.previousLeaveId,
      'next_leave_date': instance.nextLeaveDate,
      'prev_leave_date': instance.prevLeaveDate,
      'sandwich_leave_date': instance.sandwichLeaveDate,
      'sandwich_leave_date_view': instance.sandwichLeaveDateView,
      'short_leave_time': instance.shortLeaveTime,
      'short_leave_available': instance.shortLeaveAvailable,
      'total_working_hours': instance.totalWorkingHours,
      'total_shift_hours': instance.totalShiftHours,
      'productive_working_hours': instance.productiveWorkingHours,
      'leave_requested_date': instance.leaveRequestedDate,
      'is_extra_day': instance.isExtraDay,
      'attendance_id': instance.attendanceId,
      'attendance_date_start': instance.attendanceDateStart,
      'attendance_date_end': instance.attendanceDateEnd,
      'punch_in_time': instance.punchInTime,
      'punch_out_time': instance.punchOutTime,
      'leave_id': instance.leaveId,
      'society_id': instance.societyId,
      'user_id': instance.userId,
      'unit_id': instance.unitId,
      'floor_id': instance.floorId,
      'user_full_name': instance.userFullName,
      'floor_name': instance.floorName,
      'block_name': instance.blockName,
      'year': instance.year,
      'year_new': instance.yearNew,
      'month': instance.month,
      'leave_type_name': instance.leaveTypeName,
      'user_designation': instance.userDesignation,
      'user_profile_pic': instance.userProfilePic,
      'short_name': instance.shortName,
      'leave_reason': instance.leaveReason,
      'leave_alternate_number': instance.leaveAlternateNumber,
      'leave_attachment': instance.leaveAttachment,
      'leave_task_dependency': instance.leaveTaskDependency,
      'leave_handle_dependency': instance.leaveHandleDependency,
      'leave_status': instance.leaveStatus,
      'half_day_session': instance.halfDaySession,
      'leave_day_type': instance.leaveDayType,
      'leave_day_type_status': instance.leaveDayTypeStatus,
      'leave_status_view': instance.leaveStatusView,
      'leave_day_view': instance.leaveDayView,
      'leave_date': instance.leaveDate,
      'leave_type_id': instance.leaveTypeId,
      'leave_date_view': instance.leaveDateView,
      'leave_admin_reason': instance.leaveAdminReason,
      'paid_unpaid': instance.paidUnpaid,
      'approved_by_name': instance.approvedByName,
      'rejected_by_name': instance.rejectedByName,
      'paid_unpaid_status': instance.paidUnpaidStatus,
      'user_total_leave': instance.userTotalLeave,
      'user_total_used_leave': instance.userTotalUsedLeave,
      'remaining_leave': instance.remainingLeave,
      'auto_leave_reason': instance.autoLeaveReason,
      'leave_percentage': instance.leavePercentage,
      'auto_leave': instance.autoLeave,
      'is_date_gone': instance.isDateGone,
      'is_salary_generated': instance.isSalaryGenerated,
      'is_multi_level_approval': instance.isMultiLevelApproval,
      'approval_users': instance.approvalUsers,
      'is_my_approval': instance.isMyApproval,
      'multi_approved_by_me': instance.multiApprovedByMe,
      'expanded': instance.expanded,
      'short_leave_id': instance.shortLeaveId,
      'short_leave': instance.shortLeave,
      'short_leave_status': instance.shortLeaveStatus,
      'short_leave_date': instance.shortLeaveDate,
      'short_leave_apply_reason': instance.shortLeaveApplyReason,
      'short_leave_date_view': instance.shortLeaveDateView,
      'short_leave_status_view': instance.shortLeaveStatusView,
      'short_leave_status_change_name': instance.shortLeaveStatusChangeName,
      'short_leave_status_change_reason': instance.shortLeaveStatusChangeReason,
      'short_leave_status_change_date': instance.shortLeaveStatusChangeDate,
      'converted_from_auto_leave': instance.convertedFromAutoLeave,
    };

LeaveTypeModel _$LeaveTypeModelFromJson(Map<String, dynamic> json) =>
    LeaveTypeModel(
      leaveTypeId: json['leave_type_id'] as String?,
      leaveTypeName: json['leave_type_name'] as String?,
      viewLeaveCount: json['view_leave_count'] as String?,
      specialLeave: json['is_special_leave'] as String?,
      applicableLeavesInMonth: json['applicable_leaves_in_month'] as String?,
      userMonthlyLeaveBalanceData:
          (json['user_monthly_leave_balance_data'] as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      leaveCalculation: json['leave_calculation'] as String?,
      applyLeaveStartDate: json['apply_leave_start_date'] as String?,
      assignLeaveFrequency: json['assign_leave_frequency'] as String?,
      leavesAccordingToPayrollCycle:
          json['leaves_according_to_payroll_cycle'] as String?,
      takeLeaveDuringNoticePeriod:
          json['take_leave_during_notice_period'] as String?,
      maxLeaveDuringNoticePeriod:
          json['max_leave_during_notice_period'] as String?,
      takeLeaveDuringProbationPeriod:
          json['take_leave_during_probation_period'] as String?,
      maxLeavePerMonthDuringProbationPeriod:
          json['max_leave_per_month_during_probation_period'] as String?,
      leaveRestrictions: json['leave_restrictions'] as bool?,
      leaveRestrictionsRules: (json['leave_restrictions_rules']
              as List<dynamic>?)
          ?.map((e) =>
              LeaveRestrictionRulesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTotalUsedLeave: json['user_total_used_leave'] as String?,
      userTotalLeave: json['user_total_leave'] as String?,
      remainingLeave: json['remaining_leave'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      leaveAllocationType: json['leave_allocation_type'] as String?,
      currentMonthLeave: json['current_month_leave'] as String?,
      remainingPastMonthsLeave: json['remaining_past_months_leave'] as String?,
      totalPayout: json['totalPayout'] as String?,
      totalCarryForward: json['totalCarryForward'] as String?,
      leaveExpireAfterDays: json['leave_expire_after_days'] as String?,
      leaveCreditLastDate: json['leave_credit_last_date'] as String?,
      carryForwardIncludes: json['carry_forward_includes'] as String?,
      previousYearCarryForwardLeave:
          json['previous_year_carry_forward_leave'] as String?,
      previouslyUsedPaidLeave: json['previously_used_paid_leave'] as String?,
      previouslyUsedUnpaidLeave:
          json['previously_used_unpaid_leave'] as String?,
      leaveEncashmentOption: json['leave_encashment_option'] as String?,
      encashmentAllowed: json['encashmentAllowed'] as String?,
      encasementSummary: json['encasement_summary'] == null
          ? null
          : EncasementSummaryModel.fromJson(
              json['encasement_summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveTypeModelToJson(LeaveTypeModel instance) =>
    <String, dynamic>{
      'leave_type_id': instance.leaveTypeId,
      'leave_type_name': instance.leaveTypeName,
      'view_leave_count': instance.viewLeaveCount,
      'is_special_leave': instance.specialLeave,
      'applicable_leaves_in_month': instance.applicableLeavesInMonth,
      'user_monthly_leave_balance_data': instance.userMonthlyLeaveBalanceData,
      'leave_calculation': instance.leaveCalculation,
      'apply_leave_start_date': instance.applyLeaveStartDate,
      'assign_leave_frequency': instance.assignLeaveFrequency,
      'leaves_according_to_payroll_cycle':
          instance.leavesAccordingToPayrollCycle,
      'take_leave_during_notice_period': instance.takeLeaveDuringNoticePeriod,
      'max_leave_during_notice_period': instance.maxLeaveDuringNoticePeriod,
      'take_leave_during_probation_period':
          instance.takeLeaveDuringProbationPeriod,
      'max_leave_per_month_during_probation_period':
          instance.maxLeavePerMonthDuringProbationPeriod,
      'leave_restrictions': instance.leaveRestrictions,
      'leave_restrictions_rules': instance.leaveRestrictionsRules,
      'user_total_used_leave': instance.userTotalUsedLeave,
      'user_total_leave': instance.userTotalLeave,
      'remaining_leave': instance.remainingLeave,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'leave_allocation_type': instance.leaveAllocationType,
      'current_month_leave': instance.currentMonthLeave,
      'remaining_past_months_leave': instance.remainingPastMonthsLeave,
      'totalPayout': instance.totalPayout,
      'totalCarryForward': instance.totalCarryForward,
      'leave_expire_after_days': instance.leaveExpireAfterDays,
      'leave_credit_last_date': instance.leaveCreditLastDate,
      'carry_forward_includes': instance.carryForwardIncludes,
      'previous_year_carry_forward_leave':
          instance.previousYearCarryForwardLeave,
      'previously_used_paid_leave': instance.previouslyUsedPaidLeave,
      'previously_used_unpaid_leave': instance.previouslyUsedUnpaidLeave,
      'leave_encashment_option': instance.leaveEncashmentOption,
      'encashmentAllowed': instance.encashmentAllowed,
      'encasement_summary': instance.encasementSummary,
    };

ApprovalUserModel _$ApprovalUserModelFromJson(Map<String, dynamic> json) =>
    ApprovalUserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      branch: json['branch'] as String?,
      department: json['department'] as String?,
      profile: json['profile'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ApprovalUserModelToJson(ApprovalUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'designation': instance.designation,
      'branch': instance.branch,
      'department': instance.department,
      'profile': instance.profile,
      'status': instance.status,
      'date': instance.date,
    };

LeaveRestrictionRulesModel _$LeaveRestrictionRulesModelFromJson(
        Map<String, dynamic> json) =>
    LeaveRestrictionRulesModel(
      leave: json['leave'] as String?,
      applyBefore: json['apply_before'] as String?,
    );

Map<String, dynamic> _$LeaveRestrictionRulesModelToJson(
        LeaveRestrictionRulesModel instance) =>
    <String, dynamic>{
      'leave': instance.leave,
      'apply_before': instance.applyBefore,
    };

EncasementSummaryModel _$EncasementSummaryModelFromJson(
        Map<String, dynamic> json) =>
    EncasementSummaryModel(
      totalPaid: json['total_paid'] as String?,
      totalEncashment: json['total_encashment'] as String?,
      totalUnpaid: json['total_unpaid'] as String?,
    );

Map<String, dynamic> _$EncasementSummaryModelToJson(
        EncasementSummaryModel instance) =>
    <String, dynamic>{
      'total_paid': instance.totalPaid,
      'total_encashment': instance.totalEncashment,
      'total_unpaid': instance.totalUnpaid,
    };
