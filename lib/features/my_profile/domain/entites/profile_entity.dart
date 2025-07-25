import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';

class ProfileModelEntity {
  final List<ProfileMenuEntity>? profileMenu;
  final List<PraiseListEntity>? praiseList;
  final List<PersonalEntity>? personal;
  final List<ReportingPersonEntity>? reportingPersons;
  final List<EmployeementSkillEntity>? employeementSkills;
  final List<ContactEntity>? contact;
  final List<SocialLinkEntity>? socialLink;
  final List<MyTeamEntity>? myTeam;
  final List<ExperienceEntity>? experience;
  final List<EducationEntity>? education;
  final String? userId;
  final String? employeeId;
  final String? shortName;
  final String? levelId;
  final String? levelName;
  final String? parentLevelId;
  final String? designation;
  final String? userProfilePic;
  final String? userFullName;
  final String? userMobile;
  final String? userEmail;
  final String? gender;
  final String? userFirstName;
  final String? faceDataImage;
  final String? faceDataImageTwo;
  final String? userLastName;
  final String? subDepartmentId;
  final String? subDepartmentName;
  final bool? publicMobile;
  final String? countryCode;
  final String? userToken;
  final String? message;
  final String? status;
  final String? blockStatus;
  final String? branchName;
  final String? departmentName;
  final bool? applyResignation;
  final String? jobDescription;
  final String? userJobDescription;

  ProfileModelEntity({
    this.profileMenu,
    this.praiseList,
    this.personal,
    this.reportingPersons,
    this.employeementSkills,
    this.contact,
    this.socialLink,
    this.myTeam,
    this.experience,
    this.education,
    this.userId,
    this.employeeId,
    this.shortName,
    this.levelId,
    this.levelName,
    this.parentLevelId,
    this.designation,
    this.userProfilePic,
    this.userFullName,
    this.userMobile,
    this.userEmail,
    this.gender,
    this.userFirstName,
    this.faceDataImage,
    this.faceDataImageTwo,
    this.userLastName,
    this.subDepartmentId,
    this.subDepartmentName,
    this.publicMobile,
    this.countryCode,
    this.userToken,
    this.message,
    this.status,
    this.blockStatus,
    this.branchName,
    this.departmentName,
    this.applyResignation,
    this.jobDescription,
    this.userJobDescription,
  });
}

class ProfileMenuEntity {
  final String? profileMenuId;
  final String? profileMenuName;
  final String? menuClick;
  final String? languageKeyName;
  final String? profileMenuPhoto;
  final String? profileMenuPhotoNew;
  final String? accessType;

  // These fields are local UI state and should be maintained only in UI layer,
  // so you can exclude them here or keep if necessary for your domain logic
  final bool isLocalMenu;
  final int localImg;

  const ProfileMenuEntity({
    this.profileMenuId,
    this.profileMenuName,
    this.menuClick,
    this.languageKeyName,
    this.profileMenuPhoto,
    this.profileMenuPhotoNew,
    this.accessType,
    this.isLocalMenu = false,
    this.localImg = 0,
  });
}

class ReportingPersonEntity {
  final String? reportingPersonId;
  final String? reportingPerson;
  final String? reportingPersonLevelName;
  final String? reportingPersonUserDesignation;
  final String? reportingPersonProfilePic;
  final String? reportingShortName;

  const ReportingPersonEntity({
    this.reportingPersonId,
    this.reportingPerson,
    this.reportingPersonLevelName,
    this.reportingPersonUserDesignation,
    this.reportingPersonProfilePic,
    this.reportingShortName,
  });
}

class PraiseListEntity {
  final String? employeePraiseTypeId;
  final String? employeePraiseName;
  final String? employeePraiseContent;
  final String? employeePraiseNameColorCode;
  final String? employeePraiseImage;
  final String? total;

  const PraiseListEntity({
    this.employeePraiseTypeId,
    this.employeePraiseName,
    this.employeePraiseContent,
    this.employeePraiseNameColorCode,
    this.employeePraiseImage,
    this.total,
  });
}

class PersonalEntity {
  final String? memberDateOfBirth;
  final String? weddingAnniversaryDate;
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

  const PersonalEntity({
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

// class MyTeamEntity {
//   final String? userId;
//   final String? levelId;
//   final String? levelName;
//   final String? userFullName;
//   final String? userDesignation;
//   final String? userProfilePic;
//   final bool? isPresent;
//   final bool? isLeaveFull;
//   final bool? isLeaveHalf;
//   final bool? isBreak;
//   final String? statusView;
//   final String? shortName;
//
//   const MyTeamEntity({
//     this.userId,
//     this.levelId,
//     this.levelName,
//     this.userFullName,
//     this.userDesignation,
//     this.userProfilePic,
//     this.isPresent,
//     this.isLeaveFull,
//     this.isLeaveHalf,
//     this.isBreak,
//     this.statusView,
//     this.shortName,
//   });
// }

class ExperienceEntity {
  final String? employeeExperienceId;
  final String? designation;
  final String? expCompanyName;
  final String? workFrom;
  final String? companyLocation;

  const ExperienceEntity({
    this.employeeExperienceId,
    this.designation,
    this.expCompanyName,
    this.workFrom,
    this.companyLocation,
  });
}

class EducationEntity {
  final String? employeeAchievementId;
  final String? achievementName;
  final String? achievementDate;
  final String? universityBoardName;
  final String? archiType;

  const EducationEntity({
    this.employeeAchievementId,
    this.achievementName,
    this.achievementDate,
    this.universityBoardName,
    this.archiType,
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

  const EmployeementSkillEntity({
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

  const ContactEntity({
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

class SocialLinkEntity {
  final String? facebook;
  final String? instagram;
  final String? linkedin;
  final String? twitter;
  final String? whatsappNumber;
  final String? whatsappNumberCountryCode;
  final String? whatsappNumberWithoutCountryCode;

  const SocialLinkEntity({
    this.facebook,
    this.instagram,
    this.linkedin,
    this.twitter,
    this.whatsappNumber,
    this.whatsappNumberCountryCode,
    this.whatsappNumberWithoutCountryCode,
  });
}

