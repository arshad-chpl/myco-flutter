import 'package:myco_flutter/features/company_selector/data/models/society_response_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response.dart';

class CompanyResponseModel extends CompanyResponse {

  CompanyResponseModel({
        super.society,
    super.status,
    super.message,
    super.takeRequestSociety,
  });

  factory CompanyResponseModel.fromJson(Map<String, dynamic> json) => CompanyResponseModel(
      society:
          (json['society'] as List<dynamic>?)
              ?.map((e) => SocietyModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
      takeRequestSociety: json['take_request_society'] as bool?,
    );

  Map<String, dynamic> toJson() =>   <String, dynamic>{
      'society': society?.map((e) => e.toJson()).toList(),
      'status': status,
      'message': message,
      'take_request_society': takeRequestSociety,
    };
  
}