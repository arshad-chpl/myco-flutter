import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/common_api/data/data_source/common_api_data_source.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';
import 'package:myco_flutter/features/common_api/models/uploaded_file_response.dart';

class CommonApiDataSourceImpl implements CommonApiDataSource {
  final Dio dio;

  CommonApiDataSourceImpl({required this.dio});
  final preferenceManager = GetIt.I<PreferenceManager>();


  @override
  Future<UploadFileResponseModel> uploadedTemp() async {
    final dataMap = {
      'uploadImageToTemp': 'uploadImageToTemp',
      'society_id': '1',
      'user_id': '0',
      'beforeLogIn': '1',
      'file_format_name': '1',
      'img': '' /*List<MultipartBody.Part>*/,
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'blockListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return UploadFileResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<BranchResponseModel> getBranchList() async {
    final dataMap = {
      'getBlocks': 'getBlocks',
      'society_id': '1',
      'user_id': '0',
      'language_id': '1' /*preferenceManager.getLanguageId()*/
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'blockListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return BranchResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<FloorAndUnitResponseModel> getFloorAndUnit(String branchId) async {
    final dataMap = {
      'getFloorandUnitNew': 'getFloorandUnitNew',
      'society_id': '1',
      'block_id': branchId,
      'language_id': '1' /*preferenceManager.getLanguageId()*/
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'blockListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return FloorAndUnitResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<ShiftResponseModel> getShiftList(String floorId) async {
    final dataMap = {
      'getShiftsRegister': 'getShiftsRegister',
      'society_id': '1',
      'floor_id': floorId,
      'language_id': '1' /*preferenceManager.getLanguageId()*/
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'shift_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return ShiftResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}