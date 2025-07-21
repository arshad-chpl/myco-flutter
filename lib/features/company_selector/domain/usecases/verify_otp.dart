import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/verify_otp_response_entity.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class VerifyOtp {
  final RequestOtpRepository repository;

  VerifyOtp({required this.repository});

  Future<Either<Failure, VerifyOtpResponseEntity>> call(
    VerifyOtpRequestModel model,
  ) => repository.verifyOtp(model);
}
