import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class VerifyOtp {
  final RequestOtpRepository repository;

  VerifyOtp({required this.repository});

  Future<Either<Failure, VerifyOtpResponse>> call(
    VerifyOtpRequestModel model,
  ) => repository.verifyOtp(model);
}
