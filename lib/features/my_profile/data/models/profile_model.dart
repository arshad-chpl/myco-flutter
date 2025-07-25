import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/dashboard/data/models/my_unit_response.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';

// Import placeholder models (you would replace these with your actual model imports)

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel{
  @JsonKey(name: 'profileMenu')
  final List<ProfileMenu>? profileMenu;

  @JsonKey(name: 'praise_list')
  final List<PraiseList>? praiseList;

  final List<Personal>? personal;

  @JsonKey(name: 'reporting_persons')
  final List<ReportingPerson>? reportingPersons;

  @JsonKey(name: 'employeement_skills')
  final List<EmployeementSkill>? employeementSkills;

  final List<Contact>? contact;

  @JsonKey(name: 'social_link')
  final List<SocialLink>? socialLink;

  @JsonKey(name: 'my_team')
  final List<MyTeam>? myTeam;

  final List<Experience>? experience;
  final List<Education>? education;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'company_employee_id')
  final String? employeeId;

  @JsonKey(name: 'short_name')
  final String? shortName;

  @JsonKey(name: 'level_id')
  final String? levelId;

  @JsonKey(name: 'level_name')
  final String? levelName;

  @JsonKey(name: 'parent_level_id')
  final String? parentLevelId;

  final String? designation;

  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;

  @JsonKey(name: 'user_full_name')
  final String? userFullName;

  @JsonKey(name: 'user_mobile')
  final String? userMobile;

  @JsonKey(name: 'user_email')
  final String? userEmail;

  final String? gender;

  @JsonKey(name: 'user_first_name')
  final String? userFirstName;

  @JsonKey(name: 'face_data_image')
  final String? faceDataImage;

  @JsonKey(name: 'face_data_image_two')
  final String? faceDataImageTwo;

  @JsonKey(name: 'user_last_name')
  final String? userLastName;

  @JsonKey(name: 'sub_department_id')
  final String? subDepartmentId;

  @JsonKey(name: 'sub_department_name')
  final String? subDepartmentName;

  @JsonKey(name: 'public_mobile')
  final bool? publicMobile;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'user_token')
  final String? userToken;

  final String? message;
  final String? status;

  @JsonKey(name: 'block_status')
  final String? blockStatus;

  @JsonKey(name: 'branch_name')
  final String? branchName;

  @JsonKey(name: 'department_name')
  final String? departmentName;

  @JsonKey(name: 'apply_resignation')
  final bool? applyResignation;

  @JsonKey(name: 'job_description')
  final String? jobDescription;

  @JsonKey(name: 'user_job_description')
  final String? userJobDescription;

  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  ProfileModelEntity toEntity() => ProfileModelEntity(
    profileMenu: profileMenu?.map((e) => e.toEntity()).toList(),
    praiseList: praiseList?.map((e) => e.toEntity()).toList(),
    personal: personal?.map((e) => e.toEntity()).toList(),
    reportingPersons: reportingPersons?.map((e) => e.toEntity()).toList(),
    employeementSkills: employeementSkills?.map((e) => e.toEntity()).toList(),
    contact: contact?.map((e) => e.toEntity()).toList(),
    socialLink: socialLink?.map((e) => e.toEntity()).toList(),
    myTeam: myTeam?.map((e) => e.toEntity()).toList(),
    experience: experience?.map((e) => e.toEntity()).toList(),
    education: education?.map((e) => e.toEntity()).toList(),
    userId: userId,
    employeeId: employeeId,
    shortName: shortName,
    levelId: levelId,
    levelName: levelName,
    parentLevelId: parentLevelId,
    designation: designation,
    userProfilePic: userProfilePic,
    userFullName: userFullName,
    userMobile: userMobile,
    userEmail: userEmail,
    gender: gender,
    userFirstName: userFirstName,
    faceDataImage: faceDataImage,
    faceDataImageTwo: faceDataImageTwo,
    userLastName: userLastName,
    subDepartmentId: subDepartmentId,
    subDepartmentName: subDepartmentName,
    publicMobile: publicMobile,
    countryCode: countryCode,
    userToken: userToken,
    message: message,
    status: status,
    blockStatus: blockStatus,
    branchName: branchName,
    departmentName: departmentName,
    applyResignation: applyResignation,
    jobDescription: jobDescription,
    userJobDescription: userJobDescription,
  );
}

@JsonSerializable()
class ProfileMenu {
  @JsonKey(name: 'profile_menu_id')
  final String? profileMenuId;

  @JsonKey(name: 'profile_menu_name')
  final String? profileMenuName;

  @JsonKey(name: 'menu_click')
  final String? menuClick;

  @JsonKey(name: 'language_key_name')
  final String? languageKeyName;

  @JsonKey(name: 'profile_menu_photo')
  final String? profileMenuPhoto;

  @JsonKey(name: 'profile_menu_photo_new')
  final String? profileMenuPhotoNew;

  @JsonKey(name: 'access_type')
  final String? accessType;

  // These fields are not from JSON and are used for local UI state
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isLocalMenu;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final int localImg;

  ProfileMenu({
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

  factory ProfileMenu.fromJson(Map<String, dynamic> json) =>
      _$ProfileMenuFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileMenuToJson(this);

  ProfileMenuEntity toEntity() => ProfileMenuEntity(
    profileMenuId: profileMenuId,
    profileMenuName: profileMenuName,
    menuClick: menuClick,
    languageKeyName: languageKeyName,
    profileMenuPhoto: profileMenuPhoto,
    profileMenuPhotoNew: profileMenuPhotoNew,
    accessType: accessType,
    isLocalMenu: isLocalMenu,
    localImg: localImg,
  );
}

@JsonSerializable()
class ReportingPerson {
  @JsonKey(name: 'reporting_person_id')
  final String? reportingPersonId;

  @JsonKey(name: 'reporting_person')
  final String? reportingPerson;

  @JsonKey(name: 'reporting_person_level_name')
  final String? reportingPersonLevelName;

  @JsonKey(name: 'reporting_person_user_designation')
  final String? reportingPersonUserDesignation;

  @JsonKey(name: 'reporting_person_profile_pic')
  final String? reportingPersonProfilePic;

  @JsonKey(name: 'reporting_short_name')
  final String? reportingShortName;

  ReportingPerson({
    this.reportingPersonId,
    this.reportingPerson,
    this.reportingPersonLevelName,
    this.reportingPersonUserDesignation,
    this.reportingPersonProfilePic,
    this.reportingShortName,
  });

  factory ReportingPerson.fromJson(Map<String, dynamic> json) => _$ReportingPersonFromJson(json);
  Map<String, dynamic> toJson() => _$ReportingPersonToJson(this);

  ReportingPersonEntity toEntity() => ReportingPersonEntity(
    reportingPersonId: reportingPersonId,
    reportingPerson: reportingPerson,
    reportingPersonLevelName: reportingPersonLevelName,
    reportingPersonUserDesignation: reportingPersonUserDesignation,
    reportingPersonProfilePic: reportingPersonProfilePic,
    reportingShortName: reportingShortName,
  );
}

@JsonSerializable()
class PraiseList {
  @JsonKey(name: 'employee_praise_type_id')
  final String? employeePraiseTypeId;

  @JsonKey(name: 'employee_praise_name')
  final String? employeePraiseName;

  @JsonKey(name: 'employee_praise_content')
  final String? employeePraiseContent;

  @JsonKey(name: 'employee_praise_name_color_code')
  final String? employeePraiseNameColorCode;

  @JsonKey(name: 'employee_praise_image')
  final String? employeePraiseImage;

  final String? total;

  PraiseList({
    this.employeePraiseTypeId,
    this.employeePraiseName,
    this.employeePraiseContent,
    this.employeePraiseNameColorCode,
    this.employeePraiseImage,
    this.total,
  });

  factory PraiseList.fromJson(Map<String, dynamic> json) =>
      _$PraiseListFromJson(json);
  Map<String, dynamic> toJson() => _$PraiseListToJson(this);

  PraiseListEntity toEntity() => PraiseListEntity(
    employeePraiseTypeId: employeePraiseTypeId,
    employeePraiseName: employeePraiseName,
    employeePraiseContent: employeePraiseContent,
    employeePraiseNameColorCode: employeePraiseNameColorCode,
    employeePraiseImage: employeePraiseImage,
    total: total,
  );
}

@JsonSerializable()
class Personal {
  @JsonKey(name: "member_date_of_birth")
  String? memberDateOfBirth;
  @JsonKey(name: "wedding_anniversary_date")
  String? weddingAnniversaryDate;
  @JsonKey(name: "blood_group")
  String? bloodGroup;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "marital_status")
  String? maritalStatus;
  @JsonKey(name: "marital_status_st")
  String? maritalStatusSt;
  @JsonKey(name: "total_family_members")
  String? totalFamilyMembers;
  @JsonKey(name: "nationality")
  String? nationality;
  @JsonKey(name: "member_date_of_birth_view")
  String? memberDateOfBirthView;
  @JsonKey(name: "wedding_anniversary_date_view")
  String? weddingAnniversaryDateView;
  @JsonKey(name: "intrest_hobbies")
  String? intrestHobbies;
  @JsonKey(name: "professional_skills")
  String? professionalSkills;
  @JsonKey(name: "special_skills")
  String? specialSkills;
  @JsonKey(name: "language_known")
  String? languageKnown;

  Personal({
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

  factory Personal.fromJson(Map<String, dynamic> json) =>
      _$PersonalFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalToJson(this);

  PersonalEntity toEntity() => PersonalEntity(
    memberDateOfBirth: memberDateOfBirth,
    weddingAnniversaryDate: weddingAnniversaryDate,
    bloodGroup: bloodGroup,
    gender: gender,
    maritalStatus: maritalStatus,
    maritalStatusSt: maritalStatusSt,
    totalFamilyMembers: totalFamilyMembers,
    nationality: nationality,
    memberDateOfBirthView: memberDateOfBirthView,
    weddingAnniversaryDateView: weddingAnniversaryDateView,
    intrestHobbies: intrestHobbies,
    professionalSkills: professionalSkills,
    specialSkills: specialSkills,
    languageKnown: languageKnown,
  );
}

// @JsonSerializable()
// class MyTeam {
//   @JsonKey(name: 'user_id')
//   String? userId;
//
//   @JsonKey(name: 'level_id')
//   String? levelId;
//
//   @JsonKey(name: 'level_name')
//   String? levelName;
//
//   @JsonKey(name: 'user_full_name')
//   String? userFullName;
//
//   @JsonKey(name: 'user_designation')
//   String? userDesignation;
//
//   @JsonKey(name: 'user_profile_pic')
//   String? userProfilePic;
//
//   @JsonKey(name: 'is_present')
//   bool? isPresent;
//
//   @JsonKey(name: 'is_leave_full')
//   bool? isLeaveFull;
//
//   @JsonKey(name: 'is_leave_half')
//   bool? isLeaveHalf;
//
//   @JsonKey(name: 'is_break')
//   bool? isBreak;
//
//   @JsonKey(name: 'status_view')
//   String? statusView;
//
//   @JsonKey(name: 'short_name')
//   String? shortName;
//
//   MyTeam({
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
//
//   factory MyTeam.fromJson(Map<String, dynamic> json) => _$MyTeamFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MyTeamToJson(this);
//
//   MyTeamEntity toEntity() => MyTeamEntity(
//     userId: userId,
//     levelId: levelId,
//     levelName: levelName,
//     userFullName: userFullName,
//     userDesignation: userDesignation,
//     userProfilePic: userProfilePic,
//     isPresent: isPresent,
//     isLeaveFull: isLeaveFull,
//     isLeaveHalf: isLeaveHalf,
//     isBreak: isBreak,
//     statusView: statusView,
//     shortName: shortName,
//   );
// }

@JsonSerializable()
class Experience {
  @JsonKey(name: 'employee_experience_id')
  String? employeeExperienceId;

  @JsonKey(name: 'designation')
  String? designation;

  @JsonKey(name: 'exp_company_name')
  String? expCompanyName;

  @JsonKey(name: 'work_from')
  String? workFrom;

  @JsonKey(name: 'company_location')
  String? companyLocation;

  Experience({
    this.employeeExperienceId,
    this.designation,
    this.expCompanyName,
    this.workFrom,
    this.companyLocation,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);

  ExperienceEntity toEntity() => ExperienceEntity(
    employeeExperienceId: employeeExperienceId,
    designation: designation,
    expCompanyName: expCompanyName,
    workFrom: workFrom,
    companyLocation: companyLocation,
  );
}

@JsonSerializable()
class Education {
  @JsonKey(name: 'employee_achievement_id')
  String? employeeAchievementId;

  @JsonKey(name: 'achievement_name')
  String? achievementName;

  @JsonKey(name: 'achievement_date')
  String? achievementDate;

  @JsonKey(name: 'university_board_name')
  String? universityBoardName;

  @JsonKey(name: 'archi_type')
  String? archiType;

  Education({
    this.employeeAchievementId,
    this.achievementName,
    this.achievementDate,
    this.universityBoardName,
    this.archiType,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  EducationEntity toEntity() => EducationEntity(
    employeeAchievementId: employeeAchievementId,
    achievementName: achievementName,
    achievementDate: achievementDate,
    universityBoardName: universityBoardName,
    archiType: archiType,
  );
}

@JsonSerializable()
class EmployeementSkill {
  @JsonKey(name: "designation")
  String? designation;
  @JsonKey(name: "employee_id")
  String? employeeId;
  @JsonKey(name: "employment_type")
  String? employmentType;
  @JsonKey(name: "joining_date")
  DateTime? joiningDate;
  @JsonKey(name: "joining_date_view")
  String? joiningDateView;
  @JsonKey(name: "probation_period_end_date")
  String? probationPeriodEndDate;
  @JsonKey(name: "company_experience")
  String? companyExperience;
  @JsonKey(name: "total_experience")
  String? totalExperience;
  @JsonKey(name: "insurance_number")
  String? insuranceNumber;
  @JsonKey(name: "insurance_company_name")
  String? insuranceCompanyName;
  @JsonKey(name: "insurance_expire_date")
  String? insuranceExpireDate;

  EmployeementSkill({
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

  factory EmployeementSkill.fromJson(Map<String, dynamic> json) =>
      _$EmployeementSkillFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeementSkillToJson(this);

  EmployeementSkillEntity toEntity() => EmployeementSkillEntity(
    designation: designation,
    employeeId: employeeId,
    employmentType: employmentType,
    joiningDate: joiningDate,
    joiningDateView: joiningDateView,
    probationPeriodEndDate: probationPeriodEndDate,
    companyExperience: companyExperience,
    totalExperience: totalExperience,
    insuranceNumber: insuranceNumber,
    insuranceCompanyName: insuranceCompanyName,
    insuranceExpireDate: insuranceExpireDate,
  );
}

@JsonSerializable()
class Contact {
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @JsonKey(name: "alt_mobile")
  String? altMobile;
  @JsonKey(name: "whatsapp_number")
  String? whatsappNumber;
  @JsonKey(name: "emergency_number")
  String? emergencyNumber;
  @JsonKey(name: "user_email")
  String? userEmail;
  @JsonKey(name: "personal_email")
  String? personalEmail;
  @JsonKey(name: "current_address")
  String? currentAddress;
  @JsonKey(name: "permanent_address")
  String? permanentAddress;
  @JsonKey(name: "current_address_lat")
  String? currentAddressLat;
  @JsonKey(name: "current_address_long")
  String? currentAddressLong;
  @JsonKey(name: "permanent_address_lat")
  String? permanentAddressLat;
  @JsonKey(name: "permanent_address_long")
  String? permanentAddressLong;
  @JsonKey(name: "public_mobile")
  bool? publicMobile;
  @JsonKey(name: "user_mobile_country_code")
  String? userMobileCountryCode;
  @JsonKey(name: "without_country_code_user_mobile")
  String? withoutCountryCodeUserMobile;
  @JsonKey(name: "alt_mobile_country_code")
  String? altMobileCountryCode;
  @JsonKey(name: "without_country_code_alt_mobile")
  String? withoutCountryCodeAltMobile;
  @JsonKey(name: "whatsapp_number_country_code")
  String? whatsappNumberCountryCode;
  @JsonKey(name: "without_country_code_whatsapp_number")
  String? withoutCountryCodeWhatsappNumber;
  @JsonKey(name: "emergency_number_country_code")
  String? emergencyNumberCountryCode;
  @JsonKey(name: "without_country_code_emergency_number")
  String? withoutCountryCodeEmergencyNumber;

  Contact({
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

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  ContactEntity toEntity() => ContactEntity(
    userMobile: userMobile,
    altMobile: altMobile,
    whatsappNumber: whatsappNumber,
    emergencyNumber: emergencyNumber,
    userEmail: userEmail,
    personalEmail: personalEmail,
    currentAddress: currentAddress,
    permanentAddress: permanentAddress,
    currentAddressLat: currentAddressLat,
    currentAddressLong: currentAddressLong,
    permanentAddressLat: permanentAddressLat,
    permanentAddressLong: permanentAddressLong,
    publicMobile: publicMobile,
    userMobileCountryCode: userMobileCountryCode,
    withoutCountryCodeUserMobile: withoutCountryCodeUserMobile,
    altMobileCountryCode: altMobileCountryCode,
    withoutCountryCodeAltMobile: withoutCountryCodeAltMobile,
    whatsappNumberCountryCode: whatsappNumberCountryCode,
    withoutCountryCodeWhatsappNumber: withoutCountryCodeWhatsappNumber,
    emergencyNumberCountryCode: emergencyNumberCountryCode,
    withoutCountryCodeEmergencyNumber: withoutCountryCodeEmergencyNumber,
  );
}

@JsonSerializable()
class SocialLink {
  @JsonKey(name: "facebook")
  String? facebook;
  @JsonKey(name: "instagram")
  String? instagram;
  @JsonKey(name: "linkedin")
  String? linkedin;
  @JsonKey(name: "twitter")
  String? twitter;
  @JsonKey(name: "whatsapp_number")
  String? whatsappNumber;
  @JsonKey(name: "whatsapp_number_country_code")
  String? whatsappNumberCountryCode;
  @JsonKey(name: "whatsapp_number_without_country_code")
  String? whatsappNumberWithoutCountryCode;

  SocialLink({
    this.facebook,
    this.instagram,
    this.linkedin,
    this.twitter,
    this.whatsappNumber,
    this.whatsappNumberCountryCode,
    this.whatsappNumberWithoutCountryCode,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkFromJson(json);

  Map<String, dynamic> toJson() => _$SocialLinkToJson(this);

  SocialLinkEntity toEntity() => SocialLinkEntity(
    facebook: facebook,
    instagram: instagram,
    linkedin: linkedin,
    twitter: twitter,
    whatsappNumber: whatsappNumber,
    whatsappNumberCountryCode: whatsappNumberCountryCode,
    whatsappNumberWithoutCountryCode: whatsappNumberWithoutCountryCode,
  );
}
