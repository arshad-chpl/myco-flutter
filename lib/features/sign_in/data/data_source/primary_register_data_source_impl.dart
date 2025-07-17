import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/models/branch_response.dart';
import 'package:myco_flutter/features/sign_in/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/sign_in/models/shift_response.dart';

class PrimaryRegisterDataSourceImpl implements PrimaryRegisterDataSource {
  final Dio dio;

  PrimaryRegisterDataSourceImpl({required this.dio});
  final preferenceManager = GetIt.I<PreferenceManager>();


  @override
  Future<BranchResponse> getBranchList() async {
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
    return BranchResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<FloorAndUnitResponse> getFloorAndUnit(String branchId) async {
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
    return FloorAndUnitResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<ShiftResponse> getShiftList(String floorId) async {
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
    return ShiftResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponse> addPrimaryUser(Map<String, dynamic> dataMap) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}