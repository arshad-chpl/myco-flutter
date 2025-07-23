// To parse this JSON data, do
//
//     final chatList = chatListFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';

part 'chat_list_model.g.dart';

ChatListModel chatListFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListToJson(ChatListModel data) => json.encode(data.toJson());

@JsonSerializable()
class ChatListModel {
  @JsonKey(name: "member")
  List<Member>? member;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  ChatListModel({this.member, this.message, this.status});

  factory ChatListModel.fromJson(Map<String, dynamic> json) =>
      _$ChatListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatListModelToJson(this);

  ChatListEntity toEntity() => ChatListEntity(
    member: member?.map((model) => model.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class Member {
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @JsonKey(name: "country_code")
  String? countryCode;
  @JsonKey(name: "company_name")
  String? companyName;
  @JsonKey(name: "user_designation")
  String? userDesignation;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "user_type")
  String? userType;
  @JsonKey(name: "block_name")
  String? blockName;
  @JsonKey(name: "floor_name")
  String? floorName;
  @JsonKey(name: "unit_name")
  String? unitName;
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "unit_id")
  String? unitId;
  @JsonKey(name: "unit_status")
  String? unitStatus;
  @JsonKey(name: "user_status")
  String? userStatus;
  @JsonKey(name: "member_status")
  String? memberStatus;
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @JsonKey(name: "public_mobile")
  String? publicMobile;
  @JsonKey(name: "member_date_of_birth")
  String? memberDateOfBirth;
  @JsonKey(name: "alt_mobile")
  String? altMobile;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "short_name")
  String? shortName;
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @JsonKey(name: "owner_name")
  String? ownerName;
  @JsonKey(name: "owner_email")
  String? ownerEmail;
  @JsonKey(name: "owner_mobile")
  String? ownerMobile;
  @JsonKey(name: "block_status")
  bool? blockStatus;

  Member({
    this.userId,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.countryCode,
    this.companyName,
    this.userDesignation,
    this.gender,
    this.userType,
    this.blockName,
    this.floorName,
    this.unitName,
    this.floorId,
    this.unitId,
    this.unitStatus,
    this.userStatus,
    this.memberStatus,
    this.userMobile,
    this.publicMobile,
    this.memberDateOfBirth,
    this.altMobile,
    this.token,
    this.shortName,
    this.userProfilePic,
    this.ownerName,
    this.ownerEmail,
    this.ownerMobile,
    this.blockStatus,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);

  MemberEntity toEntity() => MemberEntity(
    userId: userId,
    userFullName: userFullName, 
    userFirstName: userFirstName,
    userLastName: userLastName,
    countryCode: countryCode,
    companyName: companyName,
    userDesignation: userDesignation,
    gender: gender,
    userType: userType,
    blockName: blockName,
    floorName: floorName,
    unitName: unitName,
    floorId: floorId,
    unitId: unitId,
    unitStatus: unitStatus,
    userStatus: userStatus,
    memberStatus: memberStatus,
    userMobile: userMobile,
    publicMobile: publicMobile,
    memberDateOfBirth: memberDateOfBirth,
    altMobile: altMobile,
    token: token,
    shortName: shortName,
    userProfilePic: userProfilePic,
    ownerName: ownerName,
    ownerEmail: ownerEmail,
    ownerMobile: ownerMobile,
    blockStatus: blockStatus,
  );
}
