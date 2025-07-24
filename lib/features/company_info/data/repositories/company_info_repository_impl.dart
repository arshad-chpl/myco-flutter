import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_info/data/data_sources/company_info_remote_data_source.dart';
import 'package:myco_flutter/features/company_info/domain/entities/company_info_entity.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

class CompanyInfoRepositoryImpl implements CompanyInfoRepository {
  final CompanyInfoRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  CompanyInfoRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CompanyInfoEntity>> getCompanyInfo() async =>
      safeApiCall.execute(() async {
        // Await the response from the data source
        final responseModel = await remoteDataSource.getCompanyInfo();
        // Convert the Model to an Entity before returning
        return responseModel.toEntity();
      });
}
