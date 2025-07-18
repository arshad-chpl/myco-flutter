import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

class HolidayRemoteDataSourceImpl implements HolidayRemoteDataSource {
  final Dio dio;

  HolidayRemoteDataSourceImpl({required this.dio});

  /*RequestOtpRequestModel model*/

  @override
  Future<HolidayListResponse> fetchHolidays(HolidayListRequestModel model) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));
    const controller = 'holiday_controller.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);

    return HolidayListResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<HolidayListResponse> applyHoliday(ApplyOptionalHoliday model) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));
    const controller = 'holiday_controller.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);

    return HolidayListResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<HolidayListResponse> deleteHoliday(
    DeleteOptionalHoliday model,
  ) async {

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(model.toMap()));
    const controller = 'holiday_controller.php';

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic(controller, encryptedBody);

    return HolidayListResponse.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
