import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_device_change_repository.dart';
import 'package:myco_flutter/features/company_selector/domain/repositories/request_otp_repository.dart';

class RequestDeviceChange {
  final RequestDeviceChangeRepository repository;

  RequestDeviceChange({required this.repository});

  Future<Either<Failure, CommonResponse>> call(
      RequestDeviceChangeModel model,
      ) => repository.requestDeviceChange(model);
}
