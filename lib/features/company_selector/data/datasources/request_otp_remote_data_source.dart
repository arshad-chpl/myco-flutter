import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/company_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';

abstract class RequestOtpRemoteDataSource {
  Future<CommonResponse> requestOtp(RequestOtpRequestModel model);
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequestModel model);
}