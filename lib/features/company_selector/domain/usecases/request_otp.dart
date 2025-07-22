import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class RequestOtp {
  final RequestOtpRepository repository;

  RequestOtp({required this.repository});

  Future<Either<Failure, CommonResponseModelEntity>> call(RequestOtpRequestModel model) =>
      repository.requestOtp(model);
}
