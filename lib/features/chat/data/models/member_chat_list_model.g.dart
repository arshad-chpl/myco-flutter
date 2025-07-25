// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_chat_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberChatListModel _$MemberChatListModelFromJson(Map<String, dynamic> json) =>
    MemberChatListModel(
      member: (json['member'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      groupChatStatus: json['group_chat_status'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$MemberChatListModelToJson(
        MemberChatListModel instance) =>
    <String, dynamic>{
      'member': instance.member,
      'message': instance.message,
      'group_chat_status': instance.groupChatStatus,
      'status': instance.status,
    };

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      chatId: json['chat_id'] as String?,
      msgData: json['msg_data'] as String?,
      msgDate: json['msg_date'] as String?,
      flag: json['flag'] as String?,
      memberSize: json['member_size'] as String?,
      userId: json['user_id'] as String?,
      userFullName: json['user_full_name'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      gender: json['gender'] as String?,
      userType: json['user_type'] as String?,
      companyName: json['company_name'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      unitName: json['unit_name'],
      floorId: json['floor_id'] as String?,
      unitId: json['unit_id'],
      unitStatus: json['unit_status'],
      userStatus: json['user_status'] as String?,
      memberStatus: json['member_status'] as String?,
      userMobile: json['user_mobile'] as String?,
      countryCode: json['country_code'] as String?,
      publicMobile: json['public_mobile'] as String?,
      memberDateOfBirth: json['member_date_of_birth'] as String?,
      altMobile: json['alt_mobile'] as String?,
      shortName: json['short_name'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      chatCount: json['chatCount'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'chat_id': instance.chatId,
      'msg_data': instance.msgData,
      'msg_date': instance.msgDate,
      'flag': instance.flag,
      'member_size': instance.memberSize,
      'user_id': instance.userId,
      'user_full_name': instance.userFullName,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'gender': instance.gender,
      'user_type': instance.userType,
      'company_name': instance.companyName,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'unit_name': instance.unitName,
      'floor_id': instance.floorId,
      'unit_id': instance.unitId,
      'unit_status': instance.unitStatus,
      'user_status': instance.userStatus,
      'member_status': instance.memberStatus,
      'user_mobile': instance.userMobile,
      'country_code': instance.countryCode,
      'public_mobile': instance.publicMobile,
      'member_date_of_birth': instance.memberDateOfBirth,
      'alt_mobile': instance.altMobile,
      'short_name': instance.shortName,
      'user_profile_pic': instance.userProfilePic,
      'chatCount': instance.chatCount,
    };
