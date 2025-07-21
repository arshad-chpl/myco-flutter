import 'package:equatable/equatable.dart';

// The main entity for the company response.
class CompanyResponseEntity extends Equatable {
  final List<SocietyEntity>? society;
  final String? status;
  final String? message;
  final bool? takeRequestSociety;

  const CompanyResponseEntity({
    this.society,
    this.status,
    this.message,
    this.takeRequestSociety,
  });

  @override
  List<Object?> get props => [society, status, message, takeRequestSociety];
}

// The entity for a single society.
class SocietyEntity extends Equatable {
  final String? societyId;
  final String? societyName;
  final String? societyAddress;
  final String? secretaryEmail;
  final String? secretaryMobile;
  final String? socieatyLogo;
  final String? shareAppContent;
  final String? socieatyStatus;
  final String? subDomain;
  final bool? isSociety;
  final String? apiKey;
  final bool? isFirebase;
  final String? countryId;
  final String? stateId;
  final String? cityId;
  final String? societyType;
  final String? stateCountryName;
  final String? loginVia;
  final String? googleLogin;

  const SocietyEntity({
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

  @override
  List<Object?> get props => [
    societyId, societyName, societyAddress, secretaryEmail, secretaryMobile,
    socieatyLogo, shareAppContent, socieatyStatus, subDomain, isSociety,
    apiKey, isFirebase, countryId, stateId, cityId, societyType,
    stateCountryName, loginVia, googleLogin
  ];
}