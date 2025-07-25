import 'package:equatable/equatable.dart';

// The main entity for the OTP verification response.
class VerifyOtpResponseEntity extends Equatable {
  final String? error;
  final String? userId;
  final String? shiftTimeId;
  final String? companyId;
  final String? userFullName;
  final String? userFirstName;
  final String? userLastName;
  final String? userMobile;
  final String? userEmail;
  final String? userIdProof;
  final String? userType;
  final String? branchId;
  final String? branchName;
  final String? departmentName;
  final String? unitName;
  final String? baseUrl;
  final String? departmentId;
  final String? gender;
  final String? unitId;
  final String? zoneId;
  final String? stateId;
  final String? levelId;
  final String? unitStatus;
  final String? userStatus;
  final String? memberStatus;
  final String? publicMobile;
  final String? visitorApproved;
  final String? memberDateOfBirth;
  final String? weddingAnniversaryDate;
  final String? facebook;
  final String? instagram;
  final String? linkedin;
  final String? altMobile;
  final String? countryCode;
  final String? countryCodeAlt;
  final String? companyName;
  final String? companyAddress;
  final String? plotLattitude;
  final String? plotLongitude;
  final bool? getBusinessData;
  final String? bloodGroup;
  final bool? newUser;
  final String? designation;
  final String? businessCategories;
  final String? businessCategoriesSub;
  final String? businessCategoriesOther;
  final String? professionalOther;
  final bool? society;
  final String? labelMemberType;
  final String? labelSettingApartment;
  final String? labelSettingResident;
  final String? userProfilePic;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerMobile;
  final String? societyAddress;
  final String? aboutBusiness;
  final String? societyLatitude;
  final String? societyLongitude;
  final String? societyName;
  final String? countryId;
  final String? stateIdEmployee;
  final String? cityId;
  final String? cityName;
  final bool? isExpenseON;
  final String? maxExpenseAmount;
  final String? apiKey;
  final String? socieatyLogo;
  final String? currency;
  final List<MemberEntity>? member;
  final List<EmergencyEntity>? emergency;
  final String? message;
  final String? status;
  final String? facultyUsername;
  final String? facultyPassword;
  final String? facultyToken;
  final String? facultyTokenData;
  final bool? viewDialogApiCall;
  final bool? viewDialog;

  const VerifyOtpResponseEntity({
    this.error,
    this.userId,
    this.shiftTimeId,
    this.companyId,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.userMobile,
    this.userEmail,
    this.userIdProof,
    this.userType,
    this.branchId,
    this.branchName,
    this.departmentName,
    this.unitName,
    this.baseUrl,
    this.departmentId,
    this.gender,
    this.unitId,
    this.zoneId,
    this.stateId,
    this.levelId,
    this.unitStatus,
    this.userStatus,
    this.memberStatus,
    this.publicMobile,
    this.visitorApproved,
    this.memberDateOfBirth,
    this.weddingAnniversaryDate,
    this.facebook,
    this.instagram,
    this.linkedin,
    this.altMobile,
    this.countryCode,
    this.countryCodeAlt,
    this.companyName,
    this.companyAddress,
    this.plotLattitude,
    this.plotLongitude,
    this.getBusinessData,
    this.bloodGroup,
    this.newUser,
    this.designation,
    this.businessCategories,
    this.businessCategoriesSub,
    this.businessCategoriesOther,
    this.professionalOther,
    this.society,
    this.labelMemberType,
    this.labelSettingApartment,
    this.labelSettingResident,
    this.userProfilePic,
    this.ownerName,
    this.ownerEmail,
    this.ownerMobile,
    this.societyAddress,
    this.aboutBusiness,
    this.societyLatitude,
    this.societyLongitude,
    this.societyName,
    this.countryId,
    this.stateIdEmployee,
    this.cityId,
    this.cityName,
    this.isExpenseON,
    this.maxExpenseAmount,
    this.apiKey,
    this.socieatyLogo,
    this.currency,
    this.member,
    this.emergency,
    this.message,
    this.status,
    this.facultyUsername,
    this.facultyPassword,
    this.facultyToken,
    this.facultyTokenData,
    this.viewDialogApiCall,
    this.viewDialog,
  });

  @override
  List<Object?> get props => [
    error,
    userId,
    shiftTimeId,
    companyId,
    userFullName,
    userFirstName,
    userLastName,
    userMobile,
    userEmail,
    userIdProof,
    userType,
    branchId,
    branchName,
    departmentName,
    unitName,
    baseUrl,
    departmentId,
    gender,
    unitId,
    zoneId,
    stateId,
    levelId,
    unitStatus,
    userStatus,
    memberStatus,
    publicMobile,
    visitorApproved,
    memberDateOfBirth,
    weddingAnniversaryDate,
    facebook,
    instagram,
    linkedin,
    altMobile,
    countryCode,
    countryCodeAlt,
    companyName,
    companyAddress,
    plotLattitude,
    plotLongitude,
    getBusinessData,
    bloodGroup,
    newUser,
    designation,
    businessCategories,
    businessCategoriesSub,
    businessCategoriesOther,
    professionalOther,
    society,
    labelMemberType,
    labelSettingApartment,
    labelSettingResident,
    userProfilePic,
    ownerName,
    ownerEmail,
    ownerMobile,
    societyAddress,
    aboutBusiness,
    societyLatitude,
    societyLongitude,
    societyName,
    countryId,
    stateIdEmployee,
    cityId,
    cityName,
    isExpenseON,
    maxExpenseAmount,
    apiKey,
    socieatyLogo,
    currency,
    member,
    emergency,
    message,
    status,
    facultyUsername,
    facultyPassword,
    facultyToken,
    facultyTokenData,
    viewDialogApiCall,
    viewDialog,
  ];
}

// Entity for a family member.
class MemberEntity extends Equatable {
  final String? userId;
  final String? userFirstName;
  final String? userLastName;
  final String? userMobile;
  final String? memberDateOfBirth;
  final String? memberAge;
  final String? memberRelationName;
  final String? userStatus;
  final String? memberStatus;

  const MemberEntity({
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.userMobile,
    this.memberDateOfBirth,
    this.memberAge,
    this.memberRelationName,
    this.userStatus,
    this.memberStatus,
  });

  @override
  List<Object?> get props => [
    userId,
    userFirstName,
    userLastName,
    userMobile,
    memberDateOfBirth,
    memberAge,
    memberRelationName,
    userStatus,
    memberStatus,
  ];
}

// Entity for an emergency contact.
class EmergencyEntity extends Equatable {
  final String? emergencyContactId;
  final String? personName;
  final String? personMobile;
  final String? relationId;
  final String? relation;

  const EmergencyEntity({
    this.emergencyContactId,
    this.personName,
    this.personMobile,
    this.relationId,
    this.relation,
  });

  @override
  List<Object?> get props => [
    emergencyContactId,
    personName,
    personMobile,
    relationId,
    relation,
  ];
}
