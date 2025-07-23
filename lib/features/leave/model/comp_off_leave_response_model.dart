import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comp_off_leave_response_model.g.dart';

CompOffLeaveResponseModel compOffLeaveResponseModelFromJson(String str) =>
    CompOffLeaveResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class CompOffLeaveResponseModel {
  @JsonKey(name: 'leaves')
  final List<LeavesItemModel>? leaves;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  CompOffLeaveResponseModel({
    this.leaves,
    this.message,
    this.status,
  });

  factory CompOffLeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompOffLeaveResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompOffLeaveResponseModelToJson(this);

  CompOffLeaveResponseEntity toEntity() => CompOffLeaveResponseEntity(
    leaves: leaves?.map((model) => model.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class LeavesItemModel {
  @JsonKey(name: 'extra_day_leave_day_type')
  final String? extraDayLeaveDayType;

  @JsonKey(name: 'leave_applied_on')
  final String? leaveAppliedOn;

  @JsonKey(name: 'comp_off_leave_id')
  final String? compOffLeaveId;

  @JsonKey(name: 'leave_expire_date')
  final String? leaveExpireDate;

  @JsonKey(name: 'is_leave_used')
  final String? isLeaveUsed;

  @JsonKey(name: 'attendance_date')
  final String? attendanceDate;

  @JsonKey(name: 'has_leave_applied')
  final String? hasLeaveApplied;

  LeavesItemModel({
    this.extraDayLeaveDayType,
    this.leaveAppliedOn,
    this.compOffLeaveId,
    this.leaveExpireDate,
    this.isLeaveUsed,
    this.attendanceDate,
    this.hasLeaveApplied,
  });

  factory LeavesItemModel.fromJson(Map<String, dynamic> json) =>
      _$LeavesItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeavesItemModelToJson(this);

  LeavesItemEntity toEntity() => LeavesItemEntity(
    extraDayLeaveDayType: extraDayLeaveDayType,
    leaveAppliedOn: leaveAppliedOn,
    compOffLeaveId: compOffLeaveId,
    leaveExpireDate: leaveExpireDate,
    isLeaveUsed: isLeaveUsed,
    attendanceDate: attendanceDate,
    hasLeaveApplied: hasLeaveApplied,
  );
}

class CompOffLeaveResponseEntity extends Equatable {
  final List<LeavesItemEntity>? leaves;
  final String? message;
  final String? status;

  const CompOffLeaveResponseEntity({
    this.leaves,
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [
    leaves,
    message,
    status,
  ];
}

class LeavesItemEntity extends Equatable {
  final String? extraDayLeaveDayType;
  final String? leaveAppliedOn;
  final String? compOffLeaveId;
  final String? leaveExpireDate;
  final String? isLeaveUsed;
  final String? attendanceDate;
  final String? hasLeaveApplied;

  const LeavesItemEntity({
    this.extraDayLeaveDayType,
    this.leaveAppliedOn,
    this.compOffLeaveId,
    this.leaveExpireDate,
    this.isLeaveUsed,
    this.attendanceDate,
    this.hasLeaveApplied,
  });

  @override
  List<Object?> get props => [
    extraDayLeaveDayType,
    leaveAppliedOn,
    compOffLeaveId,
    leaveExpireDate,
    isLeaveUsed,
    attendanceDate,
    hasLeaveApplied,
  ];
}