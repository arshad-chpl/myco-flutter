// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_pending_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewPendingProfileResponse _$ViewPendingProfileResponseFromJson(
        Map<String, dynamic> json) =>
    ViewPendingProfileResponse(
      userProfilePic: json['user_profile_pic'] as String?,
      userFullName: json['user_full_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      countryCode: json['country_code'] as String?,
      userMobile: json['user_mobile'] as String?,
      userEmail: json['user_email'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      unitName: json['unit_name'],
      designation: json['designation'] as String?,
      gender: json['gender'] as String?,
      userId: json['user_id'] as String?,
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      userStatus: json['user_status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ViewPendingProfileResponseToJson(
        ViewPendingProfileResponse instance) =>
    <String, dynamic>{
      'user_profile_pic': instance.userProfilePic,
      'user_full_name': instance.userFullName,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'country_code': instance.countryCode,
      'user_mobile': instance.userMobile,
      'user_email': instance.userEmail,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'unit_name': instance.unitName,
      'designation': instance.designation,
      'gender': instance.gender,
      'user_id': instance.userId,
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'user_status': instance.userStatus,
      'message': instance.message,
    };
