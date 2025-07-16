import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

abstract class CompanyInfoRepository {
  Future<Either<Failure, CompanyInfoResponse>> getCompanyInfo();
}
