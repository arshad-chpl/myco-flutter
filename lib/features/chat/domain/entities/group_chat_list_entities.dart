class GroupChatListEntity {
  final List<MemberEntity>? member;
  final String? message;
  final String? groupChatStatus;
  final String? status;

  GroupChatListEntity({
    required this.member,
    this.message,
    this.groupChatStatus,
    this.status,
  });
}

class MemberEntity {
  final String? chatId;
  final String? societyId;
  final String? topicName;
  final String? msgData;
  final String? groupType;
  final String? activeStatus;
  final String? createdDate;
  final bool? otherMemberChatRestrict;
  final bool? otherMemberMediaRestrict;
  final DateTime? msgDate;
  final String? flag;
  final String? memberSize;
  final String? userId;
  final String? userFullName;
  final String? userFirstName;
  final String? userLastName;
  final String? shortName;
  final String? gender;
  final String? userType;
  final String? userProfilePic;
  final String? blockName;
  final String? floorName;
  final String? unitName;
  final String? floorId;
  final String? unitId;
  final String? unitStatus;
  final String? userStatus;
  final String? memberStatus;
  final String? userMobile;
  final String? publicMobile;
  final String? memberDateOfBirth;
  final String? altMobile;
  final String? chatCount;

  MemberEntity({
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
}
