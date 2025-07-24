// To parse this JSON data, do
//
//     final memberChatListModel = memberChatListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/chat/domain/entities/member_chat_list_entities.dart';

part 'member_chat_list_model.g.dart';

MemberChatListModel memberChatListModelFromJson(String str) =>
    MemberChatListModel.fromJson(json.decode(str));

String memberChatListModelToJson(MemberChatListModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MemberChatListModel {
  @JsonKey(name: "member")
  List<Member>? member;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "group_chat_status")
  String? groupChatStatus;
  @JsonKey(name: "status")
  String? status;

  MemberChatListModel({
    this.member,
    this.message,
    this.groupChatStatus,
    this.status,
  });

  factory MemberChatListModel.fromJson(Map<String, dynamic> json) =>
      _$MemberChatListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberChatListModelToJson(this);
  MemberChatListEntity toEntity() => MemberChatListEntity(
    member: member?.map((e) => e.toEntity()).toList() ?? [],
    message: message,
    groupChatStatus: groupChatStatus,
    status: status,
  );
}

@JsonSerializable()
class Member {
  @JsonKey(name: "chat_id")
  String? chatId;
  @JsonKey(name: "msg_data")
  String? msgData;
  @JsonKey(name: "msg_date")
  String? msgDate;
  @JsonKey(name: "flag")
  String? flag;
  @JsonKey(name: "member_size")
  String? memberSize;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "user_type")
  String? userType;
  @JsonKey(name: "company_name")
  String? companyName;
  @JsonKey(name: "block_name")
  String? blockName;
  @JsonKey(name: "floor_name")
  String? floorName;
  @JsonKey(name: "unit_name")
  dynamic unitName;
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "unit_id")
  dynamic unitId;
  @JsonKey(name: "unit_status")
  dynamic unitStatus;
  @JsonKey(name: "user_status")
  String? userStatus;
  @JsonKey(name: "member_status")
  String? memberStatus;
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @JsonKey(name: "country_code")
  String? countryCode;
  @JsonKey(name: "public_mobile")
  String? publicMobile;
  @JsonKey(name: "member_date_of_birth")
  String? memberDateOfBirth;
  @JsonKey(name: "alt_mobile")
  String? altMobile;
  @JsonKey(name: "short_name")
  String? shortName;
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @JsonKey(name: "chatCount")
  String? chatCount;

  Member({
    this.chatId,
    this.msgData,
    this.msgDate,
    this.flag,
    this.memberSize,
    this.userId,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.gender,
    this.userType,
    this.companyName,
    this.blockName,
    this.floorName,
    this.unitName,
    this.floorId,
    this.unitId,
    this.unitStatus,
    this.userStatus,
    this.memberStatus,
    this.userMobile,
    this.countryCode,
    this.publicMobile,
    this.memberDateOfBirth,
    this.altMobile,
    this.shortName,
    this.userProfilePic,
    this.chatCount,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
  MemberChatEntity toEntity() => MemberChatEntity(
    chatId: chatId,
    msgData: msgData,
    msgDate: msgDate,
    flag: flag,
    memberSize: memberSize,
    userId: userId,
    userFullName: userFullName,
    userFirstName: userFirstName,
    userLastName: userLastName,
    gender: gender,
    userType: userType,
    companyName: companyName,
    blockName: blockName,
    floorName: floorName,
    unitName: unitName,
    floorId: floorId,
    unitId: unitId,
    unitStatus: unitStatus,
    userStatus: userStatus,
    memberStatus: memberStatus,
    userMobile: userMobile,
    countryCode: countryCode,
    publicMobile: publicMobile,
    memberDateOfBirth: memberDateOfBirth,
    altMobile: altMobile,
    shortName: shortName,
    userProfilePic: userProfilePic,
    chatCount: chatCount,
  );
}
