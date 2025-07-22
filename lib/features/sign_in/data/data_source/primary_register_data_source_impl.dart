import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/sign_in/data/data_source/primary_register_data_source.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';

class PrimaryRegisterDataSourceImpl implements PrimaryRegisterDataSource {
  final Dio dio;

  PrimaryRegisterDataSourceImpl({required this.dio});
  final preferenceManager = GetIt.I<PreferenceManager>();

  @override
  Future<CommonResponseModel> addPrimaryUser(Map<String, dynamic> dataMap) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
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
  Future<CommonResponseModel> getCancelPendingProfile() async {
    final dataMap = {
      'CancelPendingProfile': 'CancelPendingProfile',
      'user_id': '1992', /*preferenceManager.getKeyValueString(VariableBag.registrationRequestPendingUserId),*/
      'society_id': '1'
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponseModel> getReminderPendingProfile(Map<String, dynamic> dataMap) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'resident_register_controller.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }


  @override
  Future<CommonResponseModel> getSociety(String societyId) async {
    final dataMap = {
      'getSociety': 'getSociety',
      'country_id': '',
      'state_id': '',
      'city_id': '',
      'society_id': societyId,
      'company_name': '',
      'language_id': ''
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'societyListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return CommonResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}