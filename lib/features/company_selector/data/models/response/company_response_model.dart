import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';

part 'company_response_model.g.dart';

// Helper function to decode JSON string
CompanyResponseModel companyResponseModelFromJson(String str) =>
    CompanyResponseModel.fromJson(json.decode(str));

// The main response model that mirrors the JSON structure
@JsonSerializable()
class CompanyResponseModel {
  @JsonKey(name: 'society')
  final List<SocietyModel>? society;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'take_request_society', defaultValue: false)
  final bool? takeRequestSociety;

  CompanyResponseModel({
    this.society,
    this.status,
    this.message,
    this.takeRequestSociety,
  });

  factory CompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  CompanyResponseEntity toEntity() => CompanyResponseEntity(
    society: society?.map((model) => model.toEntity()).toList(),
    status: status,
    message: message,
    takeRequestSociety: takeRequestSociety,
  );
}

// The model for an individual society item
@JsonSerializable()
class SocietyModel {
  @JsonKey(name: 'society_id')
  final String? societyId;
  @JsonKey(name: 'society_name')
  final String? societyName;
  @JsonKey(name: 'society_address')
  final String? societyAddress;
  @JsonKey(name: 'secretary_email')
  final String? secretaryEmail;
  @JsonKey(name: 'secretary_mobile')
  final String? secretaryMobile;
  @JsonKey(name: 'socieaty_logo')
  final String? socieatyLogo;
  @JsonKey(name: 'share_app_content')
  final String? shareAppContent;
  @JsonKey(name: 'socieaty_status')
  final String? socieatyStatus;
  @JsonKey(name: 'sub_domain')
  final String? subDomain;
  @JsonKey(name: 'is_society', defaultValue: false)
  final bool? isSociety;
  @JsonKey(name: 'api_key')
  final String? apiKey;
  @JsonKey(name: 'is_firebase', defaultValue: false)
  final bool? isFirebase;
  @JsonKey(name: 'country_id')
  final String? countryId;
  @JsonKey(name: 'state_id')
  final String? stateId;
  @JsonKey(name: 'city_id')
  final String? cityId;
  @JsonKey(name: 'society_type')
  final String? societyType;
  @JsonKey(name: 'state_country_name')
  final String? stateCountryName;
  @JsonKey(name: 'login_via')
  final String? loginVia;
  @JsonKey(name: 'google_login')
  final String? googleLogin;

  SocietyModel({
    this.societyId,
    this.societyName,
    this.societyAddress,
    this.secretaryEmail,
    this.secretaryMobile,
    this.socieatyLogo,
    this.shareAppContent,
    this.socieatyStatus,
    this.subDomain,
    this.isSociety,
    this.apiKey,
    this.isFirebase,
    this.countryId,
    this.stateId,
    this.cityId,
    this.societyType,
    this.stateCountryName,
    this.loginVia,
    this.googleLogin,
  });

  factory SocietyModel.fromJson(Map<String, dynamic> json) =>
      _$SocietyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocietyModelToJson(this);

  /// Converts the data model to a domain entity.
  SocietyEntity toEntity() => SocietyEntity(
    societyId: societyId,
    societyName: societyName,
    societyAddress: societyAddress,
    secretaryEmail: secretaryEmail,
    secretaryMobile: secretaryMobile,
    socieatyLogo: socieatyLogo,
    shareAppContent: shareAppContent,
    socieatyStatus: socieatyStatus,
    subDomain: subDomain,
    isSociety: isSociety,
    apiKey: apiKey,
    isFirebase: isFirebase,
    countryId: countryId,
    stateId: stateId,
    cityId: cityId,
    societyType: societyType,
    stateCountryName: stateCountryName,
    loginVia: loginVia,
    googleLogin: googleLogin,
  );
}