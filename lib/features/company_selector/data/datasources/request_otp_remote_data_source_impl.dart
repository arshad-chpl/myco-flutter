import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/request_otp_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/verify_otp_request_model.dart';
import 'package:myco_flutter/features/company_selector/data/models/response/verify_otp_response_model.dart';

class RequestOtpRemoteDataSourceImpl implements RequestOtpRemoteDataSource {
  final Dio dio;

  RequestOtpRemoteDataSourceImpl({required this.dio});

  @override
  Future<CommonResponseModel> requestOtp(RequestOtpRequestModel model) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return CommonResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel model) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));

    final controller = 'otpControllerNewEnc.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return VerifyOtpResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}