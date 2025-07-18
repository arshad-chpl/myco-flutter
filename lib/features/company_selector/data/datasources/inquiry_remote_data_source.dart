import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';

abstract class InquiryRemoteDataSource {
  Future<CommonResponseModel> requestSociety(RequestSociety requestSociety);
}
