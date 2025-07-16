import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

abstract class HolidayRemoteDataSource {
  Future<HolidayListResponse> fetchHolidays(String month);
  Future<void> applyHoliday(String holidayId);
  Future<void> deleteHoliday(String holidayAssignId);
}
