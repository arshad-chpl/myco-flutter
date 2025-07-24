import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/circuler/data/data_source/circular_data_source.dart';
import 'package:myco_flutter/features/circuler/data/models/notice_board_response.dart';

class CircularDataSourceImpl implements CircularDataSource {
  final Dio dio;

  CircularDataSourceImpl({required this.dio});

  final preferenceManager = GetIt.I<PreferenceManager>();


  Future<NoticeBoardResponse> getNoticeFilter() async {
    final dataMap = {
      'getNoticeFilter': 'getNoticeFilter',
      'unit_id': '1',
      'user_id': '1',
      'floor_id': '1',
      'block_id': '1',
      'society_id': '1',
      'language_id': '1',
      'filter_type': '1',
      'from_date': '1',
      'to_date': '1'
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    final controller = 'noticeBoardController.php';

    final response = await GetIt.I<ApiClient>(instanceName: VariableBag.employeeMobileApi).postDynamic(controller, encryptedBody);
    return NoticeBoardResponse.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }

}