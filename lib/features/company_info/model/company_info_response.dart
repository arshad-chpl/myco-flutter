import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/company_info/domain/entities/company_info_entity.dart';

part 'company_info_response.g.dart';

CompanyInfoResponseModel companyInfoResponseModelFromJson(String str) =>
    CompanyInfoResponseModel.fromJson(json.decode(str));

@JsonSerializable(explicitToJson: true)
class CompanyInfoResponseModel {
  @JsonKey(name: "society_name")
  final String? companyName;
  @JsonKey(name: "society_based")
  final String? companyBased;
  @JsonKey(name: "society_address")
  final String? companyAddress;
  @JsonKey(name: "socieaty_logo")
  final String? companyLogo;
  @JsonKey(name: "builder_name")
  final String? builderName;
  @JsonKey(name: "builder_address")
  final String? builderAddress;
  @JsonKey(name: "society_latitude")
  final String? companyLatitude;
  @JsonKey(name: "society_longitude")
  final String? companyLongitude;
  @JsonKey(name: "builder_mobile")
  final String? builderMobile;
  @JsonKey(name: "secretary_email")
  final String? secretaryEmail;
  @JsonKey(name: "secretary_mobile")
  final String? secretaryMobile;
  @JsonKey(name: "no_of_units")
  final String? noOfUnits;
  @JsonKey(name: "unit_name")
  final String? unitName;
  @JsonKey(name: "no_of_blocks")
  final String? noOfBlocks;
  @JsonKey(name: "block_name")
  final String? blockName;
  @JsonKey(name: "no_of_population")
  final String? noOfPopulation;
  @JsonKey(name: "population_view")
  final String? populationView;
  final List<CommitieModel>? commitie;
  @JsonKey(name: "builder_view")
  final String? builderView;
  @JsonKey(name: "authorities_view")
  final String? authoritiesView;
  @JsonKey(name: "statistical_view")
  final String? statisticalView;
  @JsonKey(name: "trial_days")
  final String? trialDays;
  final String? message;

  CompanyInfoResponseModel({
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

  factory CompanyInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoResponseModelToJson(this);

  /// Converts to domain entity
  CompanyInfoEntity toEntity() => CompanyInfoEntity(
    companyName: companyName,
    companyBased: companyBased,
    companyAddress: companyAddress,
    companyLogo: companyLogo,
    builderName: builderName,
    builderAddress: builderAddress,
    companyLatitude: companyLatitude,
    companyLongitude: companyLongitude,
    builderMobile: builderMobile,
    secretaryEmail: secretaryEmail,
    secretaryMobile: secretaryMobile,
    noOfUnits: noOfUnits,
    unitName: unitName,
    noOfBlocks: noOfBlocks,
    blockName: blockName,
    noOfPopulation: noOfPopulation,
    populationView: populationView,
    commitie: commitie?.map((e) => e.toEntity()).toList(),
    builderView: builderView,
    authoritiesView: authoritiesView,
    statisticalView: statisticalView,
    trialDays: trialDays,
    message: message,
  );
}

@JsonSerializable()
class CommitieModel {
  @JsonKey(name: "admin_id")
  final String? adminId;
  @JsonKey(name: "role_id")
  final String? roleId;
  @JsonKey(name: "society_id")
  final String? companyId;
  @JsonKey(name: "admin_name")
  final String? adminName;
  @JsonKey(name: "admin_email")
  final String? adminEmail;
  @JsonKey(name: "short_name")
  final String? shortName;
  @JsonKey(name: "admin_mobile")
  final String? adminMobile;
  @JsonKey(name: "mobile_private")
  final String? mobilePrivate;
  @JsonKey(name: "admin_address")
  final String? adminAddress;
  @JsonKey(name: "role_name")
  final String? roleName;
  @JsonKey(name: "admin_profile")
  final String? adminProfile;

  CommitieModel({
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

  factory CommitieModel.fromJson(Map<String, dynamic> json) =>
      _$CommitieModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommitieModelToJson(this);

  /// Converts to domain entity
  CommitieEntity toEntity() => CommitieEntity(
    adminId: adminId,
    roleId: roleId,
    companyId: companyId,
    adminName: adminName,
    adminEmail: adminEmail,
    shortName: shortName,
    adminMobile: adminMobile,
    mobilePrivate: mobilePrivate,
    adminAddress: adminAddress,
    roleName: roleName,
    adminProfile: adminProfile,
  );
}
