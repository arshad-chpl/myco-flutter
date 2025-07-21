// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponseModel _$CompanyResponseModelFromJson(
        Map<String, dynamic> json) =>
    CompanyResponseModel(
      society: (json['society'] as List<dynamic>?)
          ?.map((e) => SocietyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      takeRequestSociety: json['take_request_society'] as bool? ?? false,
    );

Map<String, dynamic> _$CompanyResponseModelToJson(
        CompanyResponseModel instance) =>
    <String, dynamic>{
      'society': instance.society,
      'status': instance.status,
      'message': instance.message,
      'take_request_society': instance.takeRequestSociety,
    };

SocietyModel _$SocietyModelFromJson(Map<String, dynamic> json) => SocietyModel(
      societyId: json['society_id'] as String?,
      societyName: json['society_name'] as String?,
      societyAddress: json['society_address'] as String?,
      secretaryEmail: json['secretary_email'] as String?,
      secretaryMobile: json['secretary_mobile'] as String?,
      socieatyLogo: json['socieaty_logo'] as String?,
      shareAppContent: json['share_app_content'] as String?,
      socieatyStatus: json['socieaty_status'] as String?,
      subDomain: json['sub_domain'] as String?,
      isSociety: json['is_society'] as bool? ?? false,
      apiKey: json['api_key'] as String?,
      isFirebase: json['is_firebase'] as bool? ?? false,
      countryId: json['country_id'] as String?,
      stateId: json['state_id'] as String?,
      cityId: json['city_id'] as String?,
      societyType: json['society_type'] as String?,
      stateCountryName: json['state_country_name'] as String?,
      loginVia: json['login_via'] as String?,
      googleLogin: json['google_login'] as String?,
    );

Map<String, dynamic> _$SocietyModelToJson(SocietyModel instance) =>
    <String, dynamic>{
      'society_id': instance.societyId,
      'society_name': instance.societyName,
      'society_address': instance.societyAddress,
      'secretary_email': instance.secretaryEmail,
      'secretary_mobile': instance.secretaryMobile,
      'socieaty_logo': instance.socieatyLogo,
      'share_app_content': instance.shareAppContent,
      'socieaty_status': instance.socieatyStatus,
      'sub_domain': instance.subDomain,
      'is_society': instance.isSociety,
      'api_key': instance.apiKey,
      'is_firebase': instance.isFirebase,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'city_id': instance.cityId,
      'society_type': instance.societyType,
      'state_country_name': instance.stateCountryName,
      'login_via': instance.loginVia,
      'google_login': instance.googleLogin,
    };
