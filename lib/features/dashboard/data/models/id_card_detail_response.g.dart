// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_card_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdCardDetailResponse _$IdCardDetailResponseFromJson(
        Map<String, dynamic> json) =>
    IdCardDetailResponse(
      userId: json['user_id'] as String?,
      userFirstName: json['user_first_name'] as String?,
      userLastName: json['user_last_name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      userDesignation: json['user_designation'] as String?,
      bloodGroup: json['blood_group'] as String?,
      blockName: json['block_name'] as String?,
      floorName: json['floor_name'] as String?,
      memberStatus: json['member_status'] as String?,
      companyEmployeeId: json['company_employee_id'] as String?,
      currentAddressLat: json['current_address_lat'] as String?,
      currentAddressLong: json['current_address_long'] as String?,
      permanentAddressLat: json['permanent_address_lat'] as String?,
      permanentAddressLong: json['permanent_address_long'] as String?,
      emergencyContact: json['emergency_contact'] as String?,
      icardQrCode: json['icard_qr_code'] as String?,
      userProfilePic: json['user_profile_pic'] as String?,
      companyName: json['company_name'] as String?,
      companyEmail: json['company_email'] as String?,
      companyAddress: json['company_address'] as String?,
      companyNumber: json['company_number'] as String?,
      companyWebsite: json['company_website'] as String?,
      companyLatitude: json['company_latitude'] as String?,
      companyLongitude: json['company_longitude'] as String?,
      companyLogo: json['company_logo'] as String?,
      isUserApproved: json['is_user_approved'] as bool?,
      isAccountActive: json['is_account_active'] as bool?,
      currentAddress: json['current_address'] as String?,
      permanentAddress: json['permanent_address'] as String?,
      wfhAddressList: (json['wfh_address_list'] as List<dynamic>?)
          ?.map((e) => WfhAddressList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$IdCardDetailResponseToJson(
        IdCardDetailResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_first_name': instance.userFirstName,
      'user_last_name': instance.userLastName,
      'mobile_number': instance.mobileNumber,
      'user_designation': instance.userDesignation,
      'blood_group': instance.bloodGroup,
      'block_name': instance.blockName,
      'floor_name': instance.floorName,
      'member_status': instance.memberStatus,
      'company_employee_id': instance.companyEmployeeId,
      'current_address_lat': instance.currentAddressLat,
      'current_address_long': instance.currentAddressLong,
      'permanent_address_lat': instance.permanentAddressLat,
      'permanent_address_long': instance.permanentAddressLong,
      'emergency_contact': instance.emergencyContact,
      'icard_qr_code': instance.icardQrCode,
      'user_profile_pic': instance.userProfilePic,
      'company_name': instance.companyName,
      'company_email': instance.companyEmail,
      'company_address': instance.companyAddress,
      'company_number': instance.companyNumber,
      'company_website': instance.companyWebsite,
      'company_latitude': instance.companyLatitude,
      'company_longitude': instance.companyLongitude,
      'company_logo': instance.companyLogo,
      'is_user_approved': instance.isUserApproved,
      'is_account_active': instance.isAccountActive,
      'current_address': instance.currentAddress,
      'permanent_address': instance.permanentAddress,
      'wfh_address_list': instance.wfhAddressList,
      'message': instance.message,
      'status': instance.status,
    };

WfhAddressList _$WfhAddressListFromJson(Map<String, dynamic> json) =>
    WfhAddressList(
      wfhAddressId: json['wfh_address_id'] as String?,
      userId: json['user_id'] as String?,
      societyId: json['society_id'] as String?,
      wfhAddressTitle: json['wfh_address_title'] as String?,
      addressType: json['address_type'] as String?,
      wfhAddress: json['wfh_address'] as String?,
      wfhLatitude: json['wfh_latitude'] as String?,
      wfhLongitude: json['wfh_longitude'] as String?,
      createdBy: json['created_by'] as String?,
      createdDate: json['created_date'] as String?,
    );

Map<String, dynamic> _$WfhAddressListToJson(WfhAddressList instance) =>
    <String, dynamic>{
      'wfh_address_id': instance.wfhAddressId,
      'user_id': instance.userId,
      'society_id': instance.societyId,
      'wfh_address_title': instance.wfhAddressTitle,
      'address_type': instance.addressType,
      'wfh_address': instance.wfhAddress,
      'wfh_latitude': instance.wfhLatitude,
      'wfh_longitude': instance.wfhLongitude,
      'created_by': instance.createdBy,
      'created_date': instance.createdDate,
    };
