import 'package:json_annotation/json_annotation.dart';

part 'company_info_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyInfoResponse {
  @JsonKey(name: "society_name")
  String? companyName;
  @JsonKey(name: "society_based")
  String? companyBased;
  @JsonKey(name: "society_address")
  String? companyAddress;
  @JsonKey(name: "socieaty_logo")
  String? companyLogo;
  @JsonKey(name: "builder_name")
  String? builderName;
  @JsonKey(name: "builder_address")
  String? builderAddress;
  @JsonKey(name: "society_latitude")
  String? companyLatitude;
  @JsonKey(name: "society_longitude")
  String? companyLongitude;
  @JsonKey(name: "builder_mobile")
  String? builderMobile;
  @JsonKey(name: "secretary_email")
  String? secretaryEmail;
  @JsonKey(name: "secretary_mobile")
  String? secretaryMobile;
  @JsonKey(name: "no_of_units")
  String? noOfUnits;
  @JsonKey(name: "unit_name")
  String? unitName;
  @JsonKey(name: "no_of_blocks")
  String? noOfBlocks;
  @JsonKey(name: "block_name")
  String? blockName;
  @JsonKey(name: "no_of_population")
  String? noOfPopulation;
  @JsonKey(name: "population_view")
  String? populationView;
  List<Commitie>? commitie;
  @JsonKey(name: "builder_view")
  String? builderView;
  @JsonKey(name: "authorities_view")
  String? authoritiesView;
  @JsonKey(name: "statistical_view")
  String? statisticalView;
  @JsonKey(name: "trial_days")
  String? trialDays;
  String? message;

  CompanyInfoResponse({
    this.companyName,
    this.companyBased,
    this.companyAddress,
    this.companyLogo,
    this.builderName,
    this.builderAddress,
    this.companyLatitude,
    this.companyLongitude,
    this.builderMobile,
    this.secretaryEmail,
    this.secretaryMobile,
    this.noOfUnits,
    this.unitName,
    this.noOfBlocks,
    this.blockName,
    this.noOfPopulation,
    this.populationView,
    this.commitie,
    this.builderView,
    this.authoritiesView,
    this.statisticalView,
    this.trialDays,
    this.message,
  });

  factory CompanyInfoResponse.fromJson(Map<String, dynamic> json) => _$CompanyInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyInfoResponseToJson(this);
}

@JsonSerializable()
class Commitie {
  @JsonKey(name: "admin_id")
  String? adminId;
  @JsonKey(name: "role_id")
  String? roleId;
  @JsonKey(name: "society_id")
  String? companyId;
  @JsonKey(name: "admin_name")
  String? adminName;
  @JsonKey(name: "admin_email")
  String? adminEmail;
  @JsonKey(name: "short_name")
  String? shortName;
  @JsonKey(name: "admin_mobile")
  String? adminMobile;
  @JsonKey(name: "mobile_private")
  String? mobilePrivate;
  @JsonKey(name: "admin_address")
  String? adminAddress;
  @JsonKey(name: "role_name")
  String? roleName;
  @JsonKey(name: "admin_profile")
  String? adminProfile;

  Commitie({
    this.adminId,
    this.roleId,
    this.companyId,
    this.adminName,
    this.adminEmail,
    this.shortName,
    this.adminMobile,
    this.mobilePrivate,
    this.adminAddress,
    this.roleName,
    this.adminProfile,
  });

  factory Commitie.fromJson(Map<String, dynamic> json) => _$CommitieFromJson(json);
  Map<String, dynamic> toJson() => _$CommitieToJson(this);
}
