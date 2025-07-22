import 'dart:convert';

import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/models/home_menu_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  ApiClient apiClient;
  ApiClient masterApiClient;
  DashboardRemoteDataSourceImpl({required this.apiClient,required this.masterApiClient});
  @override
  Future<IdCardDetailResponse> getIDCardDetails(
    Map<String, dynamic> dataMap,
  ) async {

    final response = await apiClient.postFormDynamic(
      'profileMenuController.php',
      dataMap,
    );
    return IdCardDetailResponse.fromJson(json.decode(response));
  }

  @override
  Future<HomeMenuResponse> getAppMenuGridWithCategory(
    Map<String, dynamic> dataMap,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final response = await masterApiClient.postDynamic(
      'app_menu_controller.php',
      encryptedBody,
    );
    final decRes=GzipUtil.decryptAES(response);
    return HomeMenuResponse.fromJson(json.decode(decRes));
  }
}
