// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatListModel _$ChatListModelFromJson(Map<String, dynamic> json) =>
    ChatListModel(
      member:
          (json['member'] as List<dynamic>?)
              ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ChatListModelToJson(ChatListModel instance) =>
    <String, dynamic>{
      'member': instance.member,
      'message': instance.message,
      'status': instance.status,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
  userId: json['user_id'] as String?,
  userFullName: json['user_full_name'] as String?,
  userFirstName: json['user_first_name'] as String?,
  userLastName: json['user_last_name'] as String?,
  countryCode: json['country_code'] as String?,
  companyName: json['company_name'] as String?,
  userDesignation: json['user_designation'] as String?,
  gender: json['gender'] as String?,
  userType: json['user_type'] as String?,
  blockName: json['block_name'] as String?,
  floorName: json['floor_name'] as String?,
  unitName: json['unit_name'] as String?,
  floorId: json['floor_id'] as String?,
  unitId: json['unit_id'] as String?,
  unitStatus: json['unit_status'] as String?,
  userStatus: json['user_status'] as String?,
  memberStatus: json['member_status'] as String?,
  userMobile: json['user_mobile'] as String?,
  publicMobile: json['public_mobile'] as String?,
  memberDateOfBirth: json['member_date_of_birth'] as String?,
  altMobile: json['alt_mobile'] as String?,
  token: json['token'] as String?,
  shortName: json['short_name'] as String?,
  userProfilePic: json['user_profile_pic'] as String?,
  ownerName: json['owner_name'] as String?,
  ownerEmail: json['owner_email'] as String?,
  ownerMobile: json['owner_mobile'] as String?,
  blockStatus: json['block_status'] as bool?,
);

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
  'user_id': instance.userId,
  'user_full_name': instance.userFullName,
  'user_first_name': instance.userFirstName,
  'user_last_name': instance.userLastName,
  'country_code': instance.countryCode,
  'company_name': instance.companyName,
  'user_designation': instance.userDesignation,
  'gender': instance.gender,
  'user_type': instance.userType,
  'block_name': instance.blockName,
  'floor_name': instance.floorName,
  'unit_name': instance.unitName,
  'floor_id': instance.floorId,
  'unit_id': instance.unitId,
  'unit_status': instance.unitStatus,
  'user_status': instance.userStatus,
  'member_status': instance.memberStatus,
  'user_mobile': instance.userMobile,
  'public_mobile': instance.publicMobile,
  'member_date_of_birth': instance.memberDateOfBirth,
  'alt_mobile': instance.altMobile,
  'token': instance.token,
  'short_name': instance.shortName,
  'user_profile_pic': instance.userProfilePic,
  'owner_name': instance.ownerName,
  'owner_email': instance.ownerEmail,
  'owner_mobile': instance.ownerMobile,
  'block_status': instance.blockStatus,
};
