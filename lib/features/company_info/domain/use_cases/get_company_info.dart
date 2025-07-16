import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

class GetCompanyInfo {
  final CompanyInfoRepository repository;

  GetCompanyInfo({required this.repository});

  Future<Either<Failure, CompanyInfoResponse>> call() async => await repository.getCompanyInfo();
}
