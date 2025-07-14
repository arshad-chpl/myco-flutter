import 'package:equatable/equatable.dart';

// The main response entity that your UI and business logic will use.
class LeaveHistoryResponseEntity extends Equatable {
  final String? totalLeaves;
  final String? totalUsedLeaves;
  final String? totalRemainingLeaves;
  final bool? hideLateInEarlyOut;
  final List<LeaveTypeEntity>? leaveTypes;
  final List<LeaveHistoryEntity>? leaveHistory;
  final List<LeaveHistoryEntity>? allLeaves;
  final String? message;
  final String? status;
  final String? totalApprovedLeaves;
  final String? totalRejectedLeaves;
  final String? totalPendingLeaves;
  final String? totalAuto;
  final String? previouslyUsedPaidLeave;
  final bool? teamLeave;
  final bool? modificationAccess;

  const LeaveHistoryResponseEntity({
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

  @override
  List<Object?> get props => [
    totalLeaves,
    totalUsedLeaves,
    totalRemainingLeaves,
    hideLateInEarlyOut,
    leaveTypes,
    leaveHistory,
    allLeaves,
    message,
    status,
    totalApprovedLeaves,
    totalRejectedLeaves,
    totalPendingLeaves,
    totalAuto,
    previouslyUsedPaidLeave,
    teamLeave,
    modificationAccess,
  ];
}

// --- Nested Entities ---

class LeaveHistoryEntity extends Equatable {
  final bool? sandwichLeave;
  final String? sandwichLeaveId;
  final String? isSpecialLeave;
  final String? lateIn;
  final String? earlyOut;
  final String? leaveCreatedDate;
  final String? leaveApprovedDate;
  final String? previousLeaveId;
  final String? nextLeaveDate;
  final String? prevLeaveDate;
  final String? sandwichLeaveDate;
  final String? sandwichLeaveDateView;
  final String? shortLeaveTime;
  final bool? shortLeaveAvailable;
  final String? totalWorkingHours;
  final String? totalShiftHours;
  final String? productiveWorkingHours;
  final String? leaveRequestedDate;
  final bool? isExtraDay;
  final String? attendanceId;
  final String? attendanceDateStart;
  final String? attendanceDateEnd;
  final String? punchInTime;
  final String? punchOutTime;
  final String? leaveId;
  final String? societyId;
  final String? userId;
  final String? unitId;
  final String? floorId;
  final String? userFullName;
  final String? floorName;
  final String? blockName;
  final String? year;
  final String? yearNew;
  final String? month;
  final String? leaveTypeName;
  final String? userDesignation;
  final String? userProfilePic;
  final String? shortName;
  final String? leaveReason;
  final String? leaveAlternateNumber;
  final String? leaveAttachment;
  final bool? leaveTaskDependency;
  final String? leaveHandleDependency;
  final String? leaveStatus;
  final String? halfDaySession;
  final String? leaveDayType;
  final String? leaveDayTypeStatus;
  final String? leaveStatusView;
  final String? leaveDayView;
  final String? leaveDate;
  final String? leaveTypeId;
  final String? leaveDateView;
  final String? leaveAdminReason;
  final String? paidUnpaid;
  final String? approvedByName;
  final String? rejectedByName;
  final String? paidUnpaidStatus;
  final String? userTotalLeave;
  final String? userTotalUsedLeave;
  final String? remainingLeave;
  final String? autoLeaveReason;
  final String? leavePercentage;
  final bool? autoLeave;
  final bool? isDateGone;
  final bool? isSalaryGenerated;
  final bool? isMultiLevelApproval;
  final List<ApprovalUserEntity>? approvalUsers;
  final bool? isMyApproval;
  final bool? multiApprovedByMe;
  final bool? expanded;
  final String? shortLeaveId;
  final bool? shortLeave;
  final String? shortLeaveStatus;
  final String? shortLeaveDate;
  final String? shortLeaveApplyReason;
  final String? shortLeaveDateView;
  final String? shortLeaveStatusView;
  final String? shortLeaveStatusChangeName;
  final String? shortLeaveStatusChangeReason;
  final String? shortLeaveStatusChangeDate;
  final String? convertedFromAutoLeave;

  const LeaveHistoryEntity({
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

  @override
  List<Object?> get props => [
    sandwichLeave,
    sandwichLeaveId,
    isSpecialLeave,
    lateIn,
    earlyOut,
    leaveCreatedDate,
    leaveApprovedDate,
    previousLeaveId,
    nextLeaveDate,
    prevLeaveDate,
    sandwichLeaveDate,
    sandwichLeaveDateView,
    shortLeaveTime,
    shortLeaveAvailable,
    totalWorkingHours,
    totalShiftHours,
    productiveWorkingHours,
    leaveRequestedDate,
    isExtraDay,
    attendanceId,
    attendanceDateStart,
    attendanceDateEnd,
    punchInTime,
    punchOutTime,
    leaveId,
    societyId,
    userId,
    unitId,
    floorId,
    userFullName,
    floorName,
    blockName,
    year,
    yearNew,
    month,
    leaveTypeName,
    userDesignation,
    userProfilePic,
    shortName,
    leaveReason,
    leaveAlternateNumber,
    leaveAttachment,
    leaveTaskDependency,
    leaveHandleDependency,
    leaveStatus,
    halfDaySession,
    leaveDayType,
    leaveDayTypeStatus,
    leaveStatusView,
    leaveDayView,
    leaveDate,
    leaveTypeId,
    leaveDateView,
    leaveAdminReason,
    paidUnpaid,
    approvedByName,
    rejectedByName,
    paidUnpaidStatus,
    userTotalLeave,
    userTotalUsedLeave,
    remainingLeave,
    autoLeaveReason,
    leavePercentage,
    autoLeave,
    isDateGone,
    isSalaryGenerated,
    isMultiLevelApproval,
    approvalUsers,
    isMyApproval,
    multiApprovedByMe,
    expanded,
    shortLeaveId,
    shortLeave,
    shortLeaveStatus,
    shortLeaveDate,
    shortLeaveApplyReason,
    shortLeaveDateView,
    shortLeaveStatusView,
    shortLeaveStatusChangeName,
    shortLeaveStatusChangeReason,
    shortLeaveStatusChangeDate,
    convertedFromAutoLeave,
  ];
}

class LeaveTypeEntity extends Equatable {
  final String? leaveTypeId;
  final String? leaveTypeName;
  final String? viewLeaveCount;
  final String? specialLeave;
  final String? applicableLeavesInMonth;
  final Map<String, String>? userMonthlyLeaveBalanceData;
  final String? leaveCalculation;
  final String? applyLeaveStartDate;
  final String? assignLeaveFrequency;
  final String? leavesAccordingToPayrollCycle;
  final String? takeLeaveDuringNoticePeriod;
  final String? maxLeaveDuringNoticePeriod;
  final String? takeLeaveDuringProbationPeriod;
  final String? maxLeavePerMonthDuringProbationPeriod;
  final bool? leaveRestrictions;
  final List<LeaveRestrictionRulesEntity>? leaveRestrictionsRules;
  final String? userTotalUsedLeave;
  final String? userTotalLeave;
  final String? remainingLeave;
  final String? startDate;
  final String? endDate;
  final String? leaveAllocationType;
  final String? currentMonthLeave;
  final String? remainingPastMonthsLeave;
  final String? totalPayout;
  final String? totalCarryForward;
  final String? leaveExpireAfterDays;
  final String? leaveCreditLastDate;
  final String? carryForwardIncludes;
  final String? previousYearCarryForwardLeave;
  final String? previouslyUsedPaidLeave;
  final String? previouslyUsedUnpaidLeave;
  final String? leaveEncashmentOption;
  final String? encashmentAllowed;
  final EncasementSummaryEntity? encasementSummary;

  const LeaveTypeEntity({
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

  @override
  List<Object?> get props => [
    leaveTypeId,
    leaveTypeName,
    viewLeaveCount,
    specialLeave,
    applicableLeavesInMonth,
    userMonthlyLeaveBalanceData,
    leaveCalculation,
    applyLeaveStartDate,
    assignLeaveFrequency,
    leavesAccordingToPayrollCycle,
    takeLeaveDuringNoticePeriod,
    maxLeaveDuringNoticePeriod,
    takeLeaveDuringProbationPeriod,
    maxLeavePerMonthDuringProbationPeriod,
    leaveRestrictions,
    leaveRestrictionsRules,
    userTotalUsedLeave,
    userTotalLeave,
    remainingLeave,
    startDate,
    endDate,
    leaveAllocationType,
    currentMonthLeave,
    remainingPastMonthsLeave,
    totalPayout,
    totalCarryForward,
    leaveExpireAfterDays,
    leaveCreditLastDate,
    carryForwardIncludes,
    previousYearCarryForwardLeave,
    previouslyUsedPaidLeave,
    previouslyUsedUnpaidLeave,
    leaveEncashmentOption,
    encashmentAllowed,
    encasementSummary,
  ];
}

class ApprovalUserEntity extends Equatable {
  final String? id;
  final String? name;
  final String? designation;
  final String? branch;
  final String? department;
  final String? profile;
  final String? status;
  final String? date;

  const ApprovalUserEntity({
    this.id,
    this.name,
    this.designation,
    this.branch,
    this.department,
    this.profile,
    this.status,
    this.date,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    designation,
    branch,
    department,
    profile,
    status,
    date,
  ];
}

class LeaveRestrictionRulesEntity extends Equatable {
  final String? leave;
  final String? applyBefore;

  const LeaveRestrictionRulesEntity({
    this.leave,
    this.applyBefore,
  });

  @override
  List<Object?> get props => [leave, applyBefore];
}

class EncasementSummaryEntity extends Equatable {
  final String? totalPaid;
  final String? totalEncashment;
  final String? totalUnpaid;

  const EncasementSummaryEntity({
    this.totalPaid,
    this.totalEncashment,
    this.totalUnpaid,
  });

  @override
  List<Object?> get props => [totalPaid, totalEncashment, totalUnpaid];
}