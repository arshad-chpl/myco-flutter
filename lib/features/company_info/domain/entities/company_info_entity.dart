import 'package:equatable/equatable.dart';

class CompanyInfoEntity extends Equatable {
  final String? companyName;
  final String? companyBased;
  final String? companyAddress;
  final String? companyLogo;
  final String? builderName;
  final String? builderAddress;
  final String? companyLatitude;
  final String? companyLongitude;
  final String? builderMobile;
  final String? secretaryEmail;
  final String? secretaryMobile;
  final String? noOfUnits;
  final String? unitName;
  final String? noOfBlocks;
  final String? blockName;
  final String? noOfPopulation;
  final String? populationView;
  final List<CommitieEntity>? commitie;
  final String? builderView;
  final String? authoritiesView;
  final String? statisticalView;
  final String? trialDays;
  final String? message;

  const CompanyInfoEntity({
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

  @override
  List<Object?> get props => [
    companyName,
    companyBased,
    companyAddress,
    companyLogo,
    builderName,
    builderAddress,
    companyLatitude,
    companyLongitude,
    builderMobile,
    secretaryEmail,
    secretaryMobile,
    noOfUnits,
    unitName,
    noOfBlocks,
    blockName,
    noOfPopulation,
    populationView,
    commitie,
    builderView,
    authoritiesView,
    statisticalView,
    trialDays,
    message,
  ];
}

class CommitieEntity extends Equatable {
  final String? adminId;
  final String? roleId;
  final String? companyId;
  final String? adminName;
  final String? adminEmail;
  final String? shortName;
  final String? adminMobile;
  final String? mobilePrivate;
  final String? adminAddress;
  final String? roleName;
  final String? adminProfile;

  const CommitieEntity({
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

  @override
  List<Object?> get props => [
    adminId,
    roleId,
    companyId,
    adminName,
    adminEmail,
    shortName,
    adminMobile,
    mobilePrivate,
    adminAddress,
    roleName,
    adminProfile,
  ];
}
