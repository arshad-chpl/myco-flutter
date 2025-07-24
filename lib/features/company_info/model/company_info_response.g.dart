// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfoResponseModel _$CompanyInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    CompanyInfoResponseModel(
      companyName: json['society_name'] as String?,
      companyBased: json['society_based'] as String?,
      companyAddress: json['society_address'] as String?,
      companyLogo: json['socieaty_logo'] as String?,
      builderName: json['builder_name'] as String?,
      builderAddress: json['builder_address'] as String?,
      companyLatitude: json['society_latitude'] as String?,
      companyLongitude: json['society_longitude'] as String?,
      builderMobile: json['builder_mobile'] as String?,
      secretaryEmail: json['secretary_email'] as String?,
      secretaryMobile: json['secretary_mobile'] as String?,
      noOfUnits: json['no_of_units'] as String?,
      unitName: json['unit_name'] as String?,
      noOfBlocks: json['no_of_blocks'] as String?,
      blockName: json['block_name'] as String?,
      noOfPopulation: json['no_of_population'] as String?,
      populationView: json['population_view'] as String?,
      commitie: (json['commitie'] as List<dynamic>?)
          ?.map((e) => CommitieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      builderView: json['builder_view'] as String?,
      authoritiesView: json['authorities_view'] as String?,
      statisticalView: json['statistical_view'] as String?,
      trialDays: json['trial_days'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CompanyInfoResponseModelToJson(
        CompanyInfoResponseModel instance) =>
    <String, dynamic>{
      'society_name': instance.companyName,
      'society_based': instance.companyBased,
      'society_address': instance.companyAddress,
      'socieaty_logo': instance.companyLogo,
      'builder_name': instance.builderName,
      'builder_address': instance.builderAddress,
      'society_latitude': instance.companyLatitude,
      'society_longitude': instance.companyLongitude,
      'builder_mobile': instance.builderMobile,
      'secretary_email': instance.secretaryEmail,
      'secretary_mobile': instance.secretaryMobile,
      'no_of_units': instance.noOfUnits,
      'unit_name': instance.unitName,
      'no_of_blocks': instance.noOfBlocks,
      'block_name': instance.blockName,
      'no_of_population': instance.noOfPopulation,
      'population_view': instance.populationView,
      'commitie': instance.commitie?.map((e) => e.toJson()).toList(),
      'builder_view': instance.builderView,
      'authorities_view': instance.authoritiesView,
      'statistical_view': instance.statisticalView,
      'trial_days': instance.trialDays,
      'message': instance.message,
    };

CommitieModel _$CommitieModelFromJson(Map<String, dynamic> json) =>
    CommitieModel(
      adminId: json['admin_id'] as String?,
      roleId: json['role_id'] as String?,
      companyId: json['society_id'] as String?,
      adminName: json['admin_name'] as String?,
      adminEmail: json['admin_email'] as String?,
      shortName: json['short_name'] as String?,
      adminMobile: json['admin_mobile'] as String?,
      mobilePrivate: json['mobile_private'] as String?,
      adminAddress: json['admin_address'] as String?,
      roleName: json['role_name'] as String?,
      adminProfile: json['admin_profile'] as String?,
    );

Map<String, dynamic> _$CommitieModelToJson(CommitieModel instance) =>
    <String, dynamic>{
      'admin_id': instance.adminId,
      'role_id': instance.roleId,
      'society_id': instance.companyId,
      'admin_name': instance.adminName,
      'admin_email': instance.adminEmail,
      'short_name': instance.shortName,
      'admin_mobile': instance.adminMobile,
      'mobile_private': instance.mobilePrivate,
      'admin_address': instance.adminAddress,
      'role_name': instance.roleName,
      'admin_profile': instance.adminProfile,
    };
