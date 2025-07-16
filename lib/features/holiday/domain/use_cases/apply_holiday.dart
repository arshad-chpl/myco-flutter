import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';

class ApplyHoliday {
  final HolidayRepository repository;

  ApplyHoliday({required this.repository});

  Future<Either<Failure, void>> call(String holidayId) async => await repository.applyHoliday(holidayId);
}
