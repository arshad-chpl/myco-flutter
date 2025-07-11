import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';

class RequestOtpRemoteDataSourceImpl implements RequestOtpRemoteDataSource {
  final Dio dio;

  RequestOtpRemoteDataSourceImpl({required this.dio});

  @override
  Future<CommonResponse> requestOtp() async {
    final dataMap = {
      'tag': 'user_login_new',
      'society_id': '1',
      'country_code': '1',
      'otp_type': '1',
      'user_mobile': 'aasif.shaikh@chplgroup.org',
      'is_firebase': true,
      'user_mac_address': '1',
      'login_via': '1',
      'language_id': '1',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
