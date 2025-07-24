class ChatListEntity {
  final List<MemberEntity>? member;
  final String? message;
  final String? status;

  ChatListEntity({
    required this.member,
    this.message,
    this.status,
  });
}

class MemberEntity {
  final String? userId;
  final String? userFullName;
  final String? userFirstName;
  final String? userLastName;
  final String? countryCode;
  final String? companyName;
  final String? userDesignation;
  final String? gender; 
  final String? userType;
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
  final String? token;
  final String? shortName;
  final String? userProfilePic;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerMobile;
  final bool? blockStatus;

  MemberEntity({
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
}
