import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

class GetHolidayList {
  final HolidayRepository repository;

  GetHolidayList({required this.repository});

  Future<Either<Failure, HolidayListResponse>> call(String year) async =>
      await repository.fetchHolidays(year);
}
