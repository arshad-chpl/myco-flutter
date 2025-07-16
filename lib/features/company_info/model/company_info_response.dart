import 'dart:convert';

CompanyInfoResponse companyInfoResponseFromJson(String str) => CompanyInfoResponse.fromJson(json.decode(str));

String companyInfoResponseToJson(CompanyInfoResponse data) => json.encode(data.toJson());

class CompanyInfoResponse {
  String? societyName;
  String? societyBased;
  String? societyAddress;
  String? socieatyLogo;
  String? builderName;
  String? builderAddress;
  String? societyLatitude;
  String? societyLongitude;
  String? builderMobile;
  String? secretaryEmail;
  String? secretaryMobile;
  String? noOfUnits;
  String? unitName;
  String? noOfBlocks;
  String? blockName;
  String? noOfPopulation;
  String? populationView;
  List<Commitie>? commitie;
  String? builderView;
  String? authoritiesView;
  String? statisticalView;
  String? trialDays;
  String? message;

  CompanyInfoResponse({
    this.societyName,
    this.societyBased,
    this.societyAddress,
    this.socieatyLogo,
    this.builderName,
    this.builderAddress,
    this.societyLatitude,
    this.societyLongitude,
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

  factory CompanyInfoResponse.fromJson(Map<String, dynamic> json) => CompanyInfoResponse(
    societyName: json["society_name"],
    societyBased: json["society_based"],
    societyAddress: json["society_address"],
    socieatyLogo: json["socieaty_logo"],
    builderName: json["builder_name"],
    builderAddress: json["builder_address"],
    societyLatitude: json["society_latitude"],
    societyLongitude: json["society_longitude"],
    builderMobile: json["builder_mobile"],
    secretaryEmail: json["secretary_email"],
    secretaryMobile: json["secretary_mobile"],
    noOfUnits: json["no_of_units"],
    unitName: json["unit_name"],
    noOfBlocks: json["no_of_blocks"],
    blockName: json["block_name"],
    noOfPopulation: json["no_of_population"],
    populationView: json["population_view"],
    commitie: json["commitie"] == null ? [] : List<Commitie>.from(json["commitie"]!.map((x) => Commitie.fromJson(x))),
    builderView: json["builder_view"],
    authoritiesView: json["authorities_view"],
    statisticalView: json["statistical_view"],
    trialDays: json["trial_days"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "society_name": societyName,
    "society_based": societyBased,
    "society_address": societyAddress,
    "socieaty_logo": socieatyLogo,
    "builder_name": builderName,
    "builder_address": builderAddress,
    "society_latitude": societyLatitude,
    "society_longitude": societyLongitude,
    "builder_mobile": builderMobile,
    "secretary_email": secretaryEmail,
    "secretary_mobile": secretaryMobile,
    "no_of_units": noOfUnits,
    "unit_name": unitName,
    "no_of_blocks": noOfBlocks,
    "block_name": blockName,
    "no_of_population": noOfPopulation,
    "population_view": populationView,
    "commitie": commitie == null ? [] : List<dynamic>.from(commitie!.map((x) => x.toJson())),
    "builder_view": builderView,
    "authorities_view": authoritiesView,
    "statistical_view": statisticalView,
    "trial_days": trialDays,
    "message": message,
  };
}

class Commitie {
  String? adminId;
  String? roleId;
  String? societyId;
  String? adminName;
  String? adminEmail;
  String? shortName;
  String? adminMobile;
  String? mobilePrivate;
  String? adminAddress;
  String? roleName;
  String? adminProfile;

  Commitie({
    this.adminId,
    this.roleId,
    this.societyId,
    this.adminName,
    this.adminEmail,
    this.shortName,
    this.adminMobile,
    this.mobilePrivate,
    this.adminAddress,
    this.roleName,
    this.adminProfile,
  });

  factory Commitie.fromJson(Map<String, dynamic> json) => Commitie(
    adminId: json["admin_id"],
    roleId: json["role_id"],
    societyId: json["society_id"],
    adminName: json["admin_name"],
    adminEmail: json["admin_email"],
    shortName: json["short_name"],
    adminMobile: json["admin_mobile"],
    mobilePrivate: json["mobile_private"],
    adminAddress: json["admin_address"],
    roleName: json["role_name"],
    adminProfile: json["admin_profile"],
  );

  Map<String, dynamic> toJson() => {
    "admin_id": adminId,
    "role_id": roleId,
    "society_id": societyId,
    "admin_name": adminName,
    "admin_email": adminEmail,
    "short_name": shortName,
    "admin_mobile": adminMobile,
    "mobile_private": mobilePrivate,
    "admin_address": adminAddress,
    "role_name": roleName,
    "admin_profile": adminProfile,
  };
}
