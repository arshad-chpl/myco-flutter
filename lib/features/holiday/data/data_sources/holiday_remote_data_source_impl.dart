import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

class HolidayRemoteDataSourceImpl implements HolidayRemoteDataSource {
  final Dio dio;

  HolidayRemoteDataSourceImpl({required this.dio});

  @override
  Future<HolidayListResponse> fetchHolidays(String year) async {
    final dataMap = {
      'tag': 'getHolidaysNewGroupWise',
      'society_id': '1',
      'unit_id': '1',
      'language_id': '1',
      'user_id': '1',
      'block_id': '1',
      'floor_id': '1',
      'level_id': '1',
      'year': year,
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    const controller = 'holiday_controller.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic(controller, encryptedBody);

    return HolidayListResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<void> applyHoliday(String holidayId) async {
    final dataMap = {
      'tag': 'applyOptionalHoliday',
      'society_id': '1',
      'holiday_id': holidayId,
      'user_id': '1',
      'optional_holiday_assign_id': '1',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    const controller = 'holiday_controller.php';

    await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic(controller, encryptedBody);
  }

  @override
  Future<void> deleteHoliday(String optionalHolidayAssignId) async {
    final dataMap = {
      'tag': 'deleteOptionalHolidayRequest',
      'society_id': '1',
      'user_id': '1',
      'optional_holiday_assign_id': optionalHolidayAssignId,
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
    const controller = 'holiday_controller.php';

    await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic(controller, encryptedBody);
  }
}
