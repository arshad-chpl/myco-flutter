import 'package:myco_flutter/features/leave/domain/entities/leave_type_response_entity.dart';

class LeaveTypeResponse {
  List<LeaveType>? leaveTypes;
  String? message;
  String? status;

  LeaveTypeResponse({this.leaveTypes, this.message, this.status});

  factory LeaveTypeResponse.fromJson(Map<String, dynamic> json) =>
      LeaveTypeResponse(
        leaveTypes: json['leave_types'] == null
            ? []
            : List<LeaveType>.from(
                json['leave_types']!.map((x) => LeaveType.fromJson(x)),
              ),
        message: json['message'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
    'leave_types': leaveTypes == null
        ? []
        : List<dynamic>.from(leaveTypes!.map((x) => x.toJson())),
    'message': message,
    'status': status,
  };

  LeaveTypeResponseEntity toEntity() => LeaveTypeResponseEntity(
    leaveTypes: leaveTypes?.map((e) => e.toEntity()).toList(),
    message: message,
    status: status,
  );
}

class LeaveType {
  String? leaveTypeId;
  String? leaveTypeName;
  String? userTotalLeave;
  bool? isAttachmentRequired;
  String? userTotalUsedLeave;
  String? remainingLeave;
  String? applicableLeavesInMonth;
  String? specialLeave;
  String? pastDaysLeaveAppliedDays;
  String? maxPastDateAllowed;
  bool? leaveApplyOnDate;
  bool? leaveAppliedOnPastDays;
  double? userSelectedLeaveCount;
  bool? asUnPaidLeave;

  LeaveType({
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

  factory LeaveType.fromJson(Map<String, dynamic> json) => LeaveType(
    leaveTypeId: json['leave_type_id'],
    leaveTypeName: json['leave_type_name'],
    userTotalLeave: json['user_total_leave'],
    isAttachmentRequired: json['is_attachment_required'],
    userTotalUsedLeave: json['user_total_used_leave'],
    remainingLeave: json['remaining_leave'],
    applicableLeavesInMonth: json['applicable_leaves_in_month'],
    specialLeave: json['is_special_leave'],
    pastDaysLeaveAppliedDays: json['past_days_leave_applied_days'],
    maxPastDateAllowed: json['max_past_date_allowed'],
    leaveApplyOnDate: json['leave_apply_on_date'],
    leaveAppliedOnPastDays: json['leave_applied_on_past_days'],
    userSelectedLeaveCount:
        json['user_selected_leave_count']?.toDouble() ?? 0.0,
    asUnPaidLeave: json['as_un_paid_leave'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'leave_type_id': leaveTypeId,
    'leave_type_name': leaveTypeName,
    'user_total_leave': userTotalLeave,
    'is_attachment_required': isAttachmentRequired,
    'user_total_used_leave': userTotalUsedLeave,
    'remaining_leave': remainingLeave,
    'applicable_leaves_in_month': applicableLeavesInMonth,
    'is_special_leave': specialLeave,
    'past_days_leave_applied_days': pastDaysLeaveAppliedDays,
    'max_past_date_allowed': maxPastDateAllowed,
    'leave_apply_on_date': leaveApplyOnDate,
    'leave_applied_on_past_days': leaveAppliedOnPastDays,
    'user_selected_leave_count': userSelectedLeaveCount,
    'as_un_paid_leave': asUnPaidLeave,
  };

  LeaveTypeEntity toEntity() => LeaveTypeEntity(
    leaveTypeId: leaveTypeId,
    leaveTypeName: leaveTypeName,
    userTotalLeave: userTotalLeave,
    isAttachmentRequired: isAttachmentRequired,
    userTotalUsedLeave: userTotalUsedLeave,
    remainingLeave: remainingLeave,
    applicableLeavesInMonth: applicableLeavesInMonth,
    specialLeave: specialLeave,
    pastDaysLeaveAppliedDays: pastDaysLeaveAppliedDays,
    maxPastDateAllowed: maxPastDateAllowed,
    leaveApplyOnDate: leaveApplyOnDate,
    leaveAppliedOnPastDays: leaveAppliedOnPastDays,
    userSelectedLeaveCount: userSelectedLeaveCount,
    asUnPaidLeave: asUnPaidLeave,
  );
}
