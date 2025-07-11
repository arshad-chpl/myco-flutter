import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class RequestOtp {
  final RequestOtpRepository repository;

  RequestOtp({required this.repository});

  Future<Either<Failure, CommonResponse>> call() async =>
      await repository.requestOtp();
}
