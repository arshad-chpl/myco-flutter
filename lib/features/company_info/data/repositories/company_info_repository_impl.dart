import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_info/data/data_sources/company_info_remote_data_source.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  CompanyInfoRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CompanyInfoResponse>> getCompanyInfo() async =>
      safeApiCall.execute(() => remoteDataSource.getCompanyInfo());
}
