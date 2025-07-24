import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';

abstract class RequestDeviceChangeRepository {
  Future<Either<Failure, CommonResponseModelEntity>> requestDeviceChange(
    RequestDeviceChangeModel model,
  );
}
