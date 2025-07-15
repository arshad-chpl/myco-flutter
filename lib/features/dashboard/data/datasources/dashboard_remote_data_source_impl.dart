import 'dart:convert';

import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
ApiClient apiClient;
  DashboardRemoteDataSourceImpl({required this.apiClient});
  @override
  Future<IdCardDetailResponse> getIDCardDetails(Map dataMap) async{
    // TODO: implement getIDCardDetails
final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await apiClient.postDynamic('societyListControllerEnc.php', encryptedBody);
    return IdCardDetailResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
  
}