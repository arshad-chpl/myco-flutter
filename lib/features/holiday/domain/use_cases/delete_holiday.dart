import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';

class DeleteHoliday {
  final HolidayRepository repository;

  DeleteHoliday({required this.repository});

  Future<Either<Failure, void>> call(String holidayAssignId) async =>
      await repository.deleteHoliday(holidayAssignId);
}
