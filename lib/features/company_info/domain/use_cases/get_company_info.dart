import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_info/domain/entities/company_info_entity.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';

class GetCompanyInfo {
  final CompanyInfoRepository repository;

  GetCompanyInfo({required this.repository});

  Future<Either<Failure, CompanyInfoEntity>> call() async => await repository.getCompanyInfo();
}
