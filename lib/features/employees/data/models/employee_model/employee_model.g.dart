// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      userId: json['user_id'] as String?,
      unitId: json['unit_id'] as String?,
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      userMobile: json['user_mobile'] as String?,
      userFullName: json['user_full_name'] as String?,
      shortName: json['short_name'] as String?,
      societyId: json['society_id'] as String?,
      designation: json['designation'] as String?,
      companyLeaveDate: json['company_leave_date'] as String?,
      companyLeaveDateView: json['company_leave_date_view'] as String?,
      isFutureDate: json['is_future_date'] as bool?,
      userActive: json['user_active'] as bool?,
      userProfilePic: json['user_profile_pic'] as String?,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'unit_id': instance.unitId,
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'user_mobile': instance.userMobile,
      'user_full_name': instance.userFullName,
      'short_name': instance.shortName,
      'society_id': instance.societyId,
      'designation': instance.designation,
      'company_leave_date': instance.companyLeaveDate,
      'company_leave_date_view': instance.companyLeaveDateView,
      'is_future_date': instance.isFutureDate,
      'user_active': instance.userActive,
      'user_profile_pic': instance.userProfilePic,
    };
