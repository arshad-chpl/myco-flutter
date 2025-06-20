import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/company_selector/data/models/society_response_model.dart';

class CompanyResponse {
  final List<SocietyModel>? society;

  final String? status;

  final String? message;

  final bool? takeRequestSociety;

  CompanyResponse({
    this.society,
    this.status,
    this.message,
    this.takeRequestSociety,
  });
}
