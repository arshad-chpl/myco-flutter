import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/device_change_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_device_change_model.dart';

class DeviceChangeRemoteDataSourceImpl implements DeviceChangeRemoteDataSource {
  final Dio dio;

  DeviceChangeRemoteDataSourceImpl({required this.dio});

  @override
  Future<CommonResponse> requestDeviceChange(RequestDeviceChangeModel model) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}