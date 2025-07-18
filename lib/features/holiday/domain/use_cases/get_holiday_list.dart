import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

class GetHolidayList {
  final HolidayRepository repository;

  GetHolidayList({required this.repository});

  Future<Either<Failure, HolidayListResponse>> call(HolidayListRequestModel model) async =>
      await repository.fetchHolidays(model);
}
