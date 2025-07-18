import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/inquiry_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/request/request_society_model.dart';


class InquiryRemoteDataSourceImpl extends InquiryRemoteDataSource {


  InquiryRemoteDataSourceImpl();

  @override
  Future<CommonResponseModel> requestSociety(RequestSociety request,
  ) async {
    try {
      final encryptedBody = GzipUtil.encryptAES(jsonEncode(request.toJson()));
      return CommonResponseModel.fromJson(
        json.decode(
          GzipUtil.decryptAES(
            (await GetIt.I<ApiClient>(
              instanceName: VariableBag.masterAPICall,
            ).postDynamic(
              'contactFincasysTeamController.php',
              encryptedBody,
            )),
          ),
        ),
      );
    } catch (e) {
      throw Exception('Failed to request society: $e');
    }
  }
}
