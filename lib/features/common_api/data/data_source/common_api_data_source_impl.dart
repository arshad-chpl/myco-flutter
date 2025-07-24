import 'dart:convert';
import 'dart:io';
import 'dart:math';

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
import 'package:http_parser/http_parser.dart';

class CommonApiDataSourceImpl implements CommonApiDataSource {
  final Dio dio;

  CommonApiDataSourceImpl({required this.dio});
  final preferenceManager = GetIt.I<PreferenceManager>();

  @override
  Future<UploadFileResponseModel> uploadedTemp(bool loginType, List<String> filePath) async {
    final List<MultipartFile> files = [];

    for (int i = 0; i < filePath.length; i++) {
      final path = filePath[i];
      if (path.isNotEmpty) {
        final file = File(path);
        final basename = file.uri.pathSegments.last;
        final extension = basename.split('.').last.toLowerCase();
        String mimeType = 'image/jpeg';
        if (extension == 'png') mimeType = 'image/png';

        files.add(await MultipartFile.fromFile(
          path,
          filename: 'img[$i]_$basename',
          contentType: MediaType.parse(mimeType),
          ),
        );
      }
    }
    final controller = 'imageUploadController.php';

    final response = await GetIt.I<ApiClient>(instanceName: VariableBag.employeeMobileApi,).postMultipartImage(
      controller,
      'uploadImageToTemp',
      '1',
      '0',
      loginType ? '1' : '0',
      'User25 S_2025-07-22_1355',
      files,
    );

    // Direct parse, NO decrypt:
    return UploadFileResponseModel.fromJson(json.decode(response));
  }




  @override
  Future<BranchResponseModel> getBranchList(String societyId, String userId) async {
    final dataMap = {
      'getBlocks': 'getBlocks',
      'society_id': societyId,
      'user_id': userId,
      'language_id': '1' /*preferenceManager.getLanguageId()*/
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'blockListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(instanceName: VariableBag.employeeMobileApi).postDynamic(controller, encryptedBody);
    return BranchResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<FloorAndUnitResponseModel> getFloorAndUnit(String societyId, String blockId) async {
    final dataMap = {
      'getFloorandUnitNew': 'getFloorandUnitNew',
      'society_id': societyId,
      'block_id': blockId,
      'language_id': '1' /*preferenceManager.getLanguageId()*/
    };

    print('societyId: $societyId');
    print('blockId: $blockId');

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'blockListControllerEnc.php';

    final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.employeeMobileApi).postDynamic(
        controller, encryptedBody);
    return FloorAndUnitResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

  @override
  Future<ShiftResponseModel> getShiftList(String societyId, String floorId) async {
    final dataMap = {
      'getShiftsRegister': 'getShiftsRegister',
      'society_id': societyId,
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