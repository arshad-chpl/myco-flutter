
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response_entity.dart';

abstract class CompanyRepository {
  Future<Either<Failure,CompanyResponseEntity>> searchCompanies(String query);
}
