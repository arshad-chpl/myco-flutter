import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/company_repository.dart';

class SearchCompanyUseCase {
  final CompanyRepository repository;
  SearchCompanyUseCase(this.repository);
  Future<Either<Failure, CompanyResponseEntity>> call(String query) async => repository.searchCompanies(query);
  
}