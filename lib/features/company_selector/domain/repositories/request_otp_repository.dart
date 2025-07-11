import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

abstract class RequestOtpRepository {
  Future<Either<Failure, CommonResponse>> requestOtp();
}
