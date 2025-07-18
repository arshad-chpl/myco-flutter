import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/inquiry_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/inquiry_repository.dart';

class InquiryRepositoryImpl extends InquiryRepository {
  InquiryRemoteDataSource remoteDataSource;
  SafeApiCall safeApiCall;

  InquiryRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CommonResponseModelEntity>> requestSociety(
    RequestSociety request,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.requestSociety(request);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });
}
