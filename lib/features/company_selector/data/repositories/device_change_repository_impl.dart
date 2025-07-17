import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_info/data/data_sources/company_info_remote_data_source.dart';
import 'package:myco_flutter/features/company_info/domain/repositories/company_info_repository.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/device_change_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_device_change_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class DeviceChangeRepositoryImpl implements RequestDeviceChangeRepository {
  final DeviceChangeRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  DeviceChangeRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CommonResponse>> requestDeviceChange(RequestDeviceChangeModel model) async => safeApiCall.execute(() => remoteDataSource.requestDeviceChange(model));

}
