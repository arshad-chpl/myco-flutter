import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/company_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';

abstract class InquiryRemoteDataSource {
  Future<CommonResponse> requestSociety(RequestSociety requestSociety);
}
