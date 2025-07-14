import 'package:myco_flutter/features/dashboard/domain/entites/wfh_address_entity.dart';

class IdCardEntity {
  String? userId;
  String? userFirstName;
  String? userLastName;
  String? mobileNumber;
  String? userDesignation;
  String? bloodGroup;
  String? blockName;
  String? floorName;
  String? memberStatus;
  String? companyEmployeeId;
  String? currentAddressLat;
  String? currentAddressLong;
  String? permanentAddressLat;
  String? permanentAddressLong;
  String? emergencyContact;
  String? icardQrCode;
  String? userProfilePic;
  String? companyName;
  String? companyEmail;
  String? companyAddress;
  String? companyNumber;
  String? companyWebsite;
  String? companyLatitude;
  String? companyLongitude;
  String? companyLogo;
  bool? isUserApproved;
  bool? isAccountActive;
  String? currentAddress;
  String? permanentAddress;
  List<WfhAddressEntity>? wfhAddressList;
  String? message;
  String? status;

  IdCardEntity({
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
}
