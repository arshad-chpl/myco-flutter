import 'package:equatable/equatable.dart';

// ====================
// LeaveTypeResponseEntity
// ====================
class LeaveTypeResponseEntity extends Equatable {
  final List<LeaveTypeEntity>? leaveTypes;
  final String? message;
  final String? status;

  const LeaveTypeResponseEntity({this.leaveTypes, this.message, this.status});

  @override
  List<Object?> get props => [leaveTypes, message, status];
}

// ====================
// LeaveTypeEntity
// ====================
class LeaveTypeEntity extends Equatable {
  final String? leaveTypeId;
  final String? leaveTypeName;
  final String? userTotalLeave;
  final bool? isAttachmentRequired;
  final String? userTotalUsedLeave;
  final String? remainingLeave;
  final String? applicableLeavesInMonth;
  final String? specialLeave;
  final String? pastDaysLeaveAppliedDays;
  final String? maxPastDateAllowed;
  final bool? leaveApplyOnDate;
  final bool? leaveAppliedOnPastDays;
  final double? userSelectedLeaveCount;
  final bool? asUnPaidLeave;

  const LeaveTypeEntity({
    this.leaveTypeId,
    this.leaveTypeName,
    this.userTotalLeave,
    this.isAttachmentRequired,
    this.userTotalUsedLeave,
    this.remainingLeave,
    this.applicableLeavesInMonth,
    this.specialLeave,
    this.pastDaysLeaveAppliedDays,
    this.maxPastDateAllowed,
    this.leaveApplyOnDate,
    this.leaveAppliedOnPastDays,
    this.userSelectedLeaveCount,
    this.asUnPaidLeave,
  });

  @override
  List<Object?> get props => [
    leaveTypeId,
    leaveTypeName,
    userTotalLeave,
    isAttachmentRequired,
    userTotalUsedLeave,
    remainingLeave,
    applicableLeavesInMonth,
    specialLeave,
    pastDaysLeaveAppliedDays,
    maxPastDateAllowed,
    leaveApplyOnDate,
    leaveAppliedOnPastDays,
    userSelectedLeaveCount,
    asUnPaidLeave,
  ];
}
