import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/verify_otp_response_entity.dart';

part 'verify_otp_response_model.g.dart';

// Helper function to decode JSON string
VerifyOtpResponseModel verifyOtpResponseModelFromJson(String str) =>
    VerifyOtpResponseModel.fromJson(json.decode(str));

// The main data model that mirrors the JSON structure
@JsonSerializable()
class VerifyOtpResponseModel {
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'shift_time_id')
  final String? shiftTimeId;
  @JsonKey(name: 'society_id')
  final String? companyId;
  @JsonKey(name: 'user_full_name')
  final String? userFullName;
  @JsonKey(name: 'user_first_name')
  final String? userFirstName;
  @JsonKey(name: 'user_last_name')
  final String? userLastName;
  @JsonKey(name: 'user_mobile')
  final String? userMobile;
  @JsonKey(name: 'user_email')
  final String? userEmail;
  @JsonKey(name: 'user_id_proof')
  final String? userIdProof;
  @JsonKey(name: 'user_type')
  final String? userType;
  @JsonKey(name: 'block_id')
  final String? branchId;
  @JsonKey(name: 'block_name')
  final String? branchName;
  @JsonKey(name: 'floor_name')
  final String? departmentName;
  @JsonKey(name: 'unit_name')
  final String? unitName;
  @JsonKey(name: 'base_url')
  final String? baseUrl;
  @JsonKey(name: 'floor_id')
  final String? departmentId;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'unit_id')
  final String? unitId;
  @JsonKey(name: 'zone_id')
  final String? zoneId;
  @JsonKey(name: 'state_id')
  final String? stateId;
  @JsonKey(name: 'level_id')
  final String? levelId;
  @JsonKey(name: 'unit_status')
  final String? unitStatus;
  @JsonKey(name: 'user_status')
  final String? userStatus;
  @JsonKey(name: 'member_status')
  final String? memberStatus;
  @JsonKey(name: 'public_mobile')
  final String? publicMobile;
  @JsonKey(name: 'visitor_approved')
  final String? visitorApproved;
  @JsonKey(name: 'member_date_of_birth')
  final String? memberDateOfBirth;
  @JsonKey(name: 'wedding_anniversary_date')
  final String? weddingAnniversaryDate;
  @JsonKey(name: 'facebook')
  final String? facebook;
  @JsonKey(name: 'instagram')
  final String? instagram;
  @JsonKey(name: 'linkedin')
  final String? linkedin;
  @JsonKey(name: 'alt_mobile')
  final String? altMobile;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'country_code_alt')
  final String? countryCodeAlt;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'company_address')
  final String? companyAddress;
  @JsonKey(name: 'plot_lattitude')
  final String? plotLattitude;
  @JsonKey(name: 'plot_longitude')
  final String? plotLongitude;
  @JsonKey(name: 'get_business_data')
  final bool? getBusinessData;
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @JsonKey(name: 'is_new_user')
  final bool? newUser;
  @JsonKey(name: 'designation')
  final String? designation;
  @JsonKey(name: 'business_categories')
  final String? businessCategories;
  @JsonKey(name: 'business_categories_sub')
  final String? businessCategoriesSub;
  @JsonKey(name: 'business_categories_other')
  final String? businessCategoriesOther;
  @JsonKey(name: 'professional_other')
  final String? professionalOther;
  @JsonKey(name: 'is_society')
  final bool? society;
  @JsonKey(name: 'label_member_type')
  final String? labelMemberType;
  @JsonKey(name: 'label_setting_apartment')
  final String? labelSettingApartment;
  @JsonKey(name: 'label_setting_resident')
  final String? labelSettingResident;
  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  @JsonKey(name: 'owner_email')
  final String? ownerEmail;
  @JsonKey(name: 'owner_mobile')
  final String? ownerMobile;
  @JsonKey(name: 'society_address')
  final String? societyAddress;
  @JsonKey(name: 'about_business')
  final String? aboutBusiness;
  @JsonKey(name: 'society_latitude')
  final String? societyLatitude;
  @JsonKey(name: 'society_longitude')
  final String? societyLongitude;
  @JsonKey(name: 'society_name')
  final String? societyName;
  @JsonKey(name: 'country_id')
  final String? countryId;
  @JsonKey(name: 'state_id_employee')
  final String? stateIdEmployee;
  @JsonKey(name: 'city_id')
  final String? cityId;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'is_expense_on', defaultValue: false)
  final bool isExpenseON;
  @JsonKey(name: 'max_expense_amount')
  final String? maxExpenseAmount;
  @JsonKey(name: 'api_key')
  final String? apiKey;
  @JsonKey(name: 'socieaty_logo')
  final String? socieatyLogo;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'member')
  final List<MemberModel>? member;
  @JsonKey(name: 'emergency')
  final List<EmergencyModel>? emergency;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'faculty_username')
  final String? facultyUsername;
  @JsonKey(name: 'faculty_password')
  final String? facultyPassword;
  @JsonKey(name: 'faculty_token')
  final String? facultyToken;
  @JsonKey(name: 'faculty_token_data')
  final String? facultyTokenData;
  @JsonKey(name: 'view_dialog_api_call')
  final bool? viewDialogApiCall;
  @JsonKey(name: 'view_dialog')
  final bool? viewDialog;

  VerifyOtpResponseModel({
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
    required this.isExpenseON,
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

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  VerifyOtpResponseEntity toEntity() => VerifyOtpResponseEntity(
    error: error,
    userId: userId,
    shiftTimeId: shiftTimeId,
    companyId: companyId,
    userFullName: userFullName,
    userFirstName: userFirstName,
    userLastName: userLastName,
    userMobile: userMobile,
    userEmail: userEmail,
    userIdProof: userIdProof,
    userType: userType,
    branchId: branchId,
    branchName: branchName,
    departmentName: departmentName,
    unitName: unitName,
    baseUrl: baseUrl,
    departmentId: departmentId,
    gender: gender,
    unitId: unitId,
    zoneId: zoneId,
    stateId: stateId,
    levelId: levelId,
    unitStatus: unitStatus,
    userStatus: userStatus,
    memberStatus: memberStatus,
    publicMobile: publicMobile,
    visitorApproved: visitorApproved,
    memberDateOfBirth: memberDateOfBirth,
    weddingAnniversaryDate: weddingAnniversaryDate,
    facebook: facebook,
    instagram: instagram,
    linkedin: linkedin,
    altMobile: altMobile,
    countryCode: countryCode,
    countryCodeAlt: countryCodeAlt,
    companyName: companyName,
    companyAddress: companyAddress,
    plotLattitude: plotLattitude,
    plotLongitude: plotLongitude,
    getBusinessData: getBusinessData,
    bloodGroup: bloodGroup,
    newUser: newUser,
    designation: designation,
    businessCategories: businessCategories,
    businessCategoriesSub: businessCategoriesSub,
    businessCategoriesOther: businessCategoriesOther,
    professionalOther: professionalOther,
    society: society,
    labelMemberType: labelMemberType,
    labelSettingApartment: labelSettingApartment,
    labelSettingResident: labelSettingResident,
    userProfilePic: userProfilePic,
    ownerName: ownerName,
    ownerEmail: ownerEmail,
    ownerMobile: ownerMobile,
    societyAddress: societyAddress,
    aboutBusiness: aboutBusiness,
    societyLatitude: societyLatitude,
    societyLongitude: societyLongitude,
    societyName: societyName,
    countryId: countryId,
    stateIdEmployee: stateIdEmployee,
    cityId: cityId,
    cityName: cityName,
    isExpenseON: isExpenseON,
    maxExpenseAmount: maxExpenseAmount,
    apiKey: apiKey,
    socieatyLogo: socieatyLogo,
    currency: currency,
    member: member?.map((e) => e.toEntity()).toList(),
    emergency: emergency?.map((e) => e.toEntity()).toList(),
    message: message,
    status: status,
    facultyUsername: facultyUsername,
    facultyPassword: facultyPassword,
    facultyToken: facultyToken,
    facultyTokenData: facultyTokenData,
    viewDialogApiCall: viewDialogApiCall,
    viewDialog: viewDialog,
  );
}

@JsonSerializable()
class MemberModel {
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'user_first_name')
  final String? userFirstName;
  @JsonKey(name: 'user_last_name')
  final String? userLastName;
  @JsonKey(name: 'user_mobile')
  final String? userMobile;
  @JsonKey(name: 'member_date_of_birth')
  final String? memberDateOfBirth;
  @JsonKey(name: 'member_age')
  final String? memberAge;
  @JsonKey(name: 'member_relation_name')
  final String? memberRelationName;
  @JsonKey(name: 'user_status')
  final String? userStatus;
  @JsonKey(name: 'member_status')
  final String? memberStatus;

  MemberModel({
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

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  /// Converts the data model to a domain entity.
  MemberEntity toEntity() => MemberEntity(
    userId: userId,
    userFirstName: userFirstName,
    userLastName: userLastName,
    userMobile: userMobile,
    memberDateOfBirth: memberDateOfBirth,
    memberAge: memberAge,
    memberRelationName: memberRelationName,
    userStatus: userStatus,
    memberStatus: memberStatus,
  );
}

@JsonSerializable()
class EmergencyModel {
  @JsonKey(name: 'emergencyContact_id')
  final String? emergencyContactId;
  @JsonKey(name: 'person_name')
  final String? personName;
  @JsonKey(name: 'person_mobile')
  final String? personMobile;
  @JsonKey(name: 'relation_id')
  final String? relationId;
  @JsonKey(name: 'relation')
  final String? relation;

  EmergencyModel({
    this.emergencyContactId,
    this.personName,
    this.personMobile,
    this.relationId,
    this.relation,
  });

  factory EmergencyModel.fromJson(Map<String, dynamic> json) =>
      _$EmergencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyModelToJson(this);

  /// Converts the data model to a domain entity.
  EmergencyEntity toEntity() => EmergencyEntity(
    emergencyContactId: emergencyContactId,
    personName: personName,
    personMobile: personMobile,
    relationId: relationId,
    relation: relation,
  );
}