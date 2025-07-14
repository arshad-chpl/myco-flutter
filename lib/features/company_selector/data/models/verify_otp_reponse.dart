// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) => json.encode(data.toJson());

class VerifyOtpResponse {
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
  String? message;

  VerifyOtpResponse({
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
    this.message,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
    userId: json["user_id"],
    societyId: json["society_id"],
    stateIdEmployee: json["state_id_employee"],
    shiftTimeId: json["shift_time_id"],
    userFullName: json["user_full_name"],
    userFirstName: json["user_first_name"],
    userLastName: json["user_last_name"],
    userMobile: json["user_mobile"],
    userEmail: json["user_email"],
    userIdProof: json["user_id_proof"],
    userType: json["user_type"],
    blockId: json["block_id"],
    blockName: json["block_name"],
    floorName: json["floor_name"],
    unitName: json["unit_name"],
    baseUrl: json["base_url"],
    floorId: json["floor_id"],
    gender: json["gender"],
    unitId: json["unit_id"],
    zoneId: json["zone_id"],
    levelId: json["level_id"],
    unitStatus: json["unit_status"],
    userStatus: json["user_status"],
    memberStatus: json["member_status"],
    publicMobile: json["public_mobile"],
    visitorApproved: json["visitor_approved"],
    memberDateOfBirth: json["member_date_of_birth"] == null ? null : DateTime.parse(json["member_date_of_birth"]),
    weddingAnniversaryDate: json["wedding_anniversary_date"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    altMobile: json["alt_mobile"],
    countryCode: json["country_code"],
    countryCodeAlt: json["country_code_alt"],
    companyName: json["company_name"],
    companyAddress: json["company_address"],
    plotLattitude: json["plot_lattitude"],
    plotLongitude: json["plot_longitude"],
    facultyUsername: json["faculty_username"],
    facultyPassword: json["faculty_password"],
    facultyToken: json["faculty_token"],
    facultyTokenData: json["faculty_token_data"],
    getBusinessData: json["get_business_data"],
    bloodGroup: json["blood_group"],
    isNewUser: json["is_new_user"],
    isExpenseOn: json["is_expense_on"],
    maxExpenseAmount: json["max_expense_amount"],
    designation: json["designation"],
    businessCategories: json["business_categories"],
    businessCategoriesSub: json["business_categories_sub"],
    businessCategoriesOther: json["business_categories_other"],
    professionalOther: json["professional_other"],
    isSociety: json["is_society"],
    labelMemberType: json["label_member_type"],
    labelSettingApartment: json["label_setting_apartment"],
    labelSettingResident: json["label_setting_resident"],
    userProfilePic: json["user_profile_pic"],
    ownerName: json["owner_name"],
    ownerEmail: json["owner_email"],
    ownerMobile: json["owner_mobile"],
    societyAddress: json["society_address"],
    societyLatitude: json["society_latitude"],
    societyLongitude: json["society_longitude"],
    societyName: json["society_name"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    cityName: json["city_name"],
    apiKey: json["api_key"],
    socieatyLogo: json["socieaty_logo"],
    currency: json["currency"],
    member: json["member"] == null ? [] : List<dynamic>.from(json["member"]!.map((x) => x)),
    emergency: json["emergency"] == null ? [] : List<dynamic>.from(json["emergency"]!.map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
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
    "member_date_of_birth": "${memberDateOfBirth!.year.toString().padLeft(4, '0')}-${memberDateOfBirth!.month.toString().padLeft(2, '0')}-${memberDateOfBirth!.day.toString().padLeft(2, '0')}",
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
    "message": message,
  };
}
