import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/company_selector/data/datasources/company_remote_data_source.dart';
import 'package:myco_flutter/features/company_selector/data/models/company_response_model.dart';

class CompanyRemoteDataSourceImpl extends CompanyRemoteDataSource {
  @override
  Future<CompanyResponseModel> searchCompanies(String query) async {
        final dataMap = {
      'getSociety': 'getSociety',
      'country_id': '1',
      'state_id': '',
      'city_id': '1',
      'society_id': '',
      'company_name': query,
      'language_id': '1',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic('societyListControllerEnc.php', encryptedBody);
    return CompanyResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
  } 