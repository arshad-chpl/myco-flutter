import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';

abstract class DeviceChangeRemoteDataSource {
  Future<CommonResponse> requestDeviceChange(RequestDeviceChangeModel model);
}