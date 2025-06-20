import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/company_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';

class SearchCompanyUseCase {
  final CompanyRepository repository;
  SearchCompanyUseCase(this.repository);
  Future<Either<Failure, CompanyResponse>> call(String query) async => repository.searchCompanies(query);
  
}