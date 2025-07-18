import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

abstract class HolidayRepository {
  Future<Either<Failure, HolidayListResponse>> fetchHolidays(
    HolidayListRequestModel model,
  );

  Future<Either<Failure, HolidayListResponse>> applyHoliday(
    ApplyOptionalHoliday model,
  );

  Future<Either<Failure, HolidayListResponse>> deleteHoliday(
    DeleteOptionalHoliday model,
  );
}
