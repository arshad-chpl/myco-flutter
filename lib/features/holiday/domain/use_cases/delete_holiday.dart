import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/entities/holiday_list_response_entity.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';

class DeleteHoliday {
  final HolidayRepository repository;

  DeleteHoliday({required this.repository});

  Future<Either<Failure, HolidayListResponseEntity>> call(DeleteOptionalHoliday model) async =>
      await repository.deleteHoliday(model);
}
