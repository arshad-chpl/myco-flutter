import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';

abstract class RequestDeviceChangeRepository {
  Future<Either<Failure, CommonResponse>> requestDeviceChange(
    RequestDeviceChangeModel model,
  );
}
