import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/time_sheet/data/data_source/time_sheet_remote_data_source.dart';
import 'package:myco_flutter/features/time_sheet/data/models/request/attendence_month_request_model.dart';
import 'package:myco_flutter/features/time_sheet/data/models/response/attendance_month_response_model.dart';

class TimeSheetRemoteDataSourceImpl extends TimeSheetRemoteDataSource {
  @override
  Future<AttendanceMonthResponseModel> monthlyAttendance(
    MonthlyAttendanceRequestModel request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('day_wise_attendance.php', encryptedBody);
    return AttendanceMonthResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
