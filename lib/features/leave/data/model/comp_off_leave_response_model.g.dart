part of 'comp_off_leave_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompOffLeaveResponseModel _$CompOffLeaveResponseModelFromJson(Map<String, dynamic> json) =>
    CompOffLeaveResponseModel(
      leaves: (json['leaves'] as List<dynamic>?)
          ?.map((e) => LeavesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CompOffLeaveResponseModelToJson(
    CompOffLeaveResponseModel instance) =>
    <String, dynamic>{
      'leaves': instance.leaves?.map((e) => e.toJson()).toList(),
      'message': instance.message,
      'status': instance.status,
    };

LeavesItemModel _$LeavesItemModelFromJson(Map<String, dynamic> json) =>
    LeavesItemModel(
      extraDayLeaveDayType: json['extra_day_leave_day_type'] as String?,
      leaveAppliedOn: json['leave_applied_on'] as String?,
      compOffLeaveId: json['comp_off_leave_id'] as String?,
      leaveExpireDate: json['leave_expire_date'] as String?,
      isLeaveUsed: json['is_leave_used'] as String?,
      attendanceDate: json['attendance_date'] as String?,
      hasLeaveApplied: json['has_leave_applied'] as String?,
    );

Map<String, dynamic> _$LeavesItemModelToJson(LeavesItemModel instance) =>
    <String, dynamic>{
      'extra_day_leave_day_type': instance.extraDayLeaveDayType,
      'leave_applied_on': instance.leaveAppliedOn,
      'comp_off_leave_id': instance.compOffLeaveId,
      'leave_expire_date': instance.leaveExpireDate,
      'is_leave_used': instance.isLeaveUsed,
      'attendance_date': instance.attendanceDate,
      'has_leave_applied': instance.hasLeaveApplied,
    };