import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

abstract class HolidayRemoteDataSource {
  Future<HolidayListResponseModel> fetchHolidays(HolidayListRequestModel model);
  Future<HolidayListResponseModel> applyHoliday(ApplyOptionalHoliday model);
  Future<HolidayListResponseModel> deleteHoliday(DeleteOptionalHoliday model,);
}
