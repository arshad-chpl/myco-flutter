import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';

abstract class DeviceChangeRemoteDataSource {
  Future<CommonResponseModel> requestDeviceChange(RequestDeviceChangeModel model);
}