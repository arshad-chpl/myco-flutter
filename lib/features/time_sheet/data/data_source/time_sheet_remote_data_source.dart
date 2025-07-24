import 'package:myco_flutter/features/time_sheet/data/models/request/attendence_month_request_model.dart';
import 'package:myco_flutter/features/time_sheet/data/models/response/attendance_month_response_model.dart';

abstract class TimeSheetRemoteDataSource {
  Future<AttendanceMonthResponseModel> monthlyAttendance(
    MonthlyAttendanceRequestModel request,
  );
}
