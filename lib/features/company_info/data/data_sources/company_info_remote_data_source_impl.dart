import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_info/data/data_sources/company_info_remote_data_source.dart';
import 'package:myco_flutter/features/company_info/model/company_info_response.dart';

class CompanyInfoRemoteDataSourceImpl implements CompanyInfoRemoteDataSource {
  final Dio dio;

  CompanyInfoRemoteDataSourceImpl({required this.dio});

  @override
  Future<CompanyInfoResponse> getCompanyInfo() async {
    final dataMap = {
      'buildingDetails': 'buildingDetails',
      'society_id': '1',
      'language_id': '1',
    };
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final controller = 'buildingDetails_controller.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);
    return CompanyInfoResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
