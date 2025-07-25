class MemberChatListEntity {
  final List<MemberChatEntity> member;
  final String? message;
  final String? groupChatStatus;
  final String? status;

  MemberChatListEntity({
    required this.member,
    this.message,
    this.groupChatStatus,
    this.status,
  });
}

class MemberChatEntity {
  final String? chatId;
  final String? msgData;
  final String? msgDate;
  final String? flag;
  final String? memberSize;
  final String? userId;
  final String? userFullName;
  final String? userFirstName;
  final String? userLastName;
  final String? gender;
  final String? userType;
  final String? companyName;
  final String? blockName;
  final String? floorName;
  final dynamic unitName;
  final String? floorId;
  final dynamic unitId;
  final dynamic unitStatus;
  final String? userStatus;
  final String? memberStatus;
  final String? userMobile;
  final String? countryCode;
  final String? publicMobile;
  final String? memberDateOfBirth;
  final String? altMobile;
  final String? shortName;
  final String? userProfilePic;
  final String? chatCount;

  MemberChatEntity({
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
}
