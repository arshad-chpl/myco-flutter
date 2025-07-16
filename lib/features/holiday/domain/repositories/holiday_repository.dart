import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

abstract class HolidayRepository {
  Future<Either<Failure, HolidayListResponse>> fetchHolidays(String month);
  Future<Either<Failure, void>> applyHoliday(String holidayId);
  Future<Either<Failure, void>> deleteHoliday(String holidayAssignId);
}
