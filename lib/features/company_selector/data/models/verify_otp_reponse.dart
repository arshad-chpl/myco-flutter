import 'dart:convert';

import 'package:myco_flutter/core/models/common_response.dart';

VerifyOtpResponse verifyOtpResponseFromJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) => json.encode(data.toJson());

class VerifyOtpResponse extends CommonResponse {
  String? userId;
  String? societyId;
  String? stateIdEmployee;
  String? shiftTimeId;
  String? userFullName;
  String? userFirstName;
  String? userLastName;
  String? userMobile;
  String? userEmail;
  dynamic userIdProof;
  String? userType;
  String? blockId;
  String? blockName;
  String? floorName;
  dynamic unitName;
  String? baseUrl;
  String? floorId;
  String? gender;
  String? unitId;
  String? zoneId;
  String? levelId;
  dynamic unitStatus;
  String? userStatus;
  String? memberStatus;
  String? publicMobile;
  String? visitorApproved;
  DateTime? memberDateOfBirth;
  String? weddingAnniversaryDate;
  String? facebook;
  String? instagram;
  String? linkedin;
  String? altMobile;
  String? countryCode;
  String? countryCodeAlt;
  String? companyName;
  String? companyAddress;
  dynamic plotLattitude;
  dynamic plotLongitude;
  String? facultyUsername;
  String? facultyPassword;
  String? facultyToken;
  String? facultyTokenData;
  bool? getBusinessData;
  String? bloodGroup;
  bool? isNewUser;
  bool? isExpenseOn;
  String? maxExpenseAmount;
  String? designation;
  String? businessCategories;
  String? businessCategoriesSub;
  String? businessCategoriesOther;
  String? professionalOther;
  bool? isSociety;
  String? labelMemberType;
  String? labelSettingApartment;
  String? labelSettingResident;
  String? userProfilePic;
  String? ownerName;
  String? ownerEmail;
  String? ownerMobile;
  String? societyAddress;
  String? societyLatitude;
  String? societyLongitude;
  String? societyName;
  String? countryId;
  String? stateId;
  String? cityId;
  String? cityName;
  String? apiKey;
  String? socieatyLogo;
  String? currency;
  List<dynamic>? member;
  List<dynamic>? emergency;

  VerifyOtpResponse({
    // Fields from CommonResponse
    super.status,
    super.message,
    super.isFirebase,
    super.trxId,
    super.isEmailOtp,
    super.isVoiceOtp,
    super.error,
    super.viewDialog,
    super.viewDialogApiCall,

    // Fields from VerifyOtpResponse
    this.userId,
    this.societyId,
    this.stateIdEmployee,
    this.shiftTimeId,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.userMobile,
    this.userEmail,
    this.userIdProof,
    this.userType,
    this.blockId,
    this.blockName,
    this.floorName,
    this.unitName,
    this.baseUrl,
    this.floorId,
    this.gender,
    this.unitId,
    this.zoneId,
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
    this.facultyUsername,
    this.facultyPassword,
    this.facultyToken,
    this.facultyTokenData,
    this.getBusinessData,
    this.bloodGroup,
    this.isNewUser,
    this.isExpenseOn,
    this.maxExpenseAmount,
    this.designation,
    this.businessCategories,
    this.businessCategoriesSub,
    this.businessCategoriesOther,
    this.professionalOther,
    this.isSociety,
    this.labelMemberType,
    this.labelSettingApartment,
    this.labelSettingResident,
    this.userProfilePic,
    this.ownerName,
    this.ownerEmail,
    this.ownerMobile,
    this.societyAddress,
    this.societyLatitude,
    this.societyLongitude,
    this.societyName,
    this.countryId,
    this.stateId,
    this.cityId,
    this.cityName,
    this.apiKey,
    this.socieatyLogo,
    this.currency,
    this.member,
    this.emergency,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
    // CommonResponse fields
    status: json["status"] as String?,
    message: json["message"] as String?,
    isFirebase: json["is_firebase"] as bool?,
    trxId: json["trx_id"] as String?,
    isEmailOtp: json["is_email_otp"] as bool?,
    isVoiceOtp: json["is_voice_otp"] as bool?,
    error: json["error"] as String?,
    viewDialog: json["view_dialog"] as bool?,
    viewDialogApiCall: json["view_dialog_api_call"] as bool?,

    // VerifyOtpResponse fields
    userId: json["user_id"] as String?,
    societyId: json["society_id"] as String?,
    stateIdEmployee: json["state_id_employee"] as String?,
    shiftTimeId: json["shift_time_id"] as String?,
    userFullName: json["user_full_name"] as String?,
    userFirstName: json["user_first_name"] as String?,
    userLastName: json["user_last_name"] as String?,
    userMobile: json["user_mobile"] as String?,
    userEmail: json["user_email"] as String?,
    userIdProof: json["user_id_proof"],
    userType: json["user_type"] as String?,
    blockId: json["block_id"] as String?,
    blockName: json["block_name"] as String?,
    floorName: json["floor_name"] as String?,
    unitName: json["unit_name"],
    baseUrl: json["base_url"] as String?,
    floorId: json["floor_id"] as String?,
    gender: json["gender"] as String?,
    unitId: json["unit_id"] as String?,
    zoneId: json["zone_id"] as String?,
    levelId: json["level_id"] as String?,
    unitStatus: json["unit_status"],
    userStatus: json["user_status"] as String?,
    memberStatus: json["member_status"] as String?,
    publicMobile: json["public_mobile"] as String?,
    visitorApproved: json["visitor_approved"] as String?,
    memberDateOfBirth: json["member_date_of_birth"] == null ? null : DateTime.parse(json["member_date_of_birth"]),
    weddingAnniversaryDate: json["wedding_anniversary_date"] as String?,
    facebook: json["facebook"] as String?,
    instagram: json["instagram"] as String?,
    linkedin: json["linkedin"] as String?,
    altMobile: json["alt_mobile"] as String?,
    countryCode: json["country_code"] as String?,
    countryCodeAlt: json["country_code_alt"] as String?,
    companyName: json["company_name"] as String?,
    companyAddress: json["company_address"] as String?,
    plotLattitude: json["plot_lattitude"],
    plotLongitude: json["plot_longitude"],
    facultyUsername: json["faculty_username"] as String?,
    facultyPassword: json["faculty_password"] as String?,
    facultyToken: json["faculty_token"] as String?,
    facultyTokenData: json["faculty_token_data"] as String?,
    getBusinessData: json["get_business_data"] as bool?,
    bloodGroup: json["blood_group"] as String?,
    isNewUser: json["is_new_user"] as bool?,
    isExpenseOn: json["is_expense_on"] as bool?,
    maxExpenseAmount: json["max_expense_amount"] as String?,
    designation: json["designation"] as String?,
    businessCategories: json["business_categories"] as String?,
    businessCategoriesSub: json["business_categories_sub"] as String?,
    businessCategoriesOther: json["business_categories_other"] as String?,
    professionalOther: json["professional_other"] as String?,
    isSociety: json["is_society"] as bool?,
    labelMemberType: json["label_member_type"] as String?,
    labelSettingApartment: json["label_setting_apartment"] as String?,
    labelSettingResident: json["label_setting_resident"] as String?,
    userProfilePic: json["user_profile_pic"] as String?,
    ownerName: json["owner_name"] as String?,
    ownerEmail: json["owner_email"] as String?,
    ownerMobile: json["owner_mobile"] as String?,
    societyAddress: json["society_address"] as String?,
    societyLatitude: json["society_latitude"] as String?,
    societyLongitude: json["society_longitude"] as String?,
    societyName: json["society_name"] as String?,
    countryId: json["country_id"] as String?,
    stateId: json["state_id"] as String?,
    cityId: json["city_id"] as String?,
    cityName: json["city_name"] as String?,
    apiKey: json["api_key"] as String?,
    socieatyLogo: json["socieaty_logo"] as String?,
    currency: json["currency"] as String?,
    member: json["member"] == null ? [] : List<dynamic>.from(json["member"].map((x) => x)),
    emergency: json["emergency"] == null ? [] : List<dynamic>.from(json["emergency"].map((x) => x)),
  );

  @override
  Map<String, dynamic> toJson() => {
    ...super.toJson(),

    "user_id": userId,
    "society_id": societyId,
    "state_id_employee": stateIdEmployee,
    "shift_time_id": shiftTimeId,
    "user_full_name": userFullName,
    "user_first_name": userFirstName,
    "user_last_name": userLastName,
    "user_mobile": userMobile,
    "user_email": userEmail,
    "user_id_proof": userIdProof,
    "user_type": userType,
    "block_id": blockId,
    "block_name": blockName,
    "floor_name": floorName,
    "unit_name": unitName,
    "base_url": baseUrl,
    "floor_id": floorId,
    "gender": gender,
    "unit_id": unitId,
    "zone_id": zoneId,
    "level_id": levelId,
    "unit_status": unitStatus,
    "user_status": userStatus,
    "member_status": memberStatus,
    "public_mobile": publicMobile,
    "visitor_approved": visitorApproved,
    "member_date_of_birth": memberDateOfBirth?.toIso8601String(),
    "wedding_anniversary_date": weddingAnniversaryDate,
    "facebook": facebook,
    "instagram": instagram,
    "linkedin": linkedin,
    "alt_mobile": altMobile,
    "country_code": countryCode,
    "country_code_alt": countryCodeAlt,
    "company_name": companyName,
    "company_address": companyAddress,
    "plot_lattitude": plotLattitude,
    "plot_longitude": plotLongitude,
    "faculty_username": facultyUsername,
    "faculty_password": facultyPassword,
    "faculty_token": facultyToken,
    "faculty_token_data": facultyTokenData,
    "get_business_data": getBusinessData,
    "blood_group": bloodGroup,
    "is_new_user": isNewUser,
    "is_expense_on": isExpenseOn,
    "max_expense_amount": maxExpenseAmount,
    "designation": designation,
    "business_categories": businessCategories,
    "business_categories_sub": businessCategoriesSub,
    "business_categories_other": businessCategoriesOther,
    "professional_other": professionalOther,
    "is_society": isSociety,
    "label_member_type": labelMemberType,
    "label_setting_apartment": labelSettingApartment,
    "label_setting_resident": labelSettingResident,
    "user_profile_pic": userProfilePic,
    "owner_name": ownerName,
    "owner_email": ownerEmail,
    "owner_mobile": ownerMobile,
    "society_address": societyAddress,
    "society_latitude": societyLatitude,
    "society_longitude": societyLongitude,
    "society_name": societyName,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "city_name": cityName,
    "api_key": apiKey,
    "socieaty_logo": socieatyLogo,
    "currency": currency,
    "member": member == null ? [] : List<dynamic>.from(member!.map((x) => x)),
    "emergency": emergency == null ? [] : List<dynamic>.from(emergency!.map((x) => x)),
  };
}
