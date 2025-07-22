// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_team_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTeamResponseModel _$MyTeamResponseModelFromJson(Map<String, dynamic> json) =>
    MyTeamResponseModel(
      myTeam: (json['my_team'] as List<dynamic>?)
          ?.map((e) => MyTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leaveList: (json['leave_list'] as List<dynamic>?)
          ?.map((e) => LeaveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leaveListNextWeek: (json['leave_list_next_week'] as List<dynamic>?)
          ?.map((e) => LeaveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MyTeamResponseModelToJson(
        MyTeamResponseModel instance) =>
    <String, dynamic>{
      'my_team': instance.myTeam,
      'leave_list': instance.leaveList,
      'leave_list_next_week': instance.leaveListNextWeek,
      'message': instance.message,
      'status': instance.status,
    };

MyTeamModel _$MyTeamModelFromJson(Map<String, dynamic> json) => MyTeamModel(
      isSelected: json['isSelected'] as bool? ?? false,
      color: json['color'] as String? ?? '',
      isEmployeeSelected: json['isEmployeeSelected'] as bool? ?? false,
      userId: json['user_id'] as String?,
      levelId: json['level_id'] as String?,
      levelName: json['level_name'] as String?,
      userFullName: json['user_full_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      shortName: json['short_name'] as String?,
    );

Map<String, dynamic> _$MyTeamModelToJson(MyTeamModel instance) =>
    <String, dynamic>{
      'isSelected': instance.isSelected,
      'color': instance.color,
      'isEmployeeSelected': instance.isEmployeeSelected,
      'user_id': instance.userId,
      'level_id': instance.levelId,
      'level_name': instance.levelName,
      'user_full_name': instance.userFullName,
      'user_designation': instance.userDesignation,
      'user_profile_pic': instance.userProfilePic,
      'short_name': instance.shortName,
    };

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) => LeaveModel(
      userId: json['user_id'] as String?,
      leaveId: json['leave_id'] as String?,
      leaveStartDate: json['leave_start_date'] as String?,
      leaveDateView: json['leave_date_view'] as String?,
      userFullName: json['user_full_name'] as String?,
      userDesignation: json['user_designation'] as String?,
      leaveDayType: json['leave_day_type'] as String?,
      halfDaySession: json['half_day_session'] as String?,
      leaveType: json['leave_type'] as String?,
      leaveTypeName: json['leave_type_name'] as String?,
      leaveReason: json['leave_reason'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      shortName: json['short_name'] as String?,
    );

Map<String, dynamic> _$LeaveModelToJson(LeaveModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'leave_id': instance.leaveId,
      'leave_start_date': instance.leaveStartDate,
      'leave_date_view': instance.leaveDateView,
      'user_full_name': instance.userFullName,
      'user_designation': instance.userDesignation,
      'leave_day_type': instance.leaveDayType,
      'half_day_session': instance.halfDaySession,
      'leave_type': instance.leaveType,
      'leave_type_name': instance.leaveTypeName,
      'leave_reason': instance.leaveReason,
      'user_profile_pic': instance.userProfilePic,
      'short_name': instance.shortName,
    };
