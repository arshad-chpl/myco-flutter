import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/response/verify_otp_response_model.dart';

abstract class RequestOtpRemoteDataSource {
  Future<CommonResponseModel> requestOtp(RequestOtpRequestModel model);

  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel model);
}