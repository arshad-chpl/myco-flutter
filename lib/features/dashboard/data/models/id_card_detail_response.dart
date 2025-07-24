// To parse this JSON data, do
//
//     final idCardDetailResponse = idCardDetailResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/id_card_entity.dart';
import 'dart:convert';

import 'package:myco_flutter/features/dashboard/domain/entites/wfh_address_entity.dart';

part 'id_card_detail_response.g.dart';

IdCardDetailResponse idCardDetailResponseFromJson(String str) => IdCardDetailResponse.fromJson(json.decode(str));

String idCardDetailResponseToJson(IdCardDetailResponse data) => json.encode(data.toJson());

@JsonSerializable()
class IdCardDetailResponse {
    @JsonKey(name: 'user_id')
    String? userId;
    @JsonKey(name: 'user_first_name')
    String? userFirstName;
    @JsonKey(name: 'user_last_name')
    String? userLastName;
    @JsonKey(name: 'mobile_number')
    String? mobileNumber;
    @JsonKey(name: 'user_designation')
    String? userDesignation;
    @JsonKey(name: 'blood_group')
    String? bloodGroup;
    @JsonKey(name: 'block_name')
    String? blockName;
    @JsonKey(name: 'floor_name')
    String? floorName;
    @JsonKey(name: 'member_status')
    String? memberStatus;
    @JsonKey(name: 'company_employee_id')
    String? companyEmployeeId;
    @JsonKey(name: 'current_address_lat')
    String? currentAddressLat;
    @JsonKey(name: 'current_address_long')
    String? currentAddressLong;
    @JsonKey(name: 'permanent_address_lat')
    String? permanentAddressLat;
    @JsonKey(name: 'permanent_address_long')
    String? permanentAddressLong;
    @JsonKey(name: 'emergency_contact')
    String? emergencyContact;
    @JsonKey(name: 'icard_qr_code')
    String? icardQrCode;
    @JsonKey(name: 'user_profile_pic')
    String? userProfilePic;
    @JsonKey(name: 'company_name')
    String? companyName;
    @JsonKey(name: 'company_email')
    String? companyEmail;
    @JsonKey(name: 'company_address')
    String? companyAddress;
    @JsonKey(name: 'company_number')
    String? companyNumber;
    @JsonKey(name: 'company_website')
    String? companyWebsite;
    @JsonKey(name: 'company_latitude')
    String? companyLatitude;
    @JsonKey(name: 'company_longitude')
    String? companyLongitude;
    @JsonKey(name: 'company_logo')
    String? companyLogo;
    @JsonKey(name: 'is_user_approved')
    bool? isUserApproved;
    @JsonKey(name: 'is_account_active')
    bool? isAccountActive;
    @JsonKey(name: 'current_address')
    String? currentAddress;
    @JsonKey(name: 'permanent_address')
    String? permanentAddress;
    @JsonKey(name: 'wfh_address_list')
    List<WfhAddressList>? wfhAddressList;
    @JsonKey(name: 'message')
    String? message;
    @JsonKey(name: 'status')
    String? status;

    IdCardDetailResponse({
        this.userId,
        this.userFirstName,
        this.userLastName,
        this.mobileNumber,
        this.userDesignation,
        this.bloodGroup,
        this.blockName,
        this.floorName,
        this.memberStatus,
        this.companyEmployeeId,
        this.currentAddressLat,
        this.currentAddressLong,
        this.permanentAddressLat,
        this.permanentAddressLong,
        this.emergencyContact,
        this.icardQrCode,
        this.userProfilePic,
        this.companyName,
        this.companyEmail,
        this.companyAddress,
        this.companyNumber,
        this.companyWebsite,
        this.companyLatitude,
        this.companyLongitude,
        this.companyLogo,
        this.isUserApproved,
        this.isAccountActive,
        this.currentAddress,
        this.permanentAddress,
        this.wfhAddressList,
        this.message,
        this.status,
    });

    factory IdCardDetailResponse.fromJson(Map<String, dynamic> json) => _$IdCardDetailResponseFromJson(json);

    Map<String, dynamic> toJson() => _$IdCardDetailResponseToJson(this);

    IdCardEntity toEntity() => IdCardEntity(
      userId: userId,
      userFirstName: userFirstName,
      userLastName: userLastName,
      mobileNumber: mobileNumber,
      userDesignation: userDesignation,
      bloodGroup: bloodGroup,
      blockName: blockName,
      floorName: floorName,
      memberStatus: memberStatus,
      companyEmployeeId: companyEmployeeId,
      currentAddressLat: currentAddressLat,
      currentAddressLong: currentAddressLong,
      permanentAddressLat: permanentAddressLat,
      permanentAddressLong: permanentAddressLong,
      emergencyContact: emergencyContact,
      icardQrCode: icardQrCode,
      userProfilePic: userProfilePic,
      companyName: companyName,
      companyEmail: companyEmail,
      companyAddress: companyAddress,
      companyNumber: companyNumber,
      companyWebsite: companyWebsite,
      companyLatitude: companyLatitude,
      companyLongitude: companyLongitude,
      companyLogo: companyLogo,
      isUserApproved: isUserApproved,
      isAccountActive: isAccountActive,
      currentAddress: currentAddress,
      permanentAddress: permanentAddress,
      // Map the list of models to a list of entities by calling the other mapper
      wfhAddressList: wfhAddressList?.map((model) => model.toEntity()).toList() ?? [],
      message: message,
      status: status,
    );
}

@JsonSerializable()
class WfhAddressList {
    @JsonKey(name: 'wfh_address_id')
    String? wfhAddressId;
    @JsonKey(name: 'user_id')
    String? userId;
    @JsonKey(name: 'society_id')
    String? societyId;
    @JsonKey(name: 'wfh_address_title')
    String? wfhAddressTitle;
    @JsonKey(name: 'address_type')
    String? addressType;
    @JsonKey(name: 'wfh_address')
    String? wfhAddress;
    @JsonKey(name: 'wfh_latitude')
    String? wfhLatitude;
    @JsonKey(name: 'wfh_longitude')
    String? wfhLongitude;
    @JsonKey(name: 'created_by')
    String? createdBy;
    @JsonKey(name: 'created_date')
    String? createdDate;

    WfhAddressList({
        this.wfhAddressId,
        this.userId,
        this.societyId,
        this.wfhAddressTitle,
        this.addressType,
        this.wfhAddress,
        this.wfhLatitude,
        this.wfhLongitude,
        this.createdBy,
        this.createdDate,
    });

    factory WfhAddressList.fromJson(Map<String, dynamic> json) => _$WfhAddressListFromJson(json);

    Map<String, dynamic> toJson() => _$WfhAddressListToJson(this);
}
// Mapper for the nested WfhAddressList object
extension WfhAddressListMapper on WfhAddressList {
  /// Converts a [WfhAddressList] data model to a [WfhAddressEntity].
  WfhAddressEntity toEntity() => WfhAddressEntity(
      wfhAddressId: wfhAddressId,
      userId: userId,
      societyId: societyId,
      wfhAddressTitle: wfhAddressTitle,
      addressType: addressType,
      wfhAddress: wfhAddress,
      wfhLatitude: wfhLatitude,
      wfhLongitude: wfhLongitude,
      createdBy: createdBy,
      createdDate: createdDate,
    );
}
// Mapper for the main IdCardDetailResponse object
extension IdCardDetailResponseMapper on IdCardDetailResponse {
  /// Converts an [IdCardDetailResponse] data model to an [IdCardEntity].
  IdCardEntity toEntity() => IdCardEntity(
      userId: userId,
      userFirstName: userFirstName,
      userLastName: userLastName,
      mobileNumber: mobileNumber,
      userDesignation: userDesignation,
      bloodGroup: bloodGroup,
      blockName: blockName,
      floorName: floorName,
      memberStatus: memberStatus,
      companyEmployeeId: companyEmployeeId,
      currentAddressLat: currentAddressLat,
      currentAddressLong: currentAddressLong,
      permanentAddressLat: permanentAddressLat,
      permanentAddressLong: permanentAddressLong,
      emergencyContact: emergencyContact,
      icardQrCode: icardQrCode,
      userProfilePic: userProfilePic,
      companyName: companyName,
      companyEmail: companyEmail,
      companyAddress: companyAddress,
      companyNumber: companyNumber,
      companyWebsite: companyWebsite,
      companyLatitude: companyLatitude,
      companyLongitude: companyLongitude,
      companyLogo: companyLogo,
      isUserApproved: isUserApproved,
      isAccountActive: isAccountActive,
      currentAddress: currentAddress,
      permanentAddress: permanentAddress,
      // Map the list of models to a list of entities by calling the other mapper
      wfhAddressList: wfhAddressList?.map((model) => model.toEntity()).toList() ?? [],
      message: message,
      status: status,
    );
}