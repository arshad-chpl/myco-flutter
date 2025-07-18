import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'my_team_response_model.g.dart';

MyTeamResponseModel myTeamResponseModelFromJson(String str) =>
    MyTeamResponseModel.fromJson(json.decode(str));

@JsonSerializable()
class MyTeamResponseModel {
  @JsonKey(name: 'my_team')
  final List<MyTeamModel>? myTeam;

  @JsonKey(name: 'leave_list')
  final List<LeaveModel>? leaveList;

  @JsonKey(name: 'leave_list_next_week')
  final List<LeaveModel>? leaveListNextWeek;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  MyTeamResponseModel({
    this.myTeam,
    this.leaveList,
    this.leaveListNextWeek,
    this.message,
    this.status,
  });

  factory MyTeamResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MyTeamResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyTeamResponseModelToJson(this);
}

@JsonSerializable()
class MyTeamModel {
  bool isSelected;
  String color;
  bool isEmployeeSelected;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'level_id')
  final String? levelId;

  @JsonKey(name: 'level_name')
  final String? levelName;

  @JsonKey(name: 'user_full_name')
  final String? userFullName;

  @JsonKey(name: 'user_designation')
  final String? userDesignation;

  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;

  @JsonKey(name: 'short_name')
  final String? shortName;

  MyTeamModel({
    this.isSelected = false,
    this.color = '',
    this.isEmployeeSelected = false,
    this.userId,
    this.levelId,
    this.levelName,
    this.userFullName,
    this.userDesignation,
    this.userProfilePic,
    this.shortName,
  });

  factory MyTeamModel.fromJson(Map<String, dynamic> json) =>
      _$MyTeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyTeamModelToJson(this);
}

@JsonSerializable()
class LeaveModel {
  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'leave_id')
  final String? leaveId;

  @JsonKey(name: 'leave_start_date')
  final String? leaveStartDate;

  @JsonKey(name: 'leave_date_view')
  final String? leaveDateView;

  @JsonKey(name: 'user_full_name')
  final String? userFullName;

  @JsonKey(name: 'user_designation')
  final String? userDesignation;

  @JsonKey(name: 'leave_day_type')
  final String? leaveDayType;

  @JsonKey(name: 'half_day_session')
  final String? halfDaySession;

  @JsonKey(name: 'leave_type')
  final String? leaveType;

  @JsonKey(name: 'leave_type_name')
  final String? leaveTypeName;

  @JsonKey(name: 'leave_reason')
  final String? leaveReason;

  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;

  @JsonKey(name: 'short_name')
  final String? shortName;

  LeaveModel({
    this.userId,
    this.leaveId,
    this.leaveStartDate,
    this.leaveDateView,
    this.userFullName,
    this.userDesignation,
    this.leaveDayType,
    this.halfDaySession,
    this.leaveType,
    this.leaveTypeName,
    this.leaveReason,
    this.userProfilePic,
    this.shortName,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveModelToJson(this);
}