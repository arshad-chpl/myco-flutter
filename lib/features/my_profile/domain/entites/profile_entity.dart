// domain/entities/profile_entity.dart

// Top-level Profile Entity
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';

class ProfileEntity {
  final bool? applyResignation;
  final String? blockStatus;
  final List<ProfileMenuEntity>? profileMenu;
  final List<dynamic>? praiseList;
  final String? userId;
  final String? levelId;
  final String? levelName;
  final String? parentLevelId;
  final String? userFirstName;
  final String? userLastName;
  final String? branchName;
  final String? departmentName;
  final String? companyEmployeeId;
  final String? subDepartmentId;
  final String? subDepartmentName;
  final String? designation;
  final String? jobDescription;
  final String? userJobDescription;
  final String? shortName;
  final String? userFaceData;
  final String? faceAddedDate;
  final String? faceDataImageTwo;
  final String? faceDataImage;
  final String? faceDataImageTwoIos;
  final String? faceDataImageIos;
  final List<dynamic>? reportingPersons;
  final String? reportingPersonId;
  final String? reportingPerson;
  final String? reportingPersonLevelName;
  final String? reportingPersonUserDesignation;
  final String? reportingPersonProfilePic;
  final String? reportingShortName;
  final SisterCompanyDataEntity? sisterCompanyData;
  final String? userFullName;
  final String? userProfilePic;
  final String? userMobile;
  final String? userEmail;
  final String? personalEmail;
  final String? altMobile;
  final String? emergencyNumber;
  final String? whatsappNumber;
  final String? employeeId;
  final DateTime? memberDateOfBirth;
  final String? bloodGroup;
  final String? gender;
  final String? userToken;
  final String? countryCode;
  final String? maritalStatus;
  final String? totalFamilyMembers;
  final String? nationality;
  final bool? publicMobile;
  final bool? memberAccessDenied;
  final bool? chatAccessDenied;
  final bool? timlineAccessDenied;
  final List<PersonalEntity>? personal;
  final List<EmployeementSkillEntity>? employeementSkills;
  final List<ContactEntity>? contact;
  final List<dynamic>? experience;
  final List<dynamic>? education;
  final List<SocialLinkEntity>? socialLink;
  final List<MyTeamEntity>? myTeam;
  final String? message;
  final String? status;

  ProfileEntity({
    this.applyResignation,
    this.blockStatus,
    this.profileMenu,
    this.praiseList,
    this.userId,
    this.levelId,
    this.levelName,
    this.parentLevelId,
    this.userFirstName,
    this.userLastName,
    this.branchName,
    this.departmentName,
    this.companyEmployeeId,
    this.subDepartmentId,
    this.subDepartmentName,
    this.designation,
    this.jobDescription,
    this.userJobDescription,
    this.shortName,
    this.userFaceData,
    this.faceAddedDate,
    this.faceDataImageTwo,
    this.faceDataImage,
    this.faceDataImageTwoIos,
    this.faceDataImageIos,
    this.reportingPersons,
    this.reportingPersonId,
    this.reportingPerson,
    this.reportingPersonLevelName,
    this.reportingPersonUserDesignation,
    this.reportingPersonProfilePic,
    this.reportingShortName,
    this.sisterCompanyData,
    this.userFullName,
    this.userProfilePic,
    this.userMobile,
    this.userEmail,
    this.personalEmail,
    this.altMobile,
    this.emergencyNumber,
    this.whatsappNumber,
    this.employeeId,
    this.memberDateOfBirth,
    this.bloodGroup,
    this.gender,
    this.userToken,
    this.countryCode,
    this.maritalStatus,
    this.totalFamilyMembers,
    this.nationality,
    this.publicMobile,
    this.memberAccessDenied,
    this.chatAccessDenied,
    this.timlineAccessDenied,
    this.personal,
    this.employeementSkills,
    this.contact,
    this.experience,
    this.education,
    this.socialLink,
    this.myTeam,
    this.message,
    this.status,
  });


}

// Nested Entities (matching your inner classes with Entity suffix)

class ContactEntity {
  final String? userMobile;
  final String? altMobile;
  final String? whatsappNumber;
  final String? emergencyNumber;
  final String? userEmail;
  final String? personalEmail;
  final String? currentAddress;
  final String? permanentAddress;
  final String? currentAddressLat;
  final String? currentAddressLong;
  final String? permanentAddressLat;
  final String? permanentAddressLong;
  final bool? publicMobile;
  final String? userMobileCountryCode;
  final String? withoutCountryCodeUserMobile;
  final String? altMobileCountryCode;
  final String? withoutCountryCodeAltMobile;
  final String? whatsappNumberCountryCode;
  final String? withoutCountryCodeWhatsappNumber;
  final String? emergencyNumberCountryCode;
  final String? withoutCountryCodeEmergencyNumber;

  ContactEntity({
    this.userMobile,
    this.altMobile,
    this.whatsappNumber,
    this.emergencyNumber,
    this.userEmail,
    this.personalEmail,
    this.currentAddress,
    this.permanentAddress,
    this.currentAddressLat,
    this.currentAddressLong,
    this.permanentAddressLat,
    this.permanentAddressLong,
    this.publicMobile,
    this.userMobileCountryCode,
    this.withoutCountryCodeUserMobile,
    this.altMobileCountryCode,
    this.withoutCountryCodeAltMobile,
    this.whatsappNumberCountryCode,
    this.withoutCountryCodeWhatsappNumber,
    this.emergencyNumberCountryCode,
    this.withoutCountryCodeEmergencyNumber,
  });
}

class EmployeementSkillEntity {
  final String? designation;
  final String? employeeId;
  final String? employmentType;
  final DateTime? joiningDate;
  final String? joiningDateView;
  final String? probationPeriodEndDate;
  final String? companyExperience;
  final String? totalExperience;
  final String? insuranceNumber;
  final String? insuranceCompanyName;
  final String? insuranceExpireDate;

  EmployeementSkillEntity({
    this.designation,
    this.employeeId,
    this.employmentType,
    this.joiningDate,
    this.joiningDateView,
    this.probationPeriodEndDate,
    this.companyExperience,
    this.totalExperience,
    this.insuranceNumber,
    this.insuranceCompanyName,
    this.insuranceExpireDate,
  });
}

class PersonalEntity {
  final DateTime? memberDateOfBirth;
  final DateTime? weddingAnniversaryDate;
  final String? bloodGroup;
  final String? gender;
  final String? maritalStatus;
  final String? maritalStatusSt;
  final String? totalFamilyMembers;
  final String? nationality;
  final String? memberDateOfBirthView;
  final String? weddingAnniversaryDateView;
  final String? intrestHobbies;
  final String? professionalSkills;
  final String? specialSkills;
  final String? languageKnown;

  PersonalEntity({
    this.memberDateOfBirth,
    this.weddingAnniversaryDate,
    this.bloodGroup,
    this.gender,
    this.maritalStatus,
    this.maritalStatusSt,
    this.totalFamilyMembers,
    this.nationality,
    this.memberDateOfBirthView,
    this.weddingAnniversaryDateView,
    this.intrestHobbies,
    this.professionalSkills,
    this.specialSkills,
    this.languageKnown,
  });
}

class ProfileMenuEntity {
  final String? profileMenuId;
  final String? profileMenuName;
  final String? menuClick;
  final String? profileMenuPhoto;
  final String? profileMenuPhotoNew;
  final String? accessType;
  final String? languageKeyName;

  ProfileMenuEntity({
    this.profileMenuId,
    this.profileMenuName,
    this.menuClick,
    this.profileMenuPhoto,
    this.profileMenuPhotoNew,
    this.accessType,
    this.languageKeyName,
  });
}

class SisterCompanyDataEntity {
  final String? sisterCompanyId;
  final String? sisterCompanyName;
  final String? sisterCompanyAddress;
  final String? sisterCompanyPhone;
  final String? sisterCompanyEmail;
  final String? sisterCompanyGstNo;
  final String? sisterCompanyWebsite;
  final String? sisterCompanyStamp;
  final String? sisterCompanyLogo;
  final String? sisterCompanyPincode;
  final String? sisterCompanyPan;
  final String? sisterCompanyLatitude;
  final String? sisterCompanyLongitude;

  SisterCompanyDataEntity({
    this.sisterCompanyId,
    this.sisterCompanyName,
    this.sisterCompanyAddress,
    this.sisterCompanyPhone,
    this.sisterCompanyEmail,
    this.sisterCompanyGstNo,
    this.sisterCompanyWebsite,
    this.sisterCompanyStamp,
    this.sisterCompanyLogo,
    this.sisterCompanyPincode,
    this.sisterCompanyPan,
    this.sisterCompanyLatitude,
    this.sisterCompanyLongitude,
  });
}

class SocialLinkEntity {
  final String? facebook;
  final String? instagram;
  final String? linkedin;
  final String? twitter;
  final String? whatsappNumber;
  final String? whatsappNumberCountryCode;
  final String? whatsappNumberWithoutCountryCode;

  SocialLinkEntity({
    this.facebook,
    this.instagram,
    this.linkedin,
    this.twitter,
    this.whatsappNumber,
    this.whatsappNumberCountryCode,
    this.whatsappNumberWithoutCountryCode,
  });

}