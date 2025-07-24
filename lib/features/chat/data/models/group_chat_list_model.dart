import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:myco_flutter/features/chat/domain/entities/group_chat_list_entities.dart';

part 'group_chat_list_model.g.dart';

GroupChatListModel groupChatListFromJson(String str) => GroupChatListModel.fromJson(json.decode(str));

String groupChatListToJson(GroupChatListModel data) => json.encode(data.toJson());

@JsonSerializable()
class GroupChatListModel {
    @JsonKey(name: "member")
    List<Member>? member;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "group_chat_status")
    String? groupChatStatus;
    @JsonKey(name: "status")
    String? status;

    GroupChatListModel({
        this.member,
        this.message,
        this.groupChatStatus,
        this.status,
    });

    factory GroupChatListModel.fromJson(Map<String, dynamic> json) => _$GroupChatListModelFromJson(json);

    Map<String, dynamic> toJson() => _$GroupChatListModelToJson(this);
    GroupChatListEntity toEntity() => GroupChatListEntity(
      member: member?.map((model) => model.toEntity()).toList(),
      message: message,
      status: status,
    );
}

@JsonSerializable()
class Member {
    @JsonKey(name: "chat_id")
    String? chatId;
    @JsonKey(name: "society_id")
    String? societyId;
    @JsonKey(name: "topic_name")
    String? topicName;
    @JsonKey(name: "msg_data")
    String? msgData;
    @JsonKey(name: "group_type")
    String? groupType;
    @JsonKey(name: "active_status")
    String? activeStatus;
    @JsonKey(name: "created_date")
    String? createdDate;
    @JsonKey(name: "other_member_chat_restrict")
    bool? otherMemberChatRestrict;
    @JsonKey(name: "other_member_media_restrict")
    bool? otherMemberMediaRestrict;
    @JsonKey(name: "msg_date")
    DateTime? msgDate;
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
    @JsonKey(name: "short_name")
    String? shortName;
    @JsonKey(name: "gender")
    String? gender;
    @JsonKey(name: "user_type")
    String? userType;
    @JsonKey(name: "user_profile_pic")
    String? userProfilePic;
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
    @JsonKey(name: "chatCount")
    String? chatCount;

    Member({
        this.chatId,
        this.societyId,
        this.topicName,
        this.msgData,
        this.groupType,
        this.activeStatus,
        this.createdDate,
        this.otherMemberChatRestrict,
        this.otherMemberMediaRestrict,
        this.msgDate,
        this.flag,
        this.memberSize,
        this.userId,
        this.userFullName,
        this.userFirstName,
        this.userLastName,
        this.shortName,
        this.gender,
        this.userType,
        this.userProfilePic,
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
        this.chatCount,
    });

    factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

    Map<String, dynamic> toJson() => _$MemberToJson(this);
    MemberEntity toEntity() => MemberEntity(
  chatId: chatId,
  societyId: societyId,
  topicName: topicName,
  msgData: msgData,
  groupType: groupType,
  activeStatus: activeStatus,
  createdDate: createdDate,
  otherMemberChatRestrict: otherMemberChatRestrict,
  otherMemberMediaRestrict: otherMemberMediaRestrict,
  msgDate: msgDate,
  flag: flag,
  memberSize: memberSize,
  userId: userId,
  userFullName: userFullName,
  userFirstName: userFirstName,
  userLastName: userLastName,
  shortName: shortName,
  gender: gender,
  userType: userType,
  userProfilePic: userProfilePic,
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
  chatCount: chatCount,
);
}
