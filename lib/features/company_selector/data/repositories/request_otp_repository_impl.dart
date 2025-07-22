import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/entites/verify_otp_response_entity.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class RequestOtpRepositoryImpl implements RequestOtpRepository {
  final RequestOtpRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  RequestOtpRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CommonResponseModelEntity>> requestOtp(
    RequestOtpRequestModel model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.requestOtp(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, VerifyOtpResponseEntity>> verifyOtp(
    VerifyOtpRequestModel model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.verifyOtp(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });
}
