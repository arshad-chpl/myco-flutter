import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';

class ApplyHoliday {
  final HolidayRepository repository;

  ApplyHoliday({required this.repository});

  Future<Either<Failure, HolidayListResponse>> call(ApplyOptionalHoliday model) async => await repository.applyHoliday(model);
}
