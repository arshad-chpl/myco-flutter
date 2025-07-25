// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/dashboard/data/models/my_unit_response.dart';
import 'package:myco_flutter/features/my_profile/domain/entites/profile_entity.dart';

part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: 'apply_resignation')
  bool? applyResignation;
  @JsonKey(name: 'block_status')
  String? blockStatus;
  @JsonKey(name: 'profileMenu')
  List<ProfileMenu>? profileMenu;
  @JsonKey(name: 'praise_list')
  List<dynamic>? praiseList;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'level_id')
  String? levelId;
  @JsonKey(name: 'level_name')
  String? levelName;
  @JsonKey(name: 'parent_level_id')
  String? parentLevelId;
  @JsonKey(name: 'user_first_name')
  String? userFirstName;
  @JsonKey(name: 'user_last_name')
  String? userLastName;
  @JsonKey(name: 'branch_name')
  String? branchName;
  @JsonKey(name: 'department_name')
  String? departmentName;
  @JsonKey(name: 'company_employee_id')
  String? companyEmployeeId;
  @JsonKey(name: 'sub_department_id')
  String? subDepartmentId;
  @JsonKey(name: 'sub_department_name')
  String? subDepartmentName;
  @JsonKey(name: 'designation')
  String? designation;
  @JsonKey(name: 'job_description')
  String? jobDescription;
  @JsonKey(name: 'user_job_description')
  String? userJobDescription;
  @JsonKey(name: 'short_name')
  String? shortName;
  @JsonKey(name: 'user_face_data')
  String? userFaceData;
  @JsonKey(name: 'face_added_date')
  String? faceAddedDate;
  @JsonKey(name: 'face_data_image_two')
  String? faceDataImageTwo;
  @JsonKey(name: 'face_data_image')
  String? faceDataImage;
  @JsonKey(name: 'face_data_image_two_ios')
  String? faceDataImageTwoIos;
  @JsonKey(name: 'face_data_image_ios')
  String? faceDataImageIos;
  @JsonKey(name: 'reporting_persons')
  List<dynamic>? reportingPersons;
  @JsonKey(name: 'reporting_person_id')
  String? reportingPersonId;
  @JsonKey(name: 'reporting_person')
  String? reportingPerson;
  @JsonKey(name: 'reporting_person_level_name')
  String? reportingPersonLevelName;
  @JsonKey(name: 'reporting_person_user_designation')
  String? reportingPersonUserDesignation;
  @JsonKey(name: 'reporting_person_profile_pic')
  String? reportingPersonProfilePic;
  @JsonKey(name: 'reporting_short_name')
  String? reportingShortName;
  @JsonKey(name: 'sister_company_data')
  SisterCompanyData? sisterCompanyData;
  @JsonKey(name: 'user_full_name')
  String? userFullName;
  @JsonKey(name: 'user_profile_pic')
  String? userProfilePic;
  @JsonKey(name: 'user_mobile')
  String? userMobile;
  @JsonKey(name: 'user_email')
  String? userEmail;
  @JsonKey(name: 'personal_email')
  String? personalEmail;
  @JsonKey(name: 'alt_mobile')
  String? altMobile;
  @JsonKey(name: 'emergency_number')
  String? emergencyNumber;
  @JsonKey(name: 'whatsapp_number')
  String? whatsappNumber;
  @JsonKey(name: 'employee_id')
  String? employeeId;
  @JsonKey(name: 'member_date_of_birth')
  DateTime? memberDateOfBirth;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'user_token')
  String? userToken;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'marital_status')
  String? maritalStatus;
  @JsonKey(name: 'total_family_members')
  String? totalFamilyMembers;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: 'public_mobile')
  bool? publicMobile;
  @JsonKey(name: 'member_access_denied')
  bool? memberAccessDenied;
  @JsonKey(name: 'chat_access_denied')
  bool? chatAccessDenied;
  @JsonKey(name: 'timline_access_denied')
  bool? timlineAccessDenied;
  @JsonKey(name: 'personal')
  List<Personal>? personal;
  @JsonKey(name: 'employeement_skills')
  List<EmployeementSkill>? employeementSkills;
  @JsonKey(name: 'contact')
  List<Contact>? contact;
  @JsonKey(name: 'experience')
  List<dynamic>? experience;
  @JsonKey(name: 'education')
  List<dynamic>? education;
  @JsonKey(name: 'social_link')
  List<SocialLink>? socialLink;
  @JsonKey(name: 'my_team')
  List<MyTeam>? myTeam;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

 ProfileEntity toEntity() => ProfileEntity(
   applyResignation: applyResignation,
   blockStatus: blockStatus,
   profileMenu: profileMenu?.map((e) => e.toEntity()).toList(),
   praiseList: praiseList,
   userId: userId,
   levelId: levelId,
   levelName: levelName,
   parentLevelId: parentLevelId,
   userFirstName: userFirstName,
   userLastName: userLastName,
   branchName: branchName,
   departmentName: departmentName,
   companyEmployeeId: companyEmployeeId,
   subDepartmentId: subDepartmentId,
   subDepartmentName: subDepartmentName,
   designation: designation,
   jobDescription: jobDescription,
   userJobDescription: userJobDescription,
   shortName: shortName,
   userFaceData: userFaceData,
   faceAddedDate: faceAddedDate,
   faceDataImageTwo: faceDataImageTwo,
   faceDataImage: faceDataImage,
   faceDataImageTwoIos: faceDataImageTwoIos,
   faceDataImageIos: faceDataImageIos,
   reportingPersons: reportingPersons,
   reportingPersonId: reportingPersonId,
   reportingPerson: reportingPerson,
   reportingPersonLevelName: reportingPersonLevelName,
   reportingPersonUserDesignation: reportingPersonUserDesignation,
   reportingPersonProfilePic: reportingPersonProfilePic,
   reportingShortName: reportingShortName,
   sisterCompanyData: sisterCompanyData?.toEntity(),
   userFullName: userFullName,
   userProfilePic: userProfilePic,
   userMobile: userMobile,
   userEmail: userEmail,
   personalEmail: personalEmail,
   altMobile: altMobile,
   emergencyNumber: emergencyNumber,
   whatsappNumber: whatsappNumber,
   employeeId: employeeId,
   memberDateOfBirth: memberDateOfBirth,
   bloodGroup: bloodGroup,
   gender: gender,
   userToken: userToken,
   countryCode: countryCode,
   maritalStatus: maritalStatus,
   totalFamilyMembers: totalFamilyMembers,
   nationality: nationality,
   publicMobile: publicMobile,
   memberAccessDenied: memberAccessDenied,
   chatAccessDenied: chatAccessDenied,
   timlineAccessDenied: timlineAccessDenied,
   personal: personal?.map((e) => e.toEntity()).toList(),
   employeementSkills: employeementSkills?.map((e) => e.toEntity()).toList(),
   contact: contact?.map((e) => e.toEntity()).toList(),
   experience: experience,
   education: education,
   socialLink: socialLink?.map((e) => e.toEntity()).toList(),
   myTeam: myTeam?.map((e) => e.toEntity()).toList(),
   message: message,
   status: status,
 );
}

@JsonSerializable()
class Contact {
  @JsonKey(name: 'user_mobile')
  String? userMobile;
  @JsonKey(name: 'alt_mobile')
  String? altMobile;
  @JsonKey(name: 'whatsapp_number')
  String? whatsappNumber;
  @JsonKey(name: 'emergency_number')
  String? emergencyNumber;
  @JsonKey(name: 'user_email')
  String? userEmail;
  @JsonKey(name: 'personal_email')
  String? personalEmail;
  @JsonKey(name: 'current_address')
  String? currentAddress;
  @JsonKey(name: 'permanent_address')
  String? permanentAddress;
  @JsonKey(name: 'current_address_lat')
  String? currentAddressLat;
  @JsonKey(name: 'current_address_long')
  String? currentAddressLong;
  @JsonKey(name: 'permanent_address_lat')
  String? permanentAddressLat;
  @JsonKey(name: 'permanent_address_long')
  String? permanentAddressLong;
  @JsonKey(name: 'public_mobile')
  bool? publicMobile;
  @JsonKey(name: 'user_mobile_country_code')
  String? userMobileCountryCode;
  @JsonKey(name: 'without_country_code_user_mobile')
  String? withoutCountryCodeUserMobile;
  @JsonKey(name: 'alt_mobile_country_code')
  String? altMobileCountryCode;
  @JsonKey(name: 'without_country_code_alt_mobile')
  String? withoutCountryCodeAltMobile;
  @JsonKey(name: 'whatsapp_number_country_code')
  String? whatsappNumberCountryCode;
  @JsonKey(name: 'without_country_code_whatsapp_number')
  String? withoutCountryCodeWhatsappNumber;
  @JsonKey(name: 'emergency_number_country_code')
  String? emergencyNumberCountryCode;
  @JsonKey(name: 'without_country_code_emergency_number')
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

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

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
class EmployeementSkill {
  @JsonKey(name: 'designation')
  String? designation;
  @JsonKey(name: 'employee_id')
  String? employeeId;
  @JsonKey(name: 'employment_type')
  String? employmentType;
  @JsonKey(name: 'joining_date')
  DateTime? joiningDate;
  @JsonKey(name: 'joining_date_view')
  String? joiningDateView;
  @JsonKey(name: 'probation_period_end_date')
  String? probationPeriodEndDate;
  @JsonKey(name: 'company_experience')
  String? companyExperience;
  @JsonKey(name: 'total_experience')
  String? totalExperience;
  @JsonKey(name: 'insurance_number')
  String? insuranceNumber;
  @JsonKey(name: 'insurance_company_name')
  String? insuranceCompanyName;
  @JsonKey(name: 'insurance_expire_date')
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

  factory EmployeementSkill.fromJson(Map<String, dynamic> json) => _$EmployeementSkillFromJson(json);

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
class Personal {
  @JsonKey(name: 'member_date_of_birth')
  DateTime? memberDateOfBirth;
  @JsonKey(name: 'wedding_anniversary_date')
  DateTime? weddingAnniversaryDate;
  @JsonKey(name: 'blood_group')
  String? bloodGroup;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'marital_status')
  String? maritalStatus;
  @JsonKey(name: 'marital_status_st')
  String? maritalStatusSt;
  @JsonKey(name: 'total_family_members')
  String? totalFamilyMembers;
  @JsonKey(name: 'nationality')
  String? nationality;
  @JsonKey(name: 'member_date_of_birth_view')
  String? memberDateOfBirthView;
  @JsonKey(name: 'wedding_anniversary_date_view')
  String? weddingAnniversaryDateView;
  @JsonKey(name: 'intrest_hobbies')
  String? intrestHobbies;
  @JsonKey(name: 'professional_skills')
  String? professionalSkills;
  @JsonKey(name: 'special_skills')
  String? specialSkills;
  @JsonKey(name: 'language_known')
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

  factory Personal.fromJson(Map<String, dynamic> json) => _$PersonalFromJson(json);

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

@JsonSerializable()
class ProfileMenu {
  @JsonKey(name: 'profile_menu_id')
  String? profileMenuId;
  @JsonKey(name: 'profile_menu_name')
  String? profileMenuName;
  @JsonKey(name: 'menu_click')
  String? menuClick;
  @JsonKey(name: 'profile_menu_photo')
  String? profileMenuPhoto;
  @JsonKey(name: 'profile_menu_photo_new')
  String? profileMenuPhotoNew;
  @JsonKey(name: 'access_type')
  String? accessType;
  @JsonKey(name: 'language_key_name')
  String? languageKeyName;

  ProfileMenu({
    this.profileMenuId,
    this.profileMenuName,
    this.menuClick,
    this.profileMenuPhoto,
    this.profileMenuPhotoNew,
    this.accessType,
    this.languageKeyName,
  });

  factory ProfileMenu.fromJson(Map<String, dynamic> json) => _$ProfileMenuFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileMenuToJson(this);

  ProfileMenuEntity toEntity() => ProfileMenuEntity(
    profileMenuId: profileMenuId,
    profileMenuName: profileMenuName,
    menuClick: menuClick,
    profileMenuPhoto: profileMenuPhoto,
    profileMenuPhotoNew: profileMenuPhotoNew,
    accessType: accessType,
    languageKeyName: languageKeyName,
  );

}

@JsonSerializable()
class SisterCompanyData {
  @JsonKey(name: 'sister_company_id')
  String? sisterCompanyId;
  @JsonKey(name: 'sister_company_name')
  String? sisterCompanyName;
  @JsonKey(name: 'sister_company_address')
  String? sisterCompanyAddress;
  @JsonKey(name: 'sister_company_phone')
  String? sisterCompanyPhone;
  @JsonKey(name: 'sister_company_email')
  String? sisterCompanyEmail;
  @JsonKey(name: 'sister_company_gst_no')
  String? sisterCompanyGstNo;
  @JsonKey(name: 'sister_company_website')
  String? sisterCompanyWebsite;
  @JsonKey(name: 'sister_company_stamp')
  String? sisterCompanyStamp;
  @JsonKey(name: 'sister_company_logo')
  String? sisterCompanyLogo;
  @JsonKey(name: 'sister_company_pincode')
  String? sisterCompanyPincode;
  @JsonKey(name: 'sister_company_pan')
  String? sisterCompanyPan;
  @JsonKey(name: 'sister_company_latitude')
  String? sisterCompanyLatitude;
  @JsonKey(name: 'sister_company_longitude')
  String? sisterCompanyLongitude;

  SisterCompanyData({
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

  factory SisterCompanyData.fromJson(Map<String, dynamic> json) => _$SisterCompanyDataFromJson(json);

  Map<String, dynamic> toJson() => _$SisterCompanyDataToJson(this);

  SisterCompanyDataEntity toEntity() => SisterCompanyDataEntity(
    sisterCompanyId: sisterCompanyId,
    sisterCompanyName: sisterCompanyName,
    sisterCompanyAddress: sisterCompanyAddress,
    sisterCompanyPhone: sisterCompanyPhone,
    sisterCompanyEmail: sisterCompanyEmail,
    sisterCompanyGstNo: sisterCompanyGstNo,
    sisterCompanyWebsite: sisterCompanyWebsite,
    sisterCompanyStamp: sisterCompanyStamp,
    sisterCompanyLogo: sisterCompanyLogo,
    sisterCompanyPincode: sisterCompanyPincode,
    sisterCompanyPan: sisterCompanyPan,
    sisterCompanyLatitude: sisterCompanyLatitude,
    sisterCompanyLongitude: sisterCompanyLongitude,
  );

}

@JsonSerializable()
class SocialLink {
  @JsonKey(name: 'facebook')
  String? facebook;
  @JsonKey(name: 'instagram')
  String? instagram;
  @JsonKey(name: 'linkedin')
  String? linkedin;
  @JsonKey(name: 'twitter')
  String? twitter;
  @JsonKey(name: 'whatsapp_number')
  String? whatsappNumber;
  @JsonKey(name: 'whatsapp_number_country_code')
  String? whatsappNumberCountryCode;
  @JsonKey(name: 'whatsapp_number_without_country_code')
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

  factory SocialLink.fromJson(Map<String, dynamic> json) => _$SocialLinkFromJson(json);

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
