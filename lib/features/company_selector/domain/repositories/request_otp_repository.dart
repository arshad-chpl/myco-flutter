import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/verify_otp_response_entity.dart';

abstract class RequestOtpRepository {
  Future<Either<Failure, CommonResponseModelEntity>> requestOtp(
    RequestOtpRequestModel model,
  );

  Future<Either<Failure, VerifyOtpResponseEntity>> verifyOtp(
    VerifyOtpRequestModel model,
  );
}
