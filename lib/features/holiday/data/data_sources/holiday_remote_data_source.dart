import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

abstract class HolidayRemoteDataSource {
  Future<HolidayListResponse> fetchHolidays(HolidayListRequestModel model);
  Future<HolidayListResponse> applyHoliday(ApplyOptionalHoliday model);
  Future<HolidayListResponse> deleteHoliday(DeleteOptionalHoliday model,);
}
