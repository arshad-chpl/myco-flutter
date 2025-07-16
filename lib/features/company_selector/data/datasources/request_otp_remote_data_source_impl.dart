import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_reponse.dart';
import 'package:myco_flutter/features/company_selector/data/models/verify_otp_request_model.dart';

class RequestOtpRemoteDataSourceImpl implements RequestOtpRemoteDataSource {
  final Dio dio;

  RequestOtpRemoteDataSourceImpl({required this.dio});

  @override
  Future<CommonResponse> requestOtp(RequestOtpRequestModel model) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequestModel model) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return VerifyOtpResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}