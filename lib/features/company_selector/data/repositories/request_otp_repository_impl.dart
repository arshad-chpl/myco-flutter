import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_info/data/data_sources/company_info_remote_data_source.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class RequestOtpRepositoryImpl implements RequestOtpRepository {
  final RequestOtpRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  RequestOtpRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CommonResponse>> requestOtp() async =>
      safeApiCall.execute(remoteDataSource.requestOtp);
}
