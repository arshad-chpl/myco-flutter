import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

class PrimaryRegisterDataSourceImpl implements PrimaryRegisterDataSource {
  final Dio dio;

  PrimaryRegisterDataSourceImpl({required this.dio});
  final preferenceManager = GetIt.I<PreferenceManager>();

  @override
  Future<CommonResponse> addPrimaryUser(Map<String, dynamic> dataMap) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  //pending profile api
  @override
  Future<ViewPendingProfileResponse> getViewPendingProfile() async {
    final dataMap = {
      'ViewPendingProfile': 'ViewPendingProfile',
      'user_id': '10', /*preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId),*/
      'society_id': '1'
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return ViewPendingProfileResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponse> getCancelPendingProfile() async {
    final dataMap = {
      'CancelPendingProfile': 'CancelPendingProfile',
      'user_id': preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId),
      'society_id': '1'
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponse> getReminderPendingProfile() async {
    final dataMap = {
      'ReminderPendingProfile': 'ReminderPendingProfile',
      'user_id': preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId),
      'society_id': '1',
      'block_id': '1',
      'user_first_name': '',
      'user_last_name': '',
      'user_full_name': '',
      'areaName': '',
      'blockName': ''
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponse> getSociety() async {
    final dataMap = {
      'getSociety': 'getSociety',
      'country_id': '0',
      'state_id': '0',
      'city_id': '0',
      'society_id': '1',
      'company_name': '1',
      'language_id': ''
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'societyListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}