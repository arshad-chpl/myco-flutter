import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/device_change_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_device_change_repository.dart';

class DeviceChangeRepositoryImpl implements RequestDeviceChangeRepository {
  final DeviceChangeRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  DeviceChangeRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, CommonResponseModelEntity>> requestDeviceChange(
    RequestDeviceChangeModel model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.requestDeviceChange(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });
}
