import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/company_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/company_response.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/company_repository.dart';

class CompanyRepositoryImpl extends CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;
  CompanyRepositoryImpl( this.safeApiCall,this.remoteDataSource,);
  @override
  Future<Either<Failure, CompanyResponse>> searchCompanies(
    String query,
  ) async => safeApiCall.execute(() => remoteDataSource.searchCompanies(query));
}
