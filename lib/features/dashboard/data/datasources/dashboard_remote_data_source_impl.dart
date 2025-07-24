import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/models/home_menu_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/my_unit_response.dart';

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiClient apiClient;
  final ApiClient masterApiClient;
  final SafeApiCall safeApiCall; // 1. Inject SafeApiCall

  DashboardRemoteDataSourceImpl({
    required this.apiClient,
    required this.masterApiClient,
    required this.safeApiCall, // 2. Add to constructor
  });

  @override
  Future<Either<Failure, IdCardDetailResponse>> getIDCardDetails(
    Map<String, dynamic> dataMap,
  ) async {
    // 3. Wrap the API call with safeApiCall.execute
    return await safeApiCall.execute<IdCardDetailResponse>(() async {
      final response = await apiClient.postFormDynamic(
        'profileMenuController.php',
        dataMap,
      );
      // This part only runs on a successful API response
      return IdCardDetailResponse.fromJson(json.decode(response));
    });
  }

  @override
  Future<Either<Failure, HomeMenuResponse>> getAppMenuGridWithCategory(
    Map<String, dynamic> dataMap,
  ) async {
    // 4. Do the same for the other method
    return await safeApiCall.execute<HomeMenuResponse>(() async {
      final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
      final response = await masterApiClient.postDynamic(
        'app_menu_controller.php',
        encryptedBody,
      );
      final decRes = GzipUtil.decryptAES(response);
      return HomeMenuResponse.fromJson(json.decode(decRes));
    });
  }
  
  @override
  Future<Either<Failure, MyUnitResponse>> getMyUnits(Map<String, dynamic> dataMap) async{
    // 4. Do the same for the other method
    return await safeApiCall.execute<MyUnitResponse>(() async {
      final response = await apiClient.postFormDynamic(
        'resident_data_update_controller.php',
        dataMap,
      );
      return MyUnitResponse.fromJson(json.decode(response));
    });
  }
}
